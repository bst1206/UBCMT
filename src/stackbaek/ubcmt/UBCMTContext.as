package stackbaek.ubcmt
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.mvcs.Context;
	
	import stackbaek.ubcmt.commands.AddCustomerCommand;
	import stackbaek.ubcmt.commands.GetCustomerListCommand;
	import stackbaek.ubcmt.commands.InitServicesCommand;
	import stackbaek.ubcmt.events.ApplicationBootstrapEvent;
	import stackbaek.ubcmt.events.CustomerModelEvent;
	import stackbaek.ubcmt.models.CustomerModel;
	import stackbaek.ubcmt.services.DatabaseService;
	import stackbaek.ubcmt.services.IDatabaseService;
	import stackbaek.ubcmt.views.CustomerListView;
	import stackbaek.ubcmt.views.mediators.CustomerListViewMediator;
	
	public class UBCMTContext extends Context
	{
		public function UBCMTContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void
		{
			trace("UBCMTContext:startup(): application mediated");
			
			// ------- mediator map -------
			mediatorMap.mapView(CustomerListView, CustomerListViewMediator);
			
			// ------- command map -------
			commandMap.mapEvent(ApplicationBootstrapEvent.CONTEXT_STARTUP_COMPLETE, InitServicesCommand, ApplicationBootstrapEvent);
			
			commandMap.mapEvent(CustomerModelEvent.ADD_CUSTOMER, AddCustomerCommand, CustomerModelEvent);
			commandMap.mapEvent(CustomerModelEvent.GET_CUSTOMER_LIST, GetCustomerListCommand, CustomerModelEvent);
//			commandMap.mapEvent(CustomerModelEvent.CUSTOMER_LIST_CHANGED, 
				
			// ------- model map -------
			injector.mapSingleton(CustomerModel);
				
			// ------- service map -------
			injector.mapSingletonOf(IDatabaseService, DatabaseService);
			
			
			dispatchEvent(new ApplicationBootstrapEvent(ApplicationBootstrapEvent.CONTEXT_STARTUP_COMPLETE));
		}
	}
}