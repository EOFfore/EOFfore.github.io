xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";


(:上_�__��期_�_2019�_1_��1_��到�_�天�_�_�_:)

for $x in doc("../Data/CombineData.xml")/film/item
where $x/information/showDate>'2019-01-01'and $x/information/showDate<'2019-04-13'
order by $x/information/showDate descending
return $x