package src.states{
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import src.gfx.Assets
	
	import src.main.World
	import src.main.Player;
	import src.main.GameContainer;
	import src.main.CollisionHandler;
	import src.main.CombatHandler;
	import src.main.TurnHandler;
	
	import src.main.EnemyHandler;

	import src.global.GameData;
	import src.global.Utils;
	import src.entities.tilespack.Tile;
	import src.engine.Entity;

	
	public class GameState extends State{
		
		private var gameContainer:GameContainer;
		
		private var turnHandler:TurnHandler;

		private var combatHandler:CombatHandler;
		private var enemyHandler:EnemyHandler;
		
		//Mouse Movement
		private var panSpeed:int = 20; //Normal is 20
		private var panDistance:int = 30;
		private var scrollSpeed:Number = 0.1; //Normal is 0.01

		private var entity:Entity;
		
		private var gameObjects:Sprite = new Sprite();		
		
		//HIERARCHY
		//GameContainer
		//HUD
		//GameObjects
		//World
		
		public function GameState(gameContainer:GameContainer){
			super(gameContainer);
			this.gameContainer = gameContainer;
			
			//
			gameContainer.addChild(gameObjects);
			
			//Add World (and generate)
			GameData.world = new World(gameContainer, GameData.enemyMapObjects);
			gameObjects.addChild(GameData.world);
			GameData.world.addChild(GameData.worldBitmap);
			
			//Prepare world
			turnHandler = new TurnHandler(gameContainer);
			
			GameData.player = new Player(gameContainer);

			//combatHandler = new CombatHandler(gameContainer, world, player);
			//enemyHandler = new EnemyHandler(gameContainer, world, player, movementHandler, GameData.enemyList);
			
		}
		
		public override function tick():void{			
			GameData.player.tick();
			turnHandler.tick();
			GameData.world.tick();
			
			//RENDER ORDER
			//Tiles
			//Items
			//Enemies
			//Player
			//Lighting 
			
			//Tiles
			//Only render on Screen Tiles
			for(var i:int = Math.max(0, GameData.player.body.tileX - GameData.screenTileHalfWidth); i < Math.min(GameData.worldSize, GameData.player.body.tileX + GameData.screenTileHalfWidth); i++){
				for(var j:int = Math.max(0, GameData.player.body.tileY - GameData.screenTileHalfHeight); j < Math.min(GameData.worldSize, GameData.player.body.tileY + GameData.screenTileHalfHeight); j++){
						GameData.tileMapObjects[i][j].render();
				}
			}
			
			//Enemies
			for(var i:int = 0; i < GameData.enemiesOnScreen.length; i++){
					GameData.enemiesOnScreen[i].tick();
					GameData.enemiesOnScreen[i].render();
					//trace(GameData.enemiesOnScreen.length)
			}
		
			//Player
			GameData.player.render();
			
			//Lighting
			for(var i:int = Math.max(0, GameData.player.body.tileX - GameData.screenTileHalfWidth); i < Math.min(GameData.worldSize, GameData.player.body.tileX + GameData.screenTileHalfWidth); i++){
				for(var j:int = Math.max(0, GameData.player.body.tileY - GameData.screenTileHalfHeight); j < Math.min(GameData.worldSize, GameData.player.body.tileY + GameData.screenTileHalfHeight); j++){
					GameData.lightMapObjects[i][j].view.renderAlpha();
				}
			}
		}
		
		public function addEntity():void{
			
		}
		
		public function removeEntity():void{
			
		}
		
		public function init():void{
			/*
			Initialize players - positions, spells, etc.
			
			*/
		}
	}
}
