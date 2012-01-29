package Actors
{
	import Pickups.Bombs;
	
	import org.flixel.FlxSprite;
	
	public class BaseCharacter extends FlxSprite
	{
		private var _bombCount:int = 0;
		
		public function BaseCharacter(X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			super(X, Y, SimpleGraphic);
		}
		
		public function pickup(obj:Bombs): void {
			_bombCount = _bombCount + 1;
		}
	}
}