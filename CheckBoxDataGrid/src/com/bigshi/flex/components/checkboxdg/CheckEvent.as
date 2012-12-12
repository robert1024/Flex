package com.bigshi.flex.components.checkboxdg
{
	import flash.events.Event;

	public class CheckEvent extends Event
	{
		
		public static const CHECK:String = "check";
		public var checked:Boolean;
		public function CheckEvent(type:String,checked:Boolean, bubbles:Boolean=false)
		{
			super(type, bubbles);
			this.checked = checked;
		}
		
		override public function clone():Event{
			return new CheckEvent(type,checked);
		}
		
	}
}