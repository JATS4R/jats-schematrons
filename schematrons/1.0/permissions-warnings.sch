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

<pattern id="permissions-warnings" 
         xmlns="http://purl.oclc.org/dsdl/schematron"
         xmlns:j4r="http://jats4r.org/ns">

  <rule context="license">

    <!-- If license/@xlink:href exists, it must not be empty -->
    <report test="@xlink:href and normalize-space(@xlink:href) = ''"> 
      <j4r:meta rec='rec5' test-file='permissions-2.xml'/>
      WARNING: Whenever the @xlink:href attribute appears on the &lt;license> element, its
      value must be the canonical URI of a valid license (such as a Creative Commons
      license). In this article, the attribute appears to be empty.
    </report>

    <!-- Same for ali:license_ref -->
    <report test="ali:license_ref and normalize-space(string(ali:license_ref)) = ''"> 
      <j4r:meta rec='rec5' test-file='permissions-2.xml'/>
      WARNING: Whenever the ali:license_ref element appears, its
      content must be the canonical URI of a valid license (such as a Creative Commons
      license). In this article, the attribute appears to be empty.
    </report>
    

    <!-- For JATS 1.1d3 and later, <license> should have an <ali:license_ref> -->
    <report test="j4r:jats-version-later-1d2(/article/@dtd-version) and 
                  not(@xlink:href) and not(ali:license_ref)">
      <j4r:meta rec='rec5' test-file='permissions-2.xml'/>
      WARNING: No licence URI.
      For JATS 1.1d3 and later, if the licence is defined by a canonical URI, then the
      &lt;license> element should have an &lt;ali:license_ref> child, that specifies
      that URI.
    </report>
    <report test="j4r:jats-version-later-1d2(/article/@dtd-version) and 
                  @xlink:href and not(ali:license_ref)">
      <j4r:meta rec='rec5' test-file='permissions-2.xml'/>
      WARNING: The license URI is given in @xlink:href.
      For JATS 1.1d3 and later, if the licence is defined by a canonical URI, then it
      should be specified in the &lt;ali:license_ref> child element.
    </report>
    
    <!-- For JATS 1.1d2 and earlier, <license> should have an @xlink:href to the license URI -->
    <report test="not(j4r:jats-version-later-1d2(/article/@dtd-version)) and
                  not(@xlink:href)"> 
      <j4r:meta rec='rec5' test-file='permissions-1.xml'/>
      WARNING: No licence URI.
      For JATS 1.1d2 and earlier, if the licence is defined by a canonical URI, then the
      &lt;license> element should have an @xlink:href attribute, that specifies
      that URI.
    </report>

  </rule>



</pattern>
