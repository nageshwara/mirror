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
		private var bombs:FlxGroup;
		private var interactables:FlxGroup;

		
		private var fallables:FlxGroup;
		
		private var healthBar:FlxBar;
		
		private var _level : FlxTilemap;
		private var _objects : FlxGroup;
		
		override public function create():void
		{
			//Set the background color to light gray (0xAARRGGBB)
			FlxG.bgColor = 0xffaaaaaa;	
			_level = LevelManager.getInstance().LoadTilemap(3);
			add(_level);

			FlxG.worldBounds.width = 800;
			FlxG.worldBounds.height = 600;			
			
			player = new Hero(150, 0);
			oplayer = new BaseBoss(player, 200, 0);
			springs = new FlxGroup();
			bombs = new FlxGroup();
			
			interactables = new FlxGroup();
			
			fallables = new FlxGroup();
			fallables.add(player);
			fallables.add(oplayer);
			fallables.add(springs);
			fallables.add(bombs);

			add(player);
			add(oplayer);
			
			add(springs);
			add(bombs);
			
			
			createSpring(100, 10);
			createSpring(100, 70);
			createSpring(100, 90);
			

			createBomb(130, 10);
			createBomb(130, 70);
			createBomb(130, 90);
			
			/*
			var dummySprite : FlxSprite = new FlxSprite(32 * 5, 32 * 5);
			dummySprite.makeGraphic(32, 32, 0xffff0000);
			add(dummySprite);
			*/
			
			_objects = LevelManager.getInstance().loadObjectGroup();
			add(_objects);
			
			FlxG.camera.follow(player);
		}
		
		
		private function createSpring(x:int, y:int): void {
			var spring:Spring = new Spring(x, y);
			springs.add(spring);
			interactables.add(spring.springproxy);
			
		}
		
		private function createBomb(x:int, y:int): void {
			var bomb:Bombs = new Bombs(x, y);
			bombs.add(bomb);
			interactables.add(bomb.bombproxy);
		}
		
		override public function update():void
		{	
			//Updates all the objects appropriately
			super.update();	
			FlxG.collide(_level,fallables);
			FlxG.collide(fallables, fallables);					
			
			FlxG.collide(interactables, player, handleInteraction);					
		}
				
		private function handleInteraction(interactable:Interactable, obj:FlxSprite): void {
			interactable.handleObject(obj);
		}

		
	}
}
