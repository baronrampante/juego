package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	
	public class Barrio extends MovieClip {
		
		public var carga_ext = 0;
		
		
		public function Barrio() {
			// constructor code
			bolo.text = "hhh";
			lista.addEventListener(MouseEvent.MOUSE_DOWN, fnLista);
		}
		
		function fnLista(event:MouseEvent):void
		{
			bolo.text = String(carga_ext);
		}
	}
	
	
	
}
