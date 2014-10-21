package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import Temporizador;
	
	
	public class Character extends MovieClip {
		public var Velocidad_var = 2;
		
		public function Character() {
			// constructor code
			this.x =  917;
			this.y = 275;
			addEventListener(Event.ENTER_FRAME, Mover);
			
		
		}
		
		function Mover(e:Event):void
		{
			// constructor code
			//gotoAndPlay("Adelante");
			this.x -=  Velocidad_var;
			this.y +=  Velocidad_var;
			if (this.y == 515){
				gotoAndStop("Quieto");
				Velocidad_var = 0;
			}
		}
	}
	
}
