<Stats>
{
let $allGenres := doc("movies.xml")//Movie/Genre/*
for $myGenre in $allGenres
	let $genreCount := count(doc("movies.xml")//Movie[Genre//Category=$myGenre])
	let $genreTxt  := $myGenre/text()
	return <Bar category= "{$genreTxt}" count="{$genreCount}"></Bar>
}
</Stats>

(:
<Stats><Bar category="Action" count="2"/><Bar category="Science Fiction" count="0"/><Bar category="Fantasy" count="0"/><Bar category="Drama" count="1"/><Bar category="Romance" count="0"/><Bar category="Action" count="2"/><Bar category="Adventure" count="0"/></Stats>
:)