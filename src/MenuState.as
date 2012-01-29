package
{
	import org.flixel.*;
	
	
	public class MenuState extends FlxState
	{
		[Embed(source="sound/Jump.mp3")]
		public var chooseWorldSnd : Class;
		
		[Embed(source="images/menubg.png")]
		private var levelSelectorBGAsset : Class;		
		
		//level select
		private var totalNumberOfLevels:int = Assets.Levels.length; //set the total number of levels in the game
		static public var levelCurrentlyHighlighted:int;
		private var levelSelector:FlxSprite;
		private var levelSelectStartX:int = 80;
		private var levelSelectStartY:int = 237;
		private var levelSelectOffsetX:int = 468 / (totalNumberOfLevels - 1);// divided by one less than the number of levels in the game
		private var levelSelectorOffsetX:int = -10;
		private var levelSelectorOffsetY:int = -35;
		static public var levelSelectBeatenFlags:Array;
		
		override public function create():void 
		{
			
			var bgImage : FlxSprite = new FlxSprite(0, 0, levelSelectorBGAsset);
			add(bgImage);
			
			//level select logic
			var world:FlxSprite;
			
			levelSelector = new FlxSprite(levelSelectStartX, levelSelectStartY, this.levelSelectorAsset);
			this.add(levelSelector);
			
			levelSelector.x = levelSelectStartX + levelSelectOffsetX * levelCurrentlyHighlighted + levelSelectorOffsetX;
			levelSelector.y = levelSelectStartY + levelSelectorOffsetY;
			
			for(var ii:int = 0; ii < totalNumberOfLevels; ii++)
			{
				if(levelSelectBeatenFlags[ii])
				{
					world = new FlxSprite(levelSelectStartX + levelSelectOffsetX * ii, levelSelectStartY, this.levelSelectorWorldCompleteAsset);
				}
				else
				{
					world = new FlxSprite(levelSelectStartX + levelSelectOffsetX * ii, levelSelectStartY, this.levelSelectorWorldAsset);
				}
				this.add(world);
			}
			
			
		}
		override public function update():void
		{
			if(creditOverlay.visible)
			{
				if (FlxG.keys.pressAnyKey()) {
					creditOverlay.visible = false;
				} 
			}
			else
			{
				
				if (FlxG.keys.justPressed("LEFT")) {
					levelCurrentlyHighlighted--;
					if(levelCurrentlyHighlighted < 0)
					{
						levelCurrentlyHighlighted = totalNumberOfLevels - 1;
					}
					levelSelector.x = levelSelectStartX + levelSelectOffsetX * levelCurrentlyHighlighted + levelSelectorOffsetX;
					levelSelector.y = levelSelectStartY + levelSelectorOffsetY;
					
					FlxG.play(chooseWorldSnd);
					
				}
				if (FlxG.keys.justPressed("RIGHT")) {
					levelCurrentlyHighlighted++
					if(levelCurrentlyHighlighted > (totalNumberOfLevels -1))
					{
						levelCurrentlyHighlighted = 0;
					}
					levelSelector.x = levelSelectStartX + levelSelectOffsetX * levelCurrentlyHighlighted + levelSelectorOffsetX;
					levelSelector.y = levelSelectStartY + levelSelectorOffsetY;
					
					FlxG.play(chooseWorldSnd);
					
				}
				if (FlxG.keys.justPressed("ENTER") || FlxG.keys.justPressed("SPACE") || FlxG.keys.justPressed("UP")) 
				{
					FlxG.state = new PlayState();
				}
				if (FlxG.keys.justPressed("C")) {
					creditOverlay.visible = true;
				}
			}
			
			super.update();
			
		}
	}
}