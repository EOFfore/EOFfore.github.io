xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";


(:_��长�_100min-120min之_�_:)

for $x in doc("../Data/data_test1.xml")/film/item
where $x/information/duration>'PT100M'and $x/information/duration<'PT120M'
order by $x/information/duration descending
return $x