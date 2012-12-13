import flash.events.Event;
import flash.net.FileFilter;
import flash.net.FileReference;
import flash.utils.ByteArray;

	private var fileRef:FileReference;

	[Bindable]
	private var filename:String="";
	[Bindable]
	private var filesize:String="";

	private function handleBrowseClick():void{
		var csvTypes:FileFilter = new FileFilter("CSV Files(*.csv)","*.csv");
		var allTypes:Array = new Array(csvTypes);
		fileRef = new FileReference();
		fileRef.browse(allTypes);
		fileRef.addEventListener(Event.SELECT,selectHandler);
	}

	private function selectHandler(event:Event):void{
		filename = fileRef.name;
		fileRef.addEventListener(Event.COMPLETE,onLoadComplete);
	}

	private function onLoadComplete(event:Event):void{
		var data:ByteArray = event.target.data as ByteArray;
		trace("onLoadComplete");
		filesize = data.length+"";
	}