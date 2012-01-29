package
{
	import org.flixel.*;
	
	public class EventManager
	{
		private var eventMap : Object;
		private static var thisObj : EventManager = null;
		
		public function EventManager()
		{
			eventMap = new Object();
		}
		
		public static function getInstance() : EventManager
		{
			if(thisObj)
			{
				return thisObj;
			}
			else
			{
				thisObj = new EventManager();
				return thisObj;
			}
		}
		
		public function SubscribeToEvent(eventName : String, subscriber : Function ) : void
		{
			if(!eventMap.hasOwnProperty(eventName))
			{
				eventMap[eventName] = new Array();
				(eventMap[eventName] as Array).push(subscriber);
			}
			else
			{
				(eventMap[eventName] as Array).push(subscriber);
			}
		}
		
		public function TriggerEvent(eventName : String, att : Object) : void
		{
			for each(var func:Function in (eventMap[eventName] as Array))
			{	
				func(att);
			}
		}
		
		//Unregister all event handlers
		public function ClearAllEvents():void
		{
			eventMap = new Object();
		}
	}
}