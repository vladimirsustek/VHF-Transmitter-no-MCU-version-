<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="7.7.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="50" name="dxf" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="99" name="SpiceOrder" color="5" fill="1" visible="no" active="no"/>
<layer number="200" name="200bmp" color="1" fill="10" visible="no" active="no"/>
<layer number="250" name="Descript" color="3" fill="1" visible="no" active="no"/>
<layer number="251" name="SMDround" color="12" fill="11" visible="no" active="no"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="FM_transmitter">
<packages>
<package name="LFCSP-16">
<wire x1="-1.8984" y1="1.4" x2="-1.4" y2="1.8984" width="0.2032" layer="21"/>
<wire x1="-1.4" y1="-1.8984" x2="1.4" y2="-1.8984" width="0.2032" layer="51"/>
<wire x1="1.8984" y1="-1.4" x2="1.8984" y2="1.4" width="0.2032" layer="51"/>
<wire x1="1.4" y1="1.8984" x2="-1.4" y2="1.8984" width="0.2032" layer="51"/>
<wire x1="-1.8984" y1="1.4" x2="-1.8984" y2="-1.4" width="0.2032" layer="51"/>
<wire x1="1.4" y1="1.8984" x2="1.8984" y2="1.4" width="0.2032" layer="21"/>
<wire x1="1.8984" y1="-1.4" x2="1.4" y2="-1.8984" width="0.2032" layer="21"/>
<wire x1="-1.4" y1="-1.8984" x2="-1.8984" y2="-1.4" width="0.2032" layer="21"/>
<circle x="-1" y="1" radius="0.275" width="0" layer="51"/>
<smd name="1" x="-1.675" y="0.975" dx="0.7" dy="0.35" layer="1" roundness="20" stop="no"/>
<smd name="2" x="-1.675" y="0.325" dx="0.7" dy="0.35" layer="1" roundness="20" stop="no"/>
<smd name="3" x="-1.675" y="-0.325" dx="0.7" dy="0.35" layer="1" roundness="20" stop="no"/>
<smd name="4" x="-1.675" y="-0.975" dx="0.7" dy="0.35" layer="1" roundness="20" stop="no"/>
<smd name="5" x="-0.975" y="-1.675" dx="0.35" dy="0.7" layer="1" roundness="20" stop="no"/>
<smd name="6" x="-0.325" y="-1.675" dx="0.35" dy="0.7" layer="1" roundness="20" stop="no"/>
<smd name="7" x="0.325" y="-1.675" dx="0.35" dy="0.7" layer="1" roundness="20" stop="no"/>
<smd name="8" x="0.975" y="-1.675" dx="0.35" dy="0.7" layer="1" roundness="20" stop="no"/>
<smd name="9" x="1.675" y="-0.975" dx="0.7" dy="0.35" layer="1" roundness="20" stop="no"/>
<smd name="10" x="1.675" y="-0.325" dx="0.7" dy="0.35" layer="1" roundness="20" stop="no"/>
<smd name="11" x="1.675" y="0.325" dx="0.7" dy="0.35" layer="1" roundness="20" stop="no"/>
<smd name="12" x="1.675" y="0.975" dx="0.7" dy="0.35" layer="1" roundness="20" stop="no"/>
<smd name="13" x="0.975" y="1.675" dx="0.35" dy="0.7" layer="1" roundness="20" stop="no"/>
<smd name="14" x="0.325" y="1.675" dx="0.35" dy="0.7" layer="1" roundness="20" stop="no"/>
<smd name="15" x="-0.325" y="1.675" dx="0.35" dy="0.7" layer="1" roundness="20" stop="no"/>
<smd name="16" x="-0.975" y="1.675" dx="0.35" dy="0.7" layer="1" roundness="20" stop="no"/>
<smd name="EXP" x="0" y="0" dx="2.1" dy="2.1" layer="1" roundness="20" stop="no" cream="no"/>
<text x="-2" y="2.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-2" y="-3.905" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-2.05" y1="0.775" x2="-1.3" y2="1.175" layer="29"/>
<rectangle x1="-2.05" y1="0.125" x2="-1.3" y2="0.525" layer="29"/>
<rectangle x1="-2.05" y1="-0.525" x2="-1.3" y2="-0.125" layer="29"/>
<rectangle x1="-2.05" y1="-1.175" x2="-1.3" y2="-0.775" layer="29"/>
<rectangle x1="-1.35" y1="-1.875" x2="-0.6" y2="-1.475" layer="29" rot="R90"/>
<rectangle x1="-0.7" y1="-1.875" x2="0.05" y2="-1.475" layer="29" rot="R90"/>
<rectangle x1="-0.05" y1="-1.875" x2="0.7" y2="-1.475" layer="29" rot="R90"/>
<rectangle x1="0.6" y1="-1.875" x2="1.35" y2="-1.475" layer="29" rot="R90"/>
<rectangle x1="1.3" y1="-1.175" x2="2.05" y2="-0.775" layer="29" rot="R180"/>
<rectangle x1="1.3" y1="-0.525" x2="2.05" y2="-0.125" layer="29" rot="R180"/>
<rectangle x1="1.3" y1="0.125" x2="2.05" y2="0.525" layer="29" rot="R180"/>
<rectangle x1="1.3" y1="0.775" x2="2.05" y2="1.175" layer="29" rot="R180"/>
<rectangle x1="0.6" y1="1.475" x2="1.35" y2="1.875" layer="29" rot="R270"/>
<rectangle x1="-0.05" y1="1.475" x2="0.7" y2="1.875" layer="29" rot="R270"/>
<rectangle x1="-0.7" y1="1.475" x2="0.05" y2="1.875" layer="29" rot="R270"/>
<rectangle x1="-1.35" y1="1.475" x2="-0.6" y2="1.875" layer="29" rot="R270"/>
<rectangle x1="-1.05" y1="-1.05" x2="1.05" y2="1.05" layer="29"/>
<rectangle x1="-0.975" y1="-0.975" x2="0.975" y2="0.975" layer="31"/>
</package>
</packages>
<symbols>
<symbol name="ADT7420">
<wire x1="7.62" y1="10.16" x2="7.62" y2="-12.7" width="0.254" layer="94"/>
<wire x1="7.62" y1="-12.7" x2="-10.16" y2="-12.7" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-12.7" x2="-10.16" y2="10.16" width="0.254" layer="94"/>
<wire x1="-10.16" y1="10.16" x2="7.62" y2="10.16" width="0.254" layer="94"/>
<pin name="CT" x="-15.24" y="7.62" length="middle"/>
<pin name="INT" x="-15.24" y="-2.54" length="middle"/>
<pin name="A0" x="-15.24" y="-7.62" length="middle"/>
<pin name="A1" x="-15.24" y="-10.16" length="middle"/>
<pin name="SCL" x="12.7" y="2.54" length="middle" rot="R180"/>
<pin name="SDA" x="12.7" y="-2.54" length="middle" rot="R180"/>
<pin name="VDD" x="12.7" y="7.62" length="middle" rot="R180"/>
<pin name="GND" x="12.7" y="-10.16" length="middle" rot="R180"/>
<text x="-7.62" y="12.7" size="1.27" layer="94">&gt;NAME</text>
<text x="-7.62" y="15.24" size="1.27" layer="94">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="ADT7420">
<gates>
<gate name="G$1" symbol="ADT7420" x="0" y="0"/>
</gates>
<devices>
<device name="" package="LFCSP-16">
<connects>
<connect gate="G$1" pin="A0" pad="3"/>
<connect gate="G$1" pin="A1" pad="4"/>
<connect gate="G$1" pin="CT" pad="10"/>
<connect gate="G$1" pin="GND" pad="11"/>
<connect gate="G$1" pin="INT" pad="9"/>
<connect gate="G$1" pin="SCL" pad="1"/>
<connect gate="G$1" pin="SDA" pad="2"/>
<connect gate="G$1" pin="VDD" pad="12"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ic-package">
<description>&lt;b&gt;IC Packages an Sockets&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="DIL08">
<description>&lt;b&gt;Dual In Line Package&lt;/b&gt;</description>
<wire x1="5.08" y1="2.921" x2="-5.08" y2="2.921" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-2.921" x2="5.08" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="5.08" y1="2.921" x2="5.08" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="2.921" x2="-5.08" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-2.921" x2="-5.08" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.016" x2="-5.08" y2="-1.016" width="0.1524" layer="21" curve="-180"/>
<pad name="1" x="-3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="2" x="-1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="7" x="-1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="8" x="-3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="3" x="1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="4" x="3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="6" x="1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="5" x="3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<text x="-5.334" y="-2.921" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="-3.556" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="SOCKET-08">
<description>&lt;b&gt;Dual In Line Socket&lt;/b&gt;</description>
<wire x1="5.08" y1="5.08" x2="-5.08" y2="5.08" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-5.08" x2="5.08" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="5.08" y1="5.08" x2="5.08" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="5.08" x2="-5.08" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-5.08" x2="-5.08" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.016" x2="-5.08" y2="-1.016" width="0.1524" layer="21" curve="-180"/>
<wire x1="-5.08" y1="2.54" x2="5.08" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="2.54" x2="-5.08" y2="1.016" width="0.1524" layer="21"/>
<wire x1="5.08" y1="2.54" x2="5.08" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-2.54" x2="5.08" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-2.54" x2="-5.08" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-2.54" x2="5.08" y2="-5.08" width="0.1524" layer="21"/>
<pad name="1" x="-3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="2" x="-1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="5" x="3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="6" x="1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="3" x="1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="4" x="3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="7" x="-1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="8" x="-3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<text x="-3.048" y="-0.508" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-5.461" y="-2.667" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
</package>
</packages>
<symbols>
<symbol name="DIL8">
<wire x1="-5.08" y1="3.81" x2="-5.08" y2="-6.35" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-6.35" x2="5.08" y2="-6.35" width="0.254" layer="94"/>
<wire x1="5.08" y1="-6.35" x2="5.08" y2="3.81" width="0.254" layer="94"/>
<wire x1="5.08" y1="3.81" x2="2.54" y2="3.81" width="0.254" layer="94"/>
<wire x1="-5.08" y1="3.81" x2="-2.54" y2="3.81" width="0.254" layer="94"/>
<wire x1="-2.54" y1="3.81" x2="2.54" y2="3.81" width="0.254" layer="94" curve="180"/>
<text x="-4.445" y="4.445" size="1.778" layer="95">&gt;NAME</text>
<text x="-4.445" y="-8.89" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-7.62" y="2.54" visible="pad" length="short" direction="pas"/>
<pin name="2" x="-7.62" y="0" visible="pad" length="short" direction="pas"/>
<pin name="3" x="-7.62" y="-2.54" visible="pad" length="short" direction="pas"/>
<pin name="4" x="-7.62" y="-5.08" visible="pad" length="short" direction="pas"/>
<pin name="5" x="7.62" y="-5.08" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="6" x="7.62" y="-2.54" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="7" x="7.62" y="0" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="8" x="7.62" y="2.54" visible="pad" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="DIL8" prefix="IC" uservalue="yes">
<description>&lt;b&gt;Dual In Line / Socket&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="DIL8" x="0" y="0"/>
</gates>
<devices>
<device name="" package="DIL08">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="S" package="SOCKET-08">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="U$1" library="FM_transmitter" deviceset="ADT7420" device=""/>
<part name="IC1" library="ic-package" deviceset="DIL8" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="U$1" gate="G$1" x="-76.2" y="40.64"/>
<instance part="IC1" gate="G$1" x="-78.74" y="73.66"/>
</instances>
<busses>
</busses>
<nets>
<net name="T8" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="VDD"/>
<wire x1="-63.5" y1="48.26" x2="-53.34" y2="48.26" width="0.1524" layer="91"/>
<label x="-58.42" y="48.26" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="8"/>
<wire x1="-71.12" y1="76.2" x2="-53.34" y2="76.2" width="0.1524" layer="91"/>
<label x="-66.04" y="76.2" size="1.778" layer="95"/>
</segment>
</net>
<net name="T7" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="GND"/>
<wire x1="-63.5" y1="30.48" x2="-53.34" y2="30.48" width="0.1524" layer="91"/>
<label x="-58.42" y="30.48" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="7"/>
<wire x1="-71.12" y1="73.66" x2="-53.34" y2="73.66" width="0.1524" layer="91"/>
<label x="-66.04" y="73.66" size="1.778" layer="95"/>
</segment>
</net>
<net name="T6" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="CT"/>
<wire x1="-91.44" y1="48.26" x2="-104.14" y2="48.26" width="0.1524" layer="91"/>
<label x="-104.14" y="48.26" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="6"/>
<wire x1="-71.12" y1="71.12" x2="-53.34" y2="71.12" width="0.1524" layer="91"/>
<label x="-66.04" y="71.12" size="1.778" layer="95"/>
</segment>
</net>
<net name="T5" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="INT"/>
<wire x1="-91.44" y1="38.1" x2="-104.14" y2="38.1" width="0.1524" layer="91"/>
<label x="-104.14" y="38.1" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="5"/>
<wire x1="-71.12" y1="68.58" x2="-53.34" y2="68.58" width="0.1524" layer="91"/>
<label x="-66.04" y="68.58" size="1.778" layer="95"/>
</segment>
</net>
<net name="T1" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="SCL"/>
<wire x1="-63.5" y1="43.18" x2="-53.34" y2="43.18" width="0.1524" layer="91"/>
<label x="-58.42" y="43.18" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="1"/>
<wire x1="-86.36" y1="76.2" x2="-104.14" y2="76.2" width="0.1524" layer="91"/>
<label x="-96.52" y="76.2" size="1.778" layer="95"/>
</segment>
</net>
<net name="T2" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="SDA"/>
<wire x1="-63.5" y1="38.1" x2="-53.34" y2="38.1" width="0.1524" layer="91"/>
<label x="-58.42" y="38.1" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="2"/>
<wire x1="-86.36" y1="73.66" x2="-104.14" y2="73.66" width="0.1524" layer="91"/>
<label x="-96.52" y="73.66" size="1.778" layer="95"/>
</segment>
</net>
<net name="T3" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="A0"/>
<wire x1="-91.44" y1="33.02" x2="-104.14" y2="33.02" width="0.1524" layer="91"/>
<label x="-104.14" y="33.02" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="3"/>
<wire x1="-86.36" y1="71.12" x2="-104.14" y2="71.12" width="0.1524" layer="91"/>
<label x="-96.52" y="71.12" size="1.778" layer="95"/>
</segment>
</net>
<net name="T4" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="A1"/>
<wire x1="-91.44" y1="30.48" x2="-104.14" y2="30.48" width="0.1524" layer="91"/>
<label x="-104.14" y="30.48" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="4"/>
<wire x1="-86.36" y1="68.58" x2="-104.14" y2="68.58" width="0.1524" layer="91"/>
<label x="-96.52" y="68.58" size="1.778" layer="95"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
