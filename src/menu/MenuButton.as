package {
	
	import flash.display.Button;
	import flash.events.MouseEvent;
	
	public class MenuButton extends Button{
		
		public function MenuButton() {
			addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			addEventListener(MouseEvent.CLICK, onMouseClick);
		}
		
		public function onMouseOver(e:MouseEvent):void{
			//Short animation
		}
		
		public function onMouseOut(e:MouseEvent):void{
			//Undo animation
		}
		
		public function onMouseClick(e:MouseEvent):void{
			
		}
	}
}
