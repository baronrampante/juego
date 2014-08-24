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


	public class array extends MovieClip
	{


		public var Trabajos_Terminados:Array = new Array();
		var Trabajos:Array = [];
		var Trabajo_Proceso:Array = [];
		var Trabajo_Que_se_Procesa = [];
		//var Trabajos_Terminados:Array = [];
		var tiempo = 0;
		var avance = 0;
		public var _timer:Timer = new Timer(1000);// se ejecuta cada un segundo
		var myprueba:prueba = new prueba();
		var en_proceso = false;
		var Cliente = 0;
		var Valor = 0;
		var Entrega = 0;
		var contador = 0;


		init();


		public function array()
		{
			Trabajos[0] = [1000,10,"Pablo",4];
			Trabajos[1] = [500,15,"Olga",4];
			Trabajos[2] = [2000,15,"Andrea",4];
			init();
		}

		public function init():void
		{
			_timer.start();
			this.addEventListener(MouseEvent.MOUSE_DOWN, fnBotonesStage);
			_timer.addEventListener(TimerEvent.TIMER, timerListener);
		}

		function timerListener(e:TimerEvent):void
		{
			trace(_timer.currentCount);

			// ver si se termino laburo
			if (avance == _timer.currentCount)
			{
				//trace(Trabajo_Que_se_Procesa[0][1]);
				var Trabajo_Que:Array = new Array();
				 Trabajo_Que[1] = Entrega + _timer.currentCount;
				 Trabajo_Que[0] = Valor;
				 Trabajo_Que[2] = Cliente;
				 trace("contador  " + contador)
				
				Trabajos_Terminados[contador] = Entrega + _timer.currentCount;
				Trabajos_Terminados[contador + 1] = Valor;
				Trabajos_Terminados[contador + 2] = Cliente;
				//Trabajo_Que_se_Procesa[0][1] = 0;
				contador = contador + 3;
				trace(Trabajos_Terminados);
				trace("termino");
				en_proceso = false;
			}
			fnBuscar_Trabajo();
		}

		// ver si esta la fecha de entrega laburo
		public function fnBuscar_Trabajo()
		{
			var length:uint = Trabajos_Terminados.length ;
			for (var i:uint=0; i<length; i+=3)
			{
				trace (i);
				if (Trabajos_Terminados[i] == _timer.currentCount)
				{
					trace(String(Trabajos_Terminados[i+2]) + " venite a buscar el laburo");
					Trabajos_Terminados.splice(i, 3);
					trace(Trabajos_Terminados);

				}
			}
		}



		public function fnBotonesStage(event:MouseEvent):void
		{
			switch (event.target.name)
			{
				case "boton1" :
					var yyy = myprueba.Claseprueba();
					trace(yyy);
					//trace(Trabajos[0]);
					tiempo = (Trabajos[0][3]);
					Trabajo_Proceso = Trabajos[0];
					Iniciar_Trabajo();
					break;
				case "boton2" :

					yyy = myprueba.Tiempo(_timer.currentCount);
					//trace(yyy);
					//trace(Trabajos[1]);
					tiempo = (Trabajos[1][3]);
					Trabajo_Proceso = Trabajos[1];
					Iniciar_Trabajo();
					break;
				case "boton3" :
					//trace(Trabajos[2]);
					tiempo = (Trabajos[1][3]);
					Trabajo_Proceso = Trabajos[2];
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
				Cliente = Trabajo_Proceso[2];
				Valor = Trabajo_Proceso[0];
				Entrega = Trabajo_Proceso[1];
				trace(Entrega);
				trace (Cliente);
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