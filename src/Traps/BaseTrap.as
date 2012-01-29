package Traps
{
	import Actors.BaseCharacter;
	
	import org.flixel.FlxSprite;

	public class BaseTrap extends Interactable
	{
		public function BaseTrap(x:int, y:int)
		{
			super(x, y);
		}
		
		public override function handleObject(obj:FlxSprite):void {
			var actor:BaseCharacter = obj as BaseCharacter;
			if (!actor) return;			
			actor.hurt(100);			
		}
	}
}