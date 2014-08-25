package 
{

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.Timer;

	public class Clientes_personas extends MovieClip
	{
		public var Velocidad_var = 0;
		public var _timer:Timer = new Timer(1000);// se ejecuta cada un segundo
		public var cliente_stage = true;
		public var Irse = false;
		


		public function Clientes_personas()
		{
			// constructor code
			
			addEventListener(Event.ENTER_FRAME, mover);
		}


		function mover(e:Event):void
		{
			if (_timer.currentCount == 15)
			{
				Irse = true;
				this.globito.gotoAndPlay("mal");
				this.gotoAndPlay("espalda");
				_timer.stop();
				_timer.reset();
				
				irse();
			}
			this.x +=  Velocidad_var;
			this.y +=  Velocidad_var;

			if (this.x >= 500)
			{
				_timer.start();
				Velocidad_var = 0;
				this.gotoAndPlay("parado");
				Irse = false;
			}
			if (this.x < 180)
			{
				cliente_stage = false;
				this.globito.gotoAndPlay("normal");
				this.parent.removeChild(this);
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