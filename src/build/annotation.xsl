<?xml version="1.0" encoding="UTF-8"?>
<!--
    Document   : annotation.xsl
    Created on : 8 de outubro de 2019, 12:40
    Author     : luciano
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet 
    xmlns="http://www.w3.org/2001/XMLSchema"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="text"/>

    <xsl:template match="/">        
        <xsl:text>defineExtension(</xsl:text>
        <xsl:apply-templates select="xsd:schema/xsd:element[@name='extension']"/>
        <xsl:text>});</xsl:text>
    </xsl:template>
    
    <xsl:template match="xsd:element">
        <xsl:text>{ </xsl:text>
        <xsl:if test="@name='extension'">        
            <xsl:text>"info": {</xsl:text>
            <xsl:for-each select="/xsd:schema/xsd:annotation/xsd:appInfo/xsd:meta.schema/@*">
                <xsl:text>"</xsl:text>
                <xsl:value-of select="name()"/>
                <xsl:text>": "</xsl:text>
                <xsl:value-of select="."/>
                <xsl:text>", </xsl:text>
            </xsl:for-each>
            <xsl:text></xsl:text>
            <xsl:text>}, </xsl:text>
        </xsl:if>

        <xsl:text>"attributes": [</xsl:text>
        <xsl:apply-templates select="xsd:complexType/xsd:attribute" mode="attribute"/>
        <xsl:text>]</xsl:text>
        
        <xsl:text>, "elements": [</xsl:text>
        <xsl:apply-templates select="//xsd:element[@name=current()/xsd:complexType/xsd:sequence/xsd:element/@ref]"/>
        <xsl:text>]</xsl:text>
        
        <xsl:text>}</xsl:text>
        <xsl:if test="position() &lt; last()"><xsl:text>, </xsl:text></xsl:if>
    </xsl:template>
    
    <xsl:template match="xsd:attribute" mode="attribute">
        <xsl:param name="name" select="@name"/>
        
        <xsl:text>{ "name": "</xsl:text>
        <xsl:value-of select="$name"/>
                
        <xsl:text>", "type": "</xsl:text>
        <xsl:value-of select="@type"/>
                
        <xsl:text>", "required": </xsl:text>
        <xsl:choose>
            <xsl:when test="@use='required'">true</xsl:when>
            <xsl:otherwise>false</xsl:otherwise>
        </xsl:choose>
        <xsl:text>", "translatable": </xsl:text>
        <xsl:choose>
            <xsl:when test="count(xsd:annotation/xsd:appInfo/xsd:meta.attribute[@translatable = 'true']) &gt; 0">true</xsl:when>
            <xsl:otherwise>false</xsl:otherwise>
        </xsl:choose>
        <xsl:text>}</xsl:text>
        <xsl:if test="position() &lt; last()"><xsl:text>, </xsl:text></xsl:if>
    </xsl:template>
</xsl:stylesheet>
