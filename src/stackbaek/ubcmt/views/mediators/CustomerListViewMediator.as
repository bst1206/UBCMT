package stackbaek.ubcmt.views.mediators
{
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Mediator;
	
	import stackbaek.ubcmt.events.ApplicationBootstrapEvent;
	import stackbaek.ubcmt.events.CustomerModelEvent;
	import stackbaek.ubcmt.models.CustomerModel;
	import stackbaek.ubcmt.views.CustomerListView;
	
	public class CustomerListViewMediator extends Mediator
	{
		[Inject]
		public var view:CustomerListView;
		
		[Inject]
		public var model:CustomerModel;
		
		public function CustomerListViewMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			trace("CustomerListViewMediator:onRegister - CustomerListView mediated");
	
			//viewListners
			addViewListener(CustomerModelEvent.GET_CUSTOMER_LIST, dispatchEvent);
			addViewListener(CustomerModelEvent.ADD_CUSTOMER, dispatchEvent, CustomerModelEvent);
			
			//contextListeners
			addContextListener(ApplicationBootstrapEvent.DBSERVICE_INIT_COMPLETE, _onDBserviceInitComplete, ApplicationBootstrapEvent);
			addContextListener(CustomerModelEvent.CUSTOMER_LIST_CHANGED, _onCustomerModel_CustomerListChanged);
		
		}
		

		// ------- event handlers -------
		private function dispatchEvent(event:Event):void
		{
			trace(event);
			dispatch(event);
		}
		
		private function _onDBserviceInitComplete(event:ApplicationBootstrapEvent):void
		{
			//once database connection is initialized, go fetch customerList
			dispatch(new CustomerModelEvent(CustomerModelEvent.GET_CUSTOMER_LIST));
		}
		
		private function _onCustomerModel_CustomerListChanged(event:CustomerModelEvent):void
		{
			view.dg.dataProvider = model.customerList;
		}
		
	
	}
}