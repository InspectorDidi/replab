classdef Package < replab.Str
    
    properties
        nameParts % row cell vector of string: parts of the package
        members % struct-based hash map
    end

    methods
       
        function self = Package(nameParts, memberList)
            self.nameParts = nameParts;
            members = struct;
            for i = 1:length(memberList)
                member = memberList{i};
                members.(member.name) = member;
            end
            members = orderfields(members);
            self.members = members;
        end
        
        function str = fullName(self)
            str = strjoin(self.nameParts, '.');
        end
        
        function b = hasMember(self, name)
            b = isfield(self.members, name);
        end
        
        function m = member(self, name)
            m = self.members.(name);
        end
        
        function names = hiddenFields(self)
            names = hiddenFields@replab.Str(self);
            names{1, end+1} = 'members';
        end
        
        function [names values] = additionalFields(self)
            [names values] = additionalFields@replab.Str(self);
            fn = fieldnames(self.members);
            for i = 1:length(fn)
                names{1, end+1} = sprintf('member(''%s'')', fn{i});
                values{1, end+1} = self.member(fn{i});
            end
        end

        function s = headerStr(self)
            s = ['Package ' strjoin(self.nameParts, '.')];
        end
                
    end
    
end
