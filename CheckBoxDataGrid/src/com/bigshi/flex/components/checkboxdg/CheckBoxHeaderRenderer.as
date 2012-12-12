package com.bigshi.flex.components.checkboxdg
{
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import com.bigshi.flex.components.checkboxdg.CheckBoxHeaderColumn;
	import com.bigshi.flex.components.checkboxdg.AllCheckEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.CheckBox;
	import mx.controls.DataGrid;
	import mx.events.DataGridEvent;

	public class CheckBoxHeaderRenderer extends CheckBox
	{
		public function CheckBoxHeaderRenderer()
		{
			super();
			this.label="";
		}
		private var _data:CheckBoxHeaderColumn;
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void{
			   super.updateDisplayList(unscaledWidth, unscaledHeight);
			   var n:int = numChildren;
			   for(var i:int = 0; i < n; i++){ 
				    var c:DisplayObject = getChildAt(i);
				    if(!(c is TextField)){
					     c.x = Math.round((unscaledWidth - c.width) / 2);    
					     c.y = Math.round((unscaledHeight - c.height) /2 );    
				    }
			   }
		  }
		
		override public function get data():Object{
			return _data;
		}
		
		override public function set data(value:Object):void{
			_data = value as CheckBoxHeaderColumn;
			DataGrid(listData.owner).addEventListener(DataGridEvent.HEADER_RELEASE,sortEventHandler);
			DataGrid(listData.owner).addEventListener("allcheck",allCheckHandler);
			selected = _data.selected;
		}
		
		private function sortEventHandler(event:DataGridEvent):void{
			if(event.itemRenderer==this)event.preventDefault();
		}
		
		override protected function clickHandler(event:MouseEvent):void{
			trace("clickHandler");
			super.clickHandler(event);
			_data.selected = selected;
			_data.dispatchEvent(event);
			var dg:DataGrid = DataGrid(listData.owner); 
			var dgp:ArrayCollection = dg.dataProvider as ArrayCollection;
			var column:CheckBoxHeaderColumn = dg.columns[listData.columnIndex];
			if(this.selected){
				column.selectedItems.removeAll();
				copyDG(column.selectedItems,dgp);
			}else{
				column.selectedItems.removeAll();
			}
			if(dgp.length==0){
				this.selected = !selected;
			}
		}
		
		public function allCheckHandler(event:AllCheckEvent):void{
			trace("allcheck");
			selected = event.allchecked;
		}
		
		private static function copyDG(dest:ArrayCollection,source:ArrayCollection):void{
			for each (var obj:Object in source){
				dest.addItem(obj);
			}
		}
	}
}