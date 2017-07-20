package src.global{
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import src.main.World;
	import src.main.Player;
	import src.engine.Entity;
	
	public class GameData{
		
		//THIS CLASS ALSO CONTAINS UTILITY FUNCTIONS
		
		//General variables
		public static var screenWidth:int = 840;
		public static var screenHeight:int = 600;
		public static var tileSize:int = 40;
		public static var screenTileWidth:int = screenWidth/tileSize;
		public static var screenTileHeight:int = screenHeight/tileSize;
		public static var screenTileHalfWidth:int = (screenTileWidth - 1) / 2 + 1;// + 1 for extra tile allowance for calculations to avoid seeing unrendered/uncalculated areas
		public static var screenTileHalfHeight:int = (screenTileHeight - 1) / 2 + 1;// + 1 for extra tile allowance for calculations to avoid seeing unrendered/uncalculated areas
		public static var worldSize:int = 60;
		
		//Player Variables
		public static var playerSize:int = 40;
		public static var playerXPoint:int = screenWidth/2 - playerSize/2;
		public static var playerYPoint:int = screenHeight/2 - playerSize/2;
		
		
		//private var _spritesPerRow:int;
		
		//Entity/Render variables
		public static var world:World;
		
		public static var worldBitmapData:BitmapData = new BitmapData(worldSize * tileSize, worldSize * tileSize);
		public static var worldBitmap:Bitmap = new Bitmap(worldBitmapData);
		
		public static var player:Player;
		
		//Entity lists
		public static var enemyMapObjects:Array = [];
		public static var miscMapObjects:Array = [];
		public static var tileMapObjects:Array = [];
		public static var lightMapObjects:Array = [];
		
		public static var enemyObjects:Array = [];
		public static var enemiesOnScreen:Array = [];
		
		//
		
		/*
		public static function get tileSize():int{
			return _tileSize;
		}
		
		public function get screenHeight():int{
			return _screenHeight;
		}
		
		public function get screenWidth():int{
			return _screenWidth;
		}
		
		public function get playerSize():int{
			return _playerSize;
		}
		public function get playerXPoint():int{
			return _playerXPoint;
		}
		public function get playerYPoint():int{
			return _playerYPoint;
		}
		*/
		/*public function get worldBitmapData():BitmapData{
			return worldBitmapData;
		}
		public function set worldBitmapData(bitmapData:BitmapData):void{
			worldBitmapData = bitmapData;
		}*/
		
	}
	
	
}
