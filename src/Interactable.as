package
{
	import org.flixel.FlxSprite;
	
	public class Interactable extends FlxSprite
	{
		public function Interactable(X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			super(X, Y, SimpleGraphic);
		}
		
		public function handleObject(obj:FlxSprite): void {
			
		}
	}
}