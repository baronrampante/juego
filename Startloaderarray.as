package 
{

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import fl.transitions.TweenEvent;
	import flash.media.Sound;
	import flash.media.SoundLoaderContext;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.media.SoundMixer;
	import flash.media.SoundLoaderContext;
	import flash.system.System;
	import Temporizador;


	public class Startloaderarray extends MovieClip
	{

		var snd:Sound = new Sound(new URLRequest("mp_musica_menuinicial.mp3"));
		var myChannel:SoundChannel = new SoundChannel();
		var Character  = 0;

		var Personaje = "Fondo_Nacho";
		var Personaje2 = "";
		var Velocidad_var = 1;
		var Cabeza_actual = "";
		var Cabeza = "";
		public var Jugador = "";
		public var Juego = "";
		public var cargador:Loader;
		public var req:URLRequest;
		public var pelicula:Object;
		var canal:SoundChannel = new SoundChannel();
		public var cargador2:Loader;
		public var req2:URLRequest;
		public var coso:Object;
		var Time:Temporizador = new Temporizador  ;

		//objetos
		var Atras_BT:Atras = new Atras  ;



		public function Startloaderarray()
		{
			/*if (stage)
			{
				init();
			}*/
			//asignamos a memoria la variable que cargara el archivo
			cargador = new Loader() as Loader;
			cargador2 = new Loader() as Loader;
			//asignamos la direccion del archivo que se va a cargar
			req = new URLRequest(Juego);
			req2 = new URLRequest("cortar_tronco_final2.swf");
			Personaje2 = Fondo_Nacho;
			Cabeza_actual = Nacho;
			Cabeza = Lety;
			Adelante_BT.visible = false;
			Atras_BT.visible = false;
			Nacho.visible = false;
			Adelante_Juego.visible = false;
			snd.play(0, 100);
			this.addEventListener(Event.ENTER_FRAME, Personajes);

			//pelicula.Cargar_Peli.addEventListener(MouseEvent.MOUSE_DOWN, Cargar_2);

			//addChild

			addChildAt(Atras_BT, 10);
			Atras_BT.x = 470;
			Atras_BT.y = 737;
			Atras_BT.mouseEnabled = true;

		}

		
		public function cargar():void
		{
			//cargamos el archivo
			//Fondo_Lety = null;
			//Fondo_Nacho = null;
			//Fondo_Ivan = null;
			//Fondo_Avril = null;
			req = new URLRequest(Juego);
			cargador.load(req);
			SoundMixer.stopAll();
			//agregamos un listener que espere a que la carga este completa, si esta completa llamara la funcion "fincarga";
			cargador.contentLoaderInfo.addEventListener(Event.COMPLETE, fincarga);
		}



		function fincarga(e:Event)
		{
			pelicula = e.currentTarget.content;
			//agregamos cargador al escenario para poder visualizar el contenido de peli.swf

			addChildAt(cargador, 19);
			pelicula.Character_var = Character;
			//pelicula.Comunidad();
			//agregamos el listener que llamara a la funcion de peli a load_btn;
			//load_btn.addEventListener(MouseEvent.CLICK, llamarfuncionpeli);
			//load_btn.text_btn.text = "mover";
		}

		public function cargar2():void
		{
			//cargamos el archivo
			cargador2.load(req2);
			//agregamos un listener que espere a que la carga este completa, si esta completa llamara la funcion "fincarga";
			cargador2.contentLoaderInfo.addEventListener(Event.COMPLETE, fincarga2);
		}

		public function fincarga2(e:Event)
		{
			coso = e.currentTarget.content;
			//agregamos cargador al escenario para poder visualizar el contenido de peli.swf
			//removeChild(cargador);
			if (Time.Pausado== false){
			addChildAt(cargador2, 20);
			//cargador.visible =false;
			//agregamos el listener que llamara a la funcion de peli a load_btn;
			}
		}

		public function descargar()
		{
			cargador.unloadAndStop();
			cargador.removeChildAt(19);
			cargador = null;
			Jugar_BT.visible = visible;
			Placa_Start.visible = visible;
			
						
			//cargador.visible =true;
			//pelicula.Time.Empezar(true);
		}
		
		public function descargar2()
		{
			Time.Empezar(true);
			cargador2.unloadAndStop();
			cargador2.removeChildAt(20);
			cargador2 = null;
			
			
						
			//cargador.visible =true;
			//pelicula.Time.Empezar(true);
		}
		
		public function descargar_volver()
		{
			cargador.unloadAndStop();
			//cargador.removeChildAt(19);
			//cargador = null;
			cargar();
		}

		public function Personajes(evt:Event):void
		{
			this.addEventListener(MouseEvent.MOUSE_DOWN, fnBotonesStage);
			Tira_MC.addEventListener(MouseEvent.MOUSE_DOWN, fnTira);
			Atras_BT.addEventListener(MouseEvent.MOUSE_DOWN, fnAtras_BT);
			trace(System.totalMemory / 1024 );
		}

		function fnAtras_BT(event:MouseEvent):void
		{
			Atras_BT.visible = false;
			Adelante_Juego.visible = false;
			Adelante_BT.visible = true;
			Lety_.visible = true;
			Nacho_.visible = true;
			Ivan_.visible = true;
			Avril_.visible = true;
			var myTween5:Tween = new Tween(Tira_MC,"y",Regular.easeOut,400,-400,2,true);
		}



		function fnBotonesStage(event:MouseEvent):void
		{
			//trace(event.target.name, event.currentTarget.name);
			if (Personaje2.x == 600)
			{
				switch (event.target.name)
				{
					case "Jugar_BT" :
						Jugar_BT.visible = false;
						Jugar_BT = null;
						Placa_Start.visible = false;
						Placa_Start = null;
						Nacho.visible = true;
						Adelante_BT.visible = true;
						var myTween:Tween = new Tween(Select_MC,"y",Bounce.easeOut,-150,40,2,true);
						break;
					case "Ivan_" :
						Personaje = Fondo_Ivan;
						Cabeza = Ivan;
						mover();
						mover_cabeza();
						Character = 1;
						break;
					case "Nacho_" :
						Personaje = Fondo_Nacho;
						Cabeza = Nacho;
						mover();
						mover_cabeza();
						Character = 0;
						break;
					case "Lety_" :
						Personaje = Fondo_Lety;
						Cabeza = Lety;
						mover();
						mover_cabeza();
						Character = 2;
						break;
					case "Avril_" :
						Personaje = Fondo_Avril;
						Cabeza = Avril;
						mover();
						mover_cabeza();
						Character = 3;
						break;
					case "Adelante_BT" :
						Tira();
						break;
					case "Atras_BT" :
						Atras_BT.visible = false;
						Adelante_Juego.visible = false;
						Adelante_BT.visible = true;
						Lety_.visible = true;
						Nacho_.visible = true;
						Ivan_.visible = true;
						Avril_.visible = true;
						var myTween5:Tween = new Tween(Tira_MC,"y",Regular.easeOut,400,-400,2,true);
						break;
					case "Adelante_Juego" :
						cargar();
						break;
					case "cargar22" :
						cargar2();
						break;
				}
			}

		}

		function fnTira(event:MouseEvent):void
		{
			switch (event.target.name)
			{
				case "Feria_BT" :
					Tira_MC.Feria_MC.visible = true;
					Tira_MC.Textil_MC.visible = false;
					Tira_MC.Carpinteria_MC.visible = false;
					Juego = "Verduleria_final.swf";
					break;
				case "Carpinteria_BT" :
					Tira_MC.Feria_MC.visible = false;
					Tira_MC.Textil_MC.visible = false;
					Tira_MC.Carpinteria_MC.visible = true;
					Juego = "micro.swf";
					break;
				case "Textil_BT" :
					Tira_MC.Feria_MC.visible = false;
					Tira_MC.Textil_MC.visible = true;
					Tira_MC.Carpinteria_MC.visible = false;
					Juego = "Textil";
					break;
			}
		}


		function Tira():void
		{
			Tira_MC.Feria_MC.visible = false;
			Tira_MC.Textil_MC.visible = false;
			Tira_MC.Carpinteria_MC.visible = false;
			Adelante_BT.visible = false;
			Adelante_Juego.visible = true;
			Atras_BT.visible = true;
			Lety_.visible = false;
			Nacho_.visible = false;
			Ivan_.visible = false;
			Avril_.visible = false;
			var myTween:Tween = new Tween(Tira_MC,"y",Regular.easeOut,-400,400,2,true);
			Jugador = Cabeza;

		}



		function mover():void
		{
			if (Personaje2 != Personaje)
			{
				var myTween:Tween = new Tween((Personaje2) , "x", None.easeInOut, 600, -600, Velocidad_var, true);
				var myPunk:Tween = new Tween(Personaje,"x",None.easeInOut,1800,600,Velocidad_var,true);
				Personaje2 = Personaje;
			}
		}


		function mover_cabeza():void
		{
			var myTween2:Tween = new Tween((Cabeza_actual) , "y", Regular.easeIn, 540, 3000, 2, true);
			var myTween3:Tween = new Tween((Cabeza) , "y", Regular.easeOut, 3000, 540, 2, true);
			Cabeza_actual = Cabeza;

		}
	}

}