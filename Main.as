package {

	import flash.display.MovieClip;
	import flash.events.*;


	public class Main extends MovieClip {

		var balls: Array = [];
		var mc: MovieClip = new MovieClip();
		public function Main() {
			stage.addChild(mc);
			placeAll();
			stage.addEventListener(Event.ENTER_FRAME, update);
		}




		function placeAll(): void {
			for (var i: int = 0; i < 10; i++) {
				var b: BallCont = new BallCont();
				mc.addChild(b.view);
				b.view.mouseDown = false;
				b.view.x = stage.stageWidth * Math.random();
				b.view.y = stage.stageHeight * Math.random();
				b.view.addEventListener(MouseEvent.MOUSE_DOWN, onDown);
				b.view.addEventListener(MouseEvent.MOUSE_UP, onUp)
				b.view.index = i;
				balls.push(b);
			}

		}




		function update(e: Event): void {

			for (var i: int = 0; i < balls.length; i++) {
				balls[i].update();
			}
			drawLines();
		}

		function drawLines(): void {
			mc.graphics.clear();
			mc.graphics.lineStyle(2, 0x990000, .75);
			for (var i: int = 0; i < balls.length; i++) {
				if (balls[i] && balls[i + 1]) {
					mc.graphics.moveTo(balls[i].view.x, balls[i].view.y);
					mc.graphics.lineTo(balls[i + 1].view.x, balls[i + 1].view.y);
				}
			}
		}


		function onUp(e: MouseEvent): void {
			var b: Ball = Ball(e.target);
			b.mouseDown = false;
		}

		function onDown(e: MouseEvent): void {
			var b: Ball = Ball(e.target);
			b.mouseDown = true;
			var index: int = b.index;
			trace(index);
			setFollowersUp(index);
			setFollowersDown(index);
		}

		function setFollowersDown(index: int): void {
			if (balls[index]) {
				var b: Ball;
				var leader: Ball = balls[index].view;
				if (balls[index - 1]) {
					trace("down " + (index - 1));
					b = balls[index - 1].view;
					balls[index - 1].myTarget = leader;
					setFollowersDown(b.index);
				}
			}
		}

		function setFollowersUp(index: int): void {
			if (balls[index]) {
				var b: Ball;
				var leader: Ball = balls[index].view;
				if (balls[index + 1]) {
					trace(index + 1);
					b = balls[index + 1].view;
					balls[index + 1].myTarget = leader;
					setFollowersUp(b.index);
				}
			}
		}
	}

}