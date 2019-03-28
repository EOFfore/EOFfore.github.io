<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xpath-default-namespace="http://www.hz-sp.com/2005/XMLSchema-menu" version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">

    <html>
        <head>
            <title>湖人总冠军小组信息发布网</title>
        <link rel="stylesheet" type="text/css" href="../static/css/poster_xsl.css"/>
         <link rel="stylesheet" type="text/css" href="../static/css/pictures.css"/>
   </head>
        <body>
            <div id="div_title">
        <p style="margin-bottom: 0px"><a id="a_ico"></a>湖人总冠军小组</p>
    </div>

    <img src="../static/images/back2.jpg" alt="信息案例模型1" class="modelTest" style="float:left;"/>

   <div id="team_infor">
       <div id="title" align="center" style="font:30px arial"> 小组信息</div>
        <p>作为xml10号小组，我们选择电影作为主题，进行素材的抓取，所有数据均来自豆瓣网，由两位组员合作完成</p>

       <br/>

       <div id="title" align="center" style="font:30px arial"> 成员信息</div>
            <xsl:for-each select="//card">
                     <xsl:value-of select="姓名"/>
<!--                    对属性的插入
               <xsl:for-each select="//姓名[@身份]">
                    <xsl:if test="position() &gt; 1">
                    <xsl:value-of select="@身份" />
                    </xsl:if>
                </xsl:for-each>-->


                <p> 学号: <xsl:value-of select="学号"/></p>
                <p> QQ:<xsl:value-of select="联系方式/QQ"/></p>


                <p>  邮箱:<xsl:value-of select="联系方式/邮箱"/></p>
<br/>
            </xsl:for-each>
    </div>

        </body>
    </html>
</xsl:template>
</xsl:stylesheet>