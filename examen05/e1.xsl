<?xml version="1.0" encoding="UTF-8"?>

<!-- xsl-template from https://drive.google.com/file/d/1Gsq5JSwcjpWBjkWl-ivtR7XP8_ZPQVNu/view?usp=sharing -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes" />

  <xsl:template match="/inventario">

    <xsl:element name="listado">

      <!-- Elemento mantiene de responsable y mail -->
      <xsl:element name="mantiene">

        <!-- Atributo  correo obtenido de mail-->
        <xsl:attribute name="correo">
          <xsl:value-of select="mail" />
        </xsl:attribute>

        <!-- Contenido del elemento -->
        <xsl:value-of select="responsable" />
      </xsl:element>

      <!-- Elemento contacto con los teléfonos -->
      <xsl:element name="contacto">
        
        <!-- Por cada teléfono -->
        <xsl:for-each select="tel">
          <xsl:choose>
            
            <xsl:when test="@tipo='particular'">
              <xsl:element name="particular">
                <xsl:value-of select="." />
              </xsl:element>
            </xsl:when>

            <xsl:otherwise>
              <xsl:element name="tel">
                <xsl:value-of select="." />
              </xsl:element>
            </xsl:otherwise>

          </xsl:choose>
        </xsl:for-each>

      </xsl:element>

      <!-- Elemento responsables -->
      <xsl:element name="responsables">
        
        <xsl:for-each select="espacio">
          <xsl:value-of select="concat(position(), '.')" />
          <xsl:value-of select="responsable" />
          
          <xsl:if test="position()!=last()">
            <xsl:text>, </xsl:text>
          </xsl:if>
        </xsl:for-each>

      </xsl:element>

      <!-- Elemento detalle -->
      <xsl:element name="detalle">

        <xsl:for-each select="espacio">

          <!-- Comentario por cada espacio -->
          <xsl:comment>
            <xsl:text>Espacio</xsl:text>
            <xsl:value-of select="code" />
            <xsl:text>: </xsl:text>
            <xsl:value-of select="nombre" />
          </xsl:comment>

          <!-- Items que hay dentro del espacio -->
          <xsl:for-each select="item[cantidad&gt;0]">
            <xsl:sort select="cantidad" data-type="number"/>
            <xsl:element name="item">
              <xsl:value-of select="concat(cantidad, ' ', nombre)" />
            </xsl:element>
          </xsl:for-each>

        </xsl:for-each>

      </xsl:element>

    </xsl:element>

  </xsl:template>
  
</xsl:stylesheet>
