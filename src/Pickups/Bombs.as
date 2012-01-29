package Pickups
{
	import Actors.BaseBoss;
	import Actors.BaseCharacter;
	
	import org.flixel.FlxSprite;
	
	public class Bombs extends FlxSprite
	{
		private var deployed:Boolean = false;
		public function Bombs(X:Number=0, Y:Number=0)
		{
			super(X, Y);
			makeGraphic(8,4,0xff11ff11);
			maxVelocity.y = 200;
			acceleration.y = 200;
			maxVelocity.x = 40;
			drag.x = maxVelocity.x*4;
			solid = true;			
		}
		
		public function deploy(): void {
			this.deployed = true;
		}
		
		public function onTheBomb(obj:BaseCharacter): void {
			if (!deployed) {
				obj.pickup(this);
				destroy();
			} else {
				//Spawn an explosion..
				obj.hurt(10);
				destroy();
			}
		}
	}
}