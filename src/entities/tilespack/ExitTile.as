package src.entities.tilespack{
	
	import src.gfx.Assets;
	import flash.display.BitmapData;
	
	public class ExitTile extends Tile{
		
		public function ExitTile(tileX:int, tileY:int){
			this.animationStartIndex = 4;
			this.animationEndIndex = 4;
			super(tileX, tileY, 0);
			this.ID = 4;
			this.solid = false;
			
		}
	}
}
