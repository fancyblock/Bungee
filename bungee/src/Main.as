package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	
	import physic.Bungee;
	import physic.Particle;
	import physic.Spring;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	[SWF(width="320", height="480", backgroundColor="0x222222")]
	public class Main extends Sprite 
	{
		//----------------------------- private member ----------------------------------
		
		protected var m_bungee:Bungee = null;
		protected var m_particle:Particle = null;
		
		protected var m_touchOffset:Point = null;
		
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
			
			var bg:Sprite = new Sprite();
			bg.graphics.beginFill( 0xffffff, 0.1 );
			bg.graphics.drawRect( 0, 0, 320, 480 );
			bg.graphics.endFill();
			
			this.addChild( bg );
			
			// create bungee
			m_bungee = new Bungee();
			m_bungee.Create( 50, 0.2, 0.8, 1.3, 1, 0.2 );
			m_bungee.SetEndpointPos( 0, 0, 200 );
			m_bungee.SetEndpointPos( 49, 320, 200 );
			m_bungee.SetExternForce( 0, 0.2 );
			
			m_touchOffset = new Point();
			
			this.addEventListener( Event.ENTER_FRAME, _onEnterFrame );
			bg.addEventListener( MouseEvent.MOUSE_DOWN, _onTouchBegin );
			bg.addEventListener( MouseEvent.MOUSE_MOVE, _onTouchMove );
			bg.addEventListener( MouseEvent.MOUSE_UP, _onTouchEnd );
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
			}
		}
		
		private function _onTouchBegin( evt:MouseEvent ):void
		{
			var particles:Vector.<Particle> = m_bungee.PARTICLE_LIST;
			
			var curPt:Point = new Point( evt.localX, evt.localY );	trace( curPt );
			var calcPt:Point = new Point();
			for( var i:int = 0; i < particles.length; i++ )
			{
				calcPt.x = particles[i].POSITION.x - evt.localX;
				calcPt.y = particles[i].POSITION.y - evt.localY;
				
				if( calcPt.length < 10 )
				{
					m_particle = particles[i];
					m_particle.SetFix( true );
					m_touchOffset.x = calcPt.x;
					m_touchOffset.y = calcPt.y;
					
					break;
				}
			}
			
		}
		
		private function _onTouchMove( evt:MouseEvent ):void
		{
			if( m_particle != null )
			{
				m_particle.SetPosition( evt.localX + m_touchOffset.x, evt.localY + m_touchOffset.y );
			}
		}
		
		private function _onTouchEnd( evt:MouseEvent ):void
		{
			if( m_particle != null )
			{
				m_particle.SetFix( false );
				m_particle = null;
			}
		}
		
	}
	
}