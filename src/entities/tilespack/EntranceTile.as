package src.entities.tilespack{
	
	import src.gfx.Assets;
	import flash.display.BitmapData;
	
	public class EntranceTile extends Tile{
		
		public function EntranceTile(tileX:int, tileY:int){
			this.animationStartIndex = 3;
			this.animationEndIndex = 3;
			super(tileX, tileY, 0);
			this.ID = 3;
			this.solid = false;
			
		}
	}
}
