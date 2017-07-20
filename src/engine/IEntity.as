package src.engine{
	
	import src.engine.components.*;
	
	public interface IEntity{
		
		// ACTIONS
		function destroy():void;
		function tick():void;
		function render():void;
		
		// COMPONENTS
		function get body():Body;
		function set body(value:Body):void;
		//function get physics():Physics; 
		//function set physics(value:Physics):void 
		function get health():Health 
		function set health(value:Health):void
		//function get weapon():Weapon; 
		//function set weapon(value:Weapon):void;
		function get view():View; 
		function set view(value:View):void; 
		function get ai():AI; 
		function set ai(value:AI):void; 
		
		// SIGNALS
		//function get entityCreated():Signal; 
		//function set entityCreated(value:Signal):void;
		//function get destroyed():Signal; 
		//function set destroyed(value:Signal):void; 
		
		// DEPENDANCIES
		function get targets():Vector.<Entity>; 
		function set targets(value:Vector.<Entity>):void;
		function get group():Vector.<Entity>; 
		function set group(value:Vector.<Entity>):void; 
	}
	
}