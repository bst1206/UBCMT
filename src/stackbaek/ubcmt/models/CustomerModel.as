package stackbaek.ubcmt.models
{
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Actor;
	
	import stackbaek.ubcmt.events.CustomerModelEvent;
	
	public class CustomerModel extends Actor
	{
		// ------- attributes --------
		private var _customerList:ArrayCollection;
		public function get customerList():ArrayCollection
		{
			return _customerList;
		}
		public function set customerList(value:ArrayCollection):void
		{
			_customerList = value;
			dispatch(new CustomerModelEvent(CustomerModelEvent.CUSTOMER_LIST_CHANGED));
		}

		// ------- Constructor -------
		public function CustomerModel()
		{
			super();
		}
	}
}