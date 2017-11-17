<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml" version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name="barInterval" select="20"/>
    <xsl:variable name="barHeight" select="300"/>
    
    <xsl:template match="/">
        
        <svg xmlns="http://www.w3.org/2000/svg" height="375">
            <g transform="translate(30, 330)">
                <!--y-axis--><line x1="20" x2="20" y1="0" y2="-320" stroke="black" stroke-width="1"/>
                <line x1="20" y1="0" y2="0"
                    x2="{count(//state)*$barInterval + $barInterval*2}" stroke-width="1" stroke="black" />
                
                <xsl:for-each select="//state">
                    <xsl:variable name="statePos" select="position()"/>
                    <xsl:variable name="xPos" select="$statePos*$barInterval+$barInterval"/>
                    <xsl:variable name="totalVotes" select="sum(candidate)"/>
                    <xsl:variable name="acro" select="@acro"/>
                    
                    <g id="{$acro}" class="wrapper">
                        
                    </g>
                    <xsl:for-each select="candidate">
                        <xsl:variable name="percentage" select="current()div$totalVotes"/>
                        <xsl:variable name="color">
                            <xsl:choose>
                                <xsl:when test="@party='Democrat'">blue</xsl:when>
                                <xsl:when test="@party='Republican'">red</xsl:when>
                                <xsl:when test="@party='Libertarian'">yellow</xsl:when>
                                <xsl:when test="@party='Green'">green</xsl:when>
                            </xsl:choose>
                        </xsl:variable>
                        <rect x="{$xPos}" y="{-($percentage+(sum(../candidate[@party lt current()/@party])div$totalVotes))*$barHeight}" 
                            stroke="black" stroke-width=".5" fill="{$color}" width="20" height="{($percentage*$barHeight)}"/>
                    </xsl:for-each>
                </xsl:for-each>
                
            </g>
        </svg>
        
    </xsl:template>
</xsl:stylesheet>