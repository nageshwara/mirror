package Pickups
{
	import flash.geom.Point;
	
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	public class SpringProxy extends Interactable
	{
		private var _parent:Spring;
		public function SpringProxy(parent:Spring, X:Number=0, Y:Number=0)
		{
			_parent  = parent;
			super(X, Y);
			makeGraphic(_parent.width, _parent.height,0x0011ff11);
			allowCollisions = UP | DOWN;
			moves = false;
		}
		
		public override function update():void {
			this.x = _parent.x;
			this.y = _parent.y - 1;
		}
		
		public override function handleObject(obj:FlxSprite): void {
				obj.velocity.y = -obj.maxVelocity.y/2;
		}
	}
}