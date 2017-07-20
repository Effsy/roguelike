package src.main {
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.ui.Keyboard;
	import flash.events.KeyboardEvent;
	
	public class InputHandler {

		private static var scrollDirection:int = 0;
		
		private var gameContainer:GameContainer;
		private var upPressed:Boolean = false;
		private var downPressed:Boolean = false;
		private var leftPressed:Boolean = false;
		private var rightPressed:Boolean = false;
		
		private var wPressed:Boolean = false;
		private var sPressed:Boolean = false;
		private var aPressed:Boolean = false;
		private var dPressed:Boolean = false;
		
		private var shiftPressed:Boolean = false;
		
		private var iPressed:Boolean = false;
		private var pPressed:Boolean = false;
		
		public function InputHandler(gameContainer:GameContainer) 
		{
			this.gameContainer = gameContainer;
			gameContainer.getStage().addEventListener(MouseEvent.MOUSE_WHEEL, onMouseWheelScroll);
			gameContainer.getStage().addEventListener(KeyboardEvent.KEY_DOWN, onKeyPressed);
			gameContainer.getStage().addEventListener(KeyboardEvent.KEY_UP, onKeyReleased);
		}
		
		public function onMouseWheelScroll(e:MouseEvent):void
		{
			if(e.delta < 0)
			{
				scrollDirection = -1;
			}
			else if(e.delta > 0)
			{
				scrollDirection = 1;
			}
		}
		
		public function onKeyPressed(e:KeyboardEvent):void
		{
			switch(e.keyCode){
				case Keyboard.UP:
					upPressed = true;
					break;
				case Keyboard.DOWN:
					downPressed = true;
					break;
				case Keyboard.LEFT:
					leftPressed = true;
					break;
				case Keyboard.RIGHT:
					rightPressed = true;
					break;
				case Keyboard.W:
					wPressed = true;
					break;
				case Keyboard.S:
					sPressed = true;
					break;
				case Keyboard.A:
					aPressed = true;
					break;
				case Keyboard.D:
					dPressed = true;
					break;
				case Keyboard.SHIFT:
					shiftPressed = true;
					break;
				case Keyboard.I:
					iPressed = !iPressed;
					break;
				case Keyboard.P:
					pPressed = !pPressed;
					break;
				
			}
		}
		
		public function onKeyReleased(e:KeyboardEvent):void
		{
			switch(e.keyCode){
				case Keyboard.UP:
					upPressed = false;
					break;
				case Keyboard.DOWN:
					downPressed = false;
					break;
				case Keyboard.LEFT:
					leftPressed = false;
					break;
				case Keyboard.RIGHT:
					rightPressed = false;
					break;
				case Keyboard.W:
					wPressed = false;
					break;
				case Keyboard.S:
					sPressed = false;
					break;
				case Keyboard.A:
					aPressed = false;
					break;
				case Keyboard.D:
					dPressed = false;
					break;
				case Keyboard.SHIFT:
					shiftPressed = false;
					break;
			}
		}
		
		public function tick():void
		{
			
		}
		
		public function getMouseX():int
		{
			return gameContainer.mouseX;
		}
		public function getMouseY():int
		{
			return gameContainer.mouseY;
		}
		
		//Movement
		public function getKeyUp():Boolean
		{
			return upPressed;
		}
		public function getKeyDown():Boolean
		{
			return downPressed;
		}
		public function getKeyLeft():Boolean
		{
			return leftPressed;
		}
		public function getKeyRight():Boolean
		{
			return rightPressed;
		}
		
		//Attacks
		public function getKeyW():Boolean
		{
			return wPressed;
		}
		public function getKeyS():Boolean
		{
			return sPressed;
		}
		public function getKeyA():Boolean
		{
			return aPressed;
		}
		public function getKeyD():Boolean
		{
			return dPressed;
		}
		
		public function getShiftPressed():Boolean
		{
			return shiftPressed;
		}
		public function getiPressed():Boolean
		{
			return iPressed;
		}
		public function getPPressed():Boolean
		{
			return pPressed;
		}
		
		public function getScrollDirection():int
		{
			return scrollDirection;
		}
		public function setScrollDirection(s:int):void
		{
			scrollDirection = s;
		}
		
		
		
	}
	
}
