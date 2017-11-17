<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Bad Hamlet Speeches</title>
            </head>
            <body>
                <xsl:for-each select="//role">
                    <p>
                        <xsl:value-of select="."/>
                        <xsl:text>: </xsl:text>
                        <xsl:value-of select="count(//sp[contains(@who, current()/@xml:id)])"/>
                    </p>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>