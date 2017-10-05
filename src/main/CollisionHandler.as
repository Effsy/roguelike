package src.main {
	
	import flash.display.Sprite;
	import src.main.World;
	
	public class CollisionHandler {

		private var gameObjects:Sprite;

		public function CollisionHandler(gameObjects:Sprite) {
			this.gameObjects = gameObjects;
			
		}
		
		//Check for collisions
		public function tick():void{
			
		}
		
		public function intersect():Boolean{
			//for(var i:int = 0; i < )
			return false;
		}
	}
}
