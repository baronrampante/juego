package 
{
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	//import Lista_Trabaj;

	public class Temporizador extends MovieClip
	{
		public var _timer:Timer = new Timer(1000);

		public var Dia_var = 1;
		public var Semana_var = 1;
		public var Hora_var = 0;
		public var Hora_Dia_var = 0;// se incrementa cada hora
		public var Horas_para_Dia = 10;// variable que determina el día
		public var Dias_para_Semana = 5;// variable que determina duracion semana
		public var Dia_Semana = 0;// variable que cuenta los dias para llegar a a la semana
		var Lista_Trab:Lista_Trabaj = new Lista_Trabaj();
		public var Dale = true;
		public var Temp = 0;
		public var Pausado = false;

		public function Temporizador()
		{
			_timer.addEventListener(TimerEvent.TIMER, timerListener);
		}

		public function Empezar(Dale)
		{
			if (Dale == true)
			{
				_timer.start();
			}
		}
		
		public function Start()
		{
			
				_timer.start();
			
		}
		
		public function Pausar()
		{
				if(Pausado == false){
				_timer.stop();
				Pausado = true;
				}
		}


		public function timerListener(e:TimerEvent):void
		{
			Hora_var = _timer.currentCount;
			Temp = 0;

			// dia;
			Hora_Dia_var = Hora_Dia_var + 1;
			if (Hora_Dia_var == Horas_para_Dia)
			{
				Dia_var = Dia_var + 1;
				Hora_Dia_var = 0;
				Dale = true;
				Temp = 1;
				
				

				// semana
				Dia_Semana = Dia_Semana + 1;
				if (Dia_Semana == Dias_para_Semana)
				{
					Semana_var = Semana_var + 1;
					Dia_Semana = 0;
					trace("Semana  " + Semana_var);
				}
			}
		}
	}
}