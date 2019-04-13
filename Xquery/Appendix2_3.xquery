xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";


(:找郑恺演的电影:)

for $x in doc("tempData.xml")/film/item
where contains(string($x/person/actor),"郑恺")
order by $x/information/name descending
return $x