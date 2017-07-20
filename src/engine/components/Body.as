package src.engine.components{
	
	import src.global.GameData;
	import src.engine.Entity;
	public class Body{
		
		private var entity:Entity;
		public var _x:Number = 0;
		public var _y:Number = 0;
		
		private var _tileX:int;
		private var _tileY:int;
		private var angle:Number = 0;
		
		private var _onScreen:Boolean = false;
		
		
		/*
		* If you give an entity a body it can take physical form in the world, although to see it you will need a view.
		*/
		
		public function Body(entity:Entity, tileX:int, tileY:int){
			this.entity = entity;
			this.tileX = tileX;
			this.tileY = tileY;
			this.x = tileX * GameData.tileSize;
			this.y = tileY * GameData.tileSize;
		}
		
		public function set x(value:int):void{
			this._x = value;
		}
		public function get x():int{
			return this._x;
		}
		public function set y(value:int):void{
			this._y = value;
		}
		public function get y():int{
			return this._y;
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
		
		//Checks body if on screen (an extra number is added/subtracted to avoid seeing rendering too early)
		/*public function onScreen():Boolean{
			if(x > -GameData.world.x - 100 && x < -GameData.world.x + GameData.screenWidth && y > -GameData.world.y - 100 && y < -GameData.world.y + GameData.screenHeight)
				return true;

			return false;
		}*/
		
		//
		public function calculateOnScreen():void{
			if(tileX > GameData.player.body.tileX - GameData.screenTileHalfWidth && tileX < GameData.player.body.tileX + GameData.screenTileHalfWidth && tileY > GameData.player.body.tileY - GameData.screenTileHalfHeight && tileY < GameData.player.body.tileY + GameData.screenTileHalfHeight)
				onScreen = true;
			else
				onScreen = false;
			
		}
		
		
		public function get onScreen():Boolean{
			return _onScreen;
		}
		public function set onScreen(value:Boolean):void{
			_onScreen = value;
		}
	}
}