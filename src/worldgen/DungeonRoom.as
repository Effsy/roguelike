package src.worldgen{
	
	import src.global.Utils;
	import src.global.GameData;
		
	import src.worldgen.TileMap;
	
	import src.entities.enemies.Enemy;
	import src.entities.enemies.RatEnemy;
	
	public class DungeonRoom extends Room{
		
		//Single Rectangle
		private var minSingleRectangle:int = 5;
		private var maxSingleRectangle:int = 14;
		
		//Double Rectangle
		private var minDoubleRectangle:int = 4;
		private var maxDoubleRectangle:int = 11;
		
		//Circle
		private var minRadius:int = 3;
		private var maxRadius:int = 6;		
		
		//Path variables
		private var markerX:int;
		private var markerY:int;
		private var connected:Boolean = false;
		private var reachable:Array = new Array();
		
		public override function DungeonRoom():void{
			super();
		}
		
		public override function generateRoom():void{
			
			//Default 1, 7
			var roomTypeRNG:int = Utils.randomRange(1, 7);
			
			//Room Types - Rectangle, Double Rectangle, Circle
			if(roomTypeRNG <= 4){
				//
				//Single Rectangle
				//
				
				roomWidth = Utils.randomRange(minSingleRectangle, maxSingleRectangle);
				roomHeight = Utils.randomRange(minSingleRectangle, maxSingleRectangle);
				
				//Fill room with wallTiles
				tileMap = generateRectangle(roomWidth, roomHeight, 2);
				
				//Remove inner area
				pasteRectangle(tileMap, 1, 1, roomWidth - 2, roomHeight - 2, 1, 0);
				
				
			}
			else if(roomTypeRNG >= 5 && roomTypeRNG <= 6){
				//
				//Double Rectangle - Pasted from Top Left Corner
				//
				var room1Width:int = Utils.randomRange(minDoubleRectangle, maxDoubleRectangle);
				var room1Height:int = Utils.randomRange(minDoubleRectangle, maxDoubleRectangle);
				
				var room2StartX:int = Utils.randomRange(1, room1Width - 1);
				var room2StartY:int = Utils.randomRange(1, room1Height - 1);
				var room2Width:int = Utils.randomRange(minDoubleRectangle, maxDoubleRectangle);
				var room2Height:int = Utils.randomRange(minDoubleRectangle, maxDoubleRectangle);
				
				//Width and Height is: Room1 + Room2 - overlap = Room1 + Room2 - (Room1 - Start2) = Room2 + Start2
				//Check if room 2 sticks outside of room 2 width/height
				// + 2 is for both walls. The starting wall is not included as it is contained inside the first room.
				// + 1 is for the outer wall. One of the walls is included as arrays starting indexing at 0 with overlap, and the room2Start points are set at 1 min
				if(room1Width >= room2Width + room2StartX) 
					roomWidth = room1Width + 2;
				else 
					roomWidth = room2Width + room2StartX + 1;
				
				if(room1Height >= room2Height + room2StartY) 
					roomHeight = room1Height + 2;
				else 
					roomHeight = room2Height + room2StartY + 1;
				
				//Fill room with wallTiles 
				tileMap = generateRectangle(roomWidth, roomHeight, 2);
				
				
				//Paste Rectangles
				pasteRectangle(tileMap, 1, 1, room1Width, room1Height, 1, 0);
				pasteRectangle(tileMap, room2StartX, room2StartY, room2Width, room2Height, 1, 0);
				
				//Remove extra wallTiles
				for(var i:int = 0; i < tileMap.length; i++){
					for(var j:int = 0; j < tileMap[0].length; j++){
						if(tileMap[i][j] == 2 && !checkSurroundingTiles(i, j, tileMap.length, tileMap[0].length, true, true, 1)){
							tileMap[i][j] = 0;
						}
					}
				}
				
			}
			else if(roomTypeRNG == 7){
				//
				//Circle
				//
				var circleRadius:int = Utils.randomRange(minRadius, maxRadius);
				
				roomWidth = circleRadius * 2 + 3;
				roomHeight = circleRadius * 2 + 3;
				
				var roomXCentre:int = circleRadius + 1;
				var roomYCentre:int = (roomHeight + 1) / 2 - 1;
				
				tileMap = generateRectangle(roomWidth, roomHeight, 2);
				
				//Create circle
				for(var i:int = 0; i < roomWidth; i++){
					for(var j:int = 0; j < roomHeight; j++){
						//x^2 + y^2 <= r^2 means inner region
						if(Math.pow(circleRadius, 2) >= Math.pow(i - roomXCentre, 2) + Math.pow(j - roomYCentre, 2)){
							tileMap[i][j] = 1;
						}
					}
				}
				
				//Remove extra wallTiles
				for(var i:int = 0; i < tileMap.length; i++){
					for(var j:int = 0; j < tileMap[0].length; j++){
						if(tileMap[i][j] == 2 && !checkSurroundingTiles(i, j, tileMap.length, tileMap[0].length, true, true, 1)){
							tileMap[i][j] = 0;
						}
					}
				}
				
				
			}
			
			//Place marker point for paths on a floorTile(initially at 0 to start the loop)
			do {
				markerX = Utils.randomRange(1, roomWidth - 1);
				markerY = Utils.randomRange(1, roomHeight - 1);
			}
			while(tileMap[markerX][markerY] != 1);
			
			//Final Initialisation
			tileMapWidth = tileMap.length;
			tileMapLength = tileMap[0].length;
		}
		
		//TEMPORARY
		public function addEnemies():void{
			//Number of enemies per room - default 1, 4 - improved range dependant on room area
			var enemyNumber:int = Utils.randomRange(1, Math.floor(tileMapWidth * tileMapLength / 30));
			var roomSpawnX:int;
			var roomSpawnY:int;
			var enemy:Enemy;
			for(var i:int = 0; i < enemyNumber; i++){
				do{
					roomSpawnX = Utils.randomRange(1, tileMapWidth - 1);
					roomSpawnY = Utils.randomRange(1, tileMapLength - 1);
				}
				while(tileMap[roomSpawnX][roomSpawnY] != 1 || GameData.enemyMapObjects[tileX + roomSpawnX][tileY + roomSpawnY] != 0);
				//Note above - tileMap is the room tileMap, enemyMap is the entire world enemyMap (hence no tileNumber is used)
				
				enemy = new RatEnemy(tileX + roomSpawnX, tileY + roomSpawnY);
				GameData.enemyMapObjects[tileX + roomSpawnX][tileY + roomSpawnY] = enemy;
				
			}
			//trace(enemies)
		}
		
		public function getMarkerX():int{
			return markerX;
		}
		
		public function getMarkerY():int{
			return markerY;
		}
		
		public function addMarkerX(X:int):void{
			markerX += X;
		}
		public function addMarkerY(Y:int):void{
			markerY += Y;
		}
		
		public function setConnected(connect:Boolean):void{
			connected = connect;
		}
		
		public function getConnected():Boolean{
			return connected;
		} 

		public function getReachable():Array{
			return reachable;
		}
	}
	
}
