package 
{
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
	import prueba;
	import Clientes;
	import Lista_Trabajos;


	public class array2 extends MovieClip
	{


		public var Trabajos_Terminados:Array = [];
		var Trabajos:Array = [];
		var Trabajo_Proceso = 0;
		var Trabajo_Que_se_Procesa = [];
		var Trabajos_Terminados_Entrega:Array = [];// lista de trabajos terminados
		var tiempo = 0;
		var avance = 0;
		public var _timer:Timer = new Timer(1000);// se ejecuta cada un segundo
		var myprueba:prueba = new prueba();
		var en_proceso = false;
		var Cliente = 0;
		var Valor = 0;
		var Entrega = 0;// tiempo que el cliente viene a buscar el trabajo
		var contador = 0;
		var Client:Clientes = new Clientes();
		var Lista_Trab:Lista_Trabajos = new Lista_Trabajos();


		//init();


		public function array2()
		{
			init();
		}

		public function init():void
		{
			Trabajo1.visible = false;
			Trabajo2.visible = false;
			Trabajo3.visible = false;
			_timer.start();
			this.addEventListener(MouseEvent.MOUSE_DOWN, fnBotonesStage);
			_timer.addEventListener(TimerEvent.TIMER, timerListener);
		}

		function timerListener(e:TimerEvent):void
		{
			//trace(_timer.currentCount);
			Lista_Trab.Tiempo(_timer.currentCount);
			//Trabajos[Trabajos.length] = (Lista_Trab.Texto);//Recibe el listado d elos clientes
			Trabajos = Lista_Trab.Trabajo;//Recibe el listado d elos clientes
			trace (Trabajos);
			Trabajo1.text = String(Trabajos [0]);
			Trabajo2.text = String(Trabajos [4]);
			Trabajo3.text = String(Trabajos [8]);
			Visible();
			



			// ver si se termino laburo;
			if (avance == _timer.currentCount)
			{

				trace("contador  " + contador);
				Trabajos_Terminados_Entrega[contador] = [(Entrega + _timer.currentCount)];
				contador = contador + 1;
				trace(Trabajos_Terminados);
				trace("termino");
				en_proceso = false;
			}
			fnBuscar_Trabajo();
		}
		
		
		function Visible():void {
			if (Trabajos [0] > 0){
				Trabajo1.visible = true;
			}
			else
			{
				Trabajo1.visible = false;
			}
			
			if (Trabajos [4] > 0){
				Trabajo2.visible = true;
			}
			else
			{
				Trabajo2.visible = false;
			}
			
			if (Trabajos [8] > 0){
				Trabajo3.visible = true;
			}
			else
			{
				Trabajo3.visible = false;
			}
		}

		// ver si esta la fecha de entrega laburo
		public function fnBuscar_Trabajo()
		{
			var length:uint = Trabajos_Terminados_Entrega.length;
			for (var i:uint=0; i<length; i++)
			{
				//trace(i);
				if (Trabajos_Terminados_Entrega[i] == _timer.currentCount)
				{
					trace(String(Trabajos_Terminados_Entrega[i]) + " venite a buscar el laburo");
					Trabajos_Terminados_Entrega.splice([i], 1);
					var mmm = i * 4;
					Trabajos.splice([mmm], 4);
					//trace (Trabajos_Terminados);
					trace("Esto es " + i);

				}
			}
		}



		public function fnBotonesStage(event:MouseEvent):void
		{
			switch (event.target.name)
			{
				case "Trabajo1" :
					
					trace(Trabajos[0]);
					tiempo = (Trabajos[1]);
					Trabajo_Proceso = Trabajos[0];
					Entrega = Trabajos[3];
					Iniciar_Trabajo();
					break;
				case "Trabajo2" :

					
					tiempo = (Trabajos[5]);
					Trabajo_Proceso = Trabajos[4];
					Entrega = Trabajos[7];
					Iniciar_Trabajo();
					break;
				case "Trabajo3" :
					
					tiempo = (Trabajos[9]);
					Trabajo_Proceso = Trabajos[8];
					Entrega = Trabajos[11];
					Iniciar_Trabajo();
					break;
			}
		}

		public function Iniciar_Trabajo():void
		{
			if (en_proceso == false)
			{
				avance = tiempo + _timer.currentCount;
				Trabajo_Que_se_Procesa[0] = Trabajo_Proceso;
				//Cliente = Trabajo_Proceso[2];
				//Valor = Trabajo_Proceso[0];
				
				trace(Entrega);
				trace(Cliente);
				en_proceso = true;

			}
			else
			{
				trace("esperá");
				//Trabajo_Proceso.splice(0,0);
				tiempo = 0;
			}

		}

	}

}