clc
clear
close all


%Experiment Part I:

M = 100;
N = 200;
K = 20;


PdB = [0, -2. -4];
PndB = 10;

S = genSrcMatrix(M, K, length(PdB));

A = genDataMatrix(S, M, N, PdB, PndB);

R = genCorrMatrix(A, N);


%Experiment Part II:

[U, sval, V] = svd(A);
sval = diag(sval);

%U_l = U(:, 1:6);

[eigvec, eigval0]= eig(R);
[eigval, idx]= sort(diag(eigval0), 'descend');
eigvec = eigvec(:,idx);

figure;
stem(sval);
xlabel('Index');
ylabel('Magnitude');
title('Singular values of A');

figure;
stem(eigval);
xlabel('Index');
ylabel('Magnitude');
title('Eigen values of R');

sigmaRatio = sval(3)/sval(4);

lambdaRatio = eigval(3)/eigval(4);

Pn = getPn(M, U, 3);

R_inv = inv(R);

S_music1 = sMusic(S(:, 1), Pn);

S_music2 = sMusic(S(:, 2), Pn);

S_music3 = sMusic(S(:, 3), Pn);

S_mvdr1 = sMvdr(S(:, 1), R_inv);

S_mvdr2 = sMvdr(S(:, 2), R_inv);

S_mvdr3 = sMvdr(S(:, 3), R_inv);

testSMusic = zeros(1, 20);

testSMvdr = zeros(1, 20);

S2 = genSrcMatrix(M, K, 20);

for h = 1:20
    
    testSMusic(h) = sMusic(S2(:,h), Pn);
    testSMvdr(h) = sMvdr(S2(:,h), R_inv);
    
end

testSMusicMax = max(testSMusic);
testSMusicMean = mean(testSMusic);
testSMusicMedian = median(testSMusic);

testSMvdrMax = max(testSMvdr);
testSMvdrMean = mean(testSMvdr);
testSMvdrMedian = median(testSMvdr);

%Both the music and mvdr spectra are much greater for the actual s vectors
%compared to the randomly generated ones

%We will say that the music one is better because the ideal value is
%infinity and it reaches infinity in some cases! They are much greater than
%the random ones!

%Experiment Part III:

M2 = 100;

N2 = 50;

S3 = genSrcMatrix(M2, K, length(PdB));

A2 = genDataMatrix(S3, M2, N2, PdB, PndB);

[U2, sval2, V2 ] = svd(A2);
sval2 = diag(sval2);

figure;
stem(sval2);
xlabel('Index');
ylabel('Magnitude');
title('Singular values of A (PART III)');

sigmaRatio2 = sval2(3)/sval2(4);

Pn2 = getPn(M2, U2, 3);

S2_music1 = sMusic(S3(:, 1), Pn2);

S2_music2 = sMusic(S3(:, 2), Pn2);

S2_music3 = sMusic(S3(:, 3), Pn2);

testS2Music = zeros(1, 20);

S4 = genSrcMatrix(M2, K, 20);

for h = 1:20
    
    testS2Music(h) = sMusic(S4(:,h), Pn2);
    
end

testS2MusicMax = max(testSMusic);
testS2MusicMean = mean(testSMusic);
testS2MusicMedian = median(testSMusic);

%The music algorithm still works... but much worse for a lower N value. The
%difference between the spectra for the actual and randomly generated s
%vectors is much lower. the sigma ratio is also lower

%Experiment part IV:

W = S' * S

% This is positive and real, so it means that it has a basis of eigen
% vectors and the eigen values are real. 

%This also reveals the rank. 3 columns -> rank 3

%Basically, its a gram matrix of a linear set of independent vectors



function sMu = sMusic(s, pn)
    sMu = 1/(s' * pn * s);
end

function sMv = sMvdr(s, rinv)

    sMv = 1 / (s' * rinv * s);

end


function pn = getPn(m, u, l) 

    ps = u(:, 1:l) * u(:, 1:l)';
    pn = eye(m) - ps;

end

function r = genCorrMatrix(a, n)

    r = (1/n)*(a*a');

end


function a = genDataMatrix (s, m, n, pdb, pndb)
    
    l = length(pdb);
    
    b = genPwrMatrix(l, n, pdb);
    
    v = genNoiseMatrix(m, n, pndb);
        
    a = s*b + (1/sqrt(m))*v;
        
end
    
function v = genNoiseMatrix(m, n, pndb)
    
    var = 10^(pndb/10);
    
    v = sqrt(var)*randn(m, n);
    
end
    
    
function b = genPwrMatrix(l, n, pdb)
    
    var = 10.^(pdb/10);
    
    vart = var';
    
    b = sqrt(vart).*randn(l, n);
    
end
    
    
function s = genSrcMatrix(m, k, l)
    
    s = zeros(m, l);
        
    for i = 1:l
        s(:, i) = genSrcSig(m, k);
    end
    
end
    
    
function srcSig = genSrcSig(m, k)
    srcSig = zeros(1, m);
    
    g = randperm(m, k);
    
    for i = g
        srcSig(i) = 1/sqrt(k);
    end
end
    
    
    