package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	
	import physic.Bungee;
	import physic.Particle;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	[SWF(width="320", height="480", backgroundColor="0x222222")]
	public class Main extends Sprite 
	{
		//----------------------------- private member ----------------------------------
		
		protected var m_bungee:Bungee = null;
		
		//----------------------------- public function ---------------------------------
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
						
			// create bungee
			m_bungee = new Bungee();
			m_bungee.Create( 30, 10 );
			m_bungee.SetEndpointPos( 0, 0, 200 );
			m_bungee.SetEndpointPos( 29, 320, 200 );
			m_bungee.SetExternForce( 0, 0.01 );
			
			this.addEventListener( Event.ENTER_FRAME, _onEnterFrame );
		}
		
		//----------------------------- event function ---------------------------------
		
		// frame function
		private function _onEnterFrame( evt:Event ):void
		{
			m_bungee.Update();
			
			this.graphics.clear();
			this.graphics.lineStyle( 2, 0xaaff99, 1 );
			
			var particles:Vector.<Particle> = m_bungee.PARTICLE_LIST;
			for( var i:int = 1; i < particles.length; i++ )
			{
				this.graphics.moveTo( particles[i-1].POSITION.x, particles[i-1].POSITION.y );
				this.graphics.lineTo( particles[i].POSITION.x, particles[i].POSITION.y );
				
				trace( particles[i].POSITION );
			}
		}
		
	}
	
}