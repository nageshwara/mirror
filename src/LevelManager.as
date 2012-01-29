package
{
	import com.adobe.serialization.json.JSON;
	
	import org.flixel.*;
	
	public class LevelManager
	{
		[Embed(source="images/level.json", mimeType="application/octet-stream")]
		public static const LEVEL1 : Class;
		[Embed(source="images/level2.json", mimeType="application/octet-stream")]
		public static const LEVEL2 : Class;
		
		private static var thisObj : LevelManager = null;
		
		private var _jsonData : Object;
		private var _height : Number;
		private var _width : Number;
		private var _layers : Array;
		private var _orientation : String;
		private var _properties : Object;
		private var _tileheight : Number;
		private var _tilewidth : Number;
		private var _tilesets : Array;
		
		private var _levelMap : Object;
		
		public function LevelManager()
		{
			super();
			_levelMap = new Object();
			_levelMap[1] = LEVEL1;
			_levelMap[2] = LEVEL2;
		}
		
		public static function getInstance() : LevelManager
		{
			if(thisObj)
			{
				return thisObj;
			}
			else
			{
				thisObj = new LevelManager();
				return thisObj;
			}
		}
		
		public function LoadTilemap(mapIdx:Number) : FlxTilemap
		{
			var tiletable : Tilesets = new Tilesets();
			var jsonString : String = new _levelMap[mapIdx];
			_jsonData = com.adobe.serialization.json.JSON.decode(jsonString);
			_height = _jsonData["height"];
			_width = _jsonData["width"];
			_layers = _jsonData["layers"];
			_orientation = _jsonData["orientation"];
			_properties = _jsonData["properties"];
			_tileheight = _jsonData["tileheight"];
			_tilewidth = _jsonData["tilewidth"];
			_tilesets = _jsonData["tilesets"];
			var loadedMap : FlxTilemap = new FlxTilemap();
			loadedMap.loadMap(FlxTilemap.arrayToCSV(_layers[0]["data"], _layers[0]["width"]), tiletable.GetTilesetByFilename(_tilesets[0]["image"]), _tilewidth, _tileheight, FlxTilemap.OFF, 1, 1, 2);
			return loadedMap;
		}
		
		public function loadObjectGroup(mapIdx:Number) : FlxGroup
		{
			var objectGroup : FlxGroup = new FlxGroup();
			return null;
		}
	}
}