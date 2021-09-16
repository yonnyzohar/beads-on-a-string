package  
{
	import flash.events.EventDispatcher;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	
	public class BallCont extends EventDispatcher
	{
		private var radian:Number;
		public var view:Ball;
		private var mouseDown:Boolean = false;
		private var speed:Number = 10;
		public var myTarget:MovieClip;
		private var dad:MovieClip;

		public function BallCont() 
		{
			view = new Ball();
			
		}
		
		
		
		public function update():void
		{
			if(view.mouseDown)
			{
				view.x = view.stage.mouseX;
				view.y = view.stage.mouseY;
			}
			else
			{
				if(myTarget != null)
				{
					var yDistance:Number = myTarget.y - view.y;
					var xDistance:Number = myTarget.x - view.x;
	 
					if (Math.sqrt(yDistance*yDistance +  xDistance*xDistance) <= (speed * 10))
					{
						
					}
					else
					{
						radian = Math.atan2(yDistance, xDistance);
						view.x += Math.cos(radian) * speed;
						view.y += Math.sin(radian) * speed;
						view.rotation = radian * 180 / Math.PI;
					}
				}
				
			}
			
		}

	}
	
}
