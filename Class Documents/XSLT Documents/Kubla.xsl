<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml" version="2.0">
    <!--xpath-default-namespace="http://www.tei-c.org/ns/1.0" -->
   
    <!--ebb: NOTICE: the namespaces are defined above to read in TEI and output HTML. -->
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>  
    
    <xsl:template match="/">
        <html>
            <head>
                <!--<link rel="stylesheet" type="text/css" href="stylesheet.css"/> -->
                <title>title text here</title>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>