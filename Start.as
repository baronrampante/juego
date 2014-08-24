package 
{

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import fl.transitions.TweenEvent;
	import flash.media.Sound;
	import flash.net.URLRequest;

	import flash.media.SoundLoaderContext;


	public class Start extends MovieClip
	{

		var snd:Sound = new Sound(new URLRequest("mp_musica_menuinicial.mp3"));


		var Personaje = "";
		var Personaje2 = "";
		var Velocidad_var = 1;
		var Cabeza_actual = "";
		var Cabeza = "";
		public var Jugador = "";
		public var Juego = "";

		public function Start()
		{
			if (stage)
			{
				init();
			}
			Personaje2 = Fondo_Nacho;
			Cabeza_actual = Nacho;
			Cabeza = Lety;
			Adelante_BT.visible = false;
			Atras_BT.visible = false;
			Nacho.visible = false;
			Adelante_Juego.visible = false;
			snd.play(0, 100);
			stage.addEventListener(Event.ENTER_FRAME, Personajes);
		}

		function Init()
		{
		}

		public function Personajes(evt:Event):void
		{
			this.addEventListener(MouseEvent.MOUSE_DOWN, fnBotonesStage);
			Tira_MC.addEventListener(MouseEvent.MOUSE_DOWN, fnTira);
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
						Placa_Start.visible = false;
						Nacho.visible = true;
						Adelante_BT.visible = true;
						var myTween:Tween = new Tween(Select_MC,"y",Bounce.easeOut,-150,40,2,true);
						break;
					case "Ivan_" :
						Personaje = Fondo_Ivan;
						Cabeza = Ivan;
						mover();
						mover_cabeza();
						break;
					case "Nacho_" :
						Personaje = Fondo_Nacho;
						Cabeza = Nacho;
						mover();
						mover_cabeza();
						break;
					case "Lety_" :
						Personaje = Fondo_Lety;
						Cabeza = Lety;
						mover();
						mover_cabeza();
						break;
					case "Avril_" :
						Personaje = Fondo_Avril;
						Cabeza = Avril;
						mover();
						mover_cabeza();
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
					Juego = "Feria";
					break;
				case "Carpinteria_BT" :
					Tira_MC.Feria_MC.visible = false;
					Tira_MC.Textil_MC.visible = false;
					Tira_MC.Carpinteria_MC.visible = true;
					Juego = "Carpinteria";
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