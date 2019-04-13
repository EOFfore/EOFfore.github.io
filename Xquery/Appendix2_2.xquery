xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";


(:上映日期在2019年1月1日到今天之间:)

for $x in doc("CombineData.xml")/film/item
where $x/information/showDate>'2019-01-01'and $x/information/showDate<'2019-04-13'
order by $x/information/showDate descending
return $x