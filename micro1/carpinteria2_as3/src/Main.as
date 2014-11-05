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
		public var diam = 0;
		public var temp = 0;
		public var re = 0;

		public var n1:String;
		public var n2:String;
		
		public var termino=false;

		
//trace(re);
		
		public function Main():void 
		{
			//if (stage) 
			init();
			//else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			diam = 1 + (Math.random()*10)/6;	
			diam = Number(String(diam).substring(0, 4));
			re = Math.PI* Math.pow((diam/2),2);
			re = Number(String(re).substring(0, 4));
			trace(n2 = String(re));
			
			//addEventListener(Event.ENTER_FRAME, funcion1);
			
			botonUno_mc.addEventListener(MouseEvent.MOUSE_DOWN, funcionBotonUno);
			
			
		}
		
		/*public function funcion1(e:Event) {
			diam = Number(String(diam).substring(0, 4));
			re = Math.PI* Math.pow((diam/2),2);
			re = Number(String(re).substring(0, 4));
			trace(n2 = String(re));
		}*/
		
		public function funcionBotonUno(e:MouseEvent): void {
			n2 = String(re);
			//n1 = resp.text.slice(0, -1);
			
			
			n1 = resp.text.substring(0,4);
			var A = n1;
			var decimal:Array = A.split(",");
			var decimalComa:String = decimal[0] + "." + decimal[1]; 
			if (decimalComa == n2) {
				gotoAndStop(2);
				botonDos_mc.addEventListener(MouseEvent.MOUSE_DOWN, funcionBotonDos);
			} else {
				gotoAndStop(3);
				botonTres_mc.addEventListener(MouseEvent.MOUSE_DOWN, funcionBotonTres);
			}
		}
		
		public function funcionBotonDos(e:MouseEvent): void {
			
			gotoAndStop(1);
			termino=true;
			botonUno_mc.addEventListener(MouseEvent.MOUSE_DOWN, funcionBotonUno);
		}

		public function funcionBotonTres(e:MouseEvent): void {
			
			gotoAndStop(1);
			botonUno_mc.addEventListener(MouseEvent.MOUSE_DOWN, funcionBotonUno);
		}
	}
	
}