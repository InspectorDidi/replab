function F = ge(X,Y)
    % greater or equal constraint
    
    % Numerical tolerance to decide whether numbers are close to zero in
    % this function.
    epsilon = 1e-10;

    % We examine each case independently
    if isa(X, 'replab.CommutantVar') && isa(Y, 'replab.CommutantVar')
        % CommutantVar >= CommutantVar
        
        % We verify that both variables have compatible structures
        compatLevel = X.compatibleWith(Y);
        if compatLevel == 0
            error('Block structure of both matrices don''t match. Consider using fullMatrix.');
        end
        
        % We express Y in the block basis of X
        rotatedY = X.U'*Y.U*Y.blockMask*Y.U'*X.U;
        
        % We impose the constraint (the constraints might be slightly
        % redundant here, to be improved)
        co = 0;
        F = [sdpvar >= 0];
        for i = 1:X.nComponents
            dim = X.dimensions1(i);
            switch X.types(i)
                case 'R'
                case 'C'
                    dim = dim/2;
                case 'H'
                    dim = dim/4;
                otherwise
                    error('Unknown type');
            end
            for j = 1:1+(2-compatLevel)*(dim-1)
                constantBlock = rotatedY(co + [1:dim:dim*size(X.blocks{i},1)], co + [1:dim:dim*size(X.blocks{i},1)]);
                % We make sure that the constant block is hermitian
                shouldBeZero = constantBlock - constantBlock';
                indices = getvariables(shouldBeZero);
                for ind = indices
                    if max(max(abs(getbasematrix(shouldBeZero,ind)))) > epsilon
                        error(['Positivity requires hermitian matrices. Non-hermiticity of ', num2str(max(max(abs(constantBlock - constantBlock')))), '.']);
                    end
                end
                if ~ishermitian(constantBlock)
                    % We force exact hermiticity
                    constantBlock = (constantBlock + constantBlock')/2;
                end
                F = [F, X.blocks{i} >= constantBlock];
                if compatLEvel == 1
                    co = co + size(X.blocks{i},1);
                else
                    co = co + dim*size(X.blocks{i},1);
                end
            end
        end
        F = F(2:end);
    elseif isa(X, 'replab.CommutantVar') && ~isa(Y, 'replab.CommutantVar')
        % CommutantVar >= sthg
        if isscalar(Y)
            F = (X.blocks{1} >= Y);
            for i = 2:X.nComponents
                F = [F, X.blocks{i} >= Y];
            end
        else
            % We verify that both variables have compatible structures
            compatLevel = X.compatibleWith(Y);
            if compatLevel == 0
                error('Block structure of both matrices don''t match. Consider using fullMatrix.');
            end

            % We express Y in the block basis of X
            rotatedY = X.U'*Y*X.U;

            % The block structure matches, we procede to impose the
            % constraint on each block
            co = 0;
            F = [sdpvar >= 0];
            for i = 1:X.nComponents
                dim = X.dimensions1(i);
                switch X.types(i)
                    case 'R'
                    case 'C'
                        dim = dim/2;
                    case 'H'
                        dim = dim/4;
                    otherwise
                        error('Unknown type');
                end
                for j = 1:1+(2-compatLevel)*(dim-1)
                    constantBlock = rotatedY(co + [1:dim:dim*size(X.blocks{i},1)], co + [1:dim:dim*size(X.blocks{i},1)]);
                    % We make sure that the constant block is hermitian
                    if max(max(abs(constantBlock - constantBlock'))) > epsilon
                        error(['Positivity requires hermitian matrices. Non-hermiticity of ', num2str(max(max(abs(constantBlock - constantBlock')))), '.']);
                    elseif ~ishermitian(constantBlock)
                        % We force exact hermiticity
                        constantBlock = (constantBlock + constantBlock')/2;
                    end
                    F = [F, X.blocks{i} >= constantBlock];
                    if compatLEvel == 1
                        co = co + size(X.blocks{i},1);
                    else
                        co = co + dim*size(X.blocks{i},1);
                    end
                end
            end
            F = F(2:end);
        end
    elseif ~isa(X, 'replab.CommutantVar') && isa(Y, 'replab.CommutantVar')
        % sthg >= CommutantVar
        F = le(Y,X);
    else
        error('Neither of the two arguments is of type replab.CommutantVar');
    end
end
