package src.states{
	
	import flash.display.Sprite;
	
	public class State{
		
		private static var currentState:State = null;
		
		protected static var stateContainer;
		
		public static function setState(s:State):void{
			currentState = s;
		}
		
		public static function getState():State{
			return currentState;
		}
		public function State(s:Sprite):void{
			stateContainer = s;
		}
		
		public static function getStateContainer():Sprite{
			return stateContainer;
		}
		
		public function tick():void{
			
		}

	}
	
}
