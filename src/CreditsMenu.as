package
{
	import org.flixel.*;
	
	public class CreditsMenu extends FlxState
	{
		[Embed(source="images/credits.png")]
		private var creditsBG : Class;

		public function CreditsMenu()
		{
			super();
		}
		
		override public function create():void 
		{
			FlxState.bgColor = 0xff404040;
			var bgImage : FlxSprite = new FlxSprite(0, 0, creditsBG);
			add(bgImage);

		}
		override public function update():void
		{
			if (FlxG.keys.pressAnyKey()) {
				FlxG.state = new MenuState();
			} 
		}
	}
}