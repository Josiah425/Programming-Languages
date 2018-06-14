/*1.01*/
my_last(X, [X]).
my_last(X, [_|T]) :- my_last(X, T).

/*1.02*/
last_but_one(X,[X,_]).
last_but_one(X,[_,Y|Ys]) :- last_but_one(X,[Y|Ys]).

/*1.03*/
element_at(X, [X|_], 0).
element_at(X, [_|T], N) :- N1 is N-1, N1 >= 0, element_at(X, T, N1).

/*1.04*/
list_length([], 0).
list_length([_|T], N) :- N1 is N-1, list_length(T, N1).

/*1.05*/
my_reverse(L1,L2) :- my_rev(L1,L2,[]).

my_rev([],L2,L2) :- !.
my_rev([X|Xs],L2,Acc) :- my_rev(Xs,L2,[X|Acc]).

/*Test2*/
eliminate([], _).
eliminate([H|T], L) :- member(H,L), eliminate(T, L).
eliminate([H|T], L) :- append([H], L, L1), eliminate(T, L1).

rotate_list(L, L, 0).
rotate_list([H|T], R, N) :- N1 is N - 1, append(T, [H], R1), rotate_list(R1, R, N1).

gcd(M, N, G) :- M >= N, gcdHelper(M, N, G, M).
gcd(M, N, G) :- N > M, gcdHelper(M, N, G, N).
gcdHelper(M, N, G, D) :- T is M/D, T1 is M//D, T = T1, K is N/D, K1 is N//D, K = K1, G = D, !.
gcdHelper(M, N, G, D) :- D > 1, D1 is D-1, gcdHelper(M, N, G, D1).

compress([], []).
compress([X], [X]).
compress([H1,H1|T], X) :- compress([H1|T], X).
compress([H1,H2|T], [H1|T1]) :- compress([H2|T], T1).

my_flatten(X, [X]) :- \+ is_list(X).
my_flatten([], []).
my_flatten([H|T], X) :- my_flatten(H, Y), my_flatten(T, Ys), append(Y, Ys, X).

pack([], []).
pack([X|Xs], [Z|Zs]) :- transfer(X, Xs, Ys, Z), pack(Ys, Zs).
transfer(X, [], [], [X]).
transfer(X, [Y|Ys], [Y|Ys], [X]) :- X \= Y.
transfer(X, [X|Xs], Ys, [X|Zs]) :- transfer(X, Xs, Ys, Zs).

is_prime(2).
is_prime(V) :- is_prime_help(V, 2).
is_prime_help(V, X) :- X1 is X+1, V >= X, T1 is V / X, T2 is V // X, T1 \= T2, is_prime_help(V, X1).
is_prime_help(V, V).

mys([], [[]]).
mys([X|T],P):- mys(T,PT), amys(X,PT,P).
amys(X,[],[]).
amys(X, [S|ST], [ [X|S], S | PT] ):- amys(X,ST,PT).





