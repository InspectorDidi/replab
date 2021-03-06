function dispatchDefaults
% Register here the default functions used in dispatch for the core of RepLAB
    ;

    % Equivariant construction
    replab.dispatch('register', 'replab.Equivariant.make', 'ForSubReps', 15, ...
                    @(repC, repR, special) replab.equivariant.ForSubReps.make(repC, repR, special));
    replab.dispatch('register', 'replab.Equivariant.make', 'ForRepByImages', 10, ...
                    @(repC, repR, special) replab.equivariant.ForRepByImages.make(repC, repR, special));
    replab.dispatch('register', 'replab.Equivariant.make', 'ForFiniteGroup', 5, ...
                    @(repC, repR, special) replab.equivariant.ForFiniteGroup.make(repC, repR, special));
    % Default method, works for all compact groups
    replab.dispatch('register', 'replab.Equivariant.make', 'ForCompactGroup', 0, ...
                    @(repC, repR, special) replab.equivariant.ForCompactGroup.make(repC, repR, special));

    replab.dispatch('register', 'replab.nice.niceIsotypic', 'trivial', 10, ...
                    @(iso) replab.nice.niceIsotypicTrivial(iso));
    replab.dispatch('register', 'replab.nice.niceIsotypic', 'singleMultiplicity', 5, ...
                    @(iso) replab.nice.niceIsotypicSingleMultiplicity(iso));
    replab.dispatch('register', 'replab.nice.niceIsotypic', 'original', 0, ...
                    @(iso) replab.nice.niceIsotypicOriginal(iso));

    replab.dispatch('register', 'replab.nice.niceSubRep', 'recoverReal', 10, ...
                    @(sub) replab.nice.niceSubRepRecoverReal(sub));
    replab.dispatch('register', 'replab.nice.niceSubRep', 'recoverInteger', 5, ...
                    @(sub) replab.nice.niceSubRepRecoverInteger(sub));
    replab.dispatch('register', 'replab.nice.niceSubRep', 'original', 0, ...
                    @(sub) replab.nice.niceSubRepOriginal(sub));

    replab.dispatch('register', 'replab.irreducible.decomposition', 'usingSplit', 0, ...
                    @(rep) replab.irreducible.decompositionUsingSplit(rep));

    replab.dispatch('register', 'replab.irreducible.split', 'splitTrivialGroup', 500, ...
                    @(r, c) replab.irreducible.splitTrivialGroup(r, c));
    replab.dispatch('register', 'replab.irreducible.split', 'splitBlocks', 400, ...
                    @(r, c) replab.irreducible.splitBlocks(r, c));
    replab.dispatch('register', 'replab.irreducible.split', 'splitAllOnes', 300, ...
                    @(r, c) replab.irreducible.splitAllOnes(r, c));
    replab.dispatch('register', 'replab.irreducible.split', 'splitTrivialComponent', 200, ...
                    @(r, c) replab.irreducible.splitTrivialComponent(r, c));
    replab.dispatch('register', 'replab.irreducible.split', 'splitUsingCommutant', 100, ...
                    @(r, c) replab.irreducible.splitUsingCommutant(r, c));

    replab.dispatch('register', 'replab.graph.burningAlgorithm', 'Fast', 500, ...
                    @(edges) replab.graph.burningAlgorithmFast(edges));
    replab.dispatch('register', 'replab.graph.burningAlgorithm', 'Fallback', 0, ...
                    @(edges) replab.graph.burningAlgorithm(edges));
end
