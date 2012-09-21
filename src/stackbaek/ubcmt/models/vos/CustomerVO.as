package stackbaek.ubcmt.models.vos
{
	import flash.events.Event;
	
	
	public class CustomerVO
	{
		//name
		public var firstName:String;
		public var lastName:String;
		
		//contact info
		public var companyName:String;
		public var physicalAddressStreet:String;
		public var physicalAddressCity:String;
		public var physicalAddressState:String;
		public var physicalAddressZip:String;
		
		public var billingAddressStreet:String;
		public var billingAddressCity:String;
		public var billingAddressState:String;
		public var billingAddressZip:String;
		
		public var contactPhone:String;
		public var workPhone:String;
		public var email:String;
		
		//related machine info
		public var machineModelNum:String;
		public var machineSerialNum:String; //can be up to 14 digits
		
		
		//update info
		public var lastUpdated:Date;
		
		//notes
		public var note:String; //wants to be up to 100 chars
		
	}
	
	
	
}