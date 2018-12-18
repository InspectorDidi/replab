classdef GroupMorphism < replab.cat.Laws
    
    properties
        S; % source group
        T; % target group
    end
    
    methods
        
        % Implement
        %
        % function t = image(s)
        
    end
    
    methods % LAWS
        
        function law_inverse_S(self, s)
            t = self.image(s);
            sI = self.S.inverse(s);
            tI1 = self.T.inverse(t);
            tI2 = self.image(sI);
            self.T.assertEqv(tI1, tI2);
        end
        
        function law_composition_SS(self, s1, s2)
            s12 = self.S.compose(s1, s2);
            t1 = self.image(s1);
            t2 = self.image(s2);
            t12_1 = self.image(s12);
            t12_2 = self.T.compose(t1, t2);
            self.T.assertEqv(t12_1, t12_2);
        end
        
        function law_identity(self)
            self.T.assertEqv(self.T.identity, self.image(self.S.identity));
        end
        
    end
    
end