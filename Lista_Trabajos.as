package 
{
	//import array2;
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.Event;
	import Clientes;

	public class Lista_Trabajos extends MovieClip
	{
		// var main:array2 = new array2();
		public var Temp = 0;
		public var Texto = "";
		var Trabajo:Array = new Array();
		var Persona:Array = [];
		var Client:Clientes = new Clientes();
		//var Nombres:Clientes = new Clientes();
		var Arreglos = "cosa";


		var ciclo = 1;// entrada de cliente
		public var Nuevo = -1;// indice nuevo cliente


		public function Lista_Trabajos()
		{
			// constructor code
			Tiempo(Temp);
		}

		public function Tiempo(Temp):void
		{
			//trace("tiempo   " + Temp);
			if (Temp == ciclo)
			{
				ciclo = ciclo + 15;
				Trabajos();
			}
		}

		public function Trabajos():void
		{
			Nuevo = Nuevo + 1;
			//Arreglos = Arreglo.Objetos[1];
			var aleatorio = randRange(0,4);
			var rand_cliente = randRange(0,4);
			//trace ("random   " + aleatorio + "  " + rand_cliente);
	
			Trabajo.push(Client.Objetos[aleatorio][0]);
			Trabajo.push(Client.Objetos[aleatorio][1]);
			Trabajo.push(Client.Objetos[aleatorio][2]);
			//Trabajo.push(Client.Objetos[aleatorio][3]);
			//Trabajo.push(Client.Objetos[aleatorio][4]);
			Trabajo.push(Client.Cliente[rand_cliente]);
			Persona.push(Client.Cliente[rand_cliente]);
			//Texto = Trabajo;
			trace("Trabajosss   " + Trabajo);
		}

		private function randRange(minNum:Number, maxNum:Number):Number
		{
			return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
		}
	}
}