<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
  xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3c.org/1999/xhtml">
  <xsl:output method="html" indent="yes" omit-xml-declaration="yes"/>
  


    <xsl:template match="tei:TEI">
        <!--Quando incontro il nodo TEI creo la struttura di base del documento HTML, 
      ovvero la head con le relative informazioni, il body e i bottoni che si trovano sulla 
      schermata principale-->
        <html>
            <head>
                <title>Versione digitale de Lo Hobbit</title>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <meta name="author" content="David Govi"/>
                <link href="stile.css" rel="stylesheet" type="text/css"/>
                <script type="text/javascript" src="js/jquery-3.0.0.min.js"/>
                <script type="text/javascript" src="js/jquery.easing.1.3.js"/>
                <script type="text/javascript" src="js/scroll.js"/>
                <script type="text/javascript" src="js/dinamic.js"/>
                <link rel="icon" href="imgs/logosmaug.png" type="image/x-icon"/>
            </head>
            <body>
                <div id="clean">Reset</div>
                <div class="buttonV" id="menuopener">MENU</div>
                <div class="buttonV" id="indexopener">INDICE</div>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    
    
    <xsl:template match="tei:body">
        <!-- Quando incontro il nodo body, applico le tamplate, dopo creo e riempio i contenitori 
            con le varie liste-->
        <xsl:apply-templates/>
        <div class="list" id="listaPersone">
            <div class="listHead">LISTA PERSONE
                <img src="imgs/spadex.png" id="closerPer" class="listCloser" alt="listcloser" ref="listaPersone"/>
            </div>
            <!-- Per riempire le liste utilizzo una variabile nella quale inserisco tutti gli elementi della lista.
        Non volendo duplicati all'interno della lista seleziono solo gli elementi che non hanno
        elementi uguali che li precedono (ovvero inserisco nella lista gli elementi solo la prima volta che li incontro).
        Successivamente, per ogni elemento nella variabile ne estraggo il contenuto.-->
            <xsl:variable name="unique"
                select="//tei:p//tei:name[@type='person' and not(.=preceding::tei:name[@type='person'])]"/>
            <xsl:for-each select="$unique">
                <xsl:sort/>
                <p><xsl:value-of select="."/></p>
            </xsl:for-each>
        </div>
        
        <div class="list" id="listaRazze">
            <div class="listHead">LISTA RAZZE
                <img src="imgs/spadex.png" id="closerRaz" class="listCloser" alt="listcloser" ref="listaRazze"/>
            </div>
            <xsl:variable name="unique"
                select="//tei:p//tei:name[@type='race' and not(.=preceding::tei:name[@type='race'])]"/>
            <xsl:for-each select="$unique">  
                <xsl:sort/>
                <p>
                    <xsl:value-of select="."/>
                </p>
            </xsl:for-each>
        </div>
        
        <div class="list" id="listaLuoghi">
            <div class="listHead">LISTA LUOGHI
                <img src="imgs/spadex.png" id="closerLuo" class="listCloser" alt="listcloser" ref="listaLuoghi"/>
            </div>
            <xsl:variable name="unique"
                select="//tei:p//tei:name[@type='place' and not(.=preceding::tei:name[@type='place'])]"/>
            <xsl:for-each select="$unique"> 
                <xsl:sort/>
                <p>
                    <xsl:value-of select="."/>
                </p>
            </xsl:for-each>
        </div>      
    </xsl:template>
   
   
   
    <xsl:template match="tei:teiHeader">
        <!-- Quando incontro il nodo teiHeader creo il menù interattivo, completo dei bottoni per comandare 
        tutte le azioni possibili dei comandi e di tutte le informazioni relative al file e contenute 
        nel teiHeader -->
        <div id="menu">           
            <div id="menuheader">MENU
                <img src="imgs/spadex.png" id="menucloser" alt="menucloser"/>
            </div>
            <div class="menupart" id="consolle">
                <p>Evidenzia:</p>
                <div class="button" id="personB">Persone</div>
                <div class="button" id="placeB">Luoghi</div>
                <div class="button" id="raceB">Razze</div>
                <div class="button" id="dialogueB">Dialoghi</div>
                <div class="button" id="songB">Canzoni</div>
            </div>
            <div class="menupart" id="liste">
                <p>Mostra Liste:</p>
                <div class="button listButton" id="personLB" ref="listaPersone">Persone</div>
                <div class="button listButton" id="placeLB" ref="listaLuoghi">Luoghi</div>
                <div class="button listButton" id="raceLB" ref="listaRazze">Razze</div>
            </div>
            <div class="menupart" id="info">
                <p id="infoHead">Informazioni:</p>
                <p>
                    <xsl:value-of select="tei:fileDesc/tei:titleStmt/tei:title"/>
                </p>
                <p>Testo: <xsl:value-of
                    select="tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:title"/> di
                    <xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:author"
                    /></p>
                <p>Edizione: <xsl:value-of
                    select="tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:publisher"
                />, <xsl:value-of
                    select="tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:pubPlace"
                />, <xsl:value-of
                    select="tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:date"
                /></p>
                <p>
                    <xsl:value-of select="tei:fileDesc/tei:titleStmt/tei:respStmt/tei:resp"/>
                    <xsl:value-of select="tei:fileDesc/tei:titleStmt/tei:respStmt/tei:name"/>
                </p>
                <p>
                    <xsl:value-of select="tei:fileDesc/tei:publicationStmt/tei:publisher"/> - <xsl:value-of
                        select="tei:fileDesc/tei:publicationStmt/tei:date"/>
                </p>
                <p>
                    <xsl:value-of select="tei:fileDesc/tei:publicationStmt/tei:availability"/>
                </p>
            </div>
        </div>
    </xsl:template>
    
    
    
    <xsl:template match="tei:titlePage">
        <!-- Quando incontro il nodo titlePage creo la copertina (home) del documento HTML, 
        inserisco immagini, e dati necessari dal documento XML -->
        <section id="cover">
            <div>
                <p id="docAuthor">
                    <xsl:value-of select="tei:docAuthor"/>
                </p>
                <h1 id="mainTitle">
                    <xsl:value-of select="tei:titlePart"/>
                </h1>
                <p id="subTitle">
                    o la Riconquista del Tesoro
                </p>
                <img src="imgs/logosmaug.png" id="logosmaug" alt="logosmaug"/>
                <p>
                    <xsl:value-of select="tei:docImprint/tei:publisher"/>
                </p>
                <img src="imgs/tolkienlogo.png" id="tlogo" alt="logotolkien"/>
                <a href="#cap1" class="scroll">
                    <img src="imgs/freccia.png" id="freccia" alt="freccia"/>
                </a>
            </div>        
        </section>
    </xsl:template>
    
    
    
    <xsl:template match="tei:div">
        <!-- Per ogni nodo div creo il contenitore corrispondente in HTML, in modo da suddividere
        il documento tra indice e capitoli -->  
        <xsl:choose>
            <xsl:when test="@type='index'">
                <div id="index">
                    <div id="indexheader">INDEX
                        <img src="imgs/spadex.png" id="indexcloser" alt="indexcloser"/>
                    </div>
                    <xsl:apply-templates/>
                </div>
            </xsl:when>
            <xsl:when test="@type='chapter' and @xml:id='cap1'">
                <div class="chapter" id="cap1">
                    <xsl:apply-templates/>
                </div>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    
    
    <xsl:template match="tei:p">
        <!-- creo un paragrafo per ogni elemento <p>-->
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    
    
    <xsl:template match="tei:name">
        <!-- Per ogni nodo name, a seconda del tipo che incontro, creo uno span
        al quale viene attribuita una classe da definire nei css per evidenziare in maniera dinamica le varie 
        categorie presenti nel testo -->
        <xsl:choose>
            <xsl:when test="@type='person'">
                <span class="person">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:when test="@type='place'">
                <span class="place">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:when test="@type='race'">
                <span class="race">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    
    <xsl:template match="tei:div/tei:head">
        <!-- Per ogni nodo head che sia figlio di un div creo un titolo con l'elemento <h3> -->
        <h3>
            <xsl:apply-templates/>
        </h3>
    </xsl:template>
    
    
    
    <xsl:template match="tei:list">
        <!-- Per ogni nodo list creo una lista non numerata, in cui trasformo gli item come elementi <li>-->
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    
    <xsl:template match="tei:list/tei:item">
        <li>
            <xsl:apply-templates/>
            <img src="imgs/decor2.png"/>
        </li>
    </xsl:template>
    
    
    
    <xsl:template match="tei:said">
        <!-- Quando incontro un nodo said inserisco le virgolette basse. Inoltre doto l'elemento span di un 
        attributo who per registrare chi abbia pronunciato un determinato discorso; questa informazioni viene 
        presa soltanto per i tre personaggi più importanti, ed i loro dialoghi vengono differenziati dagli 
        altri tramite l'utilizzo di colori differenti. -->
                <xsl:element name="span">
                    <xsl:attribute name="who">
                        <xsl:value-of select="@who"/>
                    </xsl:attribute>
                    <xsl:attribute name="class">said</xsl:attribute>«<xsl:apply-templates/>»
                </xsl:element>
    </xsl:template>
    
    
    
    <xsl:template match="tei:emph">
        <!-- Quando incontro un nodo <emph>, applico al contenuto una class="emph" in modo da poterne 
        determinare lo stile tramite css -->
        <xsl:element name="span">
            <xsl:attribute name="class">emph</xsl:attribute><xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    
    
    <xsl:template match="tei:hi">
        <!-- Uso il tag generico hi per individuare il capolettera da inizio capitolo ed assegnargli una 
        classe così da assegnargli uno stile tramite css  -->
                <xsl:element name="span">
                    <xsl:attribute name="class">capolettera</xsl:attribute><xsl:apply-templates/>
                </xsl:element>
    </xsl:template>
    
    
    
    <xsl:template match="tei:q">
        <!-- Quando incontro un nodo quote assegno una classe song per l'indentazione tramite css ed una 
        classe song2 per lo span creato all'interno del paragrafo per definire poi la colorazione dinamica. 
        Se il nodo quote è l'ultimo facente parte di una canzone, aggiungo un'ulteriore spaziatura alla fine -->      
        <xsl:choose>
            <xsl:when test="@type='last'">
                <xsl:element name="p">
                    <xsl:attribute name="class">song</xsl:attribute> <br/> <span class="song2"><xsl:apply-templates/></span> <br/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="p">
                    <xsl:attribute name="class">song</xsl:attribute> <br/> <span class="song2"><xsl:apply-templates/></span>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    
</xsl:stylesheet>