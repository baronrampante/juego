package 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author pabloBoquete
	 */
	public class Main extends MovieClip 
	{
		
		public	var cprendas = 0;
		public 	var mtprenda = 0;
		public	var ancho = 0;
		public	var re = 0;
		
		public var n1:String;
		public var n2:String;

		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			
			cprendas = 3 + (Math.random()*4);
			cprendas = cprendas.toString().substr(0, 1); //reduce a 1 dígito
			mtprenda = (5 + (Math.random()*6))/10;
			mtprenda = mtprenda.toString().substr(0, 4); //reduce decimales a 2 dígitos
			ancho = (5 + (Math.random()*6))/10;
			ancho = ancho.toString().substr(0, 4); //reduce decimales a 2 dígitos
			re = cprendas * mtprenda;
			trace(re);
			re = String(re/ancho);
			trace(re);
			re = re.substring(0,4)
			trace(re);
			
			botonUno_mc.addEventListener(MouseEvent.MOUSE_DOWN, funcionBotonUno);

		}
		
		public function funcionBotonUno(e:MouseEvent): void {
			n2 = String(re);
			//n1 = resp.text.slice(0, -1);
			n1 = resp.text.substring(0,4);
			if (n1 == n2) {
				gotoAndStop(2);
				trace("RESPUESTA CORRECTA");
			} else {
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