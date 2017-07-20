package src.engine{
	
	import flash.display.BitmapData;
	
	import src.global.GameData;
	import src.engine.Entity;
	import src.gfx.Assets;
	import src.engine.components.Body;
	import src.engine.components.View;
	import src.engine.components.AI;

	
	public class Enemy extends Entity{
		
		private var tileWidth:int = 40;
		private var tileLength:int = 40;
		
		public var idleType:int;
		public var aggroType:int;
		public var fleeType:int;
		
		//State determines basic AI - always start idle
		//0 = Idle
		//1 = Aggro
		//2 = Flee
		//3 = 
		//4 = 
		
		
		private var combatState:int = 0;
		
		public function Enemy(tileX:int, tileY:int) {
			body = new Body(this, tileX, tileY);
			view = new View(this, Assets.tileSheet, GameData.tileSize, GameData.tileSize, animationStartIndex, animationEndIndex);
			ai = new AI(this, idleType, aggroType, fleeType);
		}
		
		public override function tick():void{
			trace(21329808091)
		}
		
	}
	
}
