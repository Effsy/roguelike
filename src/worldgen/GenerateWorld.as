package src.worldgen{
	
	import flash.geom.Point;
	import src.global.GameData;
	import src.global.Utils;
	import src.worldgen.DungeonRoom;
	import src.engine.Entity;
	
	public class GenerateWorld extends TileMap{
		
		//General
		private var worldSize:int = 60;
		private var completable:Boolean = false;
		
		//Paths
		private var markerIncrease:int = 10;
		
		//Stairs
		private var doorDistance:int = 50;
		private var _entranceX:int;
		private var _entranceY:int;
		private var exitX:int;
		private var exitY:int;
		private var escapeX:int;
		private var escapeY:int;
		
		private var rooms:Array = new Array();
		private var reachableRooms:Array = new Array();
		
		//Enemy
		private var enemyList:Array;
		private var enemyMap:Array;
		
		//Rooms
		private var dungeonRoom:DungeonRoom;
		
		public function GenerateWorld(enemyList:Array):void
		{
			this.enemyList = enemyList;
		
			//Generate tileMap of emptyTiles			
			
			
			//Generate chosen map type
			
			//If not completable, start over
			while(!completable){
				//Initialisation
				tileMap = generateRectangle(worldSize, worldSize, 0);
				rooms = [];
				reachableRooms = [];
				
				entranceX = 0;
				entranceY = 0;
				exitX = 0;
				exitY = 0;
				escapeX = 0;
				escapeY = 0;
				
				generateDungeon();
				
			}
			
			addDoors();
			//addFeatures();
			addEnemies();
			
			
			
			//traceArray(tileMap);
		}
		
		
		
		private function generateDungeon():void{
			var roomAttempts:int = 60;
			var fitAttempts:int = 15;
			
			//----------
			//Make Rooms
			//----------
			for(var i:int = 0; i < roomAttempts; i++){
				dungeonRoom = new DungeonRoom();
				
				//Try fit rooms in map
				for(var j:int = 0; j < fitAttempts; j++){
					
					var posX:int = Utils.randomRange(1, worldSize - 1);
					var posY:int = Utils.randomRange(1, worldSize - 1);
					
					//Check if fits in limit of map and check there are no intersection with other rooms
					if(posX + dungeonRoom.tileMapWidth < worldSize && posY + dungeonRoom.tileMapLength < worldSize && !roomIntersects(dungeonRoom.getTileMap(), posX, posY)){
						//Successful - the room will be placed
						
						//Add markers for linking paths
						dungeonRoom.addMarkerX(posX);
						dungeonRoom.addMarkerY(posY);
						dungeonRoom.tileX = posX;
						dungeonRoom.tileY = posY;
						//Paste the array on the world tileMap
						pasteArray(dungeonRoom.getTileMap(), tileMap, posX, posY, 0);
						
						//Keep track of rooms
						rooms.push(dungeonRoom);
						
						//Increase length of array by 
						//reachableRooms.push(-2);
						
						j = fitAttempts;
					}
					
				}
			}
			//----------
			//Link paths
			//----------
			var asd:int = 0;

			reachableRooms[0] = 0;

			for(var i:int = 0; i < rooms.length; i++){
				var maxDistance:int = 2;
				
				while(!rooms[i].getConnected()){
					maxDistance += markerIncrease;
						
					//If the room is different, and the marker is within the distance
					for(var j:int = 0; j < rooms.length; j++){
						if(i != j && Math.abs(rooms[i].getMarkerX() - rooms[j].getMarkerX()) + Math.abs(rooms[i].getMarkerY() - rooms[j].getMarkerY()) <= maxDistance){
							rooms[i].setConnected(true);
							rooms[j].setConnected(true);
							
							createPath(rooms[i].getMarkerX(), rooms[i].getMarkerY(), rooms[j].getMarkerX(), rooms[j].getMarkerY());
							
							if(rooms[i].getReachable().indexOf(i) == -1){
								rooms[i].getReachable().push(i);
							}
							if(rooms[j].getReachable().indexOf(i) == -1){
								rooms[j].getReachable().push(i);
							}
							if(rooms[i].getReachable().indexOf(j) == -1){
								rooms[i].getReachable().push(j);
							}
							if(rooms[j].getReachable().indexOf(j) == -1){
								rooms[j].getReachable().push(j);
							}
						}
					}
				}
			}
			
			//---------------
			//Fill emptyTiles
			//---------------
			for(var i:int = 0; i < worldSize; i++){
				for(var j:int = 0; j < worldSize; j++){
					if(tileMap[i][j] == 1){
					   fillSurroundingEmptyTiles(i, j, worldSize, worldSize, true, true);
					}  
				}
				
			}
			
			//--------------------
			//Check if completable
			//--------------------
			
			//Add all connected rooms to an array
			var changeMade:Boolean = true;
			while(changeMade){
				changeMade = false;
				//Iterate through every room
				for(var i:int = 0; i < rooms.length; i++){
					//Iterate through every room's reachable array
					for(var j:int = 0; j < rooms[i].getReachable().length; j++){
						//If one of the values in the reachable array is in the reachableRooms array:
						if(reachableRooms.indexOf(rooms[i].getReachable()[j]) > -1){
							//Add all reachable rooms to the reachableRooms array
							
							for(var k:int = 0; k < rooms[i].getReachable().length; k++){								
								//If the value isn't already in the reachableRooms array - this is just so that a change isn't a made, and the loop can exit
								if(reachableRooms.indexOf(rooms[i].getReachable()[k]) == -1){
									reachableRooms[rooms[i].getReachable()[k]] = rooms[i].getReachable()[k];
									changeMade = true;
									
								}
							}
							//j = rooms[i].getReachable().length;
							break;
						}
					}
				}
				
			}			
			trace(reachableRooms)
			//Check reachableRooms contains every room
			var roomsConnected:int = 0;
			for(var i:int = 0; i < rooms.length; i++){
				if(reachableRooms.indexOf(i) > -1)
					roomsConnected++;
			}
			if(roomsConnected == rooms.length)
				completable = true;
			
		}
		
		private function createPath(X1:int, Y1:int, X2:int, Y2:int):void{
				tileMap[X1][Y1] = 1;
				
				var addX:int;
				var addY:int;
				var dir:Boolean;
				//Setup addition amounts depending on positions
				if(X2 > X1){
					addX = 1;
				}
				else{
					addX = -1;
				}
				if(Y2 > Y1){
					addY = 1;
				}
				else{
					addY = -1;
				}
				while(X1 != X2 || Y1 != Y2){
					//Chance to change direction
					if(Utils.randomRange(0, 3) == 0){
						dir = !dir
					}
					//X axis
					if(dir && X1 != X2){
						X1 += addX;
					}
					//Y axis
					else if(!dir && Y1 != Y2){
						Y1 += addY;
					}
					tileMap[X1][Y1] = 1;
				}
		}
		
		private function addDoors():void{
			//While distance between doors are less than doorDistance, or the doors aren't on floorTiles, or the surrounding tiles aren't all floorTiles
			while(Math.abs(entranceX - exitX) + Math.abs(entranceY - exitY) < doorDistance || tileMap[entranceX][entranceY] != 1 || tileMap[exitX][exitY] != 1){
				entranceX = Utils.randomRange(1, worldSize - 1);
				entranceY = Utils.randomRange(1, worldSize - 1);
				exitX = Utils.randomRange(1, worldSize - 1);
				exitY = Utils.randomRange(1, worldSize - 1);
			}
			while(Math.abs(entranceX - escapeX) + Math.abs(entranceY - escapeY) < doorDistance || tileMap[escapeX][escapeY] != 1){
				escapeX = Utils.randomRange(1, worldSize - 1);
				escapeY = Utils.randomRange(1, worldSize - 1);
			}
			
			tileMap[entranceX][entranceY] = 3;
			tileMap[exitX][exitY] = 4;
			tileMap[escapeX][escapeY] = 5;
		}
		
		private function roomIntersects(room:Array, posX:int, posY:int):Boolean{
			for(var i:int = 0; i < room.length; i++){
				for(var j:int = 0; j < room[0].length; j++){
					//If the tile is not an empty space in the room, or the tile is not an empty space in the tileMap, or the tile is not a wall in both arrays
					if(dungeonRoom.getTileMap()[i][j] != 0 && tileMap[posX + i][posY + j] != 0 && !(dungeonRoom.getTileMap()[i][j] == 2 && tileMap[posX + i][posY + j] == 2)){
						//There is an intersection here
						return true;
						
					}
				}
			}
			return false;
		}
			
		public function get entranceX():int{
			return _entranceX;
		}
		public function set entranceX(value:int):void{
			_entranceX = value;
		}
		public function get entranceY():int{
			return _entranceY;
		}
		public function set entranceY(value:int):void{
			_entranceY = value;
		}
		
		private function addEnemies():void{
			for(var i:int = 0; i < rooms.length; i++){
				rooms[i].addEnemies();
			}
			
			
		}
	}
	
}
