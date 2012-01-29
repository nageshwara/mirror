package
{
	import Actors.BaseBoss;
	import Actors.Hero;
	
	import Pickups.BombProxy;
	import Pickups.Bombs;
	import Pickups.Spring;
	import Pickups.SpringProxy;
	
	import Traps.Fire;
	
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
		
		
		private var level:TiledTilemap
		
		override public function create():void
		{
			//Set the background color to light gray (0xAARRGGBB)
			FlxG.bgColor = 0xffaaaaaa;
			
			level = new TiledTilemap();
			add(level);
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
			add(interactables);
			
			
			createSpring(100, 10);
			createSpring(100, 70);
			createSpring(100, 90);
			

			createBomb(130, 10);
			createBomb(130, 70);
			createBomb(130, 90);
			
			
			//createFire(150, 250);
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
		
		private function createFire(x:int, y:int): void {
			var bomb:Fire = new Fire(x, y);
			interactables.add(bomb);
		}		
		
		
		override public function update():void
		{	
			//Updates all the objects appropriately
			super.update();	
			FlxG.collide(level,fallables);
			FlxG.collide(fallables, fallables);					
			
			FlxG.collide(interactables, player, handleInteraction);			
			FlxG.collide(interactables, oplayer, handleInteraction);						
					
		}
				
		private function handleInteraction(inter:Interactable, obj:FlxSprite): void {
			inter.handleObject(obj);
		}		
	}
}
