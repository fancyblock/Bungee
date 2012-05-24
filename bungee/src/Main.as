package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import physic.Bungee;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	[SWF(width="320", height="480", backgroundColor="0x000000")]
	public class Main extends Sprite 
	{
		protected var m_bungee:Bungee = null;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			this.addEventListener( Event.ENTER_FRAME, _onEnterFrame );
		}
		
		//----------------------------- event function ---------------------------------
		
		// frame function
		private function _onEnterFrame( evt:Event ):void
		{
			//TODO 
		}
		
	}
	
}