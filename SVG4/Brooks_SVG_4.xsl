<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name="xlength" select="20"/>
    <xsl:variable name="ylength" select="1"/>
    <xsl:variable name="abbr" select="distinct-values(//abbr/@type)"/>
    <xsl:variable name="abbrtxt" select="//text/body/q/u/abbr[@type='textese']"/>
    <xsl:variable name="abbrinf" select="//text/body/q/u/abbr[@type='informal']"/>
    <xsl:variable name="abbrcon" select="//text/body/q/u/abbr[@type='contraction']"/>
    <xsl:variable name="abbrmax" select="max(TEI/text/body/q/count(u/abbr))"/>
    
    <xsl:template match="/">
        
        <html xmlns="http://www.w3.org/1999/xhtml">
            <link rel="stylesheet" type="text/css" href="../css/index.css" />
            <head>
                <title>Analysis</title>
            </head>
            <body>
                <a href="http://portu-whatsapp.newtfire.org/index.html"><img src="Corcovado.jpg"
                    alt="Rio de Janeiro" /></a>
                <!--#include virtual="ssi_menu_other_pages.html" -->
                <div class="header">
                    <h1>Analysis</h1>
                    <hr />
                </div>
                <div class="description">
                    <p>At this stage in our production, there are still plenty of research questions that we
                        are interested in pursuing. There are several possibilities, such as looking at the
                        use of emojis within the texting conventions, any speech errors made by the non
                        native speakers (and whether or not they are corrected by the native speaker),
                        extended pauses between links of text, and any characteristic use of
                        punctuation.</p>
                </div>
                <div class="main"> 
                    <svg xmlns="http://www.w3.org/2000/svg" width="1800" height="250" viewBox="0 0 1800 250">
                        <g>
                            <line 
                                x1="0" y1="{-($abbrmax*$ylength)-(15*$ylength)}" 
                                x2="0" y2="400" 
                                stroke="black" stroke-width="3"/>
                            <!-- this is my y axis -->
                            
                            <line 
                                x1="0" y1="400" 
                                x2="400" y2="400" 
                                stroke="black" stroke-width="3"/>
                            <!-- this is my x axis -->
                            <xsl:for-each select="//q">
                                <xsl:variable name="pos" select="position()"/>
                                <text x="{$pos * $xlength + $xlength}" y="420"><xsl:apply-templates select="@n"/></text>
                                <line x1="{$pos*$xlength +$xlength}" y1="400" 
                                    x2="{$pos*$xlength +$xlength}" y2="{-(count(u/abbr) * $ylength)}" 
                                    stroke="black" stroke-width="3"/>
                                <!-- lines showing the count of <abbr> within each q -->
                            </xsl:for-each>
                            
                        </g>
                    </svg>
                
                
                
                </div>
            </body>
        </html>
        
        
        
        
        
        
        
        
    </xsl:template>
    
    
    
</xsl:stylesheet>