package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class Character extends MovieClip {
		public var Velocidad_var = 2;
		
		public function Character() {
			// constructor code
			this.x =  900;
		this.y = 150;
			addEventListener(Event.ENTER_FRAME, Mover);
			
		
		}
		
		function Mover(e:Event):void
		{
			// constructor code
			this.x -=  Velocidad_var;
			this.y +=  Velocidad_var;
			if (this.y == 250){
				gotoAndStop("Quieto");
				Velocidad_var = 0;
			}
		}
	}
	
}
