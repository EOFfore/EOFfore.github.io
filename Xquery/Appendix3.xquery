xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";




<nation>
{

for $x in doc("data_test1.xml")/film/item
order by $x/information/production descending
return 
<item>
{
<Name>{data($x/information/name)}</Name>,
<Production>{data($x/information/production)}</Production>,
<Type>{data($x/information/type)}</Type>,
<showDate>{data($x/information/showDate)}</showDate>,
<mark>{data($x/mark)}</mark>
}
(&#x000A;)
</item>
}
</nation>