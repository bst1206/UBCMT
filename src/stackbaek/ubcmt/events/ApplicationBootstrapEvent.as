package stackbaek.ubcmt.events
{
	import flash.events.Event;
	
	public class ApplicationBootstrapEvent extends Event
	{
		public static const CONTEXT_STARTUP_COMPLETE:String = "ApplicationEvent.contextStartupComplete";
		public static const DBSERVICE_INIT_COMPLETE:String = "ApplicationEvent.dbserviceInitComplete";
		
		public function ApplicationBootstrapEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function  clone():Event
		{
			return new ApplicationBootstrapEvent(type, bubbles, cancelable);
		}
	}
}