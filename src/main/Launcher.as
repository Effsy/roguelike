package src.main
{
	import flash.display.MovieClip;
	
	public class Launcher extends MovieClip
	{
		
		public function Launcher() 
		{
			var gameContainer:GameContainer = new GameContainer(stage);
			addChild(gameContainer);
		}
	}
	
}
