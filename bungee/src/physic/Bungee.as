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
		
		protected var m_externalForce:Point = null;
		
		//------------------------------ public function -----------------------------------
		
		/**
		 * @desc	constructor of Bungee
		 */
		public function Bungee() 
		{
			m_particles = new Vector.<Particle>();
			m_springs = new Vector.<Spring>();
			
			m_externalForce = new Point();
		}
		
		
		/**
		 * @desc	create the bungee
		 * @para	particle count
		 * @para	spring length
		 * @return	none
		 * */
		public function Create( particleCnt:int, springLen:Number, mass:Number = 1, k:Number = 5, dampK:Number = 1, interval:Number = 0.1 ):void
		{
			for( var i:int = 0; i < particleCnt; i++ )
			{
				var particle:Particle = new Particle();
				particle.MASS = mass;
				particle.INTERVAL = interval;
				m_particles.push( particle );
				
				// install the spring
				if( i > 0 )
				{
					var spring:Spring = new Spring();
					m_springs.push( spring );
					
					spring.LENGTH = springLen;
					spring.K = k;
					spring.DAMP_K = k;
					spring.PARTICLE1 = m_particles[i-1];
					spring.PARTICLE2 = m_particles[i];
				}
			}
		}
		
		
		/**
		 * @desc	set endpoint position
		 * @para	index
		 * @para	x
		 * @para	y
		 * @return	none
		 **/
		public function SetEndpointPos( index:int, x:Number, y:Number ):void
		{
			if( index < 0 || index >= m_particles.length )
			{
				return;
			}
			
			var particle:Particle = m_particles[index];
			
			particle.SetFix( true );
			particle.SetPosition( x, y );
		}
		
		
		/**
		 * @desc	getter of the particle list
		 **/
		public function get PARTICLE_LIST():Vector.<Particle>
		{
			return m_particles;
		}
		
		
		/**
		 * @desc	set the external force
		 * @para	x
		 * @para	y
		 * @return	none
		 **/
		public function SetExternForce( x:Number, y:Number ):void
		{
			m_externalForce.x = x;
			m_externalForce.y = y;
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
				m_particles[i].AddForce( m_externalForce.x, m_externalForce.y );
				m_particles[i].Update();
			}
			
		}
		
		//------------------------------ private function ----------------------------------
		
		//------------------------------- event callback -----------------------------------
		
	}

}