package Actors
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	
	public class BaseBoss extends BaseCharacter
	{
		
		private var _target:Hero;
		
		public function BaseBoss(target:Hero, X:Number=0, Y:Number=0)
		{
			_target = target;
			super(X, Y, null);
			//makeGraphic(8,12,0xff1111aa);
			maxVelocity.x = 80;
			maxVelocity.y = 200;
			acceleration.y = 200;
			drag.x = maxVelocity.x*4;
		}
		
		
		public override function update():void {
			acceleration.x = 0;
			if(FlxG.keys.LEFT) {
				acceleration.x = maxVelocity.x*4;
				this.facing = RIGHT;
			}
			if(FlxG.keys.RIGHT) {
				acceleration.x = -maxVelocity.x*4;
				this.facing = LEFT;
			}
			if(FlxG.keys.justPressed("SPACE") && isTouching(FlxObject.FLOOR))
				velocity.y = -maxVelocity.y/2;
			
			super.update();
		}
	}
}