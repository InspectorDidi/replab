classdef Property < replab.infra.ClassElement

    methods

        function self = Property(name, attributes, doc, packageNameParts, className, lineNumber)
            self.name = name;
            self.attributes = attributes;
            self.doc = doc;
            self.packageNameParts = packageNameParts;
            self.className = className;
            self.kind = 'property';
            self.lineNumber = lineNumber;
        end
        
        function str = headerStr(self)
            keywords = {};
            if isfield(self.attributes, 'Access') && ismember(self.attributes.Access, {'private', 'protected'})
                keywords{1,end+1} = self.attributes.Access;
            end
            keywords{1,end+1} = 'property';
            str = [self.name ' (' strjoin(keywords, ' ') ')'];
        end

    end

end
