package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author pabloBoquete
	 */
	public class Main extends MovieClip 
	{
		public	var ancho = 1.30;
		public	var largo = 2.10;
		public	var temp = 0;
		public var re = 0;
		public var n1:String;
		public var termino=false;
		
		
		public function Main():void 
		
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
				
			ancho = 1 + ((Math.random()*3)/4);
			largo = 1 + (Math.random() * 5) / 4;
			ancho = ancho.toString().substr(0, 4);
			largo = largo.toString().substr(0, 4);
			
			//value= int((20/7)*100)/100;

			if (ancho > largo){
				temp = ancho;
				ancho = largo;
				largo = temp;
			}

			re = largo * ancho;
			re = re.toString().substr(0, 4);
			
			botonUno_mc.addEventListener(MouseEvent.MOUSE_DOWN, funcionBotonUno);
			
			trace(re);
			
				
		}
		
	public function fnClose(e:MouseEvent): void {
		termino = true;
		//gotoAndStop(1);
	}
		
		public function funcionBotonUno(e:MouseEvent): void {
			n1 = resp.text;
			var A = n1;
			var decimal:Array = A.split(",");
			var decimalComa:String = decimal[0] + "." + decimal[1]; 
			
			
			if (decimalComa == re) {
				gotoAndStop(2);
				trace("LA RESPUESTA ES CORRECTA");
				Close.addEventListener(MouseEvent.MOUSE_DOWN, fnClose);
				
			}
			else {
				gotoAndStop(3);
				botonTres_mc.addEventListener(MouseEvent.MOUSE_DOWN, funcionBotonTres);
			}
		}
		
		public function funcionBotonTres(e:MouseEvent): void {
			gotoAndStop(1);
			botonUno_mc.addEventListener(MouseEvent.MOUSE_DOWN, funcionBotonUno);
		}
		

	}
	
}