package
{
	import Actors.BaseBoss;
	import Actors.Hero;
	
	import Pickups.BombProxy;
	import Pickups.Bombs;
	import Pickups.Spring;
	import Pickups.SpringProxy;
	
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class PlayState extends FlxState
	{
		public var player:Hero;
		public var oplayer:BaseBoss;
		
		private var springs:FlxGroup;
		private var springProxies:FlxGroup;
		private var bombs:FlxGroup;
		private var bombProxies:FlxGroup;
		
		private var fallables:FlxGroup;
		
		private var healthBar:FlxBar;
		
		private var _level : FlxTilemap;
		
		override public function create():void
		{
			//Set the background color to light gray (0xAARRGGBB)
			FlxG.bgColor = 0xffaaaaaa;	
			_level = LevelManager.getInstance().LoadTilemap(1);
			add(_level);
			
			/*FlxG.worldBounds.x = -100;
			FlxG.worldBounds.y = -100;*/
			FlxG.worldBounds.width = 2000;
			FlxG.worldBounds.height = 2000;			
			
			player = new Hero(150, 0);
			oplayer = new BaseBoss(player, 200, 0);
			springs = new FlxGroup();
			springProxies = new FlxGroup();
			bombs = new FlxGroup();
			bombProxies = new FlxGroup();
			
			fallables = new FlxGroup();
			fallables.add(player);
			fallables.add(oplayer);
			fallables.add(springs);
			fallables.add(bombs);

			add(player);
			add(oplayer);
			
			add(springs);
			add(springProxies);
			add(bombs);
			add(bombProxies);
			
			
			createSpring(100, 10);
			createSpring(100, 70);
			createSpring(100, 90);
			

			createBomb(130, 10);
			createBomb(130, 70);
			createBomb(130, 90);
			
			var dummySprite : FlxSprite = new FlxSprite(32 * 5, 32 * 5);
			dummySprite.makeGraphic(32, 32, 0xffff0000);
			add(dummySprite);
			
			
			
			FlxG.camera.follow(player);
		}
		
		
		private function createSpring(x:int, y:int): void {
			var spring:Spring = new Spring(x, y);
			springs.add(spring);
			springProxies.add(spring.springproxy);
			
		}
		
		private function createBomb(x:int, y:int): void {
			var bomb:Bombs = new Bombs(x, y);
			bombs.add(bomb);
			bombProxies.add(bomb.bombproxy);
		}
		
		
		
		override public function update():void
		{	
			//Updates all the objects appropriately
			super.update();	
			FlxG.collide(_level,fallables);
			FlxG.collide(fallables, fallables);					
			
			FlxG.collide(springProxies, player, somethingOnSpring);			
			FlxG.collide(springProxies, oplayer, somethingOnSpring);			

			
			FlxG.collide(bombProxies, player, somethingNearBomb);			
			FlxG.collide(bombProxies, oplayer, somethingNearBomb);			
					
		}
				
		private function somethingOnSpring(char1:SpringProxy, obj:FlxSprite): void {
			char1.handleObject(obj);
		}
		
		private function somethingNearBomb(char:BombProxy, obj:FlxSprite): void {
			char.handleObject(obj);
		}
		
	}
}
