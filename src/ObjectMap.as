package
{
	import Pickups.*;
	import org.flixel.*;
	//This ObjectMap maps an object index to the object class
	public class ObjectMap
	{
		private var _objectMap : Object;
		public function ObjectMap(tileToLoad : FlxTilemap, tileSize : Number)
		{	
			_objectMap = new Object();
			_objectMap[9] = Bombs;
		}
		public function GetObjectClassByIndex(idx:Number):Class
		{
			if(_objectMap.hasOwnProperty(idx))
			{
				return _objectMap[idx];
			}
			else
			{
				throw (new Error("Class doesn't exist!!!"));
			}
		}
	}
}