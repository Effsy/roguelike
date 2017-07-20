package src.engine.components{
	
	import src.engine.Entity;
	
	public class Health{
		public var entity:Entity;
		public var hp:int;
		//public var died:Signal;
		//public var hurt:Signal;
		
		public function Health(entity:Entity){
			this.entity = entity;
			//died = new Signal(Entity);
			//hurt = new Signal(Entity);
		}
		
		public function hit(amount:int):void{
			hp -= amount;
			
			//hurt.dispatch(entity);
			
			//Dead
			if (hp < 0){
				//died.dispatch(entity);
			}
		}
		
		public function heal(amount:int):void{
			hp += amount;
		}
		
	}

}