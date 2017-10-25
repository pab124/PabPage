<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Sanitary Conditions</title>
            </head>
            <body>
                <h1>Yes or no</h1>
                <table>
                    <tr>
                        <th>Number</th>
                        <th>Question</th>
                        <th>Yes</th>
                        <th>Yes, but fined</th>
                        <th>No</th>
                        <th>Blank</th>
                        <th>Total Responses</th>
                    </tr>
                    <xsl:apply-templates select="//f[@name='question']"/>
                </table>
                <h1>Source of Smells</h1>
                <table>
                    <tr>
                        <th>Question</th>
                        <th>Water Closet</th>
                        <th>Other Sources</th>
                        <th>Total Responses</th>
                    </tr>
                    <xsl:apply-templates select="//fs/contains(., 'water_closet')"/>
                </table>
                <h1>Standing or Sitting at Work</h1>
                <table>
                    <tr>
                        <th>Question</th>
                        <th>Sit</th>
                        <th>Stand</th>
                        <th>Optional</th>
                        <th>Blank</th>
                        <th>Totale Responses</th>
                    </tr>
                    <xsl:apply-templates select="//fs[contains(., 'Sit')]"/>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="//f[@name='question']">
      <tr>
            <td>
               <xsl:apply-templates select="count(preceding::fs[@type='QandA'])+ 1"/>
            </td>
          <td>
              <xsl:apply-templates select="string"/>
          </td>
          <td>
              <xsl:apply-templates select="distinct-values(//fs[@type='QandA']/f[@select='Yes']/@n)" />
          </td>
          <td>
              Yes but fined values
          </td>
          <td>
              <xsl:apply-templates select="//fs[@type='QandA']/f[@select='No']/@n" />
          </td>
          <td>
              <xsl:apply-templates select="//fs[@type='QandA']/f[@select='Blank']/@n" />
          </td>
          <td>
          </td>
            
        </tr>
    </xsl:template>
    <xsl:template match="//fs/f[@select='water_closet']">
        <tr>
            <td>
                <xsl:apply-templates select="string"/>
            </td>
            <td>
                Water closet values
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//fs/f[@select='Sit']">
        <tr>
            <td>
                gg
            </td>
        </tr>
    </xsl:template>
   
    
    
    
    
</xsl:stylesheet>