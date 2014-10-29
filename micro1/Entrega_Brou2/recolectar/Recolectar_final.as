package 
{
    import flash.media.Sound;
    import flash.media.SoundChannel;
	import flash.net.URLLoader;
    import flash.net.URLRequest;
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import com.greensock.*;
	import com.greensock.easing.*;

	public class Recolectar_final extends MovieClip
	{
		private var _timer:Timer = new Timer(500);// se ejecuta cada un segundo
		private var _timer_malo:Timer = new Timer(9000);// definimos cuanto es el tiempo para que aparezca el malo
		private var _tiempo_jugado:uint = 0;
		private var _tiempo_para_jugar:uint = 50;// definir el tiempo total aca en segundos
		private var _velocidad_personaje:uint = 20;//velocidad con la que se mueve el personaje
		private var vx:int = 0;
		private var _frame_reloj:uint;
		public var termino = false;

		private var _velocidad_bomba:uint = 20;//velocidad con la que se mueve la bomba

		private var _cantidad_manzanas:uint = 5;// definir cantidad de frutas a recolectar
		private var _cantidad_limones:uint = 7;// definir cantidad de frutas a recolectar
		private var _cantidad_naranjas:uint = 6;// definir cantidad de frutas a recolectar

		////FRUTAS
		private var ArrayLimones:Array = new Array();
		private var ArrayManzanas:Array = new Array();
		private var ArrayNaranjas:Array = new Array();

		private var _nombre_fruta_recolectada:String;
		private var _manzanas_delay:Number;
		private var _limones_delay:Number;
		private var _naranjas_delay:Number;
		private var _delay_inicial:Number;

		private var _total_frutas_recolectadas:Number = 0;
		private var _personaje_posicion:String;
		private var _vel_frutas_y:int = 6;
		private var _score_puntos:int = 0;
		
		////definir aca los PUNTOS por fruta recojida
		private var _puntos_x_manzana_recojida:int = 25;
		private var _puntos_x_limon_recojida:int = 10;
		private var _puntos_x_naranja_recojida:int = 15

		private var _altodelJuego = 800 + 10;

		private var atrapa_fruta_sonido:Atrapa_fruta_sonido = new Atrapa_fruta_sonido(); 
		private var sonido_bg:mm_minijuegos_bgmusic_gameplay = new mm_minijuegos_bgmusic_gameplay();
		private var channel:SoundChannel = new SoundChannel();
		private var channel2:SoundChannel = new SoundChannel();

		public function Recolectar_final()
		{
			init();
		}

		public function init():void
		{
			//_total_frutas_recolectadas = 0;
			placa_inicio.visible = true;
			//placa_fin.visible = false;
			placa_perdiste.visible = false;
			placa_inicio.btn_iniciar.addEventListener(MouseEvent.MOUSE_DOWN, IniciarJuego);
			placa_perdiste.btn_cerrar.addEventListener(MouseEvent.MOUSE_DOWN, IniciarJuego);
			channel2 = sonido_bg.play();

			_manzanas_delay  = 6+ Number (Math.random()*(6));
			_naranjas_delay  = 6+ Number (Math.random()*(6));
			_limones_delay  = 6+ Number (Math.random()*(8));
			
		}
		
		private function IniciarJuego(event:MouseEvent):void
		{
			placa_inicio.visible = false;
			this.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			this.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			//arranca juego seteamos tiempo 
			_timer.addEventListener(TimerEvent.TIMER, onTimer);
			_timer.start();
			_timer_malo.addEventListener(TimerEvent.TIMER, ApareceMalo);
			_timer_malo.start();
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			ordenar_frutos();
			malo.x = int(Math.random()*(stage.x/2));
		}

		private function ReIniciarJuego(event:MouseEvent):void
		{
			_tiempo_jugado = 0;
			termino = true;
			channel2.stop();
			tiempo.gotoAndStop(1);
			for (var inc:Number = 0; inc < _total_frutas_recolectadas; inc++)
			{
				score.removeChildAt(1);
			}
			_timer_malo.stop();
			//init();

		}
		public function ordenar_frutos():void
		{

			for (var i:uint = 0; i <_cantidad_manzanas; i++)
			{
				var manzana:MovieClip = new Manzana();
				ArrayManzanas[i] = manzana;

				ArrayManzanas[i].x = 15 + int (Math.random()*(200));
				ArrayManzanas[i].y = 20 + int (Math.random()*(300));
				addChild(ArrayManzanas[i]);
				_delay_inicial  = 0.5+ Number (Math.random()*(3));
				TweenMax.fromTo(ArrayManzanas[i], _vel_frutas_y, {y:ArrayManzanas[i].y}, {y:_altodelJuego, delay:i * _manzanas_delay+_delay_inicial, onUpdate:checkHitTest,ease:Quad.easeIn});
			}

			for (var l:uint = 0; l <_cantidad_limones; l++)
			{
				var limon:MovieClip = new Limon();
				ArrayLimones[l] = limon;

				ArrayLimones[l].x = 305 + int (Math.random()*(stage.x/2));
				ArrayLimones[l].y = 35 + int (Math.random()*(stage.y/2));
				addChild(ArrayLimones[l]);
				_delay_inicial  = 0.5+ Number (Math.random()*(2));
				TweenMax.fromTo(ArrayLimones[l], _vel_frutas_y, {y:ArrayLimones[l].y}, {y:_altodelJuego, delay:l * _limones_delay+_delay_inicial, onUpdate:checkHitTest,ease:Quad.easeIn});
			}

			for (var n:uint = 0; n< _cantidad_naranjas; n++)
			{
				var naranja:MovieClip = new Naranja();
				ArrayNaranjas[n] = naranja;

				ArrayNaranjas[n].x = 620 + int (Math.random()*(stage.x/2));
				ArrayNaranjas[n].y = 35 + int (Math.random()*(stage.y/2));
				addChild(ArrayNaranjas[n]);
				_delay_inicial  = 0.5+ Number (Math.random()*(1));
				TweenMax.fromTo(ArrayNaranjas[n], _vel_frutas_y, {y:ArrayNaranjas[n].y}, {y:_altodelJuego, delay:n * _naranjas_delay+_delay_inicial, onUpdate:checkHitTest,ease:Quad.easeIn});
			}
		}

		public function checkHitTest()
		{
			var channel:SoundChannel;

			for (var i:uint = 0; i <_cantidad_manzanas; i++)
			{
				if (personaje.hit_cesto.hitTestObject(ArrayManzanas[i]))
				{
					TweenLite.killTweensOf(ArrayManzanas[i]);
					_nombre_fruta_recolectada = "manzana";
					ArrayManzanas[i].y = 1200;
					_score_puntos +=  _puntos_x_manzana_recojida;
					Cesto_Frutas_Recolectadas();
					trace("RECOLECTO FRUTA");
					atrapa_fruta_sonido.play();

				}
			}

			for (var l:uint = 0; l <_cantidad_limones; l++)
			{
				if (personaje.hit_cesto.hitTestObject(ArrayLimones[l]))
				{
					TweenLite.killTweensOf(ArrayLimones[l]);
					_nombre_fruta_recolectada = "limon";
					ArrayLimones[l].y = 1200;
					_score_puntos +=  _puntos_x_limon_recojida;
					Cesto_Frutas_Recolectadas();
					trace("RECOLECTO FRUTA");
					atrapa_fruta_sonido.play();
	
				}
			}

			for (var n:uint = 0; n< _cantidad_naranjas; n++)
			{
				if (personaje.hit_cesto.hitTestObject(ArrayNaranjas[n]))
				{
					TweenLite.killTweensOf(ArrayNaranjas[n]);
					_nombre_fruta_recolectada = "naranja";
					ArrayNaranjas[n].y = 1200;
					_score_puntos +=  _puntos_x_naranja_recojida;
					Cesto_Frutas_Recolectadas();
					trace("RECOLECTO FRUTA");
					atrapa_fruta_sonido.play();
				}
			}
		}


		public function onKeyDown(event:KeyboardEvent):void
		{
			if (event.keyCode == Keyboard.RIGHT)
			{
				personaje.gotoAndStop("camino_der");
				_personaje_posicion = "derecha";
				vx =  +  _velocidad_personaje;

			}
			else if (event.keyCode == Keyboard.LEFT )
			{
				_personaje_posicion = "izquierda";
				personaje.gotoAndStop("camino_izq");
				vx =  -  _velocidad_personaje;
			}
		}

		public function onKeyUp(event:KeyboardEvent):void
		{
			if (_personaje_posicion != "izquierda")
			{
				personaje.gotoAndStop("parado_derecha");
			}
			else if (_personaje_posicion != "derecha")
			{
				personaje.gotoAndStop("parado_izquierda");
			}
			vx = 0;

		}

		private function onTimer(evt:TimerEvent):void
		{
			_tiempo_jugado +=  1;
			_frame_reloj = _tiempo_jugado * 100 / _tiempo_para_jugar;
			tiempo.gotoAndStop(_frame_reloj);

			if (_tiempo_jugado > _tiempo_para_jugar)
			{
				_timer.stop();
				placa_perdiste.visible = true;
				placa_perdiste.btn_reiniciar.addEventListener(MouseEvent.MOUSE_DOWN, ReIniciarJuego);
				removeEventListener(Event.ENTER_FRAME, onEnterFrame);//// para la dinamica de juego

				trace( "tu puntaje fue" + _score_puntos);
				placa_perdiste.total_puntos.text = _score_puntos;
				placa_perdiste.total_frutas_recolectadas.text =_total_frutas_recolectadas
				for (var i:uint = 0; i <_cantidad_manzanas; i++)
				{
					TweenLite.killTweensOf(ArrayManzanas[i]);
				}
				for (var l:uint = 0; l <_cantidad_limones; l++)
				{
					TweenLite.killTweensOf(ArrayLimones[l]);
				}
				for (var n:uint = 0; n< _cantidad_naranjas; n++)
				{
					TweenLite.killTweensOf(ArrayNaranjas[n]);
				}
			}
		}

		private function ApareceMalo(evt:TimerEvent):void
		{
			malo.x = int(Math.random()*(800/1.4));
			malo.gotoAndPlay(2);
			malo.bomba.y = 60;
			//malo.bomba.gotoAndStop(1);
		}
		
		public function onEnterFrame(event:Event):void
		{
			////CONTROL PERSONAJE
			if (personaje.x >= (1800 -470))
			{
				personaje.x = 800 - 480;
			}
			else if (personaje.x <= 0)
			{
				personaje.x = 10;
			}
			else
			{
				personaje.x +=  vx;
			}
			///control bomba
			if (malo.bomba.y > (_altodelJuego))
			{
				malo.bomba.y +=  0;
				//malo.bomba.play();
			}
			else
			{
				malo.bomba.y +=  _velocidad_bomba;
			}
			if (personaje.hit_cesto.hitTestObject(malo.bomba))
			{
				_score_puntos = 0;
				for (var inc:Number = 0; inc < _total_frutas_recolectadas; inc++)
				{
					score.removeChildAt(1);
				}
				_total_frutas_recolectadas = 0;
				trace("me dio la bomba");
				malo.bomba.play();
				TweenLite.to(malo.bomba, 0, {y:_altodelJuego+200, delay:0.3});

				//malo.bomba.y = _altodelJuego+200;
				malo.bomba.y +=  0;
			}
		}

		public function Cesto_Frutas_Recolectadas():void
		{
			//_total_frutas_recolectadas +=  1;
			/*var frutas_recolectadas:MovieClip = new Frutas_recolectadas();
			score.addChildAt(frutas_recolectadas, 1);
			frutas_recolectadas.y -=  frutas_recolectadas.height * _total_frutas_recolectadas;
			frutas_recolectadas.gotoAndStop(_nombre_fruta_recolectada);
			trace("fruta recolectada");
			*/
			
					
			//_total_frutas_recolectadas++;
			var numOfColumns:int = 2;
			var spacer:int = 5;
			
			switch (_nombre_fruta_recolectada) {
			case "naranja" :
				var naranja:MovieClip = new Naranja();
				naranja.x = (_total_frutas_recolectadas % numOfColumns) * (60 + spacer);
				naranja.y = Math.floor(_total_frutas_recolectadas / numOfColumns) *  -(60 + spacer);
				score.addChild(naranja);
			break;
			case "manzana" :
				var manzana:MovieClip = new Manzana();
				manzana.x = (_total_frutas_recolectadas % numOfColumns) * (60 + spacer);
				manzana.y = Math.floor(_total_frutas_recolectadas / numOfColumns) *  -(60 + spacer);
				score.addChild(manzana);
			break;
			case "limon" :
				var limon:MovieClip = new Limon();
				limon.x = (_total_frutas_recolectadas % numOfColumns) * (60 + spacer);
				limon.y = Math.floor(_total_frutas_recolectadas / numOfColumns) *  -(60 + spacer);
				score.addChild(limon);
			break;
			default :
			break;

			}
			_total_frutas_recolectadas +=  1;

		}

	}

}