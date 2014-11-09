package 
{

	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.Event;
	import Clientes_Textil;



	public class Lista_Trabaj_Textil extends MovieClip
	{
		public var Nuevo_Cliente = 0;
		public var Temp = 1;
		public var temp = false;
		public var Texto = "";
		var Trabajo:Array = new Array();
		var Persona:Array = [];
		var Client:Clientes_Textil = new Clientes_Textil();
		var Arreglos = "cosa";
		var ciclo = 1;// entrada de cliente
		public var Nuevo = -1;// indice nuevo cliente
		var Hacer = 0; // variable global para seber si hizo juego y puede empezar a construir


		public function Lista_Trabaj()
		{

			Tiempo(Temp);
		}
		
		public function fnHacer(temp){
			if (temp == true){
				Hacer = 1;
			}
		}

		public function Tiempo(Temp):void
		{
			Nuevo_Cliente = 0;
			if (Temp == ciclo)
			{
				Trabajos();
			}
		}

		public function Trabajos():void
		{
			Nuevo = Nuevo + 1;
			var aleatorio = 0;
			//Arreglos = Arreglo.Objetos[1];
			if (Hacer == 0)
			{
				aleatorio = randRange(5,9);
			}
			else
			{
				 aleatorio = randRange(0,4);
				
			}
			var rand_cliente = randRange(0,5);
			Trabajo[0] =(Client.Objetos[aleatorio][0]);
			Trabajo[1] =(Client.Objetos[aleatorio][1]);
			Trabajo[2] =(Client.Objetos[aleatorio][2]);
			Trabajo[3] =(Client.Objetos[aleatorio][3]);
			Trabajo[4] =(Client.Objetos[aleatorio][4]);
			Trabajo[5] =(Client.Objetos[aleatorio][5]);
			Trabajo[6] =(Client.Cliente[rand_cliente]);
			//trace("Trabajo   " + Trabajo);
			Nuevo_Cliente = 1;
			ciclo = ciclo + 16;
		}

		private function randRange(minNum:Number, maxNum:Number):Number
		{
			return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
		}
	}
}