:- dynamic letter/1.

letter(a).
letter(b).
letter(c).

start :-
    write('Hi, This is the "Name Game".'), nl,
    write('You will be given a set of English letters in which you will add, delete or move to create your name.'), nl,
    menu.

menu :-
    nl,
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice....'), nl,
    read(C),
    choice(C).

choice(1) :- !,
    show_letters,
    menu.

choice(2) :- !,
    write('Enter the letter: '), read(L),
    assert(letter(L)),
    write('Letter added.'), nl,
    menu.

choice(3) :- !,
    write('Enter the letter: '), read(L),
    asserta(letter(L)),
    write('Letter added at the top.'), nl,
    menu.

choice(4) :- !,
    write('Enter the letter: '), read(L),
    assertz(letter(L)),
    write('Letter added at the bottom.'), nl,
    menu.

choice(5) :- !,
    write('Enter the letter to delete: '), read(L),
    delete_letter(L),
    menu.

choice(6) :- !,
    retractall(letter(_)),
    write('All letters deleted.'), nl,
    menu.

choice(7) :- !,
    write('Goodbye!'), nl.

choice(_) :-
    write('Invalid choice, try again.'), nl,
    menu.

show_letters :-
    letter(X),
    write(X), write(' '),
    fail.
show_letters :- nl.

delete_letter(L) :-
    retract(letter(L)), !,
    write('Letter deleted.'), nl.
delete_letter(_) :-
    write('This letter is not in the set.'), nl.
