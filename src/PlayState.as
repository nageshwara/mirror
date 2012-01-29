package
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		private var _avatar:Avatar;
		private var _enemy:Enemy;
		private var _level:TiledTilemap;
		
		override public function create():void
		{
			//Set the background color to light gray (0xAARRGGBB)
			FlxG.bgColor = 0xFF000000;
			//_enemy = new Enemy(100,150);
			//add(_enemy);
			//EventManager.getInstance().SubscribeToEvent("ENEMY_TOUCHED", powerUp);
			_level = new TiledTilemap();
			add(_level);
			_avatar = new Avatar(160,-100);
			add(_avatar);
			FlxG.camera.follow(_avatar);
			FlxG.worldBounds.x = -100;
			FlxG.worldBounds.y = -100;
			FlxG.worldBounds.width = 2000;
			FlxG.worldBounds.height = 2000;
		}
		
		override public function update():void
		{
			//Updates all the objects appropriately
			//_enemy.overlaps(_avatar);
			FlxG.collide(_level, _avatar);
			super.update();
		}
		
		public function powerUp(att:Object):void
		{
			//Power up the player
			remove(_enemy);
		}
	}
}
