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
                    <xsl:text>Fragmente Digital</xsl:text>
                </title>
                <meta charset="utf-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
                <link rel="stylesheet" type="text/css" href="../css/mdb.min.css" />
                <script src="https://code.jquery.com/jquery-1.12.4.js"> </script>
                <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"> </script>
                <script src="../js/mdb.min.js"> </script>
            </head>
            <body>
                <div class="container-fluid fixed-top">
                    <div class="row p-0 yellow darken-3 rounded">
                        <h1>Fragmente Digital</h1>
                    </div>
                    <div class="row p-0 yellow rounded">
                        <div class="col-sm-12 p-0">
                            <nav class="navbar navbar-expand-lg navbar-light p-2 rounded">
                                <button class="navbar-toggler" type="button" data-toggle="collapse"
                                    data-target="#main_navbar_top" aria-controls="main_navbar_top"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>
                                <div class="collapse navbar-collapse" id="main_navbar_top">
                                    <ul class="navbar-nav mr-auto">
                                        <li class="nav-item">
                                            <a class="nav-link rounded" href="../index.html">Home</a>
                                        </li>
                                        <li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle rounded" id="navbarDropdown"
                                                role="button" data-toggle="dropdown" aria-haspopup="true"
                                                aria-expanded="false">About</a>
                                            <div class="dropdown-menu yellow lighten-4"
                                                aria-labelledby="navbarDropdown">
                                                <a class="dropdown-item rounded" href="projekt.html"
                                                    >Projekt</a>
                                                <a class="dropdown-item rounded" href="dokumentation.html"
                                                    >Dokumentation</a>
                                            </div>
                                        </li>
                                        <li class="nav-item active">
                                            <a class="nav-link rounded" href="fragmente.html">Fragmente</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link rounded" href="viewer.html">Viewer</a>
                                        </li>
                                    </ul>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="container-fluid p-5 m-2"></div>
                <!-- Ein leerer Container der leider für Anständiges Spacing nötig ist. Er nimmt denselben Platz ein wie der Container für Überschrift h1 und Navbar, welcher fixed-top ist -->
                <div class="container-fluid p-0">
                    <div class="row pt-4 pb-5 justify-content-around">
                        <div class="col-sm-12 p-0">
                            <div class="container yellow lighten-4 border z-depth-1 rounded">
                                <p style="font-size:100px">Fragmente</p>
                                <div id="accordion">
                                    <xsl:variable name="fragID"><xsl:value-of select="teiHeader/fileDesc/titleStmt/title"/></xsl:variable>
                                    <div class="card">
                                        <div class="card-header">
                                            <xsl:attribute name="id">
                                                <xsl:text>collapse</xsl:text>
                                                <xsl:value-of select="replace($fragID, ' ', '')"/>
                                            </xsl:attribute>
                                            <h5 class="mb-0">
                                                <button class="btn btn-link" data-toggle="collapse" aria-expanded="false">
                                                    <xsl:attribute name="aria-controls">
                                                        <xsl:text>collapse</xsl:text>
                                                        <xsl:value-of select="replace($fragID, ' ', '')"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="data-target">
                                                        <xsl:text>#collapse</xsl:text>
                                                        <xsl:value-of select="replace($fragID, ' ', '')"/>
                                                    </xsl:attribute>                                                
                                                    <xsl:value-of select="teiHeader/fileDesc/titleStmt/title"/>
                                                </button>
                                            </h5>
                                        </div>
                                        <div>
                                            <xsl:attribute name="id">
                                                <xsl:text>collapse</xsl:text>
                                                <xsl:value-of select="replace($fragID, ' ', '')"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="class">collapse</xsl:attribute>
                                            <xsl:attribute name="aria-labelledby">
                                                <xsl:text>heading</xsl:text>
                                                <xsl:value-of select="replace($fragID, ' ', '')"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="data-parent">#accordion</xsl:attribute>                        
                                            <div class="card-body">
                                                
                                                <!-- Eigentliches Fragment -->
                                                
                                                <table>
                                                    <tr>
                                                        <xsl:for-each select="facsimile/surface">
                                                            <td>                            
                                                                <img>
                                                                    <xsl:attribute name="src">
                                                                        <xsl:value-of select="graphic/@url"/> <!-- {replace ('file:///', 'file:///', '..\graphic\'} -->
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
                                    </div>
                                </div>                                
                            </div>
                        </div>
                    </div>
                </div>
                <footer class="page-footer yellow text-dark z-depth-1 rounded">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6">
                                <h6 style="border-bottom:1px solid">Weitere Informationen</h6>
                                <p><a href="impressum.html" style="color:black"
                                    onmouseover="this.style.textDecoration='underline'"
                                    onmouseout="this.style.textDecoration='none'">Impressum</a></p>
                                <p><a href="datenschutz.html" style="color:black"
                                    onmouseover="this.style.textDecoration='underline'"
                                    onmouseout="this.style.textDecoration='none'">Datenschutz</a></p>
                            </div>
                            <div class="col-sm-6">
                                <h6 style="border-bottom:1px solid">Kontakt</h6>
                                <p>Alexander Fruhwirth:</p>
                                <p>Angelika Hechtl:</p>
                                <p>Selina Galka:</p>
                                <p>Stefan Heider:</p>
                            </div>
                        </div>
                    </div>
                </footer>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"> </script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"> </script>
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