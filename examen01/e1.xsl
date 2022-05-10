<?xml version="1.0" encoding="UTF-8"?>

<!-- xsl-template from https://drive.google.com/file/d/1Gsq5JSwcjpWBjkWl-ivtR7XP8_ZPQVNu/view?usp=sharing -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" encoding="utf-8" indent="yes" />

  <xsl:template match="/proyecto">

    <xsl:element name="memoria">

      <xsl:element name="titular">

        <xsl:value-of select="datos_proyecto/titulo" />

      </xsl:element>

      <xsl:element name="autores">

        <xsl:for-each select="datos_proyecto/autor">
        
          <xsl:value-of select="nombre" />
          <xsl:if test="position()!=last()">
            <xsl:text>, </xsl:text>
          </xsl:if>

        </xsl:for-each>

      </xsl:element>

    </xsl:element>
  
  </xsl:template>
  
</xsl:stylesheet>
