<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs t"
    version="3.0">
    <xsl:output indent="yes"/>
    
    
    
    
    <!-- 2. XSLT – looks for ID and then replaces content of <ref@subtype="archived"> with content of cell 3
        
        if the content in element idno@n=titleID matches in doc "naggari_printsBiblStruct_master" the content in first cell in a row in doc "OneDrive_newlinks_Certain"
        then take the value of "target" attribute in the ptr element in the third cell in doc "OneDrive_newlinks_Certain" 
        and next
        replace with that value the content of ref@subtype="archived" element in doc "naggari_printsBiblStruct_master" 



<xsl:variable name="urls" select="doc('myURLs')"/>

$urls//row[@xml:id=‘’]/cell[3]

<xsl:template match="xsd:element[@name != '' and not(starts-with(@type, 'common:'))][position() != last()]">
"<xsl:value-of select="@name"/>", 
</xsl:template>

identity transform
 -->
    
    <xsl:variable name="urls" select="doc('newLinks.xml')"/>
    
    <xsl:mode on-no-match="shallow-copy"/>
    
   
    <xsl:template match="t:ref[@type='URL' and @subtype='archived']">
        <xsl:variable name="id" select="../../t:analytic/t:idno[@n='titleID']"/>

        <xsl:copy><xsl:copy-of select="@*"/><xsl:value-of select="$urls//t:row[t:cell[1]=$id]/t:cell[3]/t:ptr/@target"/></xsl:copy>
        
    </xsl:template>
    
    
    
    
</xsl:stylesheet>