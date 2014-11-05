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
		
			public var aancho = 0;
			public var alargo = 0;
			public var rancho = 0;
			public var rlargo = 0;
			public var temp = 0;
			public var re = 0;
			
			public var n1:String;
			public var n2:String;
		
		public function Main():void 
		{
			init();
			
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			aancho = 0.35 + (Math.random()*2)/4;	
			alargo = 0.3 + (Math.random()*2)/4;	
			rancho = 0.3 + (Math.random()*2)/4;	
			rlargo = 0.25 + (Math.random()*2)/4;	
			
			aancho = aancho.toString().substr(0, 4);
			alargo = alargo.toString().substr(0, 4);
			rancho = rancho.toString().substr(0, 4);
			rlargo = rlargo.toString().substr(0, 4);

			if (aancho > alargo){
				temp = aancho;
				aancho = alargo;
				alargo = temp;
			}

			re = (alargo * aancho) + (rlargo * rancho);
			re = Number(String(re).substring(0,4));
			trace(alargo + " " + aancho + " " + rlargo + " " + rancho + " = " + re);

			botonUno_mc.addEventListener(MouseEvent.MOUSE_DOWN, funcionBotonUno);
		}
		
		public function funcionBotonUno(e:MouseEvent): void {
			n2 = String(re);
			//n1 = resp.text.slice(0, -1);
			n1 = resp.text.substring(0,4);
			if (n1 == n2) {
				gotoAndStop(2);
				trace("LA RESPUESTA ES CORRECTA");
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