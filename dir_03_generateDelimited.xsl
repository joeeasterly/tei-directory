<?xml version="1.0" encoding="UTF-8"?>

<!-- This script converts a TEI table to a tab-delimited file. While written for the file directory, it works with most TEI tables. -->

<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    >
    <xsl:output method="text" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <xsl:apply-templates select="//tei:table"/>
    </xsl:template>
    <xsl:template match="tei:table">
        <xsl:for-each select="tei:row[1]/tei:cell">
            <xsl:value-of select="@role"/>
            <xsl:text>&#09;</xsl:text>
        </xsl:for-each>
        <xsl:text>&#10;</xsl:text>
        <xsl:apply-templates select="//tei:row"/>
    </xsl:template>
    
    <xsl:template match="tei:row">
        <xsl:for-each select="tei:cell">
            <xsl:value-of select="normalize-space(.)"/>
            <xsl:text>&#09;</xsl:text>
        </xsl:for-each>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
</xsl:stylesheet>