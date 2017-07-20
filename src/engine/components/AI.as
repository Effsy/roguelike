package src.engine.components{
	
	import src.global.GameData;
	import src.engine.components.Body;
	
	import src.engine.Entity;
	import src.engine.states.*;
	
	public class AI{

		private var entity:Entity;
		
		//Used States
		private var idleState:IAIState;
		private var aggroState:IAIState;
		private var fleeState:IAIState;
		
		private var currentState:IAIState = null;
		
		
		//All States
		
		
		//IDLE TYPES
		//0 = No movement
		//1 = random movement
		//??? pattern movement? circle, square, line
		
		//AGGRO TYPES
		//0 = x/y follow
		//1 = flying x/y follow - is this different?
		//
		
		//FLEE TYPES
		//0 = x/y flee
		//
		//
		
		
		
		public function AI(entity:Entity, idleState:int, aggroState:int, fleeState:int){
			this.entity = entity;
			//this.idleType = idleType;
			//this.aggroType = aggroType;
			//this.fleeType = fleeType;
			
		}
		
		public function initStates():void{
			
		}

	}
	
}
