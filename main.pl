vertical(point2d(X,Y), point2d(A,B)):- X =:= A, Y =\= B.
horizontal(point2d(X,Y), point2d(A,B)):- X =\= A, Y =:= B.
diagonal(point2d(X,Y), point2d(A,B), point2d(C,D)):- rdiv(-(B,Y),-(A,X)) =:= rdiv(-(D,B),-(C,A)). 

line(point2d(X,Y), point2d(A,B), point2d(C,D)):- vertical(point2d(X,Y), point2d(A,B)), vertical(point2d(X,Y), point2d(C,D)); 
	horizontal(point2d(X,Y), point2d(A,B)), horizontal(point2d(X,Y), point2d(C,D)); 
	diagonal(point2d(X,Y), point2d(A,B), point2d(C,D)).

triangle(point2d(X,Y), point2d(A,B), point2d(C,D)):- not(line(point2d(X,Y), point2d(A,B), point2d(C,D))).

findDistance(point2d(X,Y), point2d(A,B), point2d(C,D), L, M, N) :- L is sqrt(+(**(-(A,X),2),**(-(B,Y),2))), M is sqrt(+(**(-(D,B),2),**(-(C,A),2))), N is sqrt(+(**(-(X,C),2),**(-(Y,D),2))).
#sort distance takes lmn as input and reassigns them based on size to P,J,H. P as the largest
sortDistance(L,M,N, P,J,H) :- L > M, L > N -> P is **(L,2), J is **(M,2), H is **(N,2); M > L, M > N -> P is **(M,2), J is **(L,2), H is **(N,2); N > M, N > L -> P is **(N,2), J is **(L,2), H is **(M,2).

twoDistanceEqual(point2d(X,Y), point2d(A,B), point2d(C,D)) :- sqrt(+(**(-(A,X),2),**(-(B,Y),2))) =:= sqrt(+(**(-(D,B),2),**(-(C,A),2))); sqrt(+(**(-(A,C),2),**(-(B,D),2))) =:= sqrt(+(**(-(X,C),2),**(-(Y,D),2))); 
																sqrt(+(**(-(A,X),2),**(-(B,Y),2))) =:= sqrt(+(**(-(C,X),2),**(-(D,Y),2))).

noDistanceEqual(point2d(X,Y), point2d(A,B), point2d(C,D)) :- sqrt(+(**(-(A,X),2),**(-(B,Y),2))) =\= sqrt(+(**(-(D,B),2),**(-(C,A),2))), sqrt(+(**(-(A,C),2),**(-(B,D),2))) =\= sqrt(+(**(-(X,C),2),**(-(Y,D),2))), 
																sqrt(+(**(-(A,X),2),**(-(B,Y),2))) =\= sqrt(+(**(-(C,X),2),**(-(D,Y),2))).

onedistance(point2d(X,Y), point2d(A,B), S) :- S is sqrt(+(**(-(A,X),2),**(-(B,Y),2))) -> writeln(S).

greatestLengths(point2d(X,Y), point2d(A,B), point2d(C,D), L, M, N) :- onedistance(point2d(X,Y), point2d(A,B), L), onedistance(point2d(X,Y), point2d(C,D), M), onedistance(point2d(A,B), point2d(C,D), N). 


equalateral(point2d(X,Y), point2d(A,B), point2d(C,D)):- findDistance(point2d(X,Y), point2d(A,B), point2d(C,D), L, M, N), L =:= M, N =:= M, L =:= N.
isosceles(point2d(X,Y), point2d(A,B), point2d(C,D)):- twoDistanceEqual(point2d(X,Y), point2d(A,B), point2d(C,D)).
scalene(point2d(X,Y), point2d(A,B), point2d(C,D)):- noDistanceEqual(point2d(X,Y), point2d(A,B), point2d(C,D)).

right(point2d(X,Y), point2d(A,B), point2d(C,D)):- findDistance(point2d(X,Y), point2d(A,B), point2d(C,D), L, M, N), sortDistance(L,M,N, P,J,H), writeln(P),writeln(J),writeln(H), P =:= J + H.
acute(point2d(X,Y), point2d(A,B), point2d(C,D)):- findDistance(point2d(X,Y), point2d(A,B), point2d(C,D), L, M, N), sortDistance(L,M,N, P,J,H), writeln(P),writeln(J),writeln(H), P < J + H.
obtuse(point2d(X,Y), point2d(A,B), point2d(C,D)):- findDistance(point2d(X,Y), point2d(A,B), point2d(C,D), L, M, N), sortDistance(L,M,N, P,J,H), writeln(P),writeln(J),writeln(H), P > J + H.
