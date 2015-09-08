<?xml version="1.0" encoding="UTF-8"?>

<!-- This script restructures the TEI-formatted file directory, and adds some analysis. -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" xmlns="http://www.tei-c.org/ns/1.0">
    <xsl:output indent="yes"/>

    <!--<xsl:strip-space elements="*"/>-->
    <xsl:template match="@*|node()" priority="-1">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="table">
        <table>
			<!-- This script assumes that all of your xml files are grouped into 
			     subfolders of a single folder named "tei". Update the line below
			     accordingly (line/column 20:76)-->
            <xsl:apply-templates select="row[tokenize(.,'/')[last()-2] eq 'tei']"/>
        </table>
    </xsl:template>


    <!-- Put those variables to work and get some metadata -->
    <xsl:template match="row">
        <xsl:variable name="full_path" select="cell/text()"/>

        <xsl:variable name="file_name">
            <xsl:value-of select="replace(tokenize($full_path, '/')[last()], '.xml','')"/>
        </xsl:variable>
		
        <xsl:variable name="file" select="document($full_path)"/>
        
        <row>
			<!-- Putting the table together is as easy as 1-2-3:
			     (1) Create a table column by duplicating one of the <cell> elements 
			         below, and give it a name by updating the @select value inside 
			         <xsl:attribute>.
			     (2) Populate that column's values by updating <xsl:value-of>/@select
			         with an XPath that queries for something you want to know.
			     (3) There is no step three!
			-->
			     
            <cell>
                <xsl:attribute name="role" select="'title'"/>
                <xsl:value-of select="$file//titleStmt/title"/>
            </cell>
            <cell>
                <xsl:attribute name="role" select="'identifier'"/>
                <xsl:value-of select="$file//TEI/@xml:id"/>
            </cell>
            <cell>
                <xsl:attribute name="role" select="'word_count'"/>
                <xsl:value-of select="count(/tokenize(normalize-space(string-join($file//text/body//*/text(), ' ')), ' '))"/>
            </cell>
            <cell>
                <xsl:attribute name="role" select="'full_path'"/>
                <xsl:value-of select="$full_path"/>
            </cell>
        </row>
    </xsl:template>



</xsl:stylesheet>
