package 
{

	import flash.display.MovieClip;
	import flash.events.Event;
	import Temporizador;


	public class Character_Textil extends MovieClip
	{
		public var Velocidad_var = 2;
		public var Tiempo = 0;

		public function Character_Textil()
		{
			// constructor code
			this.x = 350;
			this.y = 275;
			this.scaleX *= -1;
			addEventListener(Event.ENTER_FRAME, Mover);



		}

		function Mover(e:Event):void
		{
			Tiempo +=  1;
			if ( Tiempo < 100)
			{
				gotoAndStop("Adelante");
				this.x +=  Velocidad_var;
				this.y +=  Velocidad_var;
			}
			if (Tiempo > 100 && Tiempo <400 )
			{
				gotoAndStop("Quieto");
			}
			if (Tiempo > 400 )
			{
				gotoAndStop("Atras");
				Velocidad_var = 2;
				this.x -=  Velocidad_var;
				this.y -=  Velocidad_var;
			}
			
			if (this.y < 275){
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

