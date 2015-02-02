<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
  <xsl:import href="/usr/share/xml/docbook/stylesheet/nwalsh/manpages/docbook.xsl"/>

  <!-- Use .TP list for the variablelist describing the strtime() directives. -->
  <!-- This hack aligns the indented paragraphs horizontally with their -->
  <!-- labels. -->
  <xsl:template match="variablelist[attribute::id='strftime']/varlistentry">
    <xsl:text>.TP&#10;</xsl:text>
    <xsl:for-each select="term">
      <xsl:variable name="content">
        <xsl:apply-templates/>
      </xsl:variable>
      <xsl:value-of select="normalize-space($content)"/>
      <xsl:choose>
        <xsl:when test="position() = last()"/> <!-- do nothing -->
        <xsl:otherwise>
          <!-- * if we have multiple terms in the same varlistentry, generate -->
          <!-- * a separator (", " by default) -->
          <xsl:value-of select="$variablelist.term.separator"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
    <xsl:text>&#10;</xsl:text>
    <xsl:apply-templates/>
  </xsl:template>

</xsl:stylesheet>
