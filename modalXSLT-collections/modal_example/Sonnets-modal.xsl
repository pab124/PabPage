<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output indent="yes" method="xml" doctype-system="about:legacy-compat"/>
    
    <!-- This is our root template establishing the structure of our HTML-output -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Shakespeare Sonnets</title>
            </head>
            <body>
                <!-- This creates a Table of Contents section -->
                <h1>Shakespearean Sonnets</h1>
                <h2>Contents</h2>
                <ul>
                    <xsl:apply-templates select="//sonnet" mode="toc"/>
                </ul>
                <hr/> <!-- horizontal rule line to separate sections-->
                <!-- This section reproduces the text of the xml-file -->
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <!-- This template creates a single entry in the ToC for each sonnet 
    referencing the sonnet's number and the text of its first line -->
    <xsl:template match="sonnet" mode="toc">
        <li>
            <xsl:apply-templates select="@number"/>
            <!-- or <xsl:value-of select="@number"/> -->  
            <xsl:text>. </xsl:text>
            <xsl:apply-templates select="line[1]" mode="toc"/>
        </li>
    </xsl:template>
    
    <!-- This template reproduces the text of a (first) line of each sonnet 
         referenced by the above template -->
    <xsl:template match="line" mode="toc">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- This template references and formats the sonnet's number to be its title, 
        and then references and places the text of each sonnet inside paragraphs -->
    <xsl:template match="sonnet">
        <h2>
            <xsl:apply-templates select="@number"/>
        </h2>
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <!-- This template reproduces the text of each sonnet, with line-breaks, 
        referenced inside the paragraphs of the above template -->
    <xsl:template match="line">
        <xsl:apply-templates/>
        <!-- This xsl-if statement tests for the presence of a next line, 
            since the last line needs no line-break -->
        <xsl:if test="following-sibling::line">
            <br/>
            <!-- Optional new-line in HTML: <xsl:text>&#x0a;</xsl:text> -->
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
