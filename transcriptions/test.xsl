<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="files">
        <html>
            <head>
                <title>
                    <xsl:text>Fragmente Digital</xsl:text>
                </title>
                </head>
            <body>
                <h1>Yo!</h1>
                <xsl:for-each select="file"> 
                    <xsl:value-of select="."/>
                    <br/>
                    
                    <xsl:value-of select="document(.)/TEI/teiHeader/fileDesc/titleStmt/title"/>
                </xsl:for-each>
            </body>
        </html>
        
    </xsl:template>
</xsl:stylesheet>