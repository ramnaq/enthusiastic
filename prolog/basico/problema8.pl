triangle_area(B,H,Area) :-
	Area is B*H/2.

/* outputs
?- triangle_area(5,5,X).
X = 12.5.

?- triangle_area(10,5,X).
X = 25.

?- triangle_area(10,-5,X).
X = -25.

?- triangle_area(0,5,X).
X = 0.
*/
