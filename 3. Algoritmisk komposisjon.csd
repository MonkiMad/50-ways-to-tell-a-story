 												  /* 50 ways to leave your lover*/
													/* LYRICS BY PAUL SIMON */
													
													
											/* She said why dont we both just sleep on it tonight. 
												I believe that in the morning youll begin to see the light.
														
											Then she kissed me and i realized she probably was right.
														There must be 50 ways to leave your lover*/
														
														
														/*CODE BY MONIKA MADSØ*/
														


<CsoundSynthesizer>
<CsOptions>
-odac -M0 -d -b1024 -B1024
</CsOptions>
<CsInstruments>


;***********************************************************************************************************************************************
; 	Header
;***********************************************************************************************************************************************

sr = 48000
ksmps = 10 ;k-rate = sr/ksmps, forteller hvor ofte a-rate skal oppdateres for hver gang k-raten oppdateres
nchnls = 2
0dbfs = 1


;***********************************************************************************************************************************************
; 	This is what you need to read python in Csound
;***********************************************************************************************************************************************


pyinit						; this function you have to write to start the python interpreter. Always start with this.
pyruni "import sys"				; import module
pyruni "import os"				; import module
pyruni "sys.path.append(os.getcwd())"	; keeps/saves the way to the folder/file you want to find the .py-file in
pyruni "import shuffleDikt"			


;***********************************************************************************************************************************************
;	 Global tables
;***********************************************************************************************************************************************

giWav1		ftgen	0, 0, 0, 1, "1n.Wav", 0, 0, 0		;these last three parameters are skiptime(if you want to start 2 seconds out in 												the file f.ex), channels (0 meens read all 	
giWav2		ftgen	0, 0, 0, 1, "2n.Wav", 0, 0, 0		;channels), and format (specifies the audio data-file format
giWav3		ftgen	0, 0, 0, 1, "3n.Wav", 0, 0, 0		;if format = 0, the sampleformat is taken from the soundfile header or default 													CSound -o flag)
giWav4		ftgen	0, 0, 0, 1, "4n.Wav", 0, 0, 0	
giWav5		ftgen	0, 0, 0, 1, "5n.Wav", 0, 0, 0	
giWav6		ftgen	0, 0, 0, 1, "6n.Wav", 0, 0, 0
giWav7		ftgen	0, 0, 0, 1, "7n.Wav", 0, 0, 0
giWav8		ftgen	0, 0, 0, 1, "8n.Wav", 0, 0, 0
giWav9		ftgen	0, 0, 0, 1, "9n.Wav", 0, 0, 0
giWav10		ftgen	0, 0, 0, 1, "10n.Wav", 0, 0, 0
giWav11		ftgen	0, 0, 0, 1, "11n.Wav", 0, 0, 0
giWav12		ftgen	0, 0, 0, 1, "12n.Wav", 0, 0, 0
giWav13		ftgen	0, 0, 0, 1, "13n.Wav", 0, 0, 0
giWav14		ftgen	0, 0, 0, 1, "14n.Wav", 0, 0, 0
giWav15		ftgen	0, 0, 0, 1, "15n.Wav", 0, 0, 0
giWav16		ftgen	0, 0, 0, 1, "16n.Wav", 0, 0, 0
giWav17		ftgen	0, 0, 0, 1, "17n.Wav", 0, 0, 0
giWav18		ftgen	0, 0, 0, 1, "18n.Wav", 0, 0, 0
giWav19		ftgen	0, 0, 0, 1, "19n.Wav", 0, 0, 0
giWav20		ftgen	0, 0, 0, 1, "20n.Wav", 0, 0, 0
giWav21		ftgen	0, 0, 0, 1, "21n.Wav", 0, 0, 0
giWav22		ftgen	0, 0, 0, 1, "22n.Wav", 0, 0, 0
giWav23		ftgen	0, 0, 0, 1, "23n.Wav", 0, 0, 0
giWav24		ftgen	0, 0, 0, 1, "24n.Wav", 0, 0, 0
giWav25		ftgen	0, 0, 0, 1, "25n.Wav", 0, 0, 0
giWav26		ftgen	0, 0, 0, 1, "26n.Wav", 0, 0, 0
giWav27		ftgen	0, 0, 0, 1, "27n.Wav", 0, 0, 0
giWav28		ftgen	0, 0, 0, 1, "28n.Wav", 0, 0, 0
giWav29		ftgen	0, 0, 0, 1, "29n.Wav", 0, 0, 0
giWav30		ftgen	0, 0, 0, 1, "30n.Wav", 0, 0, 0
giWav31		ftgen	0, 0, 0, 1, "31n.Wav", 0, 0, 0
giWav32		ftgen	0, 0, 0, 1, "32n.Wav", 0, 0, 0
giWav33		ftgen	0, 0, 0, 1, "33n.Wav", 0, 0, 0
giWav34		ftgen	0, 0, 0, 1, "34n.Wav", 0, 0, 0
giWav35		ftgen	0, 0, 0, 1, "35n.Wav", 0, 0, 0
giWav36		ftgen	0, 0, 0, 1, "36n.Wav", 0, 0, 0
giWav37		ftgen	0, 0, 0, 1, "37n.Wav", 0, 0, 0
giWav38		ftgen	0, 0, 0, 1, "38n.Wav", 0, 0, 0
giWav39		ftgen	0, 0, 0, 1, "39n.Wav", 0, 0, 0
giWav40		ftgen	0, 0, 0, 1, "40n.Wav", 0, 0, 0
giWav41		ftgen	0, 0, 0, 1, "41n.Wav", 0, 0, 0

giWav42		ftgen	0, 0, 0, 1, "1m.Wav", 0, 0, 0			;Monikas soundfiles
giWav43		ftgen	0, 0, 0, 1, "2m.Wav", 0, 0, 0
giWav44		ftgen	0, 0, 0, 1, "3m.Wav", 0, 0, 0
giWav45		ftgen	0, 0, 0, 1, "4m.Wav", 0, 0, 0
giWav46		ftgen	0, 0, 0, 1, "5m.Wav", 0, 0, 0
giWav47		ftgen	0, 0, 0, 1, "6m.Wav", 0, 0, 0
giWav48		ftgen	0, 0, 0, 1, "7m.Wav", 0, 0, 0
giWav49		ftgen	0, 0, 0, 1, "8m.Wav", 0, 0, 0
giWav50		ftgen	0, 0, 0, 1, "9m.Wav", 0, 0, 0
giWav51		ftgen	0, 0, 0, 1, "10m.Wav", 0, 0, 0
giWav52		ftgen	0, 0, 0, 1, "11m.Wav", 0, 0, 0
giWav53		ftgen	0, 0, 0, 1, "12m.Wav", 0, 0, 0
giWav54		ftgen	0, 0, 0, 1, "13m.Wav", 0, 0, 0
giWav55		ftgen	0, 0, 0, 1, "14m.Wav", 0, 0, 0
giWav56		ftgen	0, 0, 0, 1, "15m.Wav", 0, 0, 0
giWav57		ftgen	0, 0, 0, 1, "16m.Wav", 0, 0, 0
giWav58		ftgen	0, 0, 0, 1, "17m.Wav", 0, 0, 0
giWav59		ftgen	0, 0, 0, 1, "18m.Wav", 0, 0, 0
giWav60		ftgen	0, 0, 0, 1, "19m.Wav", 0, 0, 0
giWav61		ftgen	0, 0, 0, 1, "20m.Wav", 0, 0, 0
giWav62		ftgen	0, 0, 0, 1, "21m.Wav", 0, 0, 0
giWav63		ftgen	0, 0, 0, 1, "22m.Wav", 0, 0, 0
giWav64		ftgen	0, 0, 0, 1, "23m.Wav", 0, 0, 0
giWav65		ftgen	0, 0, 0, 1, "24m.Wav", 0, 0, 0
giWav66		ftgen	0, 0, 0, 1, "25m.Wav", 0, 0, 0
giWav67		ftgen	0, 0, 0, 1, "26m.Wav", 0, 0, 0
giWav68		ftgen	0, 0, 0, 1, "27m.Wav", 0, 0, 0
giWav69		ftgen	0, 0, 0, 1, "28m.Wav", 0, 0, 0
giWav70		ftgen	0, 0, 0, 1, "29m.Wav", 0, 0, 0
giWav71		ftgen	0, 0, 0, 1, "30m.Wav", 0, 0, 0
giWav72		ftgen	0, 0, 0, 1, "31m.Wav", 0, 0, 0
giWav73		ftgen	0, 0, 0, 1, "32m.Wav", 0, 0, 0
giWav74		ftgen	0, 0, 0, 1, "33m.Wav", 0, 0, 0
giWav75		ftgen	0, 0, 0, 1, "34m.Wav", 0, 0, 0
giWav76		ftgen	0, 0, 0, 1, "35m.Wav", 0, 0, 0
giWav77		ftgen	0, 0, 0, 1, "36m.Wav", 0, 0, 0
giWav78		ftgen	0, 0, 0, 1, "37m.Wav", 0, 0, 0
giWav79		ftgen	0, 0, 0, 1, "38m.Wav", 0, 0, 0
giWav80		ftgen	0, 0, 0, 1, "39m.Wav", 0, 0, 0
giWav81		ftgen	0, 0, 0, 1, "40m.Wav", 0, 0, 0
giWav82		ftgen	0, 0, 0, 1, "41m.Wav", 0, 0, 0


giSounds		ftgen 0, 0, 128, -2, giWav1, giWav2, giWav3, giWav4, giWav5, giWav6, giWav7, giWav8, giWav9, giWav10, giWav11, giWav12, giWav13, giWav14, giWav15, giWav16, giWav17, giWav18, giWav19, giWav20, giWav21, giWav22, giWav23, giWav24, giWav25,giWav26, giWav27, giWav28, giWav29, giWav30, giWav31, giWav32, giWav33, giWav34, giWav35, giWav36, giWav37, giWav38, giWav39, giWav40, giWav41, giWav42, giWav43, giWav44, giWav45, giWav46, giWav47, giWav48, giWav49, giWav50, giWav51, giWav52, giWav53, giWav54, giWav55, giWav56, giWav57, giWav58, giWav59, giWav60, giWav61, giWav62, giWav63, giWav64, giWav65,giWav66, giWav67, giWav68, giWav69, giWav70, giWav71, giWav72, giWav73, giWav74, giWav75, giWav76, giWav77, giWav78, giWav79, giWav80, giWav81, giWav82

;***********************************************************************************************************************************************
;	TRIGGER INSTRUMENT
;***********************************************************************************************************************************************
	instr 2
	iBytte = 1
	kLength		init 1								;kLength will be 1 first time, to start
	kTempo 		divz	1, kLength, 1						;if kLength is 0, kTempo will divide by 1(argu 3) instead of 0				
	kTrig 		metro kTempo
	
	printk2 kTempo
	kFlag 		pycall1t	kTrig, "shuffleDikt.likListe", 0		;calling likListe-function in python and get back 1 or -1
	
	iSkip 		init 1								;skipping the first value, cause it gives two numbers the first time?
	if iSkip == 1 	igoto skip
	kLoop			init -1
	kLoop = (kLoop + kTrig) %2								;Takes a value that jumps between the soundfiles by 0 and 1
	printk2 kLoop
	

	if kFlag < 1 	then									;if kFlag gets 1 back from python it will go directly to else,turnoff 														because then the list would be sorted
	  if kTrig == 1 	then									;sends the trigger to instrument 2
	
	  
reinit navn
	
	  navn: 
	 
	  iNote 	pycall1i "shuffleDikt.getNote", 0					;gets a number from the list in getNote in python that tells what 															soundfile is gonna be played

	  iOffset 	= (i(kLoop) == 0 ? -1 : 40)						;gets the value -1 or 40
	  iWav	table	(int(iNote+iOffset)), giSounds				;iWav gets value iNote -1 or iNote +40 (this value would be the 															indexnumber for the soundfile to play
	  print iNote, iWav
	    iTrigTempo	ctrl7 1, 22, 0.1, 3
	    iLength		= ftlen(iWav)/sr	* iTrigTempo				;calculate the length of the soundfile in seconds! (ftlen gives you how 													many samples,divided by sr you get seconds)
	     if iLength == 0.1 then 								;ups...instead of doing this i could have set the minimum to be .5 															instead of 	.1
	     iLength 	= ftlen(iWav)/sr * .5
	     print iLength
	     
	    endif 
	  
	    event_i "i", 3, 0, 2, -9, iNote, i(kLoop), i(kFlag)			;makes a score-line in orchestra-part of csound (the arguments is same 														as in score.

rireturn
	    kLength = iLength

	    endif


	
	else
	event "i", 4, 0, 1									;if kFlag is 1, it goes to else and event makes instr 4 play, which is 														a default instr that stops the code running
	turnoff											;which is a bit weird, because turnoff should stop the instr itself?!
		
	endif
	skip:
    	iSkip = 0
	
	endin


	
;***********************************************************************************************************************************************
; 	AUDIO INSTRUMENT
;***********************************************************************************************************************************************
	instr 3
	
	iDur 		= p3
	iAmp 		= ampdbfs(p4)
	iAtk 		= p3 * 0.4
	iRel 		= p3 * 0.4
	iNote		= p5
	iOffset 	= (p6 == 0 ? -1 : 40)
	iFinal	= p7
	
	k1 		linen iAmp, iAtk, iDur, iRel			;envelope that softens the attack and release to avoid clicking

	
	if iFinal < 0 then						;if the lists still are not the same
	iWav	table	(int(iNote+iOffset)), giSounds
	a1	loscil k1, 1, iWav, 1					;loscil read sampled sound from table (stereo or mono. This is mono, if you want stereo, 										make one more argument in front of loscil(f.eks a1, a2 loscil ...)
	a1 	= 0.5 * a1							; lower the amplitude (that can be higher with use of foscil instead of oscil)
		outs a1, a1

	else									;if the lists are the same for the first time
	iWav1	table	(int(iNote-1)), giSounds
	iWav2	table	(int(iNote+40)), giSounds
	a1	loscil k1, 1, iWav1, 1					;the first argu after iWav (1) tells that I will use the same frequency that is already 											given in the soundfile
	a2	loscil k1, 1, iWav2, 1
	a1	= a1 * 0.5
	a2   	= a2 * 0.5
	
		outch 1, a1, 2, a2

	endif

	endin

	

;***********************************************************************************************************************************************
; 	DEFAULT INSTRUMENT
;***********************************************************************************************************************************************
	instr 4	
	
	print p1, p2, p3
	exitnow
	endin



</CsInstruments>
<CsScore>

; instr	start		length
i 2		0		10000		

</CsScore>
</CsoundSynthesizer>

<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>72</x>
 <y>179</y>
 <width>400</width>
 <height>200</height>
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
  <uuid>{9a09c3c5-533a-4a6f-93ed-e01af6aa1bd7}</uuid>
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
WindowBounds: 72 179 400 200
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioSlider {5, 5} {20, 100} 0.000000 1.000000 0.000000 slider1
</MacGUI>
<EventPanel name="" tempo="60.00000000" loop="8.00000000" x="360" y="248" width="596" height="322" visible="true" loopStart="0" loopEnd="0">    </EventPanel>
