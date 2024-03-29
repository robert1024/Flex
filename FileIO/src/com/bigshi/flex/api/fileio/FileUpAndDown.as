import flash.events.Event;
import flash.net.FileFilter;
import flash.net.FileReference;
import flash.net.URLRequest;
import flash.net.URLRequestMethod;
import flash.utils.ByteArray;

import mx.collections.ArrayCollection;

	private var fileRef:FileReference;

	private var fileData:ByteArray=new ByteArray();

	[Bindable]
	private var dp:ArrayCollection = new ArrayCollection();

	private function handleBrowseClick():void{
		var csvTypes:FileFilter = new FileFilter("CSV Files(*.csv)","*.csv");
		var allTypes:Array = new Array(csvTypes);
		fileRef = new FileReference();
		fileRef.browse(allTypes);
		fileRef.addEventListener(Event.SELECT,selectHandler);
	}

	private function selectHandler(event:Event):void{
		fileRef.load();
		fileRef.addEventListener(Event.COMPLETE,onLoadComplete);
	}

	private function onLoadComplete(event:Event):void{
		fileData= fileRef.data;
		fname_lb.text = fileRef.name;
		fsize_lb.text = fileRef.size+"";
		trace(fileData);
	}

	private function handleSaveClick():void{
		var fl:FileReference = new FileReference();
		fl.save(fileData.toString(),"abc");
	}

	private function handleDisplayClick():void{
		var result:String = new String(fileData);
		var lines:Array = result.split("\r\n");
		dp.removeAll();
		trace(lines.length);
		for(var i:int=0;i<lines.length;i++){
			//trace(lines[i]);
			var obj:Object = new Object();
			var fields:Array = lines[i].split(",");
			if(fields.length==1){
				break;
			}
			obj.ip = fields[0];
			obj.name = fields[1];
			obj.size= fields[2];
			obj.pp = fields[3];
			dp.addItem(obj);
		}
		dp.refresh();
	}
