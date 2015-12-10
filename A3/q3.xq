let $md := fn:doc("movies.xml")
let $pd := fn:doc("people.xml")

for $Director in $md//Director, $Person in $pd//Person
return
  if ($Person/@PID eq $Director/@PID)
  then
    if ($Person/@pob)
    then
      ()
    else
      <PERSON id = "{distinct-values($Person/@PID)}">{$Person/Name/Last}</PERSON>
  else ()

(:

Which directors do not have their place of birth
(pob) listed in the database? Return their person
ID (PID) and last name.

Output:

<PERSON id="person_1"><Last>Cameron</Last></PERSON>,
<PERSON id="person_1"><Last>Cameron</Last></PERSON>

*has duplicates still

:)
