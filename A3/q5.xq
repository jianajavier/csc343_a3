 for $anOscar in doc("oscars.xml")//Oscar
  
 let $allOscarsYears :=
          for $anOscar2 in doc("oscars.xml")//Oscar
		  where $anOscar/Type = $anOscar2/Type
          return $anOscar2/@year
 where $anOscar/@year <= min($allOscarsYears)
 return <First-Time_Award type="{$anOscar/Type}" year="{$anOscar/@year}" title="{doc("movies.xml")//Movie[Oscar/@OID=$anOscar/@OID]/Title}"/>

(: <First-Time_Award type="Best Achievement in Cinematography" year="2009" title="Avatar"/>,
<First-Time_Award type="Best Achievement in Art Direction" year="2009" title="Avatar"/>,
<First-Time_Award type="Best Picture" year="1997" title="Titanic"/>,
<First-Time_Award type="Best Director" year="1997" title="Titanic"/>,
<First-Time_Award type="Best Achievement in Visual Effects" year="1997" title="Titanic"/>,
<First-Time_Award type="Best Costume Design" year="1997" title="Titanic"/>,
<First-Time_Award type="Best Sound" year="1997" title="Titanic"/>,
<First-Time_Award type="Best Actress in a Leading Role" year="1988" title=""/>,
<First-Time_Award type="Best Performance by an Actor in a Leading Role" year="2004" title=""/>,
<First-Time_Award type="Best Performance by an Actress in a Leading Role" year="2008" title=""/>,
<First-Time_Award type="Best Achievement in Makeup" year="2010" title="Star Trek"/> :)