package Traps
{
	public class Fire extends BaseTrap
	{
		public function Fire(x:int, y:int)
		{
			super(x, y);
			//Make Graphic
			makeGraphic(15,20,0xff555511);
			maxVelocity.y = 0;
			maxVelocity.x = 0;
			solid = true;			
		}
	}
}