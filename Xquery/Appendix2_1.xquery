xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";


(:时长在100min-120min之间:)

for $x in doc("data_test1.xml")/film/item
where $x/information/duration>'PT100M'and $x/information/duration<'PT120M'
order by $x/information/duration descending
return $x