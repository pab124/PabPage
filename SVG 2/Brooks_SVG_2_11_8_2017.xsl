<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg">
    
    <xsl:output method="xml" indent="yes"/> 
    <xsl:variable name="xinterval" select="100"/>
    <xsl:variable name="yinterval" select="-10"/>
    <xsl:variable name="Xpos" select="position() * $xinterval"/>
    <xsl:variable name="numChap" select="count(//chapter)"/>
    <xsl:variable name="qmax" select="max(//chapter/count(p/q[@sp='alice']))"/>
     
     <xsl:template match="/">
         <svg xmlns="http://www.w3.org/2000/svg" width="1800" height="250" viewBox="0 0 1800 250">
         <g>
             <line x1="0" y1="0" x2="{($numChap)*($xinterval)}" y2="0" stroke-width="3" stroke="black"/>
             <!-- this is my x axis -->
             
             <line x1="0" y1="0" x2="0" y2="{($qmax*$yinterval)+$yinterval}" stroke-width="3" stroke="black"/>
             <!-- this is my y axis -->
             
             <xsl:for-each select="1 to $qmax">
                 <xsl:variable name="HashLocator" select=". * $yinterval"/>
                 <xsl:variable name="HashLabel" select="."/>
                 <text x="-10" y="{$HashLocator}" fill="black" text-anchor="middle"><xsl:value-of select="."/></text>
                 <line x1="0" y1="{.* $yinterval}" x2="{$numChap * $xinterval}" y2="{.* $yinterval}" stroke="black" stroke-width=".5" stroke-dasharray="5"/>
             </xsl:for-each>
             <!-- dotted lines in the back -->
            
             <xsl:variable name="pos" select="position()"/>
             <xsl:comment>What is the value of $Pos? <xsl:value-of select="$pos"/></xsl:comment>
             <text x="{$pos * $xinterval - $xinterval div 2}" y="15" fill="red" text-anchor="middle"><xsl:apply-templates select="alice/chapter/@which"/></text>
             <!-- the x axis labels -->
             
         </g>
         </svg>
         
     </xsl:template>
</xsl:stylesheet>