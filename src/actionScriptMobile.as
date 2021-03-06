package
{
	import flash.display.*;
	import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import flash.text.TextFormat;
    import flash.events.Event;
    import flash.display.Scene;

    import flash.display.Shape;
    import flash.events.MouseEvent;
    import flash.events.TextEvent;
    import flash.events.KeyboardEvent;
    import spark.components.Button;

	public class actionScriptMobile extends Sprite
	{
		private var label:TextField;
		private var triangle: Shape;
		private var acceptButton: Button;
		
		private var xPos: int;
		private var yPos: int;
		
		public function actionScriptMobile()
		{
			super();
			
			var w:Number= 100
			 
		
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			label = new TextField();
			label.autoSize = TextFieldAutoSize.CENTER;
			
			var format:TextFormat = new TextFormat();
			format.font = "Verdana";
			format.size = 24;
			
			label.defaultTextFormat = format;
			label.text = "Hello World!";
			addChild(label);
			
			
			
			addChild(createTriangle());
			stage.addEventListener(Event.RESIZE, onResizeEvent); 
			
			stage.addEventListener(MouseEvent.CLICK, onTrackMouse );
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, updatOutput );
			
			stage.addEventListener(MouseEvent.MOUSE_MOVE, stopDragObject);
			
			 
			
		}
		
		private function createTriangle(): Shape {
			
			var triangleHeight: uint= 100;
			
			triangle= new Shape();
			
			
			
			triangle.graphics.beginFill(0x0000CC);
			triangle.graphics.moveTo(triangleHeight/2,0);
			
			triangle.graphics.lineTo(triangleHeight, triangleHeight); 
			triangle.graphics.lineTo(0, triangleHeight); 
			triangle.graphics.lineTo(triangleHeight / 2, 0); 
	 		
			
			return triangle;
			
		}
		
		private function onResizeEvent(event:Event):void
		{ 
	        label.x = (stage.width)/2;
			label.y = (stage.height)/2;
		}
		
		private function onTrackMouse(event: MouseEvent): void{
			
			//label.text = "event cli";
			 		
		}
		
		private function updatOutput(event: KeyboardEvent): void
		{
			 var key:Object =  String.fromCharCode(event.charCode);
			label.text=key.toString();
			
			 label.text="x: " + this.triangle.x.toString()  + " y:" + this.triangle.y.toString();
			 
			
			 
			
			
			switch(event.keyCode){
				
				//left
				case 37 :												
				
				if ( this.LimitIsValid(triangle.x-1, triangle.y, triangle)){
				this.triangle.x--;						
				}
				 
				
				break;
				
				//up
				case 38:				
				
				if (this.LimitIsValid(triangle.x, triangle.y-1, triangle)){
				this.triangle.y--;
				}
				
				
				break;
				
				//right
				case 39:
				
				if (this.LimitIsValid(triangle.x+1, triangle.y, triangle)){
				this.triangle.x++;
				}
				
				
				break;
				
				//down
				case 40:				
				
				if ( this.LimitIsValid(triangle.x, triangle.y+1, triangle)){
				 this.triangle.y++;
				}
				
				 break;
				
			
				default:				
				label.text="key pressed: " + key.toString();				
				break;
			}
			
			
		}
		
		private function stopDragObject(event: MouseEvent): void{
			
			 		 
			 label.text="x: " + event.stageX.toString()   + " y:" + event.stageY.toString();
			
			 
			 
			this.ShapeLimit(event.stageX,event.stageY, triangle);
			 
			
		}
		
		private function ShapeLimit(positionX: Number , positionY: Number, currentShape : Shape): void {
			
			  label.text="x: " + positionX.toString()   + " y:" + positionY.toString();
			  
			if ( this.LimitIsValid(positionX, positionY, currentShape) ) {					 
				currentShape.x= positionX;
				currentShape.y= positionY;
			}
			
		}
		
		
		private function LimitIsValid(positionX: Number , positionY: Number, currentShape : Shape): Boolean {
			 
			trace("x: " + positionX + " y: " + positionY);
			
			if (positionX<=0 || positionY <=0){
				trace("minor than 0");
				return false;
			}
			
			if  ((positionX + currentShape.width > stage.stageWidth) || (positionY + currentShape.height> stage.stageHeight ) ) {
				label.text= "Shape is on edge..."
				
				return false;
			}
			else{
				return true;
			}
			
			 
			
		}
		
		
		 
	} //	public class actionScriptMobile extends Sprite
} // package