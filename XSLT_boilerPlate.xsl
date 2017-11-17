<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="2.0">
    <!--ebb: NOTICE: the namespaces are defined above to read in TEI and output HTML. -->
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>  
    
    <xsl:template match="/">
        <html>
            <head>
                <title>speeches in Hamlet</title>
            </head>
            <body>
                <table border="10">
                    <tr>
                        <th>Act</th>
                        <th>Speeches</th>
                    </tr>
                <xsl:apply-templates select="//body/div"/>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="div">
        <tr>
            <td>
                <xsl:apply-templates select="head"/>
            </td>
            <td>
                <xsl:value-of select="count(.//sp)"/>
            </td>
        </tr>
        
    </xsl:template>
</xsl:stylesheet>