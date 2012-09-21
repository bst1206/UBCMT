package stackbaek.ubcmt.commands
{
	import org.robotlegs.mvcs.Command;
	
	import stackbaek.ubcmt.events.ApplicationBootstrapEvent;
	import stackbaek.ubcmt.services.DatabaseService;
	import stackbaek.ubcmt.services.IDatabaseService;
	
	public class InitServicesCommand extends Command
	{
		[Inject]
		public var event:ApplicationBootstrapEvent;
		
		[Inject]
		public var dbService:IDatabaseService;
		
		public function InitServicesCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			dbService.init();
		}
	}
}