package src.entities.tilespack{

	import flash.display.BitmapData;
	
	import src.gfx.Assets;
	import src.engine.Entity;
	import src.global.GameData;
	
	import src.engine.components.Body;
	import src.engine.components.View;
	
	public class Tile extends Entity{
		
		private var _ID:int;
		
		private var animated:Boolean = false;
		
		private var tileData:BitmapData;
		//Sheet IDs
		//TileSheet = 0
		//LightSheet = 1;
		
		public function Tile(tileX:int, tileY:int, sheetID:int):void{
			switch(sheetID){
				case 0: tileData = Assets.tileSheet; break;
				case 1: tileData = Assets.lightSheet; break;
			}
				
			body = new Body(this, tileX, tileY);
			view = new View(this, tileData, GameData.tileSize, GameData.tileSize, animationStartIndex, animationEndIndex);
		}
		
		public function get ID():int{
			return _ID;
		}
		
		public function set ID(id:int):void{
			_ID = id;
		}

		public override function tick():void{
			
		}
		
	}
	
}
