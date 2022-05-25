<?xml version="1.0" encoding="UTF-8"?>

<!-- xsl-template from https://drive.google.com/file/d/1Gsq5JSwcjpWBjkWl-ivtR7XP8_ZPQVNu/view?usp=sharing -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" encoding="utf-8" indent="yes" />

  <xsl:template match="/mayorista">
    
    <!-- Comentario con el nombre -->
    <xsl:comment>Agencia: <xsl:value-of select="nombre" /></xsl:comment>

    <!-- Nuevo elemento raíz -->
    <xsl:element name="ofertas">

      <!-- Cada ruta se convierte en una oferta -->
      <xsl:for-each select="ruta">

        <!-- Ordena por precio estimado -->
        <xsl:sort select="destino/precioEstimado" data-type="number" order="descending"/>

        <xsl:element name="oferta">
          
          <!-- Elemento destino -->
          <xsl:element name="destino">
            
            <!-- Atributo tipo -->
            <xsl:attribute name="tipo">
              <xsl:value-of select="destino/tipo" />
            </xsl:attribute>
            
            <!-- Contenido del elemento -->
            <xsl:value-of select="destino/nombre" />
            <xsl:value-of select="concat('. Del ', fechaIni, ' al ', fechaFin)" />

          </xsl:element>
          
          <!-- Elemento id -->
          <xsl:element name="id">
            <xsl:value-of select="@codigo" />
          </xsl:element>
          
          <!-- Elemento precio -->
          <xsl:element name="precio">

            <!-- Atributo moneda -->
            <xsl:attribute name="moneda">
              
              <xsl:choose>
                <xsl:when test="destino/precioEstimado/@moneda='E'">
                  <xsl:text>euros</xsl:text>
                </xsl:when>
                <xsl:when test="destino/precioEstimado/@moneda='L'">
                  <xsl:text>libras</xsl:text>
                </xsl:when>
                <xsl:when test="destino/precioEstimado/@moneda='D'">
                  <xsl:text>dólares</xsl:text>
                </xsl:when>
              </xsl:choose>

            </xsl:attribute>

            <!-- Contenido elemento -->
            <xsl:value-of select="destino/precioEstimado" />

          </xsl:element>

          <!-- Cada poi que tenga horario se convierte en un elemento visita -->
          <xsl:for-each select="destacados/poi[horario!='']">
          
            <!-- Elemento visita -->
            <xsl:element name="visita">

              <!-- Elemento a -->
              <xsl:element name="a">

                <!-- Atributo href -->
                <xsl:attribute name="href">
                  <xsl:value-of select="web" />
                </xsl:attribute>

                <!-- Contenido -->
                <xsl:value-of select="concat('(', position(), ') ', nombre)" />

              </xsl:element>
              
              <!-- Elemento descr -->
              <xsl:element name="descr">

                <!-- Se recorren todas las etiquetas -->
                <xsl:for-each select="etiqueta">
                  
                  <!-- Ordenación alfabética -->
                  <xsl:sort select="."/>

                  <!-- Valor de la etiqueta -->
                  <xsl:value-of select="." />
                  <!-- Mientras no sea la última agrega ~ como separador -->
                  <xsl:if test="position()!=last()">
                    <xsl:text> ~ </xsl:text>
                  </xsl:if>

                </xsl:for-each>

              </xsl:element>

            </xsl:element>

          </xsl:for-each>

        </xsl:element>

      </xsl:for-each>

    </xsl:element>

  </xsl:template>
  
</xsl:stylesheet>
