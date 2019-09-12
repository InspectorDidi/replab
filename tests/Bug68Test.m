function test_suite = Bug68Test()
    try
        test_functions = localfunctions();
    catch
    end
    initTestSuite;
end
function test_bug
    group = replab.SignedPermutations(12).subgroup({[1 3 2 5 6 7 4 9 8 12 10 11]});
    I = group.naturalRep.decomposition;
    assert(isa(I, 'replab.Irreducible'));
end