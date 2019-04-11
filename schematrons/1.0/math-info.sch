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

<pattern id="math-info" 
         xmlns="http://purl.oclc.org/dsdl/schematron"
         xmlns:j4r="http://jats4r.org/ns">

  <rule context="disp-formula | inline-formula">
    <report test="alternatives"> 
      INFO: &lt;alternatives> may contain any combination of
      representations (&lt;graphic>, &lt;mml:math>, &lt;tex-math>) but where it is used, each
      representation should be correct, complete and logically equivalent with every other
      representation present. There is no explicit or implied preferred representation within
      &lt;alternatives>. 
    </report>

    <report test="descendant::tex-math"> 
      INFO: The content of the &lt;tex-math> element should be
      math-mode LaTeX, without the delimiters that are normally used to switch into / out of math
      mode (\\[...\\], \\(...\\), $$...$$, etc.). 
    </report>
  </rule>

</pattern>
