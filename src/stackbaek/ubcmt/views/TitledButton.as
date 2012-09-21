package stackbaek.ubcmt.views
{
	import spark.components.Button;
	import spark.components.Label;
	
	public class TitledButton extends Button
	{
		[SkinPart]
		public var titleLbl:Label;
		[SkinPart]
		public var textLbl:Label;
		
		[Bindable]
		public var title:String;
		[Bindable]
		public var text:String;
	
		public function TitledButton()
		{
			super();
		}
		
		override protected function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName,instance);
			if(instance === titleLbl)
			{
				titleLbl.text = title;  
			}
			if(instance === textLbl)
			{
				textLbl.text = text;    
			}
		}
	}
}