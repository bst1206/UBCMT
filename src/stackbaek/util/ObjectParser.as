package stackbaek.util
{
	import stackbaek.ubcmt.models.vos.CustomerVO;
	import stackbaek.ubcmt.views.components.CustomerDetailWindow;

	public class ObjectParser
	{
		public static function toCustomerVO(object:Object):CustomerVO
		{
			var customer:CustomerVO = new CustomerVO;
			
			if(object)
			{
				customer.billingAddressCity = object.billingAddrCity;
				customer.billingAddressState = object.billingAddrState;
				customer.billingAddressStreet = object.billingAddrStreet;
				customer.billingAddressZip = object.billingAddrZip;
				customer.physicalAddressCity = object.physicalAddrCity;
				customer.physicalAddressState = object.physicalAddrState;
				customer.physicalAddressStreet = object.physicalAddrStreet;
				customer.physicalAddressZip = object.physicalAddrZip;
				customer.workPhone = object.workPhone;
				customer.companyName = object.companyName;
				customer.contactPhone = object.contactPhone;
				customer.email = object.email;
				customer.firstName = object.firstname;
				customer.lastName = object.lastname;
				customer.lastUpdated = object.lastUpdated;
				customer.machineModelNum = object.machineModelNum;
				customer.machineSerialNum = object.machineSerialNum;
				customer.note = object.notes;
			}
			
			return customer;
			
		}
	}
}