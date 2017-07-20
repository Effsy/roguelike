package src.entities.tilespack{
	
	import src.gfx.Assets;
	import flash.display.BitmapData;
	
	public class EscapeTile extends Tile{
		
		public function EscapeTile(tileX:int, tileY:int){
			this.animationStartIndex = 5;
			this.animationEndIndex = 5;
			super(tileX, tileY, 0);
			this.ID = 5;
			this.solid = false;
			
		}
	}
}
