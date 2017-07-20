package src.entities.tilespack{
	
	public class LightTile extends Tile{
		
		public function LightTile(tileX:int, tileY:int){
			this.animationStartIndex = 0;
			this.animationEndIndex = 0;
			super(tileX, tileY, 1);
			this.ID = 0;
			this.solid = false;
			
		}
		
		
	}
}
