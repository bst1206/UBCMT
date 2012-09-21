package stackbaek.ubcmt.models
{
	public class Globals
	{
		public var appWidth:Number;
		public var appHeight:Number;
		
		// ------- instance -------
		private static const _instance:Globals = new Globals(SingletonLock);
		
		public function Globals(lock:Class)
		{
			if( lock != SingletonLock)
			{
				throw new Error("invalid use of singleton. use Globals.instance");
			}
		}
		
		public static function get instance():Globals
		{
			return _instance;
		}
	}
}

class SingletonLock
{
	
}