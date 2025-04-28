% Represent the family relations as function terms and predicates.
% basato sull'albero genealogico mostrato nell'immagine "img/kinship.png"

% male/female
male(george).
male(philip).
male(spencer).
male(charles).
male(mark).
male(andrew).
male(edward).
male(william).
male(harry).
male(peter).
male(james).
female(mum).
female(elizabeth).
female(kydd).
female(margaret).
female(diana).
female(anne).
female(sarah).
female(sophie).
female(zara).
female(beatrice).
female(eugenie).
female(louise).

% spouse
spouse_fact(mum, george).
spouse_fact(kydd, spencer).
spouse_fact(elizabeth, philip).
spouse_fact(diana, charles).
spouse_fact(anne, mark).
spouse_fact(sarah, andrew).
spouse_fact(sophie, edward).

% parent
parent(mum, margaret).
parent(george, margaret).
parent(mum, elizabeth).
parent(george, elizabeth).
parent(kydd, diana).
parent(spencer, diana).
parent(elizabeth, charles).
parent(philip, charles).
parent(elizabeth, anne).
parent(philip, anne).
parent(elizabeth, andrew).
parent(philip, andrew).
parent(elizabeth, edward).
parent(philip, edward).
parent(diana, william).
parent(charles, william).
parent(diana, harry).
parent(charles, harry).
parent(anne, peter).
parent(mark, peter).
parent(anne, zara).
parent(mark, zara).
parent(sarah, beatrice).
parent(andrew, beatrice).
parent(sarah, eugenie).
parent(andrew, eugenie).
parent(sophie, louise).
parent(edward, louise).
parent(sophie, james).
parent(edward, james).


% rendo spouse simmetrico
spouse(X,Y):-spouse_fact(X,Y);spouse_fact(Y,X).

% altre regole
wife(X,Y):-female(X),spouse(X,Y).
husband(Y,X):-male(Y),spouse(X,Y).
child(X,Y) :- parent(Y,X).
daughter(X,Y):-female(X),child(X,Y).
son(X,Y):-male(X),child(X,Y).
father(X,Y):-male(X),parent(X,Y).
mother(X,Y):-female(X),parent(X,Y).
sibling(X,Y):-parent(Z,X),parent(Z,Y),X\=Y.
sister(X,Y):-female(X),sibling(X,Y).
brother(X,Y):-male(X),sibling(X,Y).
grandparent(X,Y):-parent(Y,Z), parent(Z,X).
grandchild(X,Y):-grandparent(Y,X).
firstCousin(X,Y):-parent(A,X),parent(B,Y),sibling(A,B).
brotherInLaw(X,Y):-spouse(Y,Z),brother(X,Z).
sisterInLaw(X,Y):-spouse(Y,Z),sister(X,Z).
aunt(X,Y):-parent(Z,Y),(sister(X,Z);sisterInLaw(X,Z)).
uncle(X,Y):-parent(Z,Y),(brother(X,Z);brotherInLaw(X,Z)).
greatgrandparent(X,Y):-parent(X,Z),grandparent(Z,Y).
ancestor(X,Y):-parent(X,Y).
ancestor(X,Y):-parent(Z,Y),ancestor(X,Z).
cousin(X,Y):-ancestor(A,X),ancestor(B,Y),sibling(A,B).