<?xml version="1.0" encoding="UTF-8"?>
<!--
    Copyright (c) 2019 JATS4Reuse (https://jats4r.org)
    
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    
    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
    -->

<schema xmlns="http://purl.oclc.org/dsdl/schematron"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:j4r="http://jats4r.org/ns"
        queryBinding="xslt2">

  <ns prefix="ali" uri="http://www.niso.org/schemas/ali/1.0"/>
  <ns prefix="j4r" uri="http://jats4r.org/ns"/>
  <ns prefix="mml" uri="http://www.w3.org/1998/Math/MathML"/>
  <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
  <ns prefix="xlink" uri="http://www.w3.org/1999/xlink"/>

  <include href="permissions-errors.sch"/>
  <include href="permissions-warnings.sch"/>
  <include href="math-errors.sch"/>
  <include href="math-warnings.sch"/>
  <include href="data-citations-errors.sch"/>
  <include href="data-citations-warnings.sch"/>
  
 <!-- <xsl:function name='j4r:jats-version-later-1d2' as="xsd:boolean">
    <xsl:param name="v"/>
    <xsl:variable name='maj' select="substring-before($v, '.')"/>
    <xsl:variable name='min' select="substring-after($v, '.')"/>
    <xsl:variable name='min-is-num' select='number($min) = number($min)'/>
    <xsl:value-of select="
      $maj = '1' and
      ( $min-is-num and number($min) >= 1 or
        not($min-is-num) and $min > '1d2' )
    "/>
  </xsl:function>-->
  
  
</schema>
