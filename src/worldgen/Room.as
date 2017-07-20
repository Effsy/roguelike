package src.worldgen {

	import src.worldgen.TileMap;
	import src.engine.Entity;
	
	public class Room extends TileMap{
		
		//Room shape variables
		public var roomWidth:int;
		public var roomHeight:int;
		
		//Feature variables
		public var water:Boolean;
		public var chest:Boolean;
		public var altar:Boolean;
		public var enemy:Boolean;
		public var save:Boolean;
		public var fire:Boolean;
		
		//Room Position variables
		private var _tileX:int;
		private var _tileY:int;
		
		
		public function Room(){
			generateRoom();
			addFeatures();
		}
		
		public function generateRoom():void{
			
		}
		
		public function addFeatures():void{
			
		}
		
		public function get tileX():int{
			return _tileX;
		}
		public function set tileX(value:int):void{
			_tileX = value;
		}
		public function get tileY():int{
			return _tileY;
		}
		public function set tileY(value:int):void{
			_tileY = value;
		}
		/*public function addEnemies():void{
			
		}
			*/
	}
	
}
