function fsi = frobeniusSchurIndicator(rep, commutantSamples)
% Computes the Frobenius-Schur indicator of an irreducible subrepresentation
%
% An irreducible representation over a complex vector space always has Frobenius-Schur
% indicator $1$.
%
% When the irreducible representation is over a real vector space, then:
%
% - if the indicator is $1$, the representation is of real-type and its complexification
%   is also irreducible,
% - if the indicator is $0$, the representation is complex-type,
% - if the indicator is $-1$, the representation is quaternion-type.
%
% Temporary restriction: the representation must be unitary.
%
% Does not mutate the ``rep`` argument.
%
% Args:
%   rep (`+replab.Rep`): Irreducible real representation to identify the type of
%   commutantSamples (`+replab.+irreducible.Samples`): Samples for the commutant of ``rep``
%
% Returns:
%
%   {-1, 0, 1}: Frobenius-Schur indicator
    assert(isequal(rep.isIrreducible, true), 'Representation must be known to be irreducible');
    assert(rep == samples.rep);
    d = sub.dimension;
    X = commutantSamples.value;
    Xsym = (X+X')/2;
    Xanti = (X-X')/2;
    C = Xsym + 1i * Xanti;
    v = replab.domain.Vectors('C', d).sample;
    v1 = C*v;
    v2 = C*v1;
    tol = replab.Parameters.doubleEigTol;
    switch rank([v v1 v2], tol)
      case 1
        t = 'R';
      case 2
        X1 = commutantSamples.value;
        X2 = commutantSamples.next.value;
        X3 = commutantSamples.next.next.value;
        H1 = (X1 + X1')/2;
        Hi = (X1 - X1')/2;
        Hj = (X2 - X2')/2;
        Hk = (X3 - X3')/2;
        H = replab.quaternion.H(H1, Hi, Hj, Hk);
        w = replab.quaternion.Vectors(d).sample;
        w1 = H*w;
        w2 = H*w1;
        w3 = H*w2;
        w4 = H*w3;
        W = [w.r w1.r w2.r w3.r w4.r
             w.i w1.i w2.i w3.i w4.i
             w.j w1.j w2.j w3.j w4.j
             w.k w1.k w2.k w3.k w4.k];
        switch rank(W, tol)
          case 2
            t = 'C';
          case 4
            t = 'H';
          otherwise
            error('Problem when identifying C/H irrep type');
        end
      otherwise
        error('Problem when identifying R/C/H irrep type');
    end
end