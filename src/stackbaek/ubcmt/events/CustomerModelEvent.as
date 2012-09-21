package stackbaek.ubcmt.events
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import stackbaek.ubcmt.models.vos.CustomerVO;
	
	public class CustomerModelEvent extends Event
	{
		public static const ADD_CUSTOMER:String = "CustomerModelEvent.addCustomer";
		public static const GET_CUSTOMER_LIST:String = "CustomerModelEvent.getCustomerList";
		
		public static const CUSTOMER_LIST_CHANGED:String = "CustomerModelEvent:customerListChanged";
		
		private var _customer:CustomerVO;
		private var _customerList:ArrayCollection;
		
		public function CustomerModelEvent(type:String, customer:CustomerVO = null, customerList:ArrayCollection = null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_customer = customer;
			_customerList = customerList;
		}
		
		override public function clone():Event
		{
			return new CustomerModelEvent(type, _customer, _customerList, bubbles, cancelable);
		}
		
		
		// ------- getters -------
		public function get customer():CustomerVO
		{
			return _customer;
		}
		public function get customerList():ArrayCollection
		{
			return _customerList;
		}
	}
}