package Pickups
{
	import flash.geom.Point;
	
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	public class Spring extends FlxSprite
	{
		
		public var springproxy:SpringProxy;
		
		public function Spring(X:Number=0, Y:Number=0)
		{
			super(X, Y);
			makeGraphic(8,4,0xff11ff11);
			maxVelocity.y = 200;
			acceleration.y = 200;
			maxVelocity.x = 40;
			drag.x = maxVelocity.x*4;
			elasticity = 0.4;
			
			solid = true;
			
			springproxy = new SpringProxy(this);
		}				
	}
}