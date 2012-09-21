package stackbaek.util
{
	import stackbaek.ubcmt.models.vos.CustomerVO;

	public class SQLHelper
	{
		public static function toValuesClause(customer:CustomerVO):String
		{
			var result:String = "VALUES (";
			
			result += "'" + customer.firstName + "',";
			result += "'" + customer.lastName + "',";
			result += "'" + customer.companyName + "',";
			result += "'" + customer.physicalAddressStreet + "',";
			result += "'" + customer.physicalAddressCity + "',";
			result += "'" + customer.physicalAddressState + "',";
			result += "'" + customer.physicalAddressZip + "',";
			result += "'" + customer.billingAddressStreet + "',";
			result += "'" + customer.billingAddressCity + "',";
			result += "'" + customer.billingAddressState + "',";
			result += "'" + customer.billingAddressZip + "',";
			result += "'" + customer.contactPhone + "',";
			result += "'" + customer.workPhone + "',";
			result += "'" + customer.email + "',";
			result += "'" + customer.machineModelNum + "',";
			result += "'" + customer.machineSerialNum + "',";
			result += "current_timestamp,";
			result += "'" + customer.note + "'";
			
			result += ");";
			return result;
		}
	}
}