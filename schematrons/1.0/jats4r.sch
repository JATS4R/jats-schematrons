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


  <include href="auths-affs-errors.sch"/>
  <include href="auths-affs-warnings.sch"/>
  <include href="coi-errors.sch"/>
  <include href="coi-warnings.sch"/>
  <include href="data-availability-errors.sch"/>
  <include href="data-availability-warnings.sch"/>
  <include href="data-citations-errors.sch"/>
  <include href="data-citations-warnings.sch"/>
  <include href="math-errors.sch"/>
  <include href="math-warnings.sch"/>
  <include href="permissions-errors.sch"/>
  <include href="permissions-warnings.sch"/>
  
 <xsl:function name='j4r:jats-version-later-1d2' as="xsd:boolean">
    <xsl:param name="v"/>
    <xsl:variable name='maj' select="substring-before($v, '.')"/>
    <xsl:variable name='min' select="substring-after($v, '.')"/>
    <xsl:variable name='min-is-num' select='number($min) = number($min)'/>
    <xsl:value-of select="
      $maj = '1' and
      ( $min-is-num and number($min) >= 1 or
        not($min-is-num) and $min > '1d2' )
    "/>
  </xsl:function>
  
  <xsl:function name="j4r:coi-type" as="xsd:boolean">
    <xsl:param name="type"/>
    <xsl:value-of select="
      $type='COI_statement' or
      $type='coi-statement' or
      $type='coi_statement' or
      $type='conflict-statement' or
      $type='conflict_statement' or
      $type='conflict-of-interests' or
      $type='conflict_of_interests' or
      $type='conflict-of-interest' or
      $type='conflict_of_interest' or
      $type='competing-interests' or
      $type='competing_interests' or
      $type='competing-interest' or
      $type='competing_interess' or
      $type='conflict'"/>
  </xsl:function>
  
  <xsl:function name="j4r:coi-title" as="xsd:boolean">
    <xsl:param name="title"/>
    <xsl:variable name="testtitle" select="upper-case($title)"/>
    <xsl:value-of select="
      $testtitle='CONFLICT OF INTEREST' or
      $testtitle='CONFLICTS OF INTEREST' or
      $testtitle='CONFLICT OF INTEREST STATEMENT' or
      $testtitle='CONFLICT OF INTEREST STATEMENTS' or
      $testtitle='AUTHOR CONFLICTS' or
      $testtitle='COMPETING INTERESS' or
      $testtitle='COMPETING INTERESTS' or
      $testtitle='CONFLICTS'"/>
  </xsl:function>
  
  <xsl:function name="j4r:data-avail-type" as="xsd:boolean">
    <xsl:param name="type"/>
    <xsl:value-of select="
      $type='data availability' or
      $type='Data availability' or
      $type='Data Availability' or 
      $type='Data-Availability' or 
      $type='data availability statement' or 
      $type='Data availability statement' or 
      $type='Data Availability Statement' or 
      $type='data-availability-statement' or
      $type='Data-availability-statement' or
      $type='Data-Availability-Statement' or 
      $type='Data_Availability' or 
      $type='data_availability-statement' or 
      $type='Data_availability-statement' or
      $type='Data_Availability-Statement' or 
      $type='data_availability' or
      $type='Data Accessibility' or
      $type='Data accessibility'"/>
  </xsl:function>
  
  
  
  
</schema>
