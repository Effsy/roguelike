package src.gfx
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	
	import src.res.imgs.TileSheet;
	import src.res.imgs.LightSheet;
	import src.entities.tilespack.*;
	//import src.entities.tilespack.FloorTile;
	
	public class Assets
	{
		
		private static var tileSize:int = 40;
		

		
		public static var floorTileData:BitmapData = new BitmapData(tileSize, tileSize); 
		public static var wallTileData:BitmapData = new BitmapData(tileSize, tileSize);
		public static var entranceTileData:BitmapData = new BitmapData(tileSize, tileSize);
		public static var exitTileData:BitmapData = new BitmapData(tileSize, tileSize);
		public static var escapeTileData:BitmapData = new BitmapData(tileSize, tileSize);
		
		public static var tileSheet:TileSheet = new TileSheet();
		public static var tileList:Array = new Array(EmptyTile, FloorTile, WallTile, EntranceTile, ExitTile, EscapeTile);
		
		public static var lightSheet:LightSheet = new LightSheet();
		//private static var enemySheet:EnemySheet = new EnemySheet();

		public static function init():void
		{
			floorTileData.copyPixels(tileSheet, new Rectangle(0, 0, tileSize, tileSize), new Point());
			wallTileData.copyPixels(tileSheet, new Rectangle(40, 0, tileSize, tileSize), new Point());
			entranceTileData.copyPixels(tileSheet, new Rectangle(80, 0, tileSize, tileSize), new Point());
			exitTileData.copyPixels(tileSheet, new Rectangle(120, 0, tileSize, tileSize), new Point());
			escapeTileData.copyPixels(tileSheet, new Rectangle(160, 0, tileSize, tileSize), new Point());
		}
		
		
		
		
	}
	
}
