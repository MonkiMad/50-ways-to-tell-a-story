<CsoundSynthesizer>
<CsOptions>
-odac -iadc1 -d -b1024 -B1024 -M0

</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 128
nchnls = 2



giwave ftgen 0, 0, 4096, 10, 1, 0.5, 0.333, 0.25, 0.2, 0.1666 


;_____________________________________inputinstrument______________________________________________

	instr 10
	
ainL, ainR inch 1, 2

	chnmix (ainL+ainR), "MasterAudioLeft"
	chnmix (ainL+ainR), "MasterAudioRight"
	
	chnmix (ainL+ainR), "ReverbSendLeft"
	chnmix (ainL+ainR), "ReverbSendRight"
	
	chnmix (ainL+ainR), "OvertoneSendLeft"
	chnmix (ainL+ainR), "OvertoneSendRight"

	chnmix (ainL+ainR), "FlangerSendLeft"
	chnmix (ainL+ainR), "FlangerSendRight"
	
	chnmix (ainL+ainR), "GrainSendLeft"
	chnmix (ainL+ainR), "GrainSendRight"
	
	endin



;_____________________________________klanginstrument______________________________________________

	instr 11
	
aLeft chnget "ReverbSendLeft"
aRight chnget "ReverbSendRight"

kWetRev	ctrl7 1, 12, 0, 1
kRoomsize	ctrl7 1, 22, 0, .9
printk 0, kRoomsize

aRevLeft, aRevRight reverbsc aLeft, aRight, kRoomsize, 10000

	chnmix aRevLeft*kWetRev, "MasterAudioLeft"
	chnmix aRevRight*kWetRev, "MasterAudioRight"
	
	chnmix aRevLeft*kWetRev, "Reverb2SendLeft"
	chnmix aRevRight*kWetRev, "Reverb2SendRight"
	
aClear = 0

	chnset aClear, "ReverbSendLeft"
	chnset aClear, "ReverbSendRight"
	
	endin
	
;_____________________________________klanginstrument2______________________________________________

	instr 12
	
aLeft chnget "Reverb2SendLeft"
aRight chnget "Reverb2SendRight"

kWetRev	ctrl7 1, 13, 0, 1
kRoomsize	ctrl7 1, 23, 0, .9
printk 0, kRoomsize

aRev2Left, aRev2Right reverbsc aLeft, aRight, kRoomsize, 10000
	
	chnmix aRev2Left*kWetRev, "MasterAudioLeft"
	chnmix aRev2Right*kWetRev, "MasterAudioRight"
	
	chnmix aRev2Left*kWetRev, "Reverb3SendLeft"
	chnmix aRev2Right*kWetRev, "Reverb3SendRight"
	
aClear = 0

	chnset aClear, "Reverb2SendLeft"
	chnset aClear, "Reverb2SendRight"
	
	endin
	
	
;_____________________________________klanginstrument3______________________________________________

	instr 13
	
aLeft chnget "Reverb3SendLeft"
aRight chnget "Reverb3SendRight"

kWetRev	ctrl7 1, 14, 0, 1
kRoomsize	ctrl7 1, 24, 0, .9
printk 0, kRoomsize

aRev2Left, aRev2Right reverbsc aLeft, aRight, kRoomsize, 10000
	a1 = aRev2Left * 0.4
	a2 = aRev2Right * 0.4
	chnmix a1*kWetRev, "MasterAudioLeft"
	chnmix a2*kWetRev, "MasterAudioRight"
	
aClear = 0

	chnset aClear, "Reverb3SendLeft"
	chnset aClear, "Reverb3SendRight"
	
	endin
;_____________________________________chorusinstrument______________________________________________

/*based on Iain McCurdy*/

	instr 14

kOnOff ctrl7 1, 15, 0, 1
if kOnOff == 1 then
printk 0, kOnOff

ifftsize = 1024
iwtype = 1    /* cleaner with hanning window */

aLeft chnget "OvertoneSendLeft"
aRight chnget "OvertoneSendRight"

fsig pvsanal   aLeft+aRight, ifftsize, ifftsize/4, ifftsize, iwtype
kfr, kamp pvspitch   fsig, 0.01

kOvertone ctrl7 1, 25, 0, 3
printk 0, kOvertone
adm  oscil     kamp, kfr * kOvertone, giwave
	
	chnmix (adm+adm), "MasterAudioLeft"
	chnmix (adm+adm), "MasterAudioRight"

aClear = 0

	chnset aClear, "OvertoneSendLeft"
	chnset aClear, "OvertoneSendRight"

endif
	endin


;_____________________________________flangerinstrument______________________________________________

/* Based on Iain McCurdy*/

	instr 15

kOnOff ctrl7 1, 16, 0, 1
if kOnOff == 1 then
printk 0, kOnOff


aLeft chnget "FlangerSendLeft"
aRight chnget "FlangerSendRight"

kWetFlanger ctrl7 1, 26, 0, 1
printk 0, kWetFlanger

adel  linseg 0, p3*.5, 0.02, p3*.5, 0	;max delay time = 20ms
aoutl flanger aLeft, adel, kWetFlanger
aoutr flanger aRight, adel*2, kWetFlanger
      
      chnmix (aoutl+aoutr), "MasterAudioLeft"
      chnmix (aoutl+aoutr), "MasterAudioRight"
      
aClear = 0

	chnset aClear, "FlangerSendLeft"
	chnset aClear, "FlangerSendRight"

endif
      endin

;__________________________________________pvspitsj_________________________________________________


	instr 16
	
	adel init 0
	
kLeft		chnget "ReverbSendLeft"
kRight	chnget "ReverbSendRight"
idelay = 0,2

adel		delay		kLeft + (adel*0.95), idelay

kWetDelay	ctrl7 1, 17, 0, 1
	
	endin

;_____________________________________masterinstrument______________________________________________

	instr 20
	
aLeft chnget "MasterAudioLeft"
aRight chnget "MasterAudioRight"

	outs aLeft, aRight
	
aClear = 0
	
	chnset aClear, "MasterAudioLeft"
	chnset aClear, "MasterAudioRight"
		
	endin

</CsInstruments>
<CsScore>

i 10 0 3600
i 11 0 3600
i 12 0 3600
i 13 0 3600
i 14 0 3600
i 15 0 3600
i 20 0 3600
</CsScore>
</CsoundSynthesizer><bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>0</y>
 <width>30</width>
 <height>105</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>slider1</objectName>
  <x>5</x>
  <y>5</y>
  <width>20</width>
  <height>100</height>
  <uuid>{3870f2b0-4b8c-404a-8476-d7286ac05032}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
<MacOptions>
Version: 3
Render: Real
Ask: Yes
Functions: ioObject
Listing: Window
WindowBounds: 0 30 96 26
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioSlider {5, 5} {20, 100} 0.000000 1.000000 0.000000 slider1
</MacGUI>
