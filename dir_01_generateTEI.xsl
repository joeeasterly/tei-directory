<?xml version="1.0" encoding="UTF-8"?>
<!-- This script converts the output of the python script into a basic TEI file -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://www.oxygenxml.com/ns/doc/xsl"
    version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0">
    <d:doc>
        <d:desc>
            <d:p type="title">Inventory Generator, Step One: Generate TEI</d:p>
            <d:p>This script receives any valid XML document and sorts the output. This script is
                particularly useful where the XML document is principally composed of lists (e.g.,
                directories, glossaries, personographies, etc.) where having the list entries in
                alphabetical order would be helpful.</d:p>
            <d:ul>
                <d:li type="input">any XML document</d:li>
                <d:li type="output">the same document, wrapped in a TEI template and table</d:li>
            </d:ul>
            <d:p type="creator">Joe Easterly</d:p>
            <d:p type="updated">May 7, 2015</d:p>
            <d:ref>http://humanities.lib.rochester.edu</d:ref>
        </d:desc>
    </d:doc>
    <xsl:output method="xml" escape-uri-attributes="yes" indent="yes"/>
    <xsl:template match="/">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title>My Project: List of Files</title>
                    </titleStmt>
                    <publicationStmt>
                        <p>Publication Information</p>
                    </publicationStmt>
                    <sourceDesc>
                        <p>Information about the source</p>
                    </sourceDesc>
                </fileDesc>
            </teiHeader>
            <text>
                <body>
                    <table>
                        <xsl:apply-templates select="//file"/>
                    </table>
                </body>
            </text>
        </TEI>
    </xsl:template>

    <!-- add the path to the project's base directory to the variable below -->
    <xsl:template match="file">
        <row>
            <cell>
                <xsl:apply-templates/>
            </cell>
        </row>
    </xsl:template>

</xsl:stylesheet>
