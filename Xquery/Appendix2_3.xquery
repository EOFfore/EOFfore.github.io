xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";


(:_‰¾éƒ‘_ºæ_”_š„_”µå½±:)

for $x in doc("../Data/tempData.xml")/film/item
where contains(string($x/person/actor),"Ö£âı")
order by $x/information/name descending
return $x