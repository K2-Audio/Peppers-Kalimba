Processor 
Type SynthChain ID Preset Bypassed Gain 	      �?Balance 	        VoiceLimit 	      P@KillFadeTime 	      4@IconColour 0 packageName  BuildVersion �  EditorStates BodyShown 0 Visible 1 Solo 0 Folded 1  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors  Processor Type ScriptProcessor ID Interface Bypassed Script HContent.makeFrontInterface(700, 600);




const var credits = Content.getComponent("credits");
const var close = Content.getComponent("close");
const var info = Content.getComponent("info");


inline function oninfoControl(component, value)
{
	credits.showControl(true);
	close.showControl(true);
};

Content.getComponent("info").setControlCallback(oninfoControl);


inline function oncloseControl(component, value)
{
	credits.showControl(false);
	close.showControl(false);
};

Content.getComponent("close").setControlCallback(oncloseControl);

const var closesetting = Content.getComponent("closesetting");
const var settings = Content.getComponent("settings");
const var settingsopen = Content.getComponent("settingsopen");



inline function onsettingsopenControl(component, value)
{
	settings.showControl(true);
};

Content.getComponent("settingsopen").setControlCallback(onsettingsopenControl);


inline function onclosesettingControl(component, value)
{
	settings.showControl(false);
};

Content.getComponent("closesetting").setControlCallback(onclosesettingControl);



const var Delay1 = Synth.getEffect("Delay1");
	Delay1.setAttribute(0, 5);
	Delay1.setAttribute(1, 5);
inline function onfeedbackControl(component, value)
{
	Delay1.setAttribute(Delay1.DelayTimeLeft, value);
	Delay1.setAttribute(Delay1.DelayTimeRight, value);
};

Content.getComponent("feedback").setControlCallback(onfeedbackControl);


//delay connection

const var delaydelayms = Content.getComponent("delaydelayms");

Content.getComponent("delaysync").setControlCallback(ondelaysyncControl);
const var delay = Content.getComponent("delay");



inline function ondelaysyncControl(component, value)
{
	Delay1.setAttribute(7, value);
	if(value == 0){
	    Content.setPropertiesFromJSON("delay", {"mode": "Time",});
	}
	else{
	    Content.setPropertiesFromJSON("delay", {"mode": "TempoSync",});
	}

};


inline function ondelayControl(component, value)
{
	Delay1.setAttribute(0, value);
	Delay1.setAttribute(1, value);
};
Content.getComponent("delay").setControlCallback(ondelayControl);

	Delay1.setAttribute(0, 5);
	Delay1.setAttribute(1, 5);

inline function onfeedbackControl(component, value)
{
	Delay1.setAttribute(2, value);
	Delay1.setAttribute(3, value);
};

Content.getComponent("feedback").setControlCallback(onfeedbackControl);


//flavour
const var cleanvol = Synth.getModulator("cleanvol");
const var dripvol = Synth.getModulator("dripvol");
inline function onKnob1Control(component, value)
{
	cleanvol.setIntensity(value);
	dripvol.setIntensity(1 - value);
	
	animafx.set("alpha", value);
};

Content.getComponent("Knob1").setControlCallback(onKnob1Control);





//adsr link

const var cleanadsr = Synth.getModulator("cleanadsr");
const var dripadsr = Synth.getModulator("dripadsr");

inline function onattackControl(component, value)
{
    cleanadsr.setAttribute(2, value);
    dripadsr.setAttribute(2, value);
};

inline function ondecayControl(component, value)
{
    cleanadsr.setAttribute(5, value);
    dripadsr.setAttribute(5, value);
};

inline function onsustainControl(component, value)
{
    cleanadsr.setAttribute(6, value);
    dripadsr.setAttribute(6, value);
};

inline function onreleaseControl(component, value)
{
    cleanadsr.setAttribute(7, value);
    dripadsr.setAttribute(7, value);
};
Content.getComponent("release").setControlCallback(onreleaseControl);
Content.getComponent("sustain").setControlCallback(onsustainControl);
Content.getComponent("decay").setControlCallback(ondecayControl);
Content.getComponent("attack").setControlCallback(onattackControl);

//LFO link

const var dripLFO = Synth.getModulator("dripLFO");
const var cleanLFO = Synth.getModulator("cleanLFO");

const var LFOspeed = Content.getComponent("LFOspeed");
const var timesynLFO = Content.getComponent("timesynLFO");

inline function onButton5Control(component, value)
{
    dripLFO.setAttribute(4, !value);
    cleanLFO.setAttribute(4, !value);
        
    if(value == 0){
        LFOspeed.showControl(false);
        timesynLFO.showControl(true);
    }
    else{
        LFOspeed.showControl(true);
        timesynLFO.showControl(false);        
    }
};

Content.getComponent("Button5").setControlCallback(onButton5Control);

inline function onLFOspeedControl(component, value)
{
    dripLFO.setAttribute(0, value);
    cleanLFO.setAttribute(0, value);   
};

inline function ontimesynLFOControl(component, value)
{
    dripLFO.setAttribute(0, value);
    cleanLFO.setAttribute(0, value); 
};

Content.getComponent("timesynLFO").setControlCallback(ontimesynLFOControl);

Content.getComponent("LFOspeed").setControlCallback(onLFOspeedControl);
        
        
inline function onLFOintControl(component, value)
{
        dripLFO.setIntensity(value);
        cleanLFO.setIntensity(value);
};

Content.getComponent("LFOint").setControlCallback(onLFOintControl);


//animation


const var anima = Content.getComponent("anima");
const var animafx = Content.getComponent("animafx");

var v = 0;

const var t = Engine.createTimerObject();
t.setTimerCallback(function(){  
    
anima.set("offset", v);
animafx.set("offset", v);   
    v = v + 527;
    if(v >= 2108){
        v = 0;
    }

});
t.startTimer(500);


//pitchknob

const var pitchclean = Synth.getModulator("pitchclean");
const var pitchdrip = Synth.getModulator("pitchdrip");

inline function onpitchControl(component, value)
{
	pitchclean.setIntensity(value);
	pitchdrip.setIntensity(value);
};

Content.getComponent("pitch").setControlCallback(onpitchControl);


//Credit Link


inline function onpepperlinkControl(component, value)
{
	Engine.openWebsite("https://www.twitch.tv/pepper_music");
};

Content.getComponent("pepperlink").setControlCallback(onpepperlinkControl);


inline function onk2audiolinkControl(component, value)
{
	Engine.openWebsite("https://k2-audio.net");
};

Content.getComponent("k2audiolink").setControlCallback(onk2audiolinkControl);


inline function onnebuhlinkControl(component, value)
{
	Engine.openWebsite("https://www.twitch.tv/nebuhbeatz");
};

Content.getComponent("nebuhlink").setControlCallback(onnebuhlinkControl);

function onNoteOn()
{
	
}
 function onNoteOff()
{
	
}
 //modwheel to flavour knob

const var Knob1 = Content.getComponent("Knob1");
const var cleanvol = Synth.getModulator("cleanvol");
const var dripvol = Synth.getModulator("dripvol");

function onController()
{
	if(Message.getControllerNumber() == 1) // Modwheel
	{
		Knob1.setValue(Message.getControllerValue() / 127.0);
		cleanvol.setIntensity(Knob1.getValue());
        dripvol.setIntensity(1 - Knob1.getValue());
        
        animafx.set("alpha", Knob1.getValue());
	}

}function onTimer()
{
	
}
 function onControl(number, value)
{
	
}
  EditorStates BodyShown 1 Visible 1 Solo 0 contentShown 1 onInitOpen 1  ChildProcessors   Content  Control type ScriptSlider id output value 	      �> Control type ScriptSlider id pitch value 	         Control type ScriptSlider id width value 	      Y@ Control type ScriptSlider id verbwidth value 	    )\�? Control type ScriptSlider id 
verbsize value 	      �? Control type ScriptSlider id 	verbmix value 	   ��Q�? Control type ScriptSlider id 
verbdamp value 	   ����? Control type ScriptSlider id 
feedback value 	   �G��? Control type ScriptSlider id 
delaymix value 	    ף�? Control type ScriptButton id 	Button1 value 	      �? Control type ScriptButton id 
delay on value 	         Control type ScriptSlider id LFOint value 	         Control type ScriptSlider id Knob1 value 	   @33�? Control type ScriptButton id 	Button5 value 	         Control type ScriptButton id delaysync value 	      �? Control type ScriptButton id info value 	      �? Control type ScriptSlider id 	hp freq value 	      4@ Control type ScriptSlider id 	lp freq value 	     ��@ Control type ScriptSlider id 	hp reso value 	         Control type ScriptSlider id 	lp reso value 	         Control type ScriptSlider id delay value 	      @ Control type ScriptSlider id timesynLFO value 	      1@ Control type ScriptSlider id attack value 	       @ Control type ScriptSlider id decay value 	     ��@ Control type ScriptSlider id 
LFOspeed value 	   ���(@ Control type ScriptSlider id 	sustain value 	   @ff'� Control type ScriptSlider id delaydelayms value 	     �k@ Control type ScriptSlider id 	release value 	     �R@ Control type ScriptButton id settingsopen value 	         Control type ScriptButton id closesetting value 	         Control type ScriptButton id close value 	      �? UIData  ContentProperties DeviceType 	Desktop $Component type ScriptImage id anima x 	      @y 	        width 	     ��@height 	     ��@fileName {PROJECT_FOLDER}animation.png scale 	   ��Q�? Component 	type ScriptImage id 	animafx x 	      @y 	        width 	     ��@height 	     ��@fileName "{PROJECT_FOLDER}animation_fx.png scale 	   ��Q�?alpha 	   @33�? Component type ScriptImage id background x 	       @y 	        fileName '{PROJECT_FOLDER}pepper_kalimba_ui.png width 	     ��@height 	     ��@ Component type ScriptSlider id output x 	     Ȃ@y 	      .@width 	      O@height 	     �P@filmstripImage ({PROJECT_FOLDER}pepperkalimba_knob.png numStrips 	      P@processorId Simple Gain1 parameterId Gain mode 	Decibel min 	      Y�max 	      $@stepSize 	   ����?suffix  dB middlePosition 	      2�scaleFactor 	   ���?showValuePopup Left isPluginParameter pluginParameterName output  Component type ScriptSlider id pitch x 	     ��@y 	     �\@width 	      O@height 	     �P@filmstripImage ({PROJECT_FOLDER}pepperkalimba_knob.png numStrips 	      P@scaleFactor 	   �G��?min 	      (�max 	      (@showValuePopup Above stepSize 	      �?suffix st middlePosition 	        isPluginParameter pluginParameterName pitch  Component type ScriptSlider id width x 	      \@y 	     @\@width 	      O@height 	     �P@filmstripImage ({PROJECT_FOLDER}pepperkalimba_knob.png numStrips 	      P@processorId Simple Gain1 parameterId Width max 	      i@middlePosition 	      Y@defaultValue 	      Y@scaleFactor 	   �G��?suffix % showValuePopup Above isPluginParameter pluginParameterName width  Component type ScriptSlider id verbwidth x 	      ?@y 	     0p@width 	     �J@height 	     �I@filmstripImage ({PROJECT_FOLDER}pepperkalimba_knob.png numStrips 	      P@scaleFactor 	   `��?processorId Simple Reverb1 parameterId Width isPluginParameter pluginParameterName reverb width  Component type ScriptSlider id 
verbsize x 	     `a@y 	     @p@width 	     �J@height 	     �I@filmstripImage ({PROJECT_FOLDER}pepperkalimba_knob.png numStrips 	      P@scaleFactor 	   `��?processorId Simple Reverb1 parameterId 
RoomSize isPluginParameter pluginParameterName reverb size  Component type ScriptSlider id 	verbmix x 	      a@y 	     �t@width 	     �J@height 	     �I@filmstripImage ({PROJECT_FOLDER}pepperkalimba_knob.png numStrips 	      P@scaleFactor 	   `��?processorId Simple Reverb1 parameterId 
WetLevel mode NormalizedPercentage suffix % middlePosition 	      �?showValuePopup Right isPluginParameter pluginParameterName reverb mix  Component type ScriptSlider id 
verbdamp x 	     �@@y 	      u@width 	     �J@height 	     �I@filmstripImage ({PROJECT_FOLDER}pepperkalimba_knob.png numStrips 	      P@scaleFactor 	   `��?processorId Simple Reverb1 parameterId 	Damping isPluginParameter pluginParameterName reverb damping  Component type ScriptSlider id 
feedback x 	     @�@y 	      u@width 	     �J@height 	     �I@filmstripImage ({PROJECT_FOLDER}pepperkalimba_knob.png numStrips 	      P@scaleFactor 	   `��?mode NormalizedPercentage middlePosition 	      �?showValuePopup Above suffix % isPluginParameter  Component type ScriptSlider id 
delaymix x 	     ��@y 	     u@width 	     �J@height 	     �I@filmstripImage ({PROJECT_FOLDER}pepperkalimba_knob.png numStrips 	      P@scaleFactor 	   `��?processorId Delay1 parameterId Mix mode NormalizedPercentage suffix % middlePosition 	      �?showValuePopup Left isPluginParameter  Component type ScriptFloatingTile id 
keyboard x 	      &@y 	     ��@ContentType 
Keyboard bgColour 	ddd�    itemColour 	���    itemColour2 	����    textColour 	����    Data m{
  "KeyWidth": 27.3,
  "DisplayOctaveNumber": false,
  "LowKey": 43,
  "HiKey": 127,
  "CustomGraphics": false,
  "DefaultAppearance": true,
  "BlackKeyRatio": 0.699999988079071,
  "ToggleMode": false,
  "MidiChannel": 1,
  "UseVectorGraphics": true,
  "UseFlatStyle": false,
  "MPEKeyboard": false,
  "MPEStartChannel": 2,
  "MPEEndChannel": 16
} width 	     @�@height 	      R@ Component 
type ScriptButton id 	Button1 x 	      C@y 	     �l@width 	      B@height 	      7@filmstripImage *{PROJECT_FOLDER}eq gui on off.blend1.png processorId Simple Reverb1 parameterId 	Enabled scaleFactor 	   `ff�? Component type ScriptButton id 
delay on x 	     Ѓ@y 	     �l@width 	      B@height 	      7@filmstripImage *{PROJECT_FOLDER}eq gui on off.blend1.png processorId Delay1 parameterId 	Enabled scaleFactor 	   `ff�?isPluginParameter  Component type ScriptSlider id LFOint x 	      {@y 	     �i@width 	     �D@height 	      C@filmstripImage ({PROJECT_FOLDER}pepperkalimba_knob.png numStrips 	      P@scaleFactor 	      �?mode NormalizedPercentage suffix % middlePosition 	      �?showValuePopup Above isPluginParameter pluginParameterName 	LFO int  Component type ScriptSlider id Knob1 x 	     �q@y 	      t@filmstripImage {PROJECT_FOLDER}peffer.png numStrips 	      P@width 	     �a@height 	      b@scaleFactor 	   ����?isPluginParameter middlePosition 	      �?defaultValue 	      �? Component type ScriptButton id 	Button5 x 	     �t@y 	     �o@filmstripImage {PROJECT_FOLDER}switch.png width 	     �F@height 	     �A@scaleFactor 	   @33�? Component type ScriptButton id delaysync x 	     ��@y 	     �q@filmstripImage {PROJECT_FOLDER}SWITCHinv.png scaleFactor 	   @33�?width 	      D@height 	     �C@ Component type ScriptButton id info x 	      ,@y 	      @width 	      ;@height 	      >@filmstripImage ({PROJECT_FOLDER}eq gui info.blend1.png scaleFactor 	   ����? Component type ScriptSlider id 	hp freq x 	     �S@y 	     p{@middlePosition 	     p�@stepSize 	      �?min 	      4@max 	     ��@suffix  Hz filmstripImage ({PROJECT_FOLDER}pepperkalimba_knob.png numStrips 	      P@width 	     �M@height 	     �N@mode Frequency processorId hipass parameterId Frequency scaleFactor 	   ����?showValuePopup Above isPluginParameter pluginParameterName 	hp freq  Component type ScriptSlider id 	lp freq x 	     }@y 	     `{@middlePosition 	     p�@stepSize 	      �?min 	      4@max 	     ��@suffix  Hz filmstripImage ({PROJECT_FOLDER}pepperkalimba_knob.png numStrips 	      P@width 	     �M@height 	     �N@mode Frequency processorId lopass parameterId Frequency scaleFactor 	   ����?showValuePopup Above isPluginParameter pluginParameterName 	lp freq  Component type ScriptSlider id 	hp reso x 	     `g@y 	     p{@max 	       @filmstripImage ({PROJECT_FOLDER}pepperkalimba_knob.png numStrips 	      P@width 	     �N@height 	      N@processorId hipass parameterId Q scaleFactor 	   ����?isPluginParameter pluginParameterName 	hp reso  Component type ScriptSlider id 	lp reso x 	     ��@y 	     �{@max 	       @filmstripImage ({PROJECT_FOLDER}pepperkalimba_knob.png numStrips 	      P@width 	     �N@height 	      N@processorId lopass parameterId Q scaleFactor 	   ����?isPluginParameter pluginParameterName 	lp reso  Component type ScriptSlider id delay x 	     P�@y 	     �p@filmstripImage ({PROJECT_FOLDER}pepperkalimba_knob.png numStrips 	      P@scaleFactor 	   `��?width 	     �G@height 	      H@mode TempoSync max 	      2@stepSize 	      �?middlePosition 	      "@showValuePopup Above defaultValue 	      @ Component type ScriptSlider id timesynLFO x 	     �m@y 	     �i@filmstripImage ({PROJECT_FOLDER}pepperkalimba_knob.png numStrips 	      P@scaleFactor 	      �?width 	      D@height 	      D@mode TempoSync max 	      2@stepSize 	      �?middlePosition 	      "@showValuePopup Above isPluginParameter pluginParameterName LFO speed  Component type ScriptSlider id attack x 	     @k@y 	     @\@filmstripImage ({PROJECT_FOLDER}pepperkalimba_knob.png numStrips 	      P@scaleFactor 	   ����?width 	     �O@height 	     �O@mode Time max 	     ��@stepSize 	      �?suffix  ms middlePosition 	     @�@showValuePopup Above isPluginParameter pluginParameterName attack  Component type ScriptSlider id decay x 	     Pr@y 	      \@filmstripImage ({PROJECT_FOLDER}pepperkalimba_knob.png numStrips 	      P@scaleFactor 	   ����?width 	     �O@height 	     �O@mode Time max 	     ��@stepSize 	      �?suffix  ms middlePosition 	     @�@showValuePopup Above isPluginParameter pluginParameterName decay  Component type ScriptSlider id 
LFOspeed x 	      m@y 	     �i@filmstripImage ({PROJECT_FOLDER}pepperkalimba_knob.png numStrips 	      P@scaleFactor 	      �?width 	      D@height 	      D@mode Time max 	      D@stepSize 	   ����?middlePosition 	      4@suffix  ms min 	      �?showValuePopup Below visible  Component type ScriptSlider id 	sustain x 	     `v@y 	     �[@filmstripImage ({PROJECT_FOLDER}pepperkalimba_knob.png numStrips 	      P@scaleFactor 	   ����?width 	     �O@height 	     �O@mode 	Decibel min 	      Y�max 	        stepSize 	   ����?suffix  dB middlePosition 	      2�showValuePopup Above isPluginParameter pluginParameterName 	sustain  Component type ScriptSlider id delaydelayms x 	     P�@y 	     �p@width 	     �J@height 	     �I@filmstripImage ({PROJECT_FOLDER}pepperkalimba_knob.png numStrips 	      P@scaleFactor 	   `��?mode Time min 	      �?max 	     ��@stepSize 	      �?suffix   middlePosition 	     @�@showValuePopup Left defaultValue 	      @visible  Component type ScriptSlider id 	release x 	     �z@y 	     �[@filmstripImage ({PROJECT_FOLDER}pepperkalimba_knob.png numStrips 	      P@scaleFactor 	   ����?width 	     �O@height 	     �O@mode Time max 	     ��@stepSize 	      �?suffix  ms middlePosition 	     @�@showValuePopup Above isPluginParameter pluginParameterName 	release  Component type ScriptButton id settingsopen x 	     ��@y 	      @filmstripImage {PROJECT_FOLDER}settings.png width 	      >@height 	     �@@scaleFactor 	   ����? Component 	type ScriptImage id 	credits x 	        y 	        width 	     ��@height 	     ��@fileName {PROJECT_FOLDER}credits.png alpha 	   `ff�?visible Component type ScriptImage id 	titleee x 	       @y 	        width 	     ��@height 	     ��@fileName -{PROJECT_FOLDER}pepper_kalimba_ui_title.png parentComponent 	credits  Component 	type ScriptButton id pepperlink x 	     @k@y 	     pp@width 	      p@height 	     �N@parentComponent 	credits saveInPreset filmstripImage !{PROJECT_FOLDER}transparent.png  Component 	type ScriptButton id k2audiolink x 	     �R@y 	     �{@width 	     `h@height 	     �N@parentComponent 	credits saveInPreset filmstripImage !{PROJECT_FOLDER}transparent.png  Component 	type ScriptButton id nebuhlink x 	     �x@y 	     �{@width 	      p@height 	     �N@parentComponent 	credits saveInPreset filmstripImage !{PROJECT_FOLDER}transparent.png  Component 
type ScriptLabel id 
settings x 	       @y 	        width 	     x�@height 	     ��@text  bgColour 	�    editable visible Component 	type ScriptButton id closesetting x 	     @�@y 	      �?width 	     �A@height 	     �@@parentComponent 
settings filmstripImage {PROJECT_FOLDER}closer.png scaleFactor 	      �? Component type ScriptFloatingTile id FloatingTile1 x 	      d@y 	      ?@bgColour 	   �    ContentType CustomSettings itemColour 	   �    itemColour2 	   �    Data �{
  "Driver": false,
  "Device": false,
  "Output": true,
  "BufferSize": false,
  "SampleRate": false,
  "GlobalBPM": false,
  "StreamingMode": false,
  "ScaleFactor": true,
  "VoiceAmountMultiplier": false,
  "ClearMidiCC": true,
  "SampleLocation": true,
  "DebugMode": true,
  "ScaleFactorList": [
    0.5,
    0.75,
    1.0,
    1.25,
    1.5,
    2.0
  ]
} width 	     `w@height 	     �t@itemColour3 	   �    parentComponent 
settings  Component 	type ScriptButton id close x 	     ��@y 	        width 	      A@height 	      @@filmstripImage {PROJECT_FOLDER}closer.png scaleFactor 	      �?visible  Processor Type ModulatorChain ID GainModulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type SynthChain ID main Bypassed Gain 	      �?Balance 	        VoiceLimit 	      p@KillFadeTime 	      4@IconColour 0 EditorStates BodyShown 0 Visible 1 Solo 0 Folded 0  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID GainModulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors  Processor 	Type PolyphonicFilter ID lopass Bypassed Gain 	        Frequency 	     ��@Q 	        Mode 	      @Quality 	      `@BipolarIntensity 	        EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Frequency Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Gain Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Bipolar Freq Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Q Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor 	Type PolyphonicFilter ID hipass Bypassed Gain 	        Frequency 	      4@Q 	        Mode 	      @Quality 	       @BipolarIntensity 	        EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Frequency Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Gain Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Bipolar Freq Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Q Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type Delay ID Delay1 Bypassed DelayTimeLeft 	      @DelayTimeRight 	      @FeedbackLeft 	   �G��?FeedbackRight 	   �G��?LowPassFreq 	     ��@HiPassFreq 	      D@Mix 	    ף�?TempoSync 	      �?EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� Processor 	Type SimpleReverb ID Simple Reverb1 Bypassed RoomSize 	      �?Damping 	   ����?WetLevel 	   ��Q�?DryLevel 	   @
��?Width 	    )\�?FreezeMode 	   ����?EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� Processor Type SimpleGain ID Simple Gain1 Bypassed Gain 	   �,_�>Delay 	        Width 	      Y@Balance 	        InvertPolarity 	        EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Gain Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Delay Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Width Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Pan Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� Processor Type StreamingSampler ID clean Bypassed Gain 	      �?Balance 	        VoiceLimit 	      p@KillFadeTime 	      4@IconColour 0 PreloadSize 	      �@BufferSize 	      �@VoiceAmount 	      p@SamplerRepeatMode 	      @RRGroupAmount 	      �?PitchTracking 	      �?OneShot 	        CrossfadeGroups 	        Purged 	        Reversed 	        NumChannels    UseStaticMatrix 	        Group0Table  Group1Table  Group2Table  Group3Table  Group4Table  Group5Table  Group6Table  Group7Table  SampleMapID kalimba_clean EditorStates BodyShown 1 Visible 1 Solo 0 MapPanelShown 1 BigSampleMap 1 Folded 0 CrossfadeTableShown 0  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID GainModulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors  Processor Type 
Constant ID 
cleanvol Bypassed Intensity 	   @33�?EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   Processor Type AHDSR ID cleanadsr Bypassed Monophonic 	        Retrigger 	      �?Intensity 	      �?AttackCurve 	        DecayCurve 	   @�z�?Attack 	       @AttackLevel 	        Hold 	        Decay 	     ��@Sustain 	   `ff'�Release 	     �R@EcoMode 	      �?EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Attack Time Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Attack Level Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Decay Time Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Sustain Level Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Release Time Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type LFO ID 
cleanLFO Bypassed Intensity 	        Frequency 	      (@FadeIn 	        WaveformType 	       @Legato 	      �?TempoSync 	      �?SmoothingTime 	      @LoopEnabled 	      �?PhaseOffset 	        CustomWaveform  StepData [64....f+....9C...3O...f+....9C...3O...f+....9C...3O...f+....9C...3O...f+....9C...3O...f+. EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID LFO Intensity Mod Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID LFO Frequency Mod Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type 
Velocity ID Velocity Modulator1 Bypassed Intensity 	      �?UseTable 	      �?Inverted 	        DecibelMode 	        VelocityTableData %24...............vO...f+....9C...1O EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors  Processor Type 
Constant ID pitchclean Bypassed Intensity 	        Bipolar EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Sample Start Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Group Fade Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� channels  channelData enabled level 	        suffix   Processor Type StreamingSampler ID drippy Bypassed Gain 	   �}��?Balance 	        VoiceLimit 	      p@KillFadeTime 	      4@IconColour 0 PreloadSize 	      �@BufferSize 	      �@VoiceAmount 	      p@SamplerRepeatMode 	      @RRGroupAmount 	      �?PitchTracking 	      �?OneShot 	        CrossfadeGroups 	        Purged 	        Reversed 	        NumChannels    UseStaticMatrix 	        Group0Table  Group1Table  Group2Table  Group3Table  Group4Table  Group5Table  Group6Table  Group7Table  SampleMapID kalimba_flavour EditorStates BodyShown 1 Visible 1 Solo 0 MapPanelShown 1 BigSampleMap 1 Folded 0 CrossfadeTableShown 0  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID GainModulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors  Processor Type 
Constant ID 	dripvol Bypassed Intensity 	    33�?EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   Processor Type AHDSR ID 
dripadsr Bypassed Monophonic 	        Retrigger 	      �?Intensity 	      �?AttackCurve 	        DecayCurve 	        Attack 	       @AttackLevel 	        Hold 	        Decay 	     ��@Sustain 	   `ff'�Release 	     �R@EcoMode 	      �?EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Attack Time Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Attack Level Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Decay Time Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Sustain Level Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Release Time Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type LFO ID 	dripLFO Bypassed Intensity 	        Frequency 	      (@FadeIn 	        WaveformType 	       @Legato 	      �?TempoSync 	      �?SmoothingTime 	      @LoopEnabled 	      �?PhaseOffset 	        CustomWaveform  StepData [64....f+....9C...3O...f+....9C...3O...f+....9C...3O...f+....9C...3O...f+....9C...3O...f+. EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID LFO Intensity Mod Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID LFO Frequency Mod Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type 
Velocity ID Velocity Modulator2 Bypassed Intensity 	      �?UseTable 	      �?Inverted 	        DecibelMode 	        VelocityTableData %24...............vO...f+....9C..P0O EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors  Processor Type 
Constant ID pitchdrip Bypassed Intensity 	        Bipolar EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Sample Start Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Group Fade Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� channels  channelData enabled level 	        suffix   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� macro_controls  macro name 	Macro 1 value 0.0 midi_cc -1  macro name 	Macro 2 value 0.0 midi_cc -1  macro name 	Macro 3 value 0.0 midi_cc -1  macro name 	Macro 4 value 0.0 midi_cc -1  macro name 	Macro 5 value 0.0 midi_cc -1  macro name 	Macro 6 value 0.0 midi_cc -1  macro name 	Macro 7 value 0.0 midi_cc -1  macro name 	Macro 8 value 0.0 midi_cc -1  MidiAutomation   MPEData Enabled  