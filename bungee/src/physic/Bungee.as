package physic 
{
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
		 * @desc	update the whole bungee
		 */
		public function Update():void
		{
			//TODO 
		}
		
		//------------------------------ private function ----------------------------------
		
		//------------------------------- event callback -----------------------------------
		
	}

}