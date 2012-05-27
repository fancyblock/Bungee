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
		
		protected var m_isFixed:Boolean = false;
		
		protected var m_position:Point = null;
		protected var m_oldPosition:Point = null;
		
		//------------------------------ public function -----------------------------------
		
		/**
		 * @desc	constructor of Particle
		 */
		public function Particle() 
		{
			m_position = new Point();
			m_oldPosition = new Point();
		}
		
		
		/**
		 * @desc	update the position & velocity according to the force to this particle
		 */
		public function Update():void
		{
			if ( m_isFixed )
			{
				return;
			}
			
			var tempX:Number = m_position.x;
			var tempY:Number = m_position.y;
			
			m_position.x += this.VELOCITY_X;
			m_position.y += this.VELOCITY_Y;
			
			m_oldPosition.x = tempX;
			m_oldPosition.y = tempY;
		}
		
		
		/**
		 * @desc	set this is a fixed particle or not
		 * @param	value
		 */
		public function SetFix( value:Boolean ):void
		{
			m_isFixed = value;
		}
		
		
		/**
		 * @desc	return if this particle is fixed or not
		 * @return
		 */
		public function IsFix():Boolean
		{
			return m_isFixed;
		}
		
		
		/**
		 * @desc	getter & setter of the velocity
		 */
		public function get VELOCITY_X():Number { return m_position.x - m_oldPosition.x; }
		public function get VELOCITY_Y():Number { return m_position.y - m_oldPosition.y; }
		public function set VELOCITY_X( value:Number ):void { m_oldPosition.x = m_position.x - value; }
		public function set VELOCITY_Y( value:Number ):void { m_oldPosition.y = m_position.y - value; }
		
		
		/**
		 * @desc	set the position of this particle
		 * @param	x
		 * @param	y
		 */
		public function SetPosition( x:Number, y:Number ):void
		{
			m_oldPosition.x = m_position.x = x;
			m_oldPosition.y = m_position.y = y;
		}
		
		
		/**
		 * @desc	getter of this particle
		 */
		public function get POSITION():Point { return m_position; }
		
		//------------------------------ private function ----------------------------------
		
		//------------------------------- event callback -----------------------------------
		
	}

}