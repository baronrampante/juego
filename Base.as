package 
{
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.events.MouseEvent;
	import flash.events.Event;

	public class Base extends MovieClip
	{
		public var cargador:Loader;
		public var cargador2:Loader;
		public var req:URLRequest;
		public var req2:URLRequest;
		public var pelicula:Object;
		public var coso:Object;

		public function Base()
		{
			// constructor code
			//asignamos a memoria la variable que cargara el archivo
			cargador = new Loader() as Loader;
			cargador2 = new Loader() as Loader;
			//asignamos la direccion del archivo que se va a cargar
			req = new URLRequest("introconcargadorarray.swf");
			req2 = new URLRequest("hola.swf");
			//colocamos un nombre a load_btn y asignamos un listener para que cargue el archivo al darle click
			load_btn.text_btn.text = "cargar";
			load_btn.addEventListener(MouseEvent.CLICK, cargar);

		}
		function cargar(event:MouseEvent):void
		{
			//cargamos el archivo
			cargador.load(req);
			//agregamos un listener que espere a que la carga este completa, si esta completa llamara la funcion "fincarga"
			cargador.contentLoaderInfo.addEventListener(Event.COMPLETE, fincarga);
		}

		function fincarga(e:Event)
		{
			pelicula = e.currentTarget.content;
			//agregamos cargador al escenario para poder visualizar el contenido de peli.swf
			addChild(cargador);
			//agregamos el listener que llamara a la funcion de peli a load_btn;
			load_btn.addEventListener(MouseEvent.CLICK, llamarfuncionpeli);
			load_btn.text_btn.text = "mover";
			pelicula.unload_btn.text_btn.text = "coooso";
		}
		
		public function cargar2():void
		{
			//cargamos el archivo
			cargador2.load(req2);
			//agregamos un listener que espere a que la carga este completa, si esta completa llamara la funcion "fincarga"
			cargador2.contentLoaderInfo.addEventListener(Event.COMPLETE, fincarga2);
		}
		
		public function fincarga2(e:Event)
		{
			coso = e.currentTarget.content;
			//agregamos cargador al escenario para poder visualizar el contenido de peli.swf
			addChild(cargador2);
			//agregamos el listener que llamara a la funcion de peli a load_btn;
		}
		
		//funcion que descarga "peli.swf"
		function descargar()
		{
			//descargamos peli.swf
			cargador.unload();
			//removemos a cargador del escenario
			removeChild(cargador);
		}

		function texto()
		{
			load_btn.text_btn.text = "segunda";
		}
		
		//funcion que llama la funcion dentro de "peli.swf"
		function llamarfuncionpeli(event:MouseEvent):void
		{
			//llamamos la funcion dentro de "peli.swf"
			pelicula.fin();
		}

	}

}