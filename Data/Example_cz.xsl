<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xpath-default-namespace="http://www.hz-sp.com/2005/XMLSchema-menu" version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">

        <html>
            <head>
                <title>湖人总冠军小组信息发布网</title>
                <link rel="stylesheet" type="text/css" href="../static/css/Example_cz.css"/>
            </head>
            <body>
                <div id="div_title">
                    <p style="margin-bottom:20px">宣传广告</p>
                </div>
                <xsl:for-each select="film/item">
                    <xsl:if test="information/name/text()='调音师'">


                        <div>
                            <img align="left" width="340" height="500" style="margin-left:100px;margin-top:50px">
                                <xsl:attribute name="src">
                                    <xsl:value-of select="information/poster"/>
                                </xsl:attribute>
                            </img>
                            <div style="color:#0C6978; margin-left:500px;font-size:26px;">
                                <br/>
                                <!--<div style="text-align:center">
                            <strong style="font-size:48px;color:#000000">电影基本信息</strong></div>-->

                                <div style="font-weight:bold;font-size:40px;color:#548B54;margin-top:0;display:inline;">
                                    <xsl:value-of select="information/name"/>
                                </div>
                                <br/>
                                <br/>
                                类型:
                                <xsl:value-of select="information/type"/>
                                <br/>
                                时长：
                                <xsl:value-of select="information/duration"/>
                                <br/>
                                制片国家：
                                <xsl:value-of select="information/production"/>
                                <br/>
                                上映日期：
                                <xsl:value-of select="information/showDate"/>
                                <br/>

                                电影链接：
                                <xsl:value-of select="res"/>
                                <br/>
                                评分：
                                <xsl:value-of select="mark"/>
                                <br/>
                                <br/>
                                导演：
                                <xsl:value-of select="person/director"/>
                                <br/>
                                演员：
                                <xsl:value-of select="person/actor"/>
                                <br/>
                                <br/>
                                <p style="font-size:26px;color:#000000;margin-top:0;display:inline;">剧情简介</p>

                                <div style="font-size:20px;color:#000000;opacity:0.7;display:inline;">
                                    <br/>

                                    <xsl:value-of select="information/brief"/>
                                </div>
                                <br/>
                            </div>

                        </div>


                    </xsl:if>
                </xsl:for-each>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>