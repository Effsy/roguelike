package src.main{
	
	import src.global.GameData;
	import src.main.GameContainer;
	import src.engine.Entity;
	import src.gfx.Assets;
	
	import src.engine.components.Body;
	import src.engine.components.View;
	
	public class Player extends Entity{
		
		private var gameContainer:GameContainer;
		
		private static var speedConst:int = 5;		
		
		public function Player(gameContainer:GameContainer):void{
			this.gameContainer = gameContainer;
			body = new Body(this, GameData.world.generateWorld.entranceX, GameData.world.generateWorld.entranceY);
			view = new View(this, Assets.tileSheet, GameData.tileSize, GameData.tileSize, 7, 7);
			this.solid = true;
		}
		
		public override function tick():void{			
			if(gameContainer.getInputHandler().getShiftPressed()){
				speedConst = 10;
			}
			else{
				speedConst = 5;
			}
		}
		
		//Movement Methods
		public function get speed():int{
			return speedConst;
		}
		

		
		
	}
	
}
