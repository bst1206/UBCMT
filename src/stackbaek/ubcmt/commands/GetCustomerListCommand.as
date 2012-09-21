package stackbaek.ubcmt.commands
{
	import org.robotlegs.mvcs.Command;
	
	import stackbaek.ubcmt.events.CustomerModelEvent;
	import stackbaek.ubcmt.models.CustomerModel;
	import stackbaek.ubcmt.services.IDatabaseService;
	
	
	public class GetCustomerListCommand extends Command
	{
		[Inject]
		public var event:CustomerModelEvent;
		
		[Inject]
		public var model:CustomerModel;
		
		[Inject]
		public var databaseService:IDatabaseService;
		
		// ------- constructor -------
		public function GetCustomerListCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			model.customerList = databaseService.getCustomerList();
		}
	}
	
}