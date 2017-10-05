package src.main{
	
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.display.BitmapData;	
	
	import flash.utils.getDefinitionByName;
	
	import src.entities.tilespack.*;
	import src.states.State;
	import src.worldgen.GenerateWorld
	import src.engine.Entity;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import src.gfx.Assets;
	import src.entities.tilespack.EmptyTile;
	import src.global.GameData;
	import src.global.Utils;
	
	public class World extends Sprite{
		
		private var gameContainer:GameContainer;
		
		public var generateWorld:GenerateWorld;
		
		private var assets:Assets = new Assets();
		
		private var tile:String;
		
		//Array of tile IDs/Tiles
		private var _tileMapIDs:Array = [];
		private var _tileMapTiles:Array = [];
		
		private var _lightMapTiles:Array = [];
		
		//Mouse Movement
		private var panSpeed:int = 20; //Normal is 20
		private var panDistance:int = 30;
		private var scrollSpeed:Number = 0.1; //Normal is 0.01
		
		public function World(gameContainer:GameContainer, enemyList:Array){
			this.gameContainer = gameContainer;
			
			//Fill maps with 0s
			GameData.enemyMapObjects = Utils.squareArray(GameData.worldSize);
			GameData.miscMapObjects = Utils.squareArray(GameData.worldSize);
			GameData.lightMapObjects = Utils.squareArray(GameData.worldSize);
			
			
			generateWorld = new GenerateWorld(enemyList);
			tileMapIDs = generateWorld.getTileMap();
			
			//Prepare tileMapTiles from IDs (Can't equate due to immutability)
			GameData.tileMapObjects = Utils.duplicateMultidimensionalArray(tileMapIDs);
			loadTileMapObjects();
			
			//Prepare lightMapTiles with an empty 2D array
			loadLightMapObjects();
					
			//Position player in room
			setPlayerPosition(generateWorld.entranceX, generateWorld.entranceY);

			//scaleX = 0.2;
			//scaleY = 0.2;
		}
		
		
		public function tick():void{
			//Scroll Map
			if(gameContainer.getInputHandler().getScrollDirection() == -1 && scaleX > 0.1){
				scaleX -= scrollSpeed;
				scaleY -= scrollSpeed;
				gameContainer.getInputHandler().setScrollDirection(0);
			}
			else if(gameContainer.getInputHandler().getScrollDirection() == 1 && scaleX < 1.5){
				scaleX += scrollSpeed;
				scaleY += scrollSpeed;
				gameContainer.getInputHandler().setScrollDirection(0);
			}
			
			//Prevent scrolling past limits
			if(scaleX < 0.1){
				scaleX = 0.1;
				scaleY = 0.1;
			}
			else if(scaleX > 1.5){
				scaleX = 1.5;
				scaleY = 1.5
			}
			
			/*
			//Moving World with mouse or keyboard
			if(gameContainer.getInputHandler().getMouseX() < panDistance || gameContainer.getInputHandler().getKeyLeft()){
				x += panSpeed;
				
			}
			else if(gameContainer.getInputHandler().getMouseX() > gameContainer.getStage().stageWidth - panDistance || gameContainer.getInputHandler().getKeyRight()){
				x -= panSpeed;
			}
			
			if(gameContainer.getInputHandler().getMouseY() < panDistance || gameContainer.getInputHandler().getKeyUp()){
				y += panSpeed;
			}
			else if(gameContainer.getInputHandler().getMouseY() > gameContainer.getStage().stageHeight - panDistance || gameContainer.getInputHandler().getKeyDown()){
				y -= panSpeed;
			}
			*/
			
		}
		
		public function loadTileMapObjects():void{
			var tile:Tile;
			for(var i:int = 0; i < tileMapIDs.length; i++)
			{
				for(var j:int = 0; j < tileMapIDs[0].length; j++)
				{
					GameData.tileMapObjects[i][j] = new Assets.tileList[tileMapIDs[i][j]](i, j);
					GameData.tileMapObjects[i][j].body.x = i * GameData.tileSize;
					GameData.tileMapObjects[i][j].body.y = j * GameData.tileSize
					
				}
			}
		}		
		public function loadLightMapObjects():void{
			var lightTile:LightTile;
			for(var i:int = 0; i < GameData.worldSize; i++){
				for(var j:int = 0; j < GameData.worldSize; j++){
					GameData.lightMapObjects[i][j] = new LightTile(i, j);
					GameData.lightMapObjects[i][j].body.x = i * GameData.tileSize;
					GameData.lightMapObjects[i][j].body.y = j * GameData.tileSize;
					
				}
			}
		}	
		
		
		//Get tile type based on ID at tile position in the tileMap - NOT PIXEL
		public function getTile(xTile:int, yTile:int):String{
			tile = Assets.tileList[tileMapIDs[xTile][yTile]];
			
			//if tile doesn't exist in tiles array, default tile is 1 (floorTile)
			if(tile == null){
				return Assets.tileList[1];
			}
			return tile;
		}
		
		//Get tile ID at tile position in the tileMap - NOT PIXEL
		public function getTileID(xTile:int, yTile:int):int{
			return tileMapIDs[xTile][yTile];
		}
		
		public function getTileObject(xTile:int, yTile:int):Tile{
			return GameData.tileMapObjects[xTile][yTile];
		}
	
		public function moveX(X:int):void{
			this.x += X;
		}
		public function moveY(Y:int):void{
			this.y += Y;
		}
		
		public function centreOnTile():void{
			this.x = -(GameData.player.body.tileX * GameData.tileSize) + GameData.playerXPoint;
			this.y = -(GameData.player.body.tileY * GameData.tileSize) + GameData.playerYPoint;
		}
		
		//Sets world at start point relative to the player
		public function setPlayerPosition(tileX:int, tileY:int):void{
			this.x = -(tileX * GameData.tileSize) + GameData.playerXPoint;
			this.y = -(tileY * GameData.tileSize) + GameData.playerYPoint;
		}		
		
		
		public function get tileMapIDs():Array{
			return _tileMapIDs;
		}
		public function set tileMapIDs(value:Array):void{
			_tileMapIDs = value;
		}
		
		/*public function get tileMapTiles():Array{
			return _tileMapTiles;
		}
		public function set tileMapTiles(value:Array):void{
			_tileMapTiles = value;
		}
		
		public function get lightMapTiles():Array{
			return _lightMapTiles;
		}
		public function set lightMapTiles(value:Array):void{
			_lightMapTiles = value;
		}*/
	}
}
