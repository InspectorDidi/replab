classdef BSGSAction < replab.cat.Action
    
    methods
        
        % Implement
        %
        % function p = findMovedElement(self, g)
        % returns either p such that leftAction(g, p) != p
        % or [] if no such p exists
        
    end
    
    methods % LAWS
        
        function law_findMovedElement_identity(self)
            p = self.findMovedElement(self.G.identity);
            assertEqual(p, []);
        end
        
        function law_findMovedElement_G(self, g)
            p = self.findMovedElement(g);
            if ~isequal(p, [])
                p1 = self.leftAction(g, p);
                self.P.assertNotEqv(p, p1);
            end
        end
        
    end
    
end