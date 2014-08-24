package 
{

	import flash.display.MovieClip;



	public class prueba extends MovieClip
	{
		public var variable = 1234;

		public function Claseprueba()
		{
			variable = 1234;
			return variable;
		}
		public function Claseprueba2(Dato, Dato2)
		{
			variable = Dato + Dato2;
			return variable;
		}
		public function Tiempo(Tempo)
		{
			trace (Tempo);
			
		}
	}

}