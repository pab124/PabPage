<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/2000/svg"
    version="3.0">
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="dickinsonColl" select="collection('Dickinson')"/>
    <!-- THIS version of the variable (commented out here) is set to the location of the Dickinson collection in the DHClass-Hub, if we navigate up from the SVG directory in Class_Examples back UP to DHClass-Hub and DOWN into Assignment-Files:
      <xsl:variable name="dickinsonColl" select="collection('../../../Assignment-Files/Dickinson')"/>-->
    
    <xsl:variable name="numPoems" select="count($dickinsonColl//TEI)"/>
    <xsl:variable name="appMax" select="max(for $file in $dickinsonColl//TEI return count($file//app))"/>
    <xsl:variable name="Xinterval" select="100"/>
    <xsl:variable name="Yinterval" select="-20"/>
    
    
    
    <xsl:template match="/">        
        <xsl:comment>X-Axis: number of poems per file = <xsl:value-of select="$numPoems"/></xsl:comment>
        <svg xmlns="http://www.w3.org/2000/svg" width="1800" height="250" viewBox="0 0 1800 250">
            <g transform="translate(50 200)">
                <line x1="0" y1="0" x2="{$numPoems*$Xinterval}" y2="0" stroke-width="4" stroke="black"/>
                <line x1="0" y1="0" x2="0" y2="{$appMax*$Yinterval + $Yinterval}" stroke-width="4" stroke="black"/>
                <text x="90" y="-180" fill="red">Dickinson Variants</text>
                
                <xsl:for-each select="$dickinsonColl//TEI">
                    
                    <xsl:variable name="Pos" select="position()"/>
                    
                    <text x="{($Pos * $Xinterval) - ($Xinterval div 2)}" y="15" fill="red" text-anchor="middle"> <xsl:apply-templates select="descendant::idno"/></text>
                    
                
                <circle cx="{($Pos *$Xinterval) - ($Xinterval div 2)}" cy="{count(descendant::app) * $Yinterval}" r="3px" fill="black">
                </circle>
                
                <xsl:if test="$Pos ne last()">
                    <line x1="{$Pos*Xinterval-Xinterval div 2}" y1="{count(descendant::app)*$Yinterval" x2="{($Pos+1) * $Xinterval - $Xinterval div 2}" y2=""></line>
                </xsl:if>
                </xsl:for-each>

            </g>
        </svg>
    </xsl:template>
</xsl:stylesheet>