﻿package 
{

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.Timer;

	public class Clientes_personas_Textil extends MovieClip
	{
		public var Velocidad_var = 0;
		public var _timer:Timer = new Timer(1000);// se ejecuta cada un segundo
		public var cliente_stage = true;
		public var Irse = false;





		public function Clientes_personas_Textil()
		{
			// constructor code

			addEventListener(Event.ENTER_FRAME, mover);
			this.scaleX *= -1;


		}


		function mover(e:Event):void
		{

			if (_timer.currentCount == 15)
			{
				Irse = true;
				MovieClip(this.parent).BajarComunidad();
				this.globito.gotoAndPlay("mal");
				this.gotoAndPlay("espalda");
				_timer.stop();
				_timer.reset();


				irse();
			}
			this.x -=  Velocidad_var;
			this.y +=  Velocidad_var;

			if (this.x <= 700)
			{
				_timer.start();
				Velocidad_var = 0;
				this.gotoAndPlay("parado");
				Irse = false;
			}

			if (this.y < 450)
			{
				cliente_stage = false;
				this.globito.gotoAndPlay("normal");
				if (stage != null)
				{
					this.parent.removeChild(this);
				}
			}
		}
		public function irse():void
		{

			Irse = true;
			_timer.stop();
			_timer.reset();
			this.gotoAndPlay("espalda");
			Velocidad_var = -10;
			this.addEventListener(Event.ENTER_FRAME, mover);
		}


	}
}