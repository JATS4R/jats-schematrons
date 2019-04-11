<?xml version="1.0" encoding="UTF-8"?>
<!--
    Copyright (c) 2015 JATS4Reuse (https://jats4r.org)
    
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

<pattern id="permissions-errors" 
         xmlns="http://purl.oclc.org/dsdl/schematron"
         xmlns:j4r="http://jats4r.org/ns">
  
  <rule context="article-meta">
    <assert test="permissions">
      <j4r:meta rec='rec1' test-file='permissions-none.xml'/>
      ERROR: Missing top-level &lt;permissions> element. JATS4R-compliant articles must include
      a &lt;permissions> element within &lt;article-meta>.
    </assert>
  </rule>

  <rule context="permissions">
    <!-- <copyright-statement> or <copyright-holder> implies copyright; so there must also be a
      <copyright-year> -->
    <report test="(copyright-statement|copyright-holder) and not(copyright-year)"> 
      <j4r:meta rec='rec3' test-file='permissions-1.xml'/>
      ERROR: Missing &lt;copyright-year>.
      When an article is under copyright
      (i.e. it is not in the public domain) we recommend that &lt;copyright-year> be given.
    </report>

    <!-- Likewise, <copyright-statement> or <copyright-year> implies there must also be a
      <copyright-holder> -->
    <report test="(copyright-statement|copyright-year) and not(copyright-holder)"> 
      <j4r:meta rec='rec4' test-file='permissions-1.xml'/>
      ERROR: Missing &lt;copyright-holder>.
      When an article is under copyright
      (i.e. it is not in the public domain) we recommend that &lt;copyright-holder> be given.
    </report>
  </rule>

  <rule context="copyright-year">
    <assert test="number() and number() > 999 and number() &lt; 10000"> 
      <j4r:meta rec='rec3' test-file='permissions-1.xml'/>
      ERROR: &lt;copyright-year&gt; must be a 4-digit year, not "<value-of select="."/>". 
    </assert>
    <report test="normalize-space(string(.)) != string(.)"> 
      <j4r:meta rec='rec3' test-file='permissions-1.xml'/>
      ERROR: &lt;copyright-year&gt; should not contain whitespace. 
    </report>
  </rule>
  
  <rule context="license">
    <!-- if both @xlink:href and ali:license_ref are used, they must match exactly -->
    <report test="@xlink:href and ali:license_ref and
                  string(@xlink:href) != string(ali:license_ref)">
      <j4r:meta rec='rec5' test-file='permissions-2.xml'/>
      ERROR: If both @xlink:href and &lt;ali:license_ref> are used to specify the licence
      URI of an article, their contents must match exactly.
    </report>
  </rule>
  
</pattern>
