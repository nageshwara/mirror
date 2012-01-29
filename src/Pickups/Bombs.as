package Pickups
{
	import Actors.BaseBoss;
	import Actors.BaseCharacter;
	
	import org.flixel.FlxSprite;
	
	public class Bombs extends FlxSprite
	{
		public var deployed:Boolean = false;
		
		public var bombproxy:BombProxy;
		
		public function Bombs(X:Number=0, Y:Number=0)
		{
			super(X, Y);
			makeGraphic(8,4,0xff551111);
			maxVelocity.y = 200;
			acceleration.y = 200;
			maxVelocity.x = 40;
			drag.x = maxVelocity.x*4;
			solid = true;	
			
			bombproxy = new BombProxy(this);
		}
		
		public function deploy(): void {
			this.deployed = true;
		}		
	}
}