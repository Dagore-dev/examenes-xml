<?xml version="1.0" encoding="UTF-8"?>

<!-- xsl-template from https://drive.google.com/file/d/1Gsq5JSwcjpWBjkWl-ivtR7XP8_ZPQVNu/view?usp=sharing -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" encoding="utf-8" />

  <xsl:template match="/mayorista">

    <!-- Cabecera del documento -->
    <xsl:text>Viaje; POI; Etiquetas</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>=====================</xsl:text>
    <xsl:text>&#10;</xsl:text>

    <!-- Por cada ruta -->
    <xsl:for-each select="ruta">

      <!-- Ordenada por fecha de inicio -->
      <xsl:sort select="fechaIni"/>

      <xsl:for-each select="destacados/poi">
      
        <!-- Viaje -->
        <xsl:value-of select="../../destino/nombre" />
        <xsl:text>; </xsl:text>

        <!-- Posición y nombre del poi -->
        <xsl:value-of select="concat(position(), '.- ')" />
        <xsl:value-of select="nombre" />
        <xsl:text>; </xsl:text>

        <!-- Etiquetas separadas por comas -->
        <xsl:for-each select="etiqueta">

          <xsl:value-of select="." />

          <xsl:if test="position()!=last()">
            <xsl:text>, </xsl:text>
          </xsl:if>

        </xsl:for-each>

        <xsl:text>&#10;</xsl:text>
      </xsl:for-each>

    </xsl:for-each>
  
    <xsl:text>&#10;</xsl:text>
  </xsl:template>
  
</xsl:stylesheet>
