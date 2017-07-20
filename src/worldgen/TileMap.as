package src.worldgen{
	
	public class TileMap{

		public var tileMap:Array = new Array();
		
		private var _tileMapWidth:int = 0;
		private var _tileMapLength:int = 0;
		
		//BE CAUTIOUS THAT SIZE != 
		public function generateRectangle(sizeX:int, sizeY:int, ID:int):Array
		{
			var rectangle:Array = [];
			
			for(var a:int = 0; a < sizeX; a++)
			{
				rectangle.push(new Array());
				for(var b:int = 0; b < sizeY; b++)
				{
					rectangle[a][b] = ID;
				}
			}			
			return rectangle;
				
		}
		
		//Paste a rectangle into a bigger tileMap array
		public function pasteRectangle(bigArray:Array, posX:int, posY:int, sizeX:int, sizeY:int, ID:int, corner:int):void{
			pasteArray(generateRectangle(sizeX, sizeY, ID), bigArray, posX, posY, corner);
		}
		
		//Paste a small tileMap array into a bigger tileMap array
		//By default 0 is omitted from pasting (0 is an emptyTile)
		public function pasteArray(smallArray:Array, bigArray:Array, posX:int, posY:int, corner:int):Array
		{
			//corner is where it is pasted from, 0 = Top Left, 1 = Top Right, 2 = Bottom Left, 3 = Bottom Right	
			
 			for(var a:int = 0; a < smallArray.length; a++)
			{
				for(var b:int = 0; b < smallArray[a].length; b++)
				{
					//Do not paste 0 by default
					if(smallArray[a][b] != 0){
						switch(corner)
						{
							case 0: bigArray[a + posX][b + posY] = smallArray[a][b];
							break;
					
							case 1: bigArray[posX - a][b + posY] = smallArray[smallArray.length - 1 - a][b];
							break;
						
							case 2: bigArray[a + posX][posY - b] = smallArray[a][smallArray.length - 1 - b];
							break;
						
							case 3: bigArray[posX - a][posY - b] = smallArray[smallArray.length - 1 - a][smallArray.length - 1 - b];
							break;
						}
						
					}
				}
			}
			return bigArray;
		}
		
		//Checks whether ID tile surrounds the chosen tile
		public function checkSurroundingTiles(X:int, Y:int, arrayWidth:int, arrayLength:int, edges:Boolean, corners:Boolean, ID:int):Boolean{
			//Perform checks to ensure they are not on the very edges (out of bounds error)
			if(edges){
				if(Y > 0 && tileMap[X][Y - 1] == ID){
					return true;
				}
				else if(Y < arrayLength - 1 && tileMap[X][Y + 1] == ID){
					return true;
				}
				else if(X > 0 && tileMap[X - 1][Y] == ID){
					return true;
				}
				else if(X < arrayWidth - 1 && tileMap[X + 1][Y] == ID){
					return true;
				}
			}
			if(corners){
				if(X > 0 && Y > 0 && tileMap[X - 1][Y - 1] == ID){
					return true;
				}
				else if(X < arrayWidth - 1 && Y > 0 && tileMap[X + 1][Y - 1] == ID){
					return true;
				}
				else if(X > 0 && Y < arrayLength - 1 && tileMap[X - 1][Y + 1] == ID){
					return true;
				}
				else if(X < arrayWidth - 1 && Y < arrayLength - 1 && tileMap[X + 1][Y + 1] == ID){
					return true;
				}
			}
			return false;
		}
		//Fills surrounding emptyTiles with walls
		public function fillSurroundingEmptyTiles(X:int, Y:int, arrayWidth:int, arrayLength:int, edges:Boolean, corners:Boolean):void{
			//Perform checks to ensure they are not on the very edges (out of bounds error)
			if(edges){
				if(Y > 0 && tileMap[X][Y - 1] == 0){
					tileMap[X][Y - 1] = 2;
				}
				if(Y < arrayLength - 1 && tileMap[X][Y + 1] == 0){
					tileMap[X][Y + 1] = 2;
				}
				if(X > 0 && tileMap[X - 1][Y] == 0){
					tileMap[X - 1][Y] = 2;
				}
				if(X < arrayWidth - 1 && tileMap[X + 1][Y] == 0){
					tileMap[X + 1][Y] = 2;
				}
			}
			if(corners){
				if(X > 0 && Y > 0 && tileMap[X - 1][Y - 1] == 0){
					tileMap[X - 1][Y - 1] = 2;
				}
				if(X < arrayWidth - 1 && Y > 0 && tileMap[X + 1][Y - 1] == 0){
					tileMap[X + 1][Y - 1] = 2;
				}
				if(X > 0 && Y < arrayLength - 1 && tileMap[X - 1][Y + 1] == 0){
					tileMap[X - 1][Y + 1] = 2;
				}
				if(X < arrayWidth - 1 && Y < arrayLength - 1 && tileMap[X + 1][Y + 1] == 0){
					tileMap[X + 1][Y + 1] = 2;
				}
			}
		}
		//FOR TESTING
		public function traceArray(array:Array):void
		{
			for(var a:int = 0; a < array[0].length; a++)
			{
				trace(getRow(a, array));
			}		
		}

		public function getRow(rowNum:int, array:Array):Array
		{
			var row:Array = [];
			
			for(var a:int = 0; a < array.length; a++)
			{
				row.push(array[a][rowNum]);
			}
			
			return row;
		}
		
		public function getTileMap():Array{
			return tileMap;
		}
		
		public function get tileMapWidth():int{
			return _tileMapWidth;
		}
		public function set tileMapWidth(newWidth:int):void{
			_tileMapWidth = newWidth;
		}
		public function get tileMapLength():int{
			return _tileMapLength;
		}
		public function set tileMapLength(newLength:int):void{
			_tileMapLength = newLength;
		}
	}
	
}
