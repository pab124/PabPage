<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    
    
    <pattern id="whitespace_at_element_end">
        
        <rule context="tei:*">
            <report test="ends-with(., ' ')"> There's white space at the end of the element</report>
        </rule>
        
    </pattern>
    <pattern id="lat_lon_format">
        <rule context="tei:geo">
            <assert test="matches(., '[0-9.]+\s[\-0-9]+')">Every geo must contain a latitude followed by a longitude separated by a whitespace</assert>
        </rule>
    </pattern>
    <pattern id="degrees">
        <rule context="tei:geo">
            <let name="tokens" value="for $i in tokenize(., '\s+') return substring-before($i, "/>
            
        </rule>
        
    </pattern>
</schema>