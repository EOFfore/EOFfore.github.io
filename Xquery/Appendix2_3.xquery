xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";


(:_��郑_���_�_��_��影:)

for $x in doc("../Data/tempData.xml")/film/item
where contains(string($x/person/actor),"֣��")
order by $x/information/name descending
return $x