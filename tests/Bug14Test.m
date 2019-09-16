function test_suite = Bug14Test()
    try
        test_functions = localfunctions();
    catch
    end
    initTestSuite;

    if ReplabTestParameters.onlyFastTests
        return;
    end
    
    B4 = replab.signed.Permutations(4);
    group = B4.subgroup({[1 -3 2 4]});
    I = group.naturalRep.decomposition;
    test_suite = replab.IrreducibleLaws(I).addTestCases(test_suite);
end
