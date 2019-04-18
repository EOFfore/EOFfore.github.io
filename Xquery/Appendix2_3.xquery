
declare namespace ext="http://www.altova.com/xslt-extensions";


(:_��郑_���_�_��_��影:)

for $x in doc("../Data/tempData.xml")/film/item
where contains(string($x/person/actor),"郑恺")
order by $x/information/name descending
return $x