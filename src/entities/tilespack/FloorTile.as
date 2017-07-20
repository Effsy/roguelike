package src.entities.tilespack{
	
	import src.gfx.Assets;
	import flash.display.BitmapData;
	
	public class FloorTile extends Tile{
		
		public function FloorTile(tileX:int, tileY:int){
			this.animationStartIndex = 1;
			this.animationEndIndex = 1;
			super(tileX, tileY, 0);
			this.ID = 1;
			this.solid = false;
			
		}
	}
}
