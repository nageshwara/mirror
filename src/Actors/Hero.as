package Actors
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSave;
	import org.flixel.FlxSprite;
	
	public class Hero extends BaseCharacter
	{
		public function Hero(X:Number=0, Y:Number=0)
		{
			//TODO: implement function
			super(X, Y);
			makeGraphic(8,12,0xffaa1111);
			maxVelocity.x = 80;
			maxVelocity.y = 200;
			acceleration.y = 200;
			drag.x = maxVelocity.x*4;			
		}
		
		public override function update():void {			
			acceleration.x = 0;
			if(FlxG.keys.LEFT)
				acceleration.x = -maxVelocity.x*4;
			if(FlxG.keys.RIGHT)
				acceleration.x = maxVelocity.x*4;
			if(FlxG.keys.justPressed("SPACE") && isTouching(FlxObject.FLOOR))
				velocity.y = -maxVelocity.y/2;
			
			super.update();
		}
	}
}