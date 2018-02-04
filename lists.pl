parent(adam, john).
parent(eve, john).
parent(eve, lisa).
parent(john, anne).
parent(john, pat).
parent(pat, jacob).
parent(carol, jacob).
grandparent(X,Z) :- parent(X,Y), parent(Y,Z).

ancestor(X,Z) :- parent(X,Z).
ancestor(X,Z) :- parent(X,Y), ancestor(Y,Z).

head([H|T], H).
tail([H|T],T).

isMember(Element, [Element|_]).
isMember(Element, [_|T]) :- isMember(Element, T).

prepend(Element, L, [Element|L]).

append([], Element, [Element]).
append([H|T], Element, [H|ExtendedTail]) :- append(T, Element, ExtendedTail).

hasLength(0, []).
hasLength(Length+1, [H|T]) :- hasLength(Length, T).

remove([Element|T], Element, T).
remove([H|T], Element, [H|ReducedTail]) :- remove(T, Element, ReducedTail).
