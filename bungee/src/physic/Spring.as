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
		
		protected var m_particle1:Particle = null;
		protected var m_particle2:Particle = null;
		
		protected var m_length:Number = 1;
		
		//------------------------------ public function -----------------------------------
		
		/**
		 * @desc	constructor of Spring
		 */
		public function Spring( particle1:Particle, particle2:Particle, length:Number = -1 )
		{
			m_particle1 = particle1;
			m_particle2 = particle2;
			
			if ( length < 0 )
			{
				var pt:Point = new Point( m_particle1.POSITION.x - m_particle2.POSITION.x, 
											m_particle2.POSITION.y - m_particle2.POSITION.y );

				m_length = pt.length;
			}
			else
			{
				m_length = length;
			}
		}
		
		
		/**
		 * @desc	calculate the force to the two particles
		 * @return	none
		 */
		public function Update():void
		{
			if ( m_particle1 != null && m_particle2 != null )
			{
				var dx:Number = m_particle2.POSITION.x - m_particle1.POSITION.x;
				var dy:Number = m_particle2.POSITION.y - m_particle1.POSITION.y;
				var dist:Number = Math.sqrt(dx * dx + dy * dy);
				var diff:Number = m_length - dist;
				
				var offsetX:Number = (diff * dx / dist) * 0.5;
				var offsetY:Number = (diff * dy / dist) * 0.5;
				
				if ( m_particle1.IsFix() == false )
				{
					m_particle1.POSITION.x -= offsetX;
					m_particle1.POSITION.y -= offsetY;
				}
				
				if ( m_particle2.IsFix() == false )
				{
					m_particle2.POSITION.x += offsetX;
					m_particle2.POSITION.y += offsetY;
				}
			}
		}
		
		
		/**
		 * @desc	setter of the length
		 */
		public function set LENGTH( value:Number ):void	{ m_length = value }
		
		
		/**
		 * @desc	release two particles
		 */
		public function Release():void
		{
			m_particle1 = null;
			m_particle2 = null;
		}
		
		//------------------------------ private function ----------------------------------
		
		//------------------------------- event callback -----------------------------------
		
	}

}