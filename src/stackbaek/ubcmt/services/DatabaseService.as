package stackbaek.ubcmt.services
{
	import flash.data.SQLConnection;
	import flash.data.SQLStatement;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.events.TimerEvent;
	import flash.filesystem.File;
	import flash.utils.Timer;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import org.robotlegs.mvcs.Actor;
	
	import stackbaek.ubcmt.events.ApplicationBootstrapEvent;
	import stackbaek.ubcmt.events.CustomerModelEvent;
	import stackbaek.ubcmt.models.CustomerModel;
	import stackbaek.ubcmt.models.vos.CustomerVO;
	import stackbaek.util.SQLHelper;
	
	
	public class DatabaseService extends Actor implements IDatabaseService
	{
		[Inject]
		public var model:CustomerModel;
		
		
		private var conn:SQLConnection = new SQLConnection();
		private var stmt:SQLStatement = new SQLStatement();
		public var result:ArrayCollection = new ArrayCollection();

		// ------- SQL Statements -------
		[Embed(source="/sql/CreateCustomerTable.sql", mimeType="application/octet-stream")]
		private static const CreateCustomerTableText:Class;
		private static const CREATE_CUSTOMER_TABLE_SQL:String = new CreateCustomerTableText();
		
		[Embed(source="/sql/AddCustomer.sql", mimeType="application/octet-stream")]
		private static const AddCustomerText:Class;
		private static const ADD_CUSTOMER_SQL:String = new AddCustomerText();
		
		
		// ------- constructor -------
		public function DatabaseService()
		{
			super();
		}
		
		public function getCustomerList():ArrayCollection
		{
			return null;
		}
		
		public function addCustomer(customer:CustomerVO):void
		{
			stmt.text = ADD_CUSTOMER_SQL + SQLHelper.toValuesClause(customer);
			stmt.execute();
			
			refresh();
		}
		
		private function remove():void
		{
			// sql statment to delete from our test_table the row that has the same number in number column as our selected row from datagrid
//			stmt.text = "DELETE FROM test_table WHERE id="+dp[dg.selectedIndex].id;
			stmt.execute();
			refresh();
		}
		
		
		public function init():void
		{
			var db:File = File.applicationStorageDirectory.resolvePath("customer.db");
			trace(db.nativePath);
			conn.openAsync(db);
			conn.addEventListener(SQLEvent.OPEN, db_opened);
			conn.addEventListener(SQLErrorEvent.ERROR, onError);
			stmt.addEventListener(SQLErrorEvent.ERROR, onError);
			stmt.addEventListener(SQLEvent.RESULT, onResult);
			
			//broadcast that it has been initialized
			dispatch(new ApplicationBootstrapEvent(ApplicationBootstrapEvent.DBSERVICE_INIT_COMPLETE));
		}
		
		
		// ------- event listeners -------
		private function db_opened(e:SQLEvent):void
		{
			stmt.sqlConnection = conn;
			stmt.text = CREATE_CUSTOMER_TABLE_SQL;
			stmt.execute();
			refresh();
		}
		
		
		// function to call when we want to refresh the data in datagrid
		private function refresh(e:TimerEvent = null):void
		{
			// timer object which we need if sql statment is still executing so that we can try again after 10 milliseconds.
			var timer:Timer = new Timer(10,1);
			timer.addEventListener(TimerEvent.TIMER, refresh);
			
			if ( !stmt.executing )
			{
				stmt.text = "SELECT * FROM CUSTOMER_TABLE";
				stmt.execute();
			}
			else
			{
				timer.start();
			}
		}
		
		private function onResult(e:SQLEvent):void
		{
			// with sqls.getResault().data we get the array of objects for each row out of our database
			var data:Array = stmt.getResult().data;
			result = new ArrayCollection(data);
			model.customerList = result;
		}
		
		private function onError(e:SQLErrorEvent):void
		{
			Alert.show(e.toString());
		}
		
	}
	
	
	
}