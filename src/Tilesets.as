package
{
	import org.flixel.*;
	public class Tilesets
	{
		[Embed(source="images/blocks1.png")]
		public static const TILEMAP1 : Class;
		[Embed(source="images/blocks2.png")]
		public static const TILEMAP2 : Class;	
		
		private var _tilesets : Object;
		
		public function Tilesets()
		{
			_tilesets = new Object();
			_tilesets["blocks1.png"] = TILEMAP1;
			_tilesets["blocks2.png"] = TILEMAP2;
		}
		
		public function GetTilesetByFilename(filename : String) : Class
		{
			if(_tilesets.hasOwnProperty(filename))
				return _tilesets[filename];
			else
				throw (new Error("No such tileset exists!!!"));
		}
	}
}