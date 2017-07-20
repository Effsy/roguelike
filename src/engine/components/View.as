package src.engine.components{
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	import src.global.GameData;
	
	import src.engine.Entity;
	
	public class View{
		
		private var entity:Entity;
		//private var containerData:BitmapData;
		private var copyData:BitmapData;
		private var rectangle:Rectangle;
		private var point:Point = new Point(0, 0);
		
		private var spritesPerRow:int = 16
		private var animationIndex:int;
		private var animationStartIndex:int;
		private var animationEndIndex:int;
		private var animationCount:int = 0;
		private var animationDelay:int = 10;
		
		
		private var tileWidth:int;
		private var tileLength:int;
		
		private var alpha0:BitmapData = new BitmapData(40, 40, true, 0x00000000);
		private var alpha10:BitmapData = new BitmapData(40, 40, true, 0x19000000);
		private var alpha20:BitmapData = new BitmapData(40, 40, true, 0x33000000);
		private var alpha30:BitmapData = new BitmapData(40, 40, true, 0x4c000000);
		private var alpha40:BitmapData = new BitmapData(40, 40, true, 0x66000000);
		private var alpha50:BitmapData = new BitmapData(40, 40, true, 0x7f000000);
		private var alpha60:BitmapData = new BitmapData(40, 40, true, 0x99000000);
		private var alpha70:BitmapData = new BitmapData(40, 40, true, 0xb2000000);
		private var alpha80:BitmapData = new BitmapData(40, 40, true, 0xcc000000);
		private var alpha90:BitmapData = new BitmapData(40, 40, true, 0xe5000000);
		private var alpha100:BitmapData = new BitmapData(40, 40, true, 0xff000000);
		
		private var alphaTileList:Array = [alpha0, alpha10, alpha20, alpha30, alpha40, alpha50, alpha60, alpha70, alpha80, alpha90, alpha100];
		
		/*
		 * View is display component which renders an Entity using a blitting technique. 
		 */
		
		public function View(entity:Entity, copyData:BitmapData, tileWidth:int, tileLength:int, animationStartIndex:int, animationEndIndex:int){
			this.entity = entity;
			this.copyData = copyData;
			this.tileWidth = tileWidth;
			this.tileLength = tileLength;
			this.animationStartIndex = animationStartIndex;
			this.animationEndIndex = animationEndIndex;
			this.animationIndex = animationStartIndex;
			rectangle = new Rectangle(0, 0, tileWidth, tileLength);
			
		}
		
		public function render():void{
			point.x = entity.body.x;
			point.y = entity.body.y;
			//bitmap.rotation = entity.body.angle * (180 / Math.PI);
			//trace(rectangle)
			//trace(point)
			//trace(containerData)
			//trace(copyData)
			//trace(this.animationIndex)
			//Increase animation index after animationDelay number of frames
			if(animationCount == animationDelay){
				//animationIndex++;
				animationCount = 0;
				//At end of animation
				if(animationIndex >= animationEndIndex){
					animationIndex = animationStartIndex;
				}
			}
			else{
				animationCount++;
			}
			
			rectangle.x = int(animationIndex % spritesPerRow) * tileWidth;
			rectangle.y = int(animationIndex / spritesPerRow) * tileLength;
			
			GameData.worldBitmapData.copyPixels(copyData, rectangle, point);
		}
		
		public function renderAlpha():void{
			point.x = entity.body.x;
			point.y = entity.body.y;
			//Increase animation index after animationDelay number of frames
			if(animationCount == animationDelay){
				//animationIndex++;
				animationCount = 0;
				//At end of animation
				if(animationIndex >= animationEndIndex){
					animationIndex = animationStartIndex;
				}
			}
			else{
				animationCount++;
			}
			
			rectangle.x = int(animationIndex % spritesPerRow) * tileWidth;
			rectangle.y = int(animationIndex / spritesPerRow) * tileLength;

			GameData.worldBitmapData.copyPixels(copyData, rectangle, point, alphaTileList[this.entity.alphaLevel], null, true);
		}
		
	}
}