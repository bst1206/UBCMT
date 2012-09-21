package stackbaek.ubcmt.services
{
	import mx.collections.ArrayCollection;
	
	import stackbaek.ubcmt.models.vos.CustomerVO;

	public interface IDatabaseService
	{
		function init():void;
		function addCustomer(customer:CustomerVO):void;
		function getCustomerList():ArrayCollection;
	}
}