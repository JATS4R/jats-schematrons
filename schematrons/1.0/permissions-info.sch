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

<pattern id="permissions-info" 
         xmlns="http://purl.oclc.org/dsdl/schematron"
         xmlns:j4r="http://jats4r.org/ns">

  <rule context="permissions/copyright-statement">
    <report test="true()"> 
      <j4r:meta rec='rem1' test-file='permissions-1.xml'/>
      INFO: The content of the &lt;copyright-statement> is intended for
      display; i.e. human consumption. Therefore, the contents of this element aren't addressed by
      these recommendations. 
    </report>
  </rule>

  <rule context="license/license-p[1]">
    <report test="true()">
      <j4r:meta rec='rem1' test-file='permissions-1.xml'/>
      INFO: The &lt;license-p> element is intended to be human-readable
      documentation, and any content is allowed, including, for example, &lt;ext-link> elements with
      URIs. Such URIs within the &lt;license-p> element will be ignored. (It is the responsibility
      of the content producer to ensure that the human-readable version of the license statement
      matches the (machine-readable) license URI.) 
    </report>
  </rule>

  <rule context="license/p[1]"> 
    <report test="true()">
      <j4r:meta rec='rem1' test-file='permissions-1.xml'/>
      INFO: The &lt;p> element in &lt;license> is intended to be human-readable
      documentation, and any content is allowed, including, for example, &lt;ext-link> elements with
      URIs. Such URIs within the &lt;license-p> element will be ignored. (It is the responsibility
      of the content producer to ensure that the human-readable version of the license statement
      matches the (machine-readable) license URI.) 
    </report>
  </rule>

  <rule context="license/p/ext-link[1] | license/license-p/ext-link[1]">
    <report test="true()"> 
      <j4r:meta rec='rem1' test-file='permissions-1.xml'/>
      INFO: Any link in the text of a license should be to a human-readable
      license that does not contradict the machine-readable license referenced at
      license/@xlink:href. 
    </report>
  </rule>

  <rule context="license/@license-type">
    <report test="true()"> 
      <j4r:meta rec='rem3' test-file='permissions-1.xml'/>
      INFO: While the @license-type attribute might be useful in some closed production systems, 
      be aware that its allowable values have not been standardized, and are therefore not usable 
      by automated systems.
    </report>
  </rule>

  <rule context="permissions">
    <report test='not(ancestor::article-meta)'>
      <j4r:meta rec='rem2' test-file='permissions-1.xml'/>
      INFO: This article has a &lt;permissions> element that is not within &lt;article-meta>.
      This is used to override the article-level permissions, to specify that this object has
      different copyright or license conditions than the article as a whole.
    </report>
  </rule>

  <rule context="ali:free_to_read">
    <report test="true()">
      <j4r:meta rec='rec8' test-file='permissions-2.xml'/>
      INFO: This article contains the &lt;ali:free_to_read> element, indicating that it is not behind 
      access barriers, irrespective of any license specifications. The article should be accessible by 
      any user without payment or authentication.
    </report>
  </rule>

  <!-- if both @xlink:href and ali:license_ref are used, and they match, that's good! -->
  <rule context="license">
    <report test="@xlink:href and ali:license_ref and
                  string(@xlink:href) = string(ali:license_ref)">
      <j4r:meta rec='rec6' test-file='permissions-2.xml'/>
      INFO: It appears this article specifies the licence URI with both the @xlink:href attribute
      and the &lt;ali:license_ref> element; and they match exactly.  This is good!
    </report>
  </rule>
</pattern>
