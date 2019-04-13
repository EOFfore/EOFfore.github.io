xquery version "1.0";



declare namespace ext="http://www.altova.com/xslt-extensions";

for $x in doc("data_test1.xml")/film/item
where $x
order by $x/information/showDate descending
return <li>Name:{data($x/information/name)}    ShowDate:{data($x/information/showDate)}</li>
