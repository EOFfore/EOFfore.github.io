xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";

for $x in doc("../Data/data_test1.xml")/film/item
where $x
order by $x/information/duration descending
return $x