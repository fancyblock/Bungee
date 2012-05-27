package physic 
{
	import flash.geom.Point;

	/**
	 * ...
	 * @author Hejiabin
	 */
	public class Bungee 
	{
		//------------------------------ static member -------------------------------------
		
		//------------------------------ private member ------------------------------------
		
		protected var m_particles:Vector.<Particle> = null;
		protected var m_springs:Vector.<Spring> = null;
		
		//------------------------------ public function -----------------------------------
		
		/**
		 * @desc	constructor of Bungee
		 */
		public function Bungee() 
		{
			m_particles = new Vector.<Particle>();
			m_springs = new Vector.<Spring>();
		}
		
		
		/**
		 * @desc	create the bungee
		 * @para	particle count
		 * @para	spring length
		 * @return	none
		 * */
		public function Create( startPos:Point, endPos:Point, number:int ):void
		{
			var dx:Number = ( endPos.x - startPos.x ) / Number(number-1);
			var dy:Number = ( endPos.y - startPos.y ) / Number(number-1);
			
			for( var i:int = 0; i < number; i++ )
			{
				var particle:Particle = new Particle();
				particle.SetPosition( startPos.x + dx * i , startPos.y + dy * i );
				m_particles.push( particle );
				
				// install the spring
				if( i > 0 )
				{
					var spring:Spring = new Spring( m_particles[i-1], m_particles[i] );
					m_springs.push( spring );
				}
			}
		}
		
		
		/**
		 * @desc	set endpoint fix or not
		 * @param	index
		 * @param	isFix
		 */
		public function SetEndpointFix( index:int, isFix:Boolean ):void
		{
			if( index < 0 || index >= m_particles.length )
			{
				return;
			}
			
			var particle:Particle = m_particles[index];
			
			particle.SetFix( isFix );
		}
		
		
		/**
		 * @desc	getter of the particle list
		 **/
		public function get PARTICLE_LIST():Vector.<Particle>
		{
			return m_particles;
		}
		
		
		/**
		 * @desc	update the whole bungee
		 */
		public function Update():void
		{
			var i:int;
			
			for( i = 0; i < m_springs.length; i++ )
			{
				m_springs[i].Update();
			}
			
			for( i = 0; i < m_particles.length; i++ )
			{	
				m_particles[i].Update();
			}
			
		}
		
		//------------------------------ private function ----------------------------------
		
		//------------------------------- event callback -----------------------------------
		
	}

}