<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output indent="yes" method="xml" doctype-system="about:legacy-compat"/>
    
    <xsl:variable name="sonnetsColl" select="collection('sonnetss')"/>
    
    <!-- This is our root template establishing the structure of our HTML-output -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Sonnets</title>
            </head>
            <body>
                <h1>Sonnets</h1>
                <h2>Table of Contents</h2>
                <ul>
                    <xsl:apply-templates select="$sonnetsColl//sonnet" mode="toc"/>
                </ul>
                <hr/>
                <xsl:apply-templates select="$sonnetsColl//sonnet"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="//sonnet" mode="toc">
        <li>
            <xsl:apply-templates select="@number"/>
            <xsl:text>. </xsl:text>
            <xsl:apply-templates select="line[1]" mode="toc"/>
        </li>
    </xsl:template>
    
    <xsl:template match="line" mode="toc">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="sonnet">
        <h2>
            <xsl:apply-templates select="@number"/>
        </h2>
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="line">
        <xsl:apply-templates/>
        <xsl:if test="following-sibling::line">
        <br/>
        </xsl:if>
    </xsl:template>
  
  
  
  
</xsl:stylesheet>
