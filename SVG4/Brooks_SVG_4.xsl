<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name="xlength" select="20"/>
    <xsl:variable name="ylength" select="1"/>
    <xsl:variable name="numcon" select="count(//q)"/>
    <xsl:variable name="abbr" select="distinct-values(//abbr/@type)"/>
    <!-- <xsl:variable name="abbrtxt" select="//text/body/q/u/abbr[@type='textese']"/>
    <xsl:variable name="abbrinf" select="//text/body/q/u/abbr[@type='informal']"/>
    <xsl:variable name="abbrcon" select="//text/body/q/u/abbr[@type='contraction']"/> I made these and then changed my plan half way through and ended up not needing them-->
    <xsl:variable name="abbrmax" select="max(TEI/text/body/q/count(u/abbr))"/>
    
    <xsl:template match="/">
        
        <html xmlns="http://www.w3.org/1999/xhtml">
            
            <head>
                <title>Analysis</title>
                <link rel="stylesheet" type="text/css" href="SVG4.css" />
            </head>
            <body>
                <div class="header">
                    <h1>Analysis</h1>
                    <hr />
                    <h2>The Use of Contractions in Texting</h2>
                </div>
                <div class="description">
                    <p>Below is a graph that represents the amount of times that a contraction was used within the texting partner groups. This selection is only representative of a few of the converstaions that were captured in the WhatsApp screenshots that we processed.</p>
                </div>
                <div class="main"> 
                    <svg xmlns="http://www.w3.org/2000/svg" width="600" height="250" viewBox="-250 50 1400 250">
                        <g>
                            <line 
                                x1="0" y1="{-($abbrmax*$ylength)-(15*$ylength)}" 
                                x2="0" y2="400" 
                                stroke="white" stroke-width="3"/>
                            <!-- this is my y axis -->
                            
                            <line 
                                x1="0" y1="400" 
                                x2="{$numcon * $xlength +(2*$xlength)}" y2="400" 
                                stroke="white" stroke-width="3"/>
                            <!-- this is my x axis -->
                            <xsl:for-each select="//q">
                                <xsl:variable name="pos" select="position()"/>
                                <text x="{$pos * $xlength + $xlength}" y="420" fill="white"><xsl:apply-templates select="@n"/></text>
                                <line x1="{$pos*$xlength +$xlength}" y1="400" 
                                    x2="{$pos*$xlength +$xlength}" y2="{-(count(u/abbr) * $ylength)}" 
                                    stroke="white" stroke-width="3"/>
                                <!-- lines showing the count of <abbr> within each q -->
                                <text x="{$pos * $xlength +$xlength}" y="{-(count(u/abbr)*$ylength) - 5}" text-anchor="middle" class="value" fill="white"><xsl:value-of select="count(u/abbr)"/></text>
                                <!-- text atop each bar/line -->
                            </xsl:for-each>
                            
                            <text x="50" y="460" class="label" fill="white">Converstaion Number</text>
                            <!-- x axis label -->
                            
                            <text x="-40" y="400" transform="rotate(270 -40,400)" class="label" fill="white">Number of Contractions Used in Each Conversation</text>
                            
                        </g>
                    </svg>
                
                
                
                </div>
            </body>
        </html>
        
        
        
        
        
        
        
        
    </xsl:template>
    
    
    
</xsl:stylesheet>