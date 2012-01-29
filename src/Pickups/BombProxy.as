package Pickups
{
	import Actors.BaseCharacter;
	
	import flash.geom.Point;
	
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	public class BombProxy extends FlxSprite
	{
		private var _parent:Bombs;
		
		private const TRIGGER_AREA:int = 4;
		
		public function BombProxy(parent:Bombs, X:Number=0, Y:Number=0)
		{
			_parent  = parent;
			super(X, Y);
			makeGraphic(_parent.width + TRIGGER_AREA, _parent.height + TRIGGER_AREA,0x3311ff11);
			moves = false;
		}
		
		public override function update():void {
			this.x = _parent.x - TRIGGER_AREA/2;
			this.y = _parent.y - TRIGGER_AREA/2;
		}

		public function handleObject(obj:FlxSprite): void {			
			var char:BaseCharacter = obj as BaseCharacter;
			if (!_parent.deployed) {
				//trace("Parent is being destoryed");
				char.pickup();
				destroy();
			} else {
				//Spawn an explosion..
				char.hurt(10);
				explode();				
			}
		}
		
		private function explode(): void {
			destroy();
		}
		
		public override function destroy():void {
			_parent.exists = false;
			exists = false;
			_parent.destroy();			
			super.destroy();
		}
	}
}