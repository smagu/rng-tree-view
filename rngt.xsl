<?xml version="1.0" encoding="UTF-8"?>
<!--<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://relaxng.org/ns/structure/1.0"
    xmlns:ng="http://relaxng.org/ns/structure/1.0"
    version="1.0">-->
    <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0"
        version="1.0" exclude-result-prefixes="a">
    <xsl:output encoding="UTF-8" method="html"/>
        <xsl:strip-space elements="*"/>
        <xsl:preserve-space elements="element"/>
        
    <xsl:template match="root" >
           <xsl:apply-templates select="start"/>
    </xsl:template>
    
    
    
<!--    <xsl:template match="start">
        <html>
            <head>
                <title>ECOTree Simple Tree 1</title>
                <script type="text/javascript" src="ECOTree.js"></script>
                <link type="text/css" rel="stylesheet" href="ECOTree.css" />
                <xml:namespace ns="urn:schemas-microsoft-com:vml" prefix="v"/>
                <style>v\:*{ behavior:url(#default#VML);}</style> 
                <style>
			.copy {
				font-family : "Verdana";				
				font-size : 10px;
				color : #CCCCCC;
			}
		</style>
                
                <script>
			var myTree = null;
			
			function CreateTree() {
				myTree = new ECOTree('myTree','myTreeContainer');
            <xsl:variable name="current-var">
                <xsl:value-of select="./choice/ref/@name"/>
            </xsl:variable>
            <xsl:apply-templates select="../define[@name=$current-var]"/>}			
		</script>			
	</head>
	<body onload="CreateTree();">
		<h4>ECOTree Simple Tree 1<span class="copy">2006 Emilio Cortegoso Lobato</span></h4>
		<div id="myTreeContainer">
		</div>
	</body>
</html>
    </xsl:template>-->
    
    <xsl:template match="define">
<xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="element">
        <xsl:text>myTree.add("</xsl:text>
        <xsl:value-of select="@name"/>
        <xsl:text>",</xsl:text>
        <!-- //TODO -->
        <xsl:choose>
            <xsl:when test="parent::element">
                <xsl:text>"</xsl:text>
                <xsl:value-of select="parent::element/@name"/>
                <xsl:text>"</xsl:text>
            </xsl:when>
            <xsl:when test="parent::define">
                <xsl:call-template name="find-parent-element">
                    <xsl:with-param name="define-name">
                        <xsl:value-of select="parent::define/@name"/>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:when>
        </xsl:choose>
        <!-- -->
        <xsl:text>,"</xsl:text>
        <xsl:value-of select="@name"/>
        <xsl:text>");</xsl:text>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="ref">
        <xsl:variable name="ref-value">
            <xsl:value-of select="@name"/>
        </xsl:variable>
        <xsl:apply-templates select="//define[@name=$ref-value]"/>
    </xsl:template>
    
    
    <xsl:template name="find-parent-element">
        <xsl:param name="define-name"/>
        <xsl:choose>
            <xsl:when test="//ref[@name=$define-name]/parent::choice/parent::element">                
                <xsl:text>"</xsl:text>
                <xsl:value-of select="//ref[@name=$define-name]/parent::choice/parent::element/@name"/>
                <xsl:text>"</xsl:text>                
            </xsl:when>
            <xsl:when test="//ref[@name=$define-name]/parent::choice/parent::define">
                <xsl:call-template name="find-parent-element">
                    <xsl:with-param name="define-name">
                        <xsl:value-of select="//ref[@name=$define-name]/parent::choice/parent::define/@name"/>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="//ref[@name=$define-name]/parent::element">                
                <xsl:text>"</xsl:text>
                <xsl:value-of select="//ref[@name=$define-name]/parent::element/@name"/>
                <xsl:text>"</xsl:text>                
            </xsl:when>
            <xsl:when test="//ref[@name=$define-name]/parent::define">
                <xsl:call-template name="find-parent-element">
                    <xsl:with-param name="define-name">
                        <xsl:value-of select="//ref[@name=$define-name]/parent::define/@name"/>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>-1</xsl:otherwise>
        </xsl:choose>
    </xsl:template>





        <xsl:template match="start">
            <html>
                <head>
                    <title>ECOTree Simple Tree 1</title>
                    <script type="text/javascript" src="ECOTree.js"></script>
                    <link type="text/css" rel="stylesheet" href="ECOTree.css" />
                    <xml:namespace ns="urn:schemas-microsoft-com:vml" prefix="v"/>
                    <style>v\:*{ behavior:url(#default#VML);}</style> 
                    <style>
			.copy {
				font-family : "Verdana";				
				font-size : 10px;
				color : #CCCCCC;
			}
		</style>
                    
                    <script>
			var myTree = null;
			
			function CreateTree() {
				myTree = new ECOTree('myTree','myTreeContainer');
                <xsl:variable name="current-var">
                    <xsl:value-of select="./choice/ref/@name"/>
                </xsl:variable>
                <xsl:apply-templates select="../define[@name=$current-var]"/>
				myTree.UpdateTree();
			}			
		</script>			
                </head>
                <body onload="CreateTree();">
                    <h4>ECOTree Simple Tree 1<span class="copy">2006 Emilio Cortegoso Lobato</span></h4>
                    <div id="myTreeContainer">
                    </div>
                </body>
            </html>
        </xsl:template>
        
        <xsl:template match="a:documentation"/>
        <xsl:template match="value"/>
            
        
</xsl:stylesheet>
