<?xml version="1.0" encoding="UTF-8"?>

<!-- xsl-template from https://drive.google.com/file/d/1Gsq5JSwcjpWBjkWl-ivtR7XP8_ZPQVNu/view?usp=sharing -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes" />

  <xsl:template match="/xbel">

    <!-- Nuevo elemento raíz -->
    <xsl:element name="favoritos">

      <!-- Atributo propietario -->
      <xsl:attribute name="propietario">
        <xsl:value-of select="owner" />
      </xsl:attribute>

      <!-- Elemento opcional fecha -->
      <xsl:if test="@added">
        <xsl:element name="fecha">
          <xsl:value-of select="@added" />
        </xsl:element>
      </xsl:if>

      <!-- Recorre los elementos folder -->
      <xsl:for-each select="folder">
        
        <!-- El elemento title pasa a ser un comentario -->
        <xsl:comment>
          <xsl:value-of select="title" />
        </xsl:comment>
        
        <xsl:for-each select="bookmark">
          
          <!-- En primer lugar se ordena por ranking -->
          <xsl:sort select="ranking" data-type="number" order="descending" />

          <!-- Genera solo los items que tienen ranking -->
          <xsl:if test="ranking">

            <xsl:element name="item">
                          
              <!-- Elemento puntos de ranking -->
              <xsl:element name="puntos">
                <xsl:value-of select="ranking" />
              </xsl:element>
              
              <!-- Elemento titulo de title -->
              <xsl:element name="titulo">
                <xsl:value-of select="title" />
              </xsl:element>  

              <!-- Elemento url con valor del href -->
              <xsl:element name="url">
                <xsl:value-of select="@href" />
              </xsl:element>

              <!-- Elemento etiquetas -->
              <xsl:element name="etiquetas">

                <!-- Añade cada tag separada por un # -->
                <xsl:for-each select="tag">

                  <xsl:value-of select="." />

                  <xsl:if test="position()!=last()">
                    <xsl:text>#</xsl:text>
                  </xsl:if>

                </xsl:for-each>

              </xsl:element>

            </xsl:element>

          </xsl:if>
        </xsl:for-each>


      </xsl:for-each>

    </xsl:element>
  
  </xsl:template>
  
</xsl:stylesheet>
