package Actors
{
	import Pickups.Bombs;
	
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	public class BaseCharacter extends FlxSprite
	{
		[Embed(source="images/character.png")]
		private var avatarImg : Class;	
		
		private var _bombCount:int = 0;
		
		public function BaseCharacter(X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			super(X, Y);
			
			
			//Graphics
			loadGraphic(avatarImg, true, true, 32, 32);
			addAnimation("walking", [1,2,3,4], 10);
			addAnimation("still",[0]);
			addAnimation("jump",[5]);
			
			width = 12;
			offset = new FlxPoint(9, 0); 			
		}
		
		public function pickup(): void {
			_bombCount = _bombCount + 1;
		}
		
		override public function update():void
		{	
			if(velocity.x == 0)
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