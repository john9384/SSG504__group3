isEven(N):-
    0 is mod(N,2).

countEvenOdd([],[0,0]).

countEvenOdd([H|C],[Even,Odd]):-
  countEvenOdd(C,[E,O]),
  ( isEven(H) -> 
    Even is E+1,Odd is O+0; 
    Even is E+0, Odd is O+1
  ).