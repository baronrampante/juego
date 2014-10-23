package 
{

	import flash.display.MovieClip;
	import flash.events.Event;
	import Temporizador;


	public class Character extends MovieClip
	{
		public var Velocidad_var = 2;
		public var Tiempo = 0;

		public function Character()
		{
			// constructor code
			this.x = 917;
			this.y = 275;
			addEventListener(Event.ENTER_FRAME, Mover);



		}

		function Mover(e:Event):void
		{
			Tiempo +=  1;
			if ( Tiempo < 100)
			{
				this.x -=  Velocidad_var;
				this.y +=  Velocidad_var;
			}
			if (Tiempo > 200 )
			{
				gotoAndStop("Quieto");
			}
			if (Tiempo > 300 )
			{
				gotoAndPlay("Atras");
				Velocidad_var = 2;
				this.x +=  Velocidad_var;
				this.y -=  Velocidad_var;
			}
			
			if (this.y < 100){
				Tiempo = 0;
			}
			
		}



		/*function Mover2():void
		{
		// constructor code
		//gotoAndPlay("Adelante");
		Velocidad_var = 2;
		gotoAndPlay("Atras");
		this.x +=  Velocidad_var;
		this.y -=  Velocidad_var;
		if (this.y  < 300){
		Mover();
		
		}*/
	}
}

