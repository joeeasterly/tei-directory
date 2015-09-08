<?xml version="1.0" encoding="UTF-8"?>

<!-- This script reads data from tei_table.xml to create text corpus, suitable for analysis and debugging. -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" xmlns="http://www.tei-c.org/ns/1.0">
    <xsl:output indent="yes"/>

    <xsl:template match="/">
        <xsl:variable name="full_path" select="cell/text()"/>
        <xsl:variable name="file" select="document($full_path)"/>
        <teiCorpus xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title>My Project: A Text Corpus</title>
                    </titleStmt>
                    <publicationStmt>
                        <p>Publication Information</p>
                    </publicationStmt>
                    <sourceDesc>
                        <p>Information about the source</p>
                    </sourceDesc>
                </fileDesc>
            </teiHeader>
            <xsl:for-each select="//cell[@role='full_path']">
                <xsl:variable name="full_path" select="."/>
                <xsl:copy-of select="document($full_path)/TEI"/>
            </xsl:for-each>
        </teiCorpus>
    </xsl:template>
</xsl:stylesheet>
