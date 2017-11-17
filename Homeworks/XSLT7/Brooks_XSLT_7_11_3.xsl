<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    version="3.0">
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    
    <xsl:template match="/">
    <html>
        <head>
            <link rel="stylesheet" type="text/css" href="Brooks_XSLT_7_11_3.css"/>
            <title>Nell Nelson Stuff </title>
        </head>
        <body>
            <div id="title"><h1>The White Slaves of Free America</h1></div>
            <xsl:apply-templates select="//text"/>
        </body>
    </html>
    </xsl:template>
    
    <xsl:template match="text">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="div[@type='headlines']">
        <div id="headlines"><em><xsl:text>Headlines</xsl:text></em>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="//list/item">
        <h5><item>
            <xsl:apply-templates/>
        </item></h5>
    </xsl:template>
    
    <xsl:template match="div[@type='chapterBody']">
        <div id="chapterBody"><em><xsl:text>Article</xsl:text></em><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="p">
        <p><xsl:apply-templates/></p><br/>
    </xsl:template>
    
    <xsl:template match="desc">
        <span class="{@type}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="ref">
        <span class="referent" value="{@type}"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="persName">
        <span class="persName">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="num">
        <num type="{@type}" value="{@value}">
            <xsl:apply-templates/>
        </num>
    </xsl:template>
    
    <xsl:template match="placeName">
        <span class="placeName">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="pb">
        <pb n="{@n}"/>
        <hr/><a href="#title"><xsl:text>Top</xsl:text></a><br/>
    </xsl:template>
    
    <xsl:template match="quote">
        <strong><span class="quote">
            <xsl:apply-templates/>
        </span></strong>
    </xsl:template>
    
    <xsl:template match="orgName">
        <span class="orgName"><xsl:apply-templates/></span>
    </xsl:template>
    
</xsl:stylesheet>