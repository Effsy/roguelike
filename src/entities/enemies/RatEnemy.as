package src.entities.enemies{

	import flash.display.BitmapData;
	import src.engine.Entity;
	import src.engine.Enemy
	
	public class RatEnemy extends Enemy{
		
		public var nextTileX:int;
		public var nextTileY:int;
		
		public function RatEnemy(tileX:int, tileY:int){
			this.animationStartIndex = 6;
			this.animationEndIndex = 6;
			super(tileX, tileY);
			this.solid = true;
			this.idleType = 0;
			this.aggroType = 0;
			this.fleeType = 0;
		}
		
		public override function tick():void{
			
		}
		
		
	}
	
}
