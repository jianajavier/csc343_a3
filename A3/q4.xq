let $md := fn:doc("movies.xml")
let $pd := fn:doc("people.xml")

for $Movie in $md//Movie for $Person in $pd//Person
return
if ($Person/@PID = $Movie/Director/@PID)
then
    if ($Person/Name/First eq "James") then
      if ($Person/Name/Last eq "Cameron") then
        if ($Movie/@year>2000) then
          <MOVIE>
          {$Movie/Title}
          <YEAR> { data($Movie/@year) } </YEAR>
          </MOVIE>
        else ()
      else ()
    else ()
  else ()


(:
All movies that were directed by James Cameron
since the year 2001. Assume there is only one
“Person” with the name James Cameron. Return
the movie title and the movie year.

Output:
<MOVIE><Title>Avatar</Title><YEAR>2009</YEAR></MOVIE>

:)
