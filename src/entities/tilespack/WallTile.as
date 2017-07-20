package src.entities.tilespack{
	
	import src.gfx.Assets;
	import flash.display.BitmapData;
	
	public class WallTile extends Tile{
		
		public function WallTile(tileX:int, tileY:int){
			this.animationStartIndex = 2;
			this.animationEndIndex = 2;
			super(tileX, tileY, 0);
			this.ID = 2;
			this.solid = true;
			
		}
	}
}
