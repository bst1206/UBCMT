package stackbaek.ubcmt.commands
{
	import org.robotlegs.mvcs.Command;
	
	import stackbaek.ubcmt.events.CustomerModelEvent;
	import stackbaek.ubcmt.models.CustomerModel;
	import stackbaek.ubcmt.services.IDatabaseService;
	
	public class AddCustomerCommand extends Command
	{
		[Inject]
		public var event:CustomerModelEvent;
		
		[Inject]
		public var service:IDatabaseService;
		
		public function AddCustomerCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			service.addCustomer(event.customer);
		}
	}
}