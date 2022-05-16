<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output encoding="utf-8" indent="yes"/>
  <xsl:output encoding="utf-8" indent="yes"/>
  <xsl:template match="/quiz">
    <examen>
      <idioma>
        <!--     otra opción: usar choose con 1 when y 1 otherwise -->
        <xsl:if test="@lang='en'">
          <xsl:text>Inglés </xsl:text>
        </xsl:if>
        <xsl:if test="@lang='es'">
          <xsl:text>Castellano </xsl:text>
        </xsl:if>
      </idioma>
      <correo nombre="{owner}">
        <xsl:value-of select="owner/@email"/>
      </correo>
      <test>
        <xsl:for-each select="category">
          <xsl:sort select="name/text"/>
          <tema>
              <titulo>  <xsl:value-of select="name/text"/>   </titulo>
              <xsl:comment>prueba</xsl:comment>
              <xsl:for-each select="question">
                  <pregunta>
                       <enunciado>  <xsl:value-of select="questiontext/text"/>   </enunciado>
                       <xsl:for-each select="answer">
                              <xsl:sort data-type="number" order="descending" select="@fraction"/>
                              <respuesta><xsl:value-of select="position()"/>. <xsl:value-of select="text"/></respuesta>
                        </xsl:for-each>
                   </pregunta>
             </xsl:for-each>
          </tema>
        </xsl:for-each>
      </test>
    </examen>
  </xsl:template>
</xsl:stylesheet>
