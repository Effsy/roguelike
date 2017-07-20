package src.main{
	
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.display.Sprite;
	
	import src.gfx.Assets;
	import src.states.*;
	import src.entities.tilespack.Tile;
	
	public class GameContainer extends Sprite{
		
		//private var global:Global = new Global();
		
		private var stageRef:Stage;
		
		private var gameState:State;
		private var menuState:State;
		
		private var inputHandler:InputHandler;
		
		public function GameContainer(stageRef:Stage) {
			this.stageRef = stageRef;
			init();
			startGame();
		}
		
		public function init():void
		{
			stageRef.align = StageAlign.TOP_LEFT;
			stageRef.scaleMode = StageScaleMode.NO_SCALE;
			//Assets.init();
			//Tile.init();
			inputHandler = new InputHandler(this);
			addEventListener(Event.ENTER_FRAME, gameLoop);
		}
		
		public function startGame():void
		{
			//trace(this);
			gameState = new GameState(this);
			State.setState(gameState);
		}
		
		public function pauseGame():void{
			
		}
		
		public function gameLoop(e:Event):void
		{
			inputHandler.tick();
			
			if(State.getState() != null)
				State.getState().tick();
		}
		
		public function getInputHandler():InputHandler
		{
			return inputHandler;
		}
		
		public function getStage():Stage
		{
			return stageRef;
		}

	}
	
}
