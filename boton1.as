package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Graphics;
	import flash.events.MouseEvent;

	public class boton1 extends MovieClip
	{


		public function botones()
		{
			// constructor code
			this.addEventListener(MouseEvent.ROLL_OVER, OVER);
		}
		private function OVER(event:MouseEvent):void
		{

			this.gotoAndStop(2);

		}

	}

}