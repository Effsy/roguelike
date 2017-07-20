package src.entities.tilespack{
	
	import src.gfx.Assets;
	import flash.display.BitmapData;
	
	public class EmptyTile extends Tile{
		
		public function EmptyTile(tileX:int, tileY:int){
			this.animationStartIndex = 0;
			this.animationEndIndex = 0;
			super(tileX, tileY, 0);
			this.ID = 0;
			this.solid = true;
			
		}
	}
}
