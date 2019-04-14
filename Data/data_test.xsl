<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xpath-default-namespace="http://www.hz-sp.com/2005/XMLSchema-menu" version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">


<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../static/css/data_xsl.css"/>
    <embed src="basketball.svg" width="300" height="100" type="image/svg+xml"/>
    </head>
<body>
    <div id="div_movieList" float="right">
        <p id="p_movieList">电影列表</p>
        <table>

        <td>
            <h2>按类型排序(蓝色的为国产电影)</h2>
        <table border="1">
      <tr bgcolor="#FF8C00">
        <th>Name</th>
        <th>Type</th>
      </tr>
            <xsl:for-each select="//information">
                <xsl:sort select="type"/>

                <tr>
                    <xsl:choose>
          <xsl:when test="production ='中国'" >
            <td bgcolor="#87CEFA">
              <xsl:value-of select="name"/></td>
          </xsl:when>
                       <!--多个条件
                        <xsl:when test="production='美国'" >
            <td bgcolor="#87CEFA">
              <xsl:value-of select="name"/></td>

          </xsl:when>-->

          <xsl:otherwise>
              <td><xsl:value-of select="name"/></td>
          </xsl:otherwise>

        </xsl:choose>

 <td><xsl:value-of select="type"/></td>
                    <!--<td><xsl:value-of select="contains(type,'动作')"/><td>-->
                </tr>
            </xsl:for-each>
        </table>
        </td>



          <td>
               <h2 style="margin-left:220px">当前本站评分top10排名</h2>
        <table border="1" style="margin-left:220px;margin-bottom: 590px;">
      <tr bgcolor="#FFD700">
        <th>Name</th>
        <th>Mark</th>
      </tr>
            <xsl:for-each select="//item" >
    <xsl:sort select="mark" order="descending"/>
                <!--保留前10个数据-->

                 <xsl:if test="position() &gt; 11">
                <tr>
                 <td><xsl:value-of select="information/name"/></td>
               <td><xsl:value-of select="mark"/></td>
                 <!--属性展示
                    <td>
                    <xsl:value-of select="information/showDate[@country]/@country" />
                    </td>
                    -->
                </tr>
                </xsl:if>

            </xsl:for-each>
        </table>
        </td>
        </table>
        <br/>
    </div>

    <div id="div_showData">
         <p id="p_data">电影信息</p>
        <xsl:for-each select="//item">
            <p id="p_movieName"> <xsl:value-of select="information/name" /></p>
            <div id="div_moviePoster">
                <img id="img_moviePoster">
                    <xsl:attribute name="src">
                    <xsl:value-of select="information/poster"/>
                    </xsl:attribute>
                </img>
            </div>
            <p id="p_movieType">类型 : <xsl:value-of select="information/type"/></p>
             <p id="p_movieDuration">时长 : <xsl:value-of select="information/duration"/></p>
            <p id="p_movieCountry">制片国家 : <xsl:value-of select="information/production"/></p>
            <p id="p_movieShowDate">上映时间 : <xsl:value-of select="information/showDate"/></p>
            <p id="p_movieBrief">剧情简介 :  <xsl:value-of select="information/brief"/></p>

            <p id="p_movieRes">电影资源链接 :  <xsl:value-of select="res" /></p>
            <p id="p_movieMark">电影评分 :  <xsl:value-of select="mark" /></p>
            <p id="p_movieDirector">导演 :  <xsl:value-of select="person/director" /></p>
            <p id="p_movieActor">主演 :  <xsl:value-of select="person/actor" /></p>
            <br/><br/><br/>
       </xsl:for-each>
    </div>
</body>
</html>
</xsl:template>

</xsl:stylesheet>