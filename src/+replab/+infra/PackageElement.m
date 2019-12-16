classdef PackageElement < replab.Str
    
    properties
        name % charstring: function or class identifier
        doc % `.Doc`: Documentation
        packageNameParts % row cell vector of cellstring: parent package identifier
        kind % {'function' 'class'}: Human readable description of type
        fullFilename % charstring: Full path of the source file
    end
    
    methods
        
        function str = headerStr(self)
            str = sprintf('%s (%s)', self.name, self.kind);
        end
        
        function str = fullName(self)
            str = strjoin(horzcat(self.packageNameParts, {self.name}), '.');
        end
        
        function str = sphinxFullName(self)
            pp = strjoin(cellfun(@(x) ['+' x], self.packageNameParts, 'uniform', 0), '.');
            str = [pp '.' self.name];
        end
        
    end

end
