xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";

for $x in doc("data_test1.xml")/film/item
where $x
order by $x/mark descending
return $x