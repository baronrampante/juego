package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Graphics;
	import flash.events.MouseEvent;

	public class botones extends MovieClip
	{
		public function botones()
		{
			// constructor code
			this.addEventListener(MouseEvent.ROLL_OVER, OVER);
			this.addEventListener(MouseEvent.ROLL_OUT, OUT);
		}
		private function OVER(event:MouseEvent):void
		{
			this.gotoAndStop(2);
		}
		
		private function OUT(event:MouseEvent):void
		{
			this.gotoAndStop(1);
		}

	}

}