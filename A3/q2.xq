let $d := fn:doc("movies.xml")

for $Movie in $d/Movies/Movie
return
<MOVIE id="{$Movie/@MID}">
<NUM_ACTORS> { count($Movie/Actors/Actor) } </NUM_ACTORS>
</MOVIE>

(:
Output:

<MOVIE id="movie_1"><NUM_ACTORS>3</NUM_ACTORS></MOVIE>,
<MOVIE id="movie_2"><NUM_ACTORS>2</NUM_ACTORS></MOVIE>,
<MOVIE id="movie_3"><NUM_ACTORS>2</NUM_ACTORS></MOVIE>
:)
