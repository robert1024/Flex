import mx.collections.ArrayCollection;
import mx.utils.StringUtil;
	
	[Bindable]
	private var cbxData:ArrayCollection;

	private function onCreationComplete():void{
		cbxData = new ArrayCollection([
					{name:"Alice",age:20},
					{name:"Bob",age:32}
				]);
	}

	private function cbxLabelFunc(item:Object):String{
		return item.name+"";
		//return StringUtil.substitute("A","a");
	}

	private function onChange():void{
	}