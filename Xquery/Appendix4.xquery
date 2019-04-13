xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";

(:中国上映过的电影评分top10:)


<film>{
let $all :=(
let $itemList :=(
for $item at $index
in doc("data_test1.xml")/film/item

return
$item,
for $y in doc("tempData.xml")/film/item
return $y

)

return
(:Part-one:)
 
for $x in $itemList
where $x/information/showDate/@country="China"
order by $x/mark descending
return $x
)
return

for $z in $all[position() lt 11]

return 
<item>
{
<Name>{data($z/information/name)}</Name>,
<Production>{data($z/information/production)}</Production>,
<Type>{data($z/information/type)}</Type>,
<showDate>{data($z/information/showDate)}</showDate>,
<mark>{data($z/mark)}</mark>
}
(&#x000A;)
</item>
}


</film>