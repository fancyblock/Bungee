package physic 
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class Spring 
	{
		//------------------------------ static member -------------------------------------
		
		//------------------------------ private member ------------------------------------
		
		var m_particle1:Particle = null;
		var m_partielc2:Particle = null;
		
		var m_length:Number = 1;
		var m_k:Number = 5;
		var m_dampK:Number = 1;
		
		//------------------------------ public function -----------------------------------
		
		/**
		 * @desc	constructor of Spring
		 */
		public function Spring() 
		{
			//TODO 
		}
		
		
		/**
		 * @desc	calculate the force to the two particles
		 * @return	none
		 */
		public function Update():void
		{
			if ( m_particle1 != null && m_partielc2 != null )
			{
				var springVecX:Number = m_particle1.POSITION.x - m_partielc2.POSITION.x;
				var springVecY:Number = m_particle1.POSITION.y - m_partielc2.POSITION.y;
				var normalSpringVec:Point = new Point( springVecX, springVecY );
				normalSpringVec.normalize( m_length );
				
				var forceX:Number = - m_k * ( springVecX - normalSpringVec.x );
				var forceY:Number = - m_k * ( springVecY - normalSpringVec.y );
				
				m_particle1.AddForce( forceX, forceY );
				m_partielc2.AddForce( -forceX, -forceY );
				
				calculateDamp();
			}
		}
		
		
		/**
		 * @desc	setter of the dampK
		 */
		public function set DAMP_K( value:Number ):void	{ m_dampK = value; }
		
		
		/**
		 * @desc	setter of the k
		 */
		public function set K( value:Number ):void { m_k = value }
		
		
		/**
		 * @desc	setter of the length
		 */
		public function set LENGTH( value:Number ):void	{ m_length = value }
		
		
		/**
		 * @desc	setter of the particle
		 */
		public function set PARTICLE1( value:Particle ):void { m_particle1 = value;	}
		public function set PARTICLE2( value:Particle ):void { m_partielc2 = value;	}
		
		
		/**
		 * @desc	release two particles
		 */
		public function Release():void
		{
			m_particle1 = null;
			m_particle2 = null;
		}
		
		//------------------------------ private function ----------------------------------
		
		// calculate damp
		protected function calculateDamp():void
		{
			var speedSubX:Number = m_partielc2.VELOCITY.x - m_particle1.VELOCITY.x;
			var speedSubY:Number = m_partielc2.VELOCITY.y - m_particle1.VELOCITY.y;
			
			var forceX:Number = m_dampK * speedSubX;
			var forceY:Number = m_dampK * speedSubY;
			
			m_particle1.AddForce( forceX, forceY );
			m_particle2.AddForce( -forceX, -forceY );
		}
		
		//------------------------------- event callback -----------------------------------
		
	}

}