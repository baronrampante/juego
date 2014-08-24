package 
{

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	



	public class Barrio_MC extends MovieClip
	{

		var carga_ext:uint = 0;
		 
		 public var coso = 4;
		
		


		public function Barrio_MC()
		{
			// constructor code
			
			lista.addEventListener(MouseEvent.MOUSE_DOWN, fnLista);
		}
		
		public function Nueva_var(coso):void {
			if (coso == 3000){
				bolo.text = String(coso + 1);
		}
				trace(coso);
		}


		function fnLista(event:MouseEvent):void
		{
			trace ("dd" + coso);
			bolo.text ="ddd";
		}

		
	}



}