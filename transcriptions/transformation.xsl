<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" 
    version="2.0">
    
    <xsl:template match="TEI">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <head>
                <title>
                    <xsl:value-of select="teiHeader/fileDesc/titleStmt/title"/>
                    <xsl:text> | Fragmente Digital</xsl:text>
                </title>
                <meta charset="utf-8"/>
            </head>
            <body>
                <h1><xsl:value-of select="teiHeader/fileDesc/titleStmt/title"/></h1>
                <table>
                    <tr>
                        <xsl:for-each select="facsimile/surface">
                             <td>                            
                                 <img>
                                     <xsl:attribute name="src">
                                         <xsl:value-of select="graphic/@url"/>
                                     </xsl:attribute>
                                 </img>                            
                             </td>
                        </xsl:for-each>
                    </tr> 
                    <tr>
                        <td colspan="2">Original</td>
                    </tr>
                    <tr>
                        <xsl:for-each select="text/body/div[contains(@type, 'original')]">
                            <td>
                                <xsl:apply-templates select="lg"/>
                            </td>   
                        </xsl:for-each>                            
                    </tr> 
                    <tr>
                        <td colspan="2">Übersetzung</td>
                    </tr>
                    <tr>
                        <xsl:for-each select="text/body/div[contains(@type, 'translation')]">
                            <td>
                                <xsl:apply-templates select="lg"/>
                            </td>     
                        </xsl:for-each>                            
                    </tr>
                </table>
                <table>   
                    <!-- origindate und textlang. was ist mit Rest? -->
                    
                    <tr>
                        <td>Typ</td>
                        <td><xsl:value-of select="/TEI/text/body/listBibl/msDesc/physDesc/p"/></td>
                    </tr>
                    <tr>
                        <td>Sprache</td>
                        <td><xsl:value-of select="teiHeader/fileDesc/sourceDesc/msDesc/msContents/textLang"/></td>
                    </tr>
                    <tr>
                        <td>Ursprung</td>
                        <td>
                            <xsl:text>Zwischen </xsl:text>
                            <xsl:value-of select="/TEI/teiHeader/fileDesc/sourceDesc/msDesc/history/origin/origDate/@notBefore"/>
                            <xsl:text> und </xsl:text>
                            <xsl:value-of select="/TEI/teiHeader/fileDesc/sourceDesc/msDesc/history/origin/origDate/@notAfter"/>
                        </td>
                    </tr>
                    
                    
                    
                    <tr>
                        <td valign="top">Responsible</td>
                        <td>
                            <xsl:for-each select="teiHeader/fileDesc/titleStmt/respStmt">
                                <xsl:value-of select="resp"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="name"/>
                                <br/>
                            </xsl:for-each>                            
                        </td>
                    </tr>
                    <tr>
                        <td>Publisher</td>
                        <td><xsl:value-of select="teiHeader/fileDesc/publicationStmt/publisher"/></td>
                    </tr>
                    <tr>
                        <td>Publishing Place</td>
                        <td><xsl:value-of select="teiHeader/fileDesc/publicationStmt/pubPlace"/></td>
                    </tr>
                    <tr>
                        <td>Publishing Date</td>
                        <td><xsl:value-of select="teiHeader/fileDesc/publicationStmt/date[@when]"/></td>
                    </tr>
                    <tr>
                        <td valign="top">Lizenz</td>
                        <td>
                            <xsl:value-of select="teiHeader/fileDesc/publicationStmt/availability"/>
                        </td>
                    </tr>
                    <tr>
                        <td>PID</td>
                        <td>
                            <xsl:value-of select="teiHeader/fileDesc/publicationStmt/idno"/>
                        </td>
                    </tr>                    
                                        
                    
                </table>
                              
                
            </body>
        </html>
    </xsl:template>    
    
    <xsl:template match="lg">
        <xsl:for-each select="l">
            <xsl:apply-templates/>
            <br/>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>