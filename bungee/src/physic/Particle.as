package physic 
{
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class Particle 
	{
		//------------------------------ static member -------------------------------------
		
		//------------------------------ private member ------------------------------------
		
		protected var m_mass:Number = 1;					// mass muse be not zero
		protected var m_interval:Number = 0.1;
		protected var m_isFixed:Boolean = false;
		
		protected var m_position:Point = null;
		protected var m_velocity:Point = null;
		protected var m_force:Point = null;
		
		//------------------------------ public function -----------------------------------
		
		/**
		 * @desc	constructor of Particle
		 */
		public function Particle() 
		{
			m_position = new Point();
			m_velocity = new Point();
			m_force = new Point();
		}
		
		
		/**
		 * @desc	update the position & velocity according to the force to this particle
		 */
		public function Update():void
		{
			if ( m_isFixed )
			{
				m_force.x = 0;
				m_force.y = 0;
				
				return;
			}
			
			// calculate the acceleration according to the Newton's second law ( F = ma )
			var acceX:Number = m_force.x / m_mass;
			var acceY:Number = m_force.y / m_mass;
			
			// calculate the velocity
			m_velocity.x += m_interval * acceX;
			m_velocity.y += m_interval * acceY;
			
			// calculate the position
			m_position.x += m_velocity.x * m_interval;
			m_position.y += m_velocity.y * m_interval;
			
			// clean the force
			m_force.x = 0;
			m_force.y = 0;
			
		}
		
		
		/**
		 * @desc	getter & setter of the MASS
		 */
		public function set MASS( value:Number ):void {	m_mass = value;s	}
		public function get MASS() { return m_mass; }
		
		
		/**
		 * @desc	getter & setter of the INTERVAL
		 */
		public function set INTERVAL( value:Number ):void {	m_interval = value;	}
		public function get INTERVAL() { return m_interval; }
		
		
		/**
		 * @desc	set this is a fixed particle or not
		 * @param	value
		 */
		public function SetFix( value:Boolean ):void
		{
			m_isFixed = value;
		}
		
		
		/**
		 * @desc	return the velocity of this particle
		 */
		public function get VELOCITY():Point {	return m_velocity; }
		
		
		/**
		 * @desc	add force to this particle
		 * @param	x
		 * @param	y
		 */
		public function AddForce( x:Number, y:Number ):void
		{
			m_force.x += x;
			m_force.y += y;
		}
		
		
		/**
		 * @desc	set the position of this particle
		 * @param	x
		 * @param	y
		 */
		public function SetPosition( x:Number, y:Number ):void
		{
			m_position.x = x;
			m_position.y = y;
		}
		
		
		/**
		 * @desc	getter of this particle
		 */
		public function get POSITION():Point { return m_position; }
		
		//------------------------------ private function ----------------------------------
		
		//------------------------------- event callback -----------------------------------
		
	}

}