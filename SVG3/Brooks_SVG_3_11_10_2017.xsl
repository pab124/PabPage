<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name="xinterval" select="20"/>
    <xsl:variable name="yinterval" select="30"/>
    
    
    
    <xsl:template match="/">
        
        <svg width="100" height="100">
            <g>
                <!-- y axis -->
                <line x1="0" y1="0" x2="0" y2="400" stroke="black" stroke-width="1"/>
                
                <!-- x axis -->
                <line x1="0" y1="400" x2="{count(//fs/f[@select='Yes'])*$xinterval+$xinterval}" y2="400" stroke="black" stroke-width="1"/>
               
                <!-- x axis variables -->
                <xsl:for-each select="//fs">
                    <xsl:variable name="qnum" select="position()"/>
                    <xsl:variable name="yes" select="/f[@select='Yes']/@n"/>
                    <xsl:variable name="no" select="/f[@select='No']/@n"/>
                    <xsl:variable name="question" select="/f[@name='question']/string"/>
                   
                    <text x="{$qnum*$xinterval}" y="400"  transform="rotate(90 {$qnum*$xinterval},400)">
                        <xsl:value-of select="f[@name='question']/string"/>
                    </text>
                </xsl:for-each>
                
            </g>
        </svg>
    </xsl:template>
    
</xsl:stylesheet>