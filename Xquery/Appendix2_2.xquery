xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";


(:ä¸Š_˜__—¥æœŸ_œ_2019å¹_1_œˆ1_—¥åˆ°ä_Šå¤©ä_‹_—_:)

for $x in doc("../Data/CombineData.xml")/film/item
where $x/information/showDate>'2019-01-01'and $x/information/showDate<'2019-04-13'
order by $x/information/showDate descending
return $x