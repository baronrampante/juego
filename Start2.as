package  {
	
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.text.*;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import fl.transitions.TweenEvent;
	
	
	
	public class Start2 extends MovieClip {

		public function Start2() {
			// constructor code
			
			//stage.addEventListener(Event.ENTER_FRAME, Personajes);
		}
		

	}
	
		public function Personajes() {
			
			Fondo_Ivan.visible = false;
			Fondo_Nacho.visible = false;
			Fondo_Llily.visible = false;
			Fondo_Avril.visible = false;
		}
}
