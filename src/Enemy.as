package
{
	import org.flixel.*;
	
	public class Enemy extends FlxSprite
	{
		[Embed(source="images/orb02.png")]
		private var _imgEnemy : Class;
		
		public function Enemy(X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			super(X, Y, _imgEnemy);
		}
		
		override public function overlaps(ObjectOrGroup:FlxBasic, InScreenSpace:Boolean=false, Camera:FlxCamera=null):Boolean
		{
			if(super.overlaps(ObjectOrGroup, InScreenSpace, Camera))
			{
				EventManager.getInstance().TriggerEvent("ENEMY_TOUCHED", this);
				return true;
			}
			return false;
		}
		
		override public function update():void
		{				
			super.update();
		}
	}
}