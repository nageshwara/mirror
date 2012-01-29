package
{
	import com.adobe.serialization.json.JSON;
	
	import org.flixel.*;
	
	public class TiledTilemap extends FlxTilemap
	{
		[Embed(source="images/level.json", mimeType="application/octet-stream")]
		public static const LEVEL1 : Class;
		[Embed(source="images/level2.json", mimeType="application/octet-stream")]
		public static const LEVEL2 : Class;
		
		private var _jsonData : Object;
		private var _height : Number;
		private var _width : Number;
		private var _layers : Array;
		private var _orientation : String;
		private var _properties : Object;
		private var _tileheight : Number;
		private var _tilewidth : Number;
		private var _tilesets : Array;
		
		
		public function TiledTilemap()
		{
			super();
			LoadMap();
		}
		public function LoadMap():void
		{
			var tiletable : Tilesets = new Tilesets();
			
			var jsonString : String = new LEVEL1();		
			
			_jsonData = com.adobe.serialization.json.JSON.decode(jsonString);
			
						
			
			_height = _jsonData["height"];
			_width = _jsonData["width"];
			_layers = _jsonData["layers"];
			_orientation = _jsonData["orientation"];
			_properties = _jsonData["properties"];
			_tileheight = _jsonData["tileheight"];
			_tilewidth = _jsonData["tilewidth"];
			_tilesets = _jsonData["tilesets"];
			/*
			for(var i : Number = 0; i < (_layers[0]["data"] as Array).length; i++)
			{
				(_layers[0]["data"] as Array)[i]--;
			}
			*/
			//trace((_layers[0]["data"] as Array));
			this.loadMap(FlxTilemap.arrayToCSV(_layers[0]["data"], _layers[0]["width"]), tiletable.GetTilesetByFilename(_tilesets[0]["image"]), _tilewidth + 2 , _tileheight + 2 , OFF, 1, 1, 2);

			
		}
	}
}