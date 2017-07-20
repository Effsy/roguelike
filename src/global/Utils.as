package src.global {
	
	public class Utils {

		public static function randomRange(minNum:Number, maxNum:Number):int{
   			return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
		}
		
		public static function duplicateMultidimensionalArray(array:Array):Array{
    		var newArray:Array = new Array();
    		for(var i:int = 0; i < array.length; i++){
        		var content:* = array[i];
        		if (content is Array) {
            		newArray[i] = duplicateMultidimensionalArray(content);
        		}
				else{
            		newArray[i] = content;
        		}
    		}
   			return newArray;       
		}
		
		public static function squareArray(arraySize:int):Array{
			var array:Array = [];
			for(var i:int = 0; i < arraySize; i++){
        		array.push(new Array());
				for(var j:int = 0; j < arraySize; j++){
        			array[i].push(0);
        		}
        	}
			return array;
    		
		}
		
	}
	
}
