package src.main {
	
	import src.main.GameContainer;
	import src.main.CombatHandler;
	import src.entities.tilespack.Tile;

	import src.engine.Entity;
	
	public class EnemyHandler {
		
		private var gameContainer:GameContainer;
		private var world:World;
		private var player:Player;
		private var turnHandler:TurnHandler;
		
		private var enemyList:Array;
		
		private var distanceMoved:int = 0;
		
		
		public function EnemyHandler(gameContainer:GameContainer, world:World, player:Player, turnHandler:TurnHandler, enemyList:Array) {
			this.gameContainer = gameContainer;
			this.world = world;
			this.player = player;
			this.turnHandler = turnHandler;
			this.enemyList = enemyList;
		}
		
		
		public function tick():void{			
			
			
			
			
		}
		
		
		
		
	}
	
}
