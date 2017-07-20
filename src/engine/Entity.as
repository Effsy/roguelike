package src.engine{

	import flash.display.BitmapData;
	
	import src.engine.components.*;
	
	public class Entity implements IEntity{
		
		private var _body:Body;
		//private var _physics:Physics;
		private var _health:Health;
		//private var _weapon:Weapon;
		private var _view:View;
		private var _ai:AI;
		
		//private var _entityCreated:Signal;
		//private var _destroyed:Signal;
		
		private var _animationStartIndex:int;
		private var _animationEndIndex:int;
		
		private var _targets:Vector.<Entity>;
		private var _group:Vector.<Entity>;
		
		private var _copyData:BitmapData;
		
		private var _solid:Boolean = true;
		private var _alphaLevel:int = 1;
		

		
		
		public function Entity(){
			//entityCreated = new Signal(Entity);
			//destroyed = new Signal(Entity);
		}
		
		public function destroy():void{
			//destroyed.dispatch(this);
			
			if (group) group.splice(group.indexOf(this), 1);
		}
		
		public function tick():void{
			//if (physics) physics.update();
		}
		
		public function render():void{
			if (view) view.render();
		}
		
		
		public function get body():Body{
			return _body;
		}
		
		public function set body(value:Body):void{
			_body = value;
		}
		
		public function get solid():Boolean{
			return _solid;
		}
		
		public function set solid(value:Boolean):void{
			_solid = value;
		}
		/*public function get physics():Physics 
		{
			return _physics;
		}
		
		public function set physics(value:Physics):void 
		{
			_physics = value;
		}*/
		
		public function get health():Health{
			return _health;
		}
		
		public function set health(value:Health):void{
			_health = value;
		}
		
		/*public function get weapon():Weapon{
			return _weapon;
		}
		
		public function set weapon(value:Weapon):void{
			_weapon = value;
		}*/
		
		public function get view():View{
			return _view;
		}
		
		public function set view(value:View):void{
			_view = value;
		}
		
		public function get ai():AI{
			return _ai;
		}
		
		public function set ai(value:AI):void{
			_ai = value;
		}
		
		public function get animationStartIndex():int{
			return _animationStartIndex;
		}
		
		public function set animationStartIndex(value:int):void{
			_animationStartIndex = value;
		}
		
		public function get animationEndIndex():int{
			return _animationEndIndex;
		}
		
		public function set animationEndIndex(value:int):void{
			_animationEndIndex = value;
		}
		
		/*public function get entityCreated():Signal 
		{
			return _entityCreated;
		}
		
		public function set entityCreated(value:Signal):void 
		{
			_entityCreated = value;
		}
		
		public function get destroyed():Signal 
		{
			return _destroyed;
		}
		
		public function set destroyed(value:Signal):void 
		{
			_destroyed = value;
		}*/
		
		public function get targets():Vector.<Entity>{
			return _targets;
		}
		
		public function set targets(value:Vector.<Entity>):void{
			_targets = value;
		}
		
		public function get group():Vector.<Entity>{
			return _group;
		}
		
		public function set group(value:Vector.<Entity>):void{
			_group = value;
		}
		
		public function set copyData(value:BitmapData):void{
			_copyData = value;
		}
		
		public function get alphaLevel():int{
			return _alphaLevel;
		}
		public function set alphaLevel(value:int):void{
			_alphaLevel = value;
		}
		

	}
	
}
