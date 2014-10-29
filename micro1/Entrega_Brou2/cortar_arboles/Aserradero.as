package 
{
	import flash.media.Sound;
    import flash.media.SoundChannel;
	import flash.net.URLLoader;
    import flash.net.URLRequest;
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import com.greensock.*;
	import com.greensock.easing.*;
	

	public class Aserradero extends Sprite
	{
		private var _timer:Timer = new Timer(1000);// se ejecuta cada un segundo
		private var _timer_golpe:Timer = new Timer(400,1);// definimos cuanto es el tiempo de mareo
		private var _tiempo_jugado:uint = 0;
		private var _tiempo_para_jugar:uint = 50;// definir el tiempo total aca
		private var _serruchadas_necesarias:uint = 40;// definir cantidad de serruchadas para cortar arbol
		public var _serruchadas_realizadas:uint = 0;
		private var _arboles_caidos:uint = 0;
		private var _leniadores_posicion:String;
		private var _vel_pinia_y:Number = 1;
		private var _gravity = 0.6;

		private var _score_puntos:int = 0;
		private var _puntos_x_arbol_caido:int = 50;////definir aca los puntos por arbol caido
		private var frame_reloj:uint;// 
		private var termino_juego: Boolean = false;
		//public var arbol:Arbol = new(Arbol);
		
		public function Aserradero()
		{
			init();
		}

		public function init():void
		{
			placa_inicio.visible = true;
			placa_inicio2.visible = false;
			placa_fin.visible = false;
			placa_inicio.btn_iniciar.addEventListener(MouseEvent.MOUSE_DOWN, IniciarJuegoxx);
			hoja.x = int(Math.random()*800);
			pinia.x = int(Math.random()*800);

		}
		
		public function IniciarJuegoxx(event:MouseEvent):void
		{
			placa_inicio.visible = false;
			placa_inicio2.visible = true;
			placa_fin.visible = false;
			placa_inicio2.btn_iniciar2.addEventListener(MouseEvent.MOUSE_DOWN, IniciarJuego);
			hoja.x = int(Math.random()*800);
			pinia.x = int(Math.random()*800);

		}

		private function IniciarJuego(event:MouseEvent):void
		{
			placa_inicio.visible = false;
			placa_inicio2.visible = false;
			addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			//arranca juego seteamos tiempo 
			_timer.addEventListener(TimerEvent.TIMER, onTimer);
			_timer.start();
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			

		}

		private function ReIniciarJuego(event:MouseEvent):void
		{
			_tiempo_jugado = 0;
			_arboles_caidos = 0;
			_score_puntos = 0;
			planta.gotoAndStop(1);
			(root.loaderInfo.loader.root as Object).descargar2();
			
			
			//reseteo barra de tiempo;
			
			placa_inicio.visible = false;
			placa_fin.visible = false;
			_timer.start();
			termino_juego = false;
			addEventListener(Event.ENTER_FRAME, onEnterFrame);

		}

		public function onKeyDown(event:KeyboardEvent):void
		{
			if (event.keyCode == Keyboard.RIGHT)
			{
				if (_leniadores_posicion != "derecha")
				{
					lenieros.gotoAndStop("leniero_mov_derecha");
					_serruchadas_realizadas +=  1;
					_leniadores_posicion = "derecha";
				}
			}
			else if (event.keyCode == Keyboard.LEFT )
			{
				if (_leniadores_posicion != "izquierda")
				{
					lenieros.gotoAndStop("leniero_mov_izquierda");
					_serruchadas_realizadas +=  1;
					_leniadores_posicion = "izquierda";
				}

			}
		}

		private function onTimer(evt:TimerEvent):void
		{
			_tiempo_jugado +=  1;
			frame_reloj = _tiempo_jugado * 100 / _tiempo_para_jugar;
			tiempo.gotoAndStop(frame_reloj);

			if (_tiempo_jugado > _tiempo_para_jugar)
			{
				_timer.stop();
				placa_fin.visible = true;
				termino_juego = true;
				
				placa_fin.btn_reiniciar.addEventListener(MouseEvent.MOUSE_DOWN, ReIniciarJuego);
				removeEventListener(Event.ENTER_FRAME, onEnterFrame);//// para la dinamica de juego
				placa_fin.total_puntos.text = _score_puntos;
				trace( "tu puntaje fue " + _score_puntos);
				
			}

		}

		public function onEnterFrame(event:Event):void
		{
		if (termino_juego == false)
			{
				if (pinia.y > (800 -400))
				{
					pinia.y = -int (Math.random()*(200));
					_vel_pinia_y = int(Math.random() * (10 - 5));
					pinia.x = int(Math.random()*400);
	
				}
				else
				{
					_vel_pinia_y +=  _gravity;
					pinia.y +=  _vel_pinia_y;
				}
	
				/////mov hoja
				if (hoja.y > 800)
				{
					hoja.y = -50;
					hoja.x = int(Math.random()*(800));
	
				}
				else
				{
					hoja.y +=  3;
					hoja.rotation +=  1;
				}
	
				if (lenieros.hit_casco_izquierdo.hitTestObject(pinia))
				{
					lenieros.gotoAndStop("golpea_izquierda");
					Animacion_pinia_me_pego();
				}
				else if (lenieros.hit_casco_derecho.hitTestObject(pinia))
				{
					lenieros.gotoAndStop("golpea_derecha");
					Animacion_pinia_me_pego();
	
				}
				else if (_serruchadas_realizadas > _serruchadas_necesarias)
				{
					removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
					lenieros.gotoAndStop("cae_arbol");
					//var arboles_cortados:MovieClip = new Arbol();
					//score.addChildAt(arboles_cortados, 1);
					_arboles_caidos++;
					var numOfColumns:int = 2;
					var spacer:int = 10;
	
					/*for (var i:int; i < _arboles_caidos; i++)
					{
						var item:MovieClip = new Arbol();
						item.x = (i % numOfColumns) * (item.width + spacer);
						item.y = Math.floor(i / numOfColumns) * -(item.height + spacer);
						score.addChild(item);
						//score.removeChild(item);
					}*/
					//addChild(arbol);
					planta.gotoAndStop(_arboles_caidos + 1);
					_serruchadas_realizadas = 0;
					_leniadores_posicion = "esperando";
					Animacion_cae_arbol();
				}
			}
			else
				{
					removeEventListener(Event.ENTER_FRAME, onEnterFrame);//// para la dinamica de juego

				}


		}
		public function Animacion_pinia_me_pego():void
		{
			pinia.y = -200;
			removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);//// para la dinamica de juego
			_timer_golpe.addEventListener(TimerEvent.TIMER, onTimerGolpe);
			_timer_golpe.start();

		}

		private function onTimerGolpe(evt:TimerEvent):void
		{
			addEventListener(Event.ENTER_FRAME, onEnterFrame);//// reanudo la dinamica de juego
			addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			//stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			lenieros.gotoAndStop("leniero_mov_izquierda");
		}

		public function Animacion_cae_arbol():void
		{
			TweenMax.to(arbol, 4, {rotation:80, alpha:0, ease:Back.easeIn, onComplete: Animacion_nuevo_arbol});
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);//// para la dinamica de juego
			_score_puntos +=  _puntos_x_arbol_caido;
			pinia.y = -200;
			hoja.y = -20;
		}

		public function Animacion_nuevo_arbol():void
		{
			TweenMax.to(arboles, 3, {x:-1700});
			TweenMax.to(fondo, 3, {x:-1200, onComplete: Continuo_cortando});
			lenieros.gotoAndStop("otro_arbol");

		}
		public function Continuo_cortando():void
		{
			addEventListener(Event.ENTER_FRAME, onEnterFrame);/// retomo los comandos y acciones del juego
			addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			lenieros.gotoAndStop("leniero_mov_derecha");
			TweenMax.to(arbol, 0, {rotation:0, alpha:1});
			arboles.x = 0;
			fondo.x = 0;


		}
	}

}