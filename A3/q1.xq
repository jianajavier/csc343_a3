let $d := fn:doc("people.xml")

return <AVG_OSCARS> {avg (
for $Person in $d/People/Person
return <COUNT> { count($Person/Oscar) } </COUNT>
)} </AVG_OSCARS>
