let $md := fn:doc("movies.xml")
let $pd := fn:doc("people.xml")

let $actors := $md//Actor
let $directors := $md//Director
let $people := $pd//Person

for $Person in $people for $Actor in $actors for $Director in $directors
return
if ($Actor/@PID eq $Director/@PID) then
                if ($Person/@PID eq $Actor/@PID)
                then
                <PERSON PID="{$Person/@PID}">{$Person/Name/Last}</PERSON>
                else ()
        else ()

(:

Didn't particularly test on one or more movies but should
work because as long as it finds one it will return

After modifying movies.xml, output is:
<PERSON PID="person_2"><Last>Worthington</Last></PERSON>


:)
