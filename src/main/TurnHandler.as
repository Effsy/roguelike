package src.main {
	
	import src.global.GameData;
	import src.main.GameContainer;
	import src.main.LightingHandler;
	import src.engine.Entity;
	
	import flash.geom.Point;
	
	public class TurnHandler {
		
		private var gameContainer:GameContainer;
		
		private var lightingHandler:LightingHandler;
		
		private var _turnReady:Boolean = true;
		
		private var _moving:Boolean = false;
		private var movingUp:Boolean = false;
		private var movingDown:Boolean = false;
		private var movingLeft:Boolean = false;
		private var movingRight:Boolean = false;
		private var distanceMoved:int = 0;
		
		private var enemyPoints:Array = [];
		private var enemyRadius:int = 18; //Distance to corner tile
		
		public function TurnHandler(gameContainer:GameContainer) {
			this.gameContainer = gameContainer;
			lightingHandler = new LightingHandler();
			enemyPoints = calculateEnemyPoints(enemyRadius);
		}
		
		private function calculateEnemyPoints(maxDistance:int):Array{
			var points:Array = [];
			var distanceManhattan:int = 1;
			
			points.push(new Point(0, 0));
			for(var k:int = 0; k < maxDistance; k++){
				//Search a square array around the player with an increasing size (according to manhattan distance)
				for(var i:int = -distanceManhattan; i <= distanceManhattan; i++){
					for(var j:int = -distanceManhattan; j <= distanceManhattan; j++){
						//At manhattan distance and within screen (eliminates unecessary tiles)
						if(Math.abs(i) + Math.abs(j) == distanceManhattan && i >= -GameData.screenTileHalfWidth && i <= GameData.screenTileHalfWidth && j >= -GameData.screenTileHalfHeight && j <= GameData.screenTileHalfHeight){
							points.push(new Point(i, j));
						}
					}
				}
				distanceManhattan++;
			}
			return points;
		}
		
		/*
		private function calculateEnemyPoints(radius:int):Array{
			var points:Array = [];
			
			for(var i:int = 0; i < radius * 2 + 1; i++){
				for(var j:int = 0; j < radius * 2 + 1; j++){
					if(Math.pow(radius, 2) >= Math.pow(i - radius, 2) + Math.pow(j - radius, 2) && Math.pow(radius - 2, 2) <= Math.pow(i - radius, 2) + Math.pow(j - radius, 2)){
						points.push(new Point(i - radius, j - radius));
					}
				}
			}
			return points;
		}
		*/
		
		public function tick():void{
			
			if(turnReady) turnInput();
			else turnOutput();
				
			//Halfway during movement - calculate new lighting
			if(distanceMoved >= GameData.tileSize/2){
				lightingHandler.calculateLight();
			}
				
			//When movement is complete
			if(distanceMoved >= GameData.tileSize){
				//Reset movement variables
				distanceMoved = 0;
				turnReady = true;
				movingUp = false;
				movingDown = false;
				movingLeft = false;
				movingRight = false;
					
				//Centre world on player if over/under-moved
				GameData.world.centreOnTile();
				
				//Calculate enemies currently on screen and store in array in order of distance form player (manhattan distance)
				calculateEnemiesOnScreen();
				
			}
		}
		
		//Player's choice of move 
		public function turnInput():void{
			//Arrow Keys (Movement)
			//Check Order:
			//Enemy on tiles
			//
			//Solid Tile
			//
			//
			
			if(gameContainer.getInputHandler().getKeyUp()){
				//Attack enemy
				if(!true){
					
				}
				else if(!GameData.world.getTileObject(GameData.player.body.tileX, GameData.player.body.tileY - 1).solid){
					movingUp = true;
					GameData.player.body.tileY--;
				}
				
				turnReady = false;					
				
			}
			else if(gameContainer.getInputHandler().getKeyDown() && !GameData.world.getTileObject(GameData.player.body.tileX, GameData.player.body.tileY + 1).solid){
				turnReady = false;					
				movingDown = true;
				GameData.player.body.tileY++;
			}
			else if(gameContainer.getInputHandler().getKeyLeft() && !GameData.world.getTileObject(GameData.player.body.tileX - 1, GameData.player.body.tileY).solid){
				turnReady = false;					
				movingLeft = true;
				GameData.player.body.tileX--;
			}
			else if(gameContainer.getInputHandler().getKeyRight() && !GameData.world.getTileObject(GameData.player.body.tileX + 1, GameData.player.body.tileY).solid){
				turnReady = false;					
				movingRight = true;
				GameData.player.body.tileX++;
			}
		}
		
		//Player's result of move 
		public function turnOutput():void{
			if(movingUp){
				GameData.world.moveY(GameData.player.speed);
				GameData.player.body.y -= GameData.player.speed;
			}
			else if(movingDown){
				GameData.world.moveY(-GameData.player.speed);
				GameData.player.body.y += GameData.player.speed;
			}
			else if(movingLeft){
				GameData.world.moveX(GameData.player.speed);
				GameData.player.body.x -= GameData.player.speed;
			}
			else if(movingRight){
				GameData.world.moveX(-GameData.player.speed);
				GameData.player.body.x += GameData.player.speed;
			}
			
			//Add to moveDistance counter
			distanceMoved += GameData.player.speed;
		}
		
		public function calculateEnemiesOnScreen():void{
			GameData.enemiesOnScreen = [];
			for(var i:int = 0; i < enemyPoints.length; i++){
				//Ensure the tile is in the map (within the array limits)
				if(GameData.player.body.tileX + enemyPoints[i].x >= 0 && GameData.player.body.tileX + enemyPoints[i].x < GameData.worldSize && GameData.player.body.tileY + enemyPoints[i].y >= 0 && GameData.player.body.tileY + enemyPoints[i].y < GameData.worldSize){
					//Check if enemy is present in the tile
					if(GameData.enemyMapObjects[GameData.player.body.tileX + enemyPoints[i].x][GameData.player.body.tileY + enemyPoints[i].y] != 0)
						GameData.enemiesOnScreen.push(GameData.enemyMapObjects[GameData.player.body.tileX + enemyPoints[i].x][GameData.player.body.tileY + enemyPoints[i].y]);
				}
			}			
			trace(GameData.enemiesOnScreen)
			for(var i:int = 0; i < GameData.enemiesOnScreen.length; i++){
				trace(GameData.enemiesOnScreen[i].body.tileX + "             " + GameData.enemiesOnScreen[i].body.tileY)
				//GameData.enemiesOnScreen[i].ai.aiTypes[0];
			}
			trace(GameData.player.body.tileX + "               " + GameData.player.body.tileY)
		}
		
		public function get turnReady():Boolean{
			return _turnReady;
		}
		public function set turnReady(value:Boolean):void{
			_turnReady = value;
		}
	}
}
