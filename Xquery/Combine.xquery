xquery version "1.0";

declare namespace ext="http://www.altova.com/xslt-extensions";


<film>{
let $itemList :=(
for $item at $index
in doc("data_test1.xml")/film/item
let $mark :=$item/mark
let $showDate :=$item/showDate
where $mark>8.7
order by $showDate descending
return
$item

)
return
(:Part-one:)
 
for $x in $itemList[position() lt 5]
return $x


}

{
for $y in doc("tempData.xml")/film/item
return $y

}

</film>



(:for $x in doc("data_test1.xml")/film/item
where $x
order by $x/information/showDate descending
return <li>Name:{data($x/information/name)}    ShowDate:{data($x/information/showDate)}</li>
:)


