package com.bigshi.flex.components.checkboxdg
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import com.bigshi.flex.components.checkboxdg.CheckBoxHeaderColumn;
	import com.bigshi.flex.components.checkboxdg.AllCheckEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.CheckBox;
	import mx.controls.DataGrid;

	public class CheckBoxItemRenderer extends CheckBox
	{
		public function CheckBoxItemRenderer()
		{
			super();
			this.addEventListener(Event.CHANGE,itemClickHandler);
		} 
		
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
		
		override public function validateProperties():void{
			super.validateProperties();
			if(listData){
				var dg:DataGrid = DataGrid(listData.owner);
				var column:CheckBoxHeaderColumn = dg.columns[listData.columnIndex];
				column.addEventListener("click",columnHeaderClickHandler);
				//selected = data[column.dataField];
			}
		}
		
		private function columnHeaderClickHandler(event:MouseEvent):void{
			selected = event.target.selected;
		}
		
		private var currentData:Object;
		override public function set data(value:Object):void{
			   this.currentData = value; 
		  }
		
		private function itemClickHandler(event:Event):void{
			var dg:DataGrid = DataGrid(listData.owner); 
			var dgp:ArrayCollection = dg.dataProvider as ArrayCollection;
			var column:CheckBoxHeaderColumn = dg.columns[listData.columnIndex];
			this.currentData.isSelected = this.selected; 
			var itemIndex:int = column.selectedItems.getItemIndex(currentData);
			if(this.selected){//select current checkbox(row)
				if(itemIndex==-1){
					column.selectedItems.addItem(currentData);
					if(column.selectedItems.length==dgp.length){
						this.dispatchEvent(new AllCheckEvent("allcheck",true,true));
					}
				}
			}else{//dis-select current row
				if(itemIndex>-1){
					column.selectedItems.removeItemAt(itemIndex);
					if(column.selectedItems.length<dgp.length){
						this.dispatchEvent(new AllCheckEvent("allcheck",false,true));
					}
				}
			}
		}
		
	}
}