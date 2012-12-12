package com.bigshi.flex.components.checkboxdg
{
	import mx.collections.ArrayCollection;
	import mx.controls.dataGridClasses.DataGridColumn;

	[Event(name="click",type="falsh.events.MoustEvent")]
	public class CheckBoxHeaderColumn extends DataGridColumn
	{
		public function CheckBoxHeaderColumn(columnName:String=null)
		{
			super(columnName);
		}
		public var selected:Boolean=false;
		public var selectedItems:ArrayCollection = new ArrayCollection();
	}
}