package src.main{
	
	import src.global.GameData;
	import flash.geom.Point;
	
	public class LightingHandler{
		
		private var lightRadius:int = 10;
		private var lightPoints:Array = [];
		
		public function LightingHandler(){
			lightPoints = calculateLightPoints(lightRadius);
		}
		
		//Not perfect but close enough
		private function calculateLightPoints(radius:int):Array{
			var points:Array = [];
			for(var i:int = 0; i < radius * 2 + 1; i++){
				for(var j:int = 0; j < radius * 2 + 1; j++){
					if(Math.pow(radius, 2) >= Math.pow(i - radius, 2) + Math.pow(j - radius, 2) && Math.pow(radius - 2, 2) <= Math.pow(i - radius, 2) + Math.pow(j - radius, 2)){
						points.push(new Point(i - radius, j - radius));
					}
				}
			}
			return points;
		}
		
		/*
		private function calculateLightPoints(radius:int):Array{
			var points:Array = [];
			
			//Progress of circle
			var point:int = 1 - radius;
			
			var stepX:int = 1;
			var stepY:int = -2 * radius;
			var X:int = 0;
			var Y:int = radius;
			
			//Furthest points (not accounted for so manually added)
			points.push(new Point(0, radius));
			points.push(new Point(0, -radius));
			points.push(new Point(radius, 0));
			points.push(new Point(-radius, 0));
			
			//Diagonal points (not accounted for so manually added)
			points.push(new Point(radius - 2, radius - 2));
			points.push(new Point(-radius + 2, radius - 2));
			points.push(new Point(radius - 2, -radius + 2));
			points.push(new Point(-radius + 2, -radius + 2));
			while(X < Y){
				if(point >= 0){
					Y--;
					stepY += 2;
					point += stepY;
				}
				X++
				stepX += 2;
				point += stepX;
				
				//Build arc
				points.push(new Point(X, Y));
				points.push(new Point(-X, Y));
				points.push(new Point(X, -Y));
				points.push(new Point(-X, -Y));
				points.push(new Point(Y, X));
				points.push(new Point(-Y, X));
				points.push(new Point(Y, -X));
				points.push(new Point(-Y, -X));
			}
			trace(points);
			
			return points;
		}		
		*/
		public function calculateLight():void{
			//Cover screen with alpha100 tiles
			for(var i:int = Math.max(0, GameData.player.body.tileX - GameData.screenTileHalfWidth); i < Math.min(GameData.worldSize, GameData.player.body.tileX + GameData.screenTileHalfWidth + 3); i++){
				for(var j:int = Math.max(0, GameData.player.body.tileY - GameData.screenTileHalfHeight); j < Math.min(GameData.worldSize, GameData.player.body.tileY + GameData.screenTileHalfHeight + 3); j++){
						GameData.lightMapObjects[i][j].alphaLevel = 10;
				}
			}

			//Set player's tile to alpha0
			GameData.lightMapObjects[GameData.player.body.tileX][GameData.player.body.tileY].alphaLevel = 0;
					
			for(var i:int = 0; i < lightPoints.length; i++){
				lineBresenham(GameData.player.body.tileX, GameData.player.body.tileY, GameData.player.body.tileX + lightPoints[i].x, GameData.player.body.tileY + lightPoints[i].y);
			}
		}
		
		
		
		public function lineBresenham(x1:int, y1:int, x2:int, y2:int):void{
			var swap:Boolean = false;
			var temp:int;
			var alphaLevel:int = 0;

			var X:int = x1; 
			var Y:int = y1;

			var dx:int = Math.abs(x2 - x1);
			var dy:int = Math.abs(y2 - y1);
			
			var s1:int = x2 - x1 < 0 ? -1 : 1;
			var s2:int = y2 - y1 < 0 ? -1 : 1;
			
			var p:int;
			
			if(dy > dx){
				temp = dx;
				dx = dy;
				dy = temp;
				swap = true;
			}
			
			p = 2 * dy - dx
			
			for(var i:int = 0; i < dx; i++){
				while(p >= 0){
					p = p - 2 * dx;
					if(swap)
						X += s1;
					else
						Y += s2;
				}
				p = p + 2 * dy
				if(swap)
					Y += s2;
				else
					X += s1;
				
				//Set alphaLevel for the tile
				GameData.lightMapObjects[X][Y].alphaLevel = alphaLevel;
				//Creates smooth lighting
				alphaLevel++;
				
				//Stop at solid tiles
				if(GameData.tileMapObjects[X][Y].solid)
					break;
			}
			
		}
		
		
	}
	
}
