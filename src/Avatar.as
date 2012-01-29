package
{
	import org.flixel.*;
	
	public class Avatar extends FlxSprite
	{	
		[Embed(source="images/character.png")]
		private var avatarImg : Class;	
		public var startX:int;
		public var startY:int;
		
		private var _default_speed:int = 50; //left and right
		
		public function Avatar(X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			super(X, Y, avatarImg);
			startX = X;
			startY = Y;
			
			//Graphics
			loadGraphic(avatarImg, true, true, 32, 32);
			addAnimation("walking", [1,2,3,4], 10);
			addAnimation("still",[0]);
			addAnimation("jump",[5]);
			
			width = 12;
			offset = new FlxPoint(9, 0); 
			this.acceleration.y = 10000;
		}
		
		override public function update():void
		{	
			////////////////////////////////////////////////////////////////////// ARROW KEY CONTROL
			if(FlxG.keys.RIGHT || FlxG.keys.D) {
				velocity.x = _default_speed;
				this.facing = RIGHT;
			}
			else if(FlxG.keys.LEFT || FlxG.keys.A) {
				velocity.x = -_default_speed;
				this.facing = LEFT;
			} 
			else
			{
				velocity.x = 0;
			}
			
			if(FlxG.keys.DOWN || FlxG.keys.S) {
				velocity.y = _default_speed;
			}
			else if(FlxG.keys.UP || FlxG.keys.W) {
				velocity.y = -_default_speed;
			} 
			else
			{
				velocity.y = 0;
			}
			
			if(velocity.x == 0 && velocity.y == 0)
			{
				this.play("still");
			}
			else
			{
				this.play("walking");
			}
			
			super.update();
		}//update end
		
	}
}