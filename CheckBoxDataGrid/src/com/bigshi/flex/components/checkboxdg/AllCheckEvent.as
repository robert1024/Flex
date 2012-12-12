package com.bigshi.flex.components.checkboxdg
{
	import flash.events.Event;

	public class AllCheckEvent extends Event
	{
		public static const ALLCHECK:String = "allcheck";
		public var allchecked:Boolean;
		public function AllCheckEvent(type:String, allchecked:Boolean,bubbles:Boolean=false)
		{
			super(type, bubbles);
			this.allchecked = allchecked;
		}
		
		override public function clone():Event{
			return new AllCheckEvent(type,allchecked);
		}
	}
}