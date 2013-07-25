package 
{
	import com.alibado.asroute.State;
	import com.alibado.asroute.OrState;
	import com.alibado.asroute.StateEventConst;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TextEvent;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author clifford.cheny
	 */
	public class Test extends Sprite 
	{
		
		public function Test():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			//创建播放器的状态和他们之间的父子关系
			var player:OrState = new OrState();
			var close:State = new State(player);
			var inited:State = new State(player);
			var streaming:State = new State(player);
			var playing:OrState = new OrState(streaming);
			var play:State = new State(playing);
			var pause:State = new State(playing);
			var buffering:OrState = new OrState(streaming);
			var full:State = new State(buffering);
			var empty:State = new State(buffering);
			
			//为每个状态添加监听
			player.addEventListener(StateEventConst.ENTER, function(e:Event):void { trace("player enter") } );
			player.addEventListener(StateEventConst.EXIT, function(e:Event):void { trace("player exit") } );
			close.addEventListener(StateEventConst.ENTER, function(e:Event):void { trace("close enter") } );
			close.addEventListener(StateEventConst.EXIT, function(e:Event):void { trace("close exit") } );
			inited.addEventListener(StateEventConst.ENTER, function(e:Event):void { trace("inited enter") } );
			inited.addEventListener(StateEventConst.EXIT, function(e:Event):void { trace("inited exit") } );
			streaming.addEventListener(StateEventConst.ENTER, function(e:Event):void { trace("streaming enter") } );
			streaming.addEventListener(StateEventConst.EXIT, function(e:Event):void { trace("streaming exit") } );
			playing.addEventListener(StateEventConst.ENTER, function(e:Event):void { trace("playing enter") } );
			playing.addEventListener(StateEventConst.EXIT, function(e:Event):void { trace("playing exit") } );
			play.addEventListener(StateEventConst.ENTER, function(e:Event):void { trace("play enter") } );
			play.addEventListener(StateEventConst.EXIT, function(e:Event):void { trace("play exit") } );
			pause.addEventListener(StateEventConst.ENTER, function(e:Event):void { trace("pause enter") } );
			pause.addEventListener(StateEventConst.EXIT, function(e:Event):void { trace("pause exit") } );
			buffering.addEventListener(StateEventConst.ENTER, function(e:Event):void { trace("buffering enter") } );
			buffering.addEventListener(StateEventConst.EXIT, function(e:Event):void { trace("buffering exit") } );
			full.addEventListener(StateEventConst.ENTER, function(e:Event):void { trace("full enter") } );
			full.addEventListener(StateEventConst.EXIT, function(e:Event):void { trace("full exit") } );
			empty.addEventListener(StateEventConst.ENTER, function(e:Event):void { trace("empty enter") } );
			empty.addEventListener(StateEventConst.EXIT, function(e:Event):void { trace("empty exit") } );
			
			var ui:TextField = new TextField();
			addChild(ui);
			ui.width = 800;
			ui.height = 600;
			ui.htmlText = '<a href="event:player">player</a>\n<a href="event:close">close</a>\n<a href="event:inited">inited</a>\n<a href="event:streaming">streaming</a>\n<a href="event:playing">playing</a>\n<a href="event:play">play</a>\n<a href="event:pause">pause</a>\n<a href="event:buffering">buffering</a>\n<a href="event:full">full</a>\n<a href="event:empty">empty</a>\n';
			ui.addEventListener(TextEvent.LINK, onLink);
			
			function onLink(e:TextEvent):void
			{
				if (e.text == "player")
				{
					player.select();
				}
				if (e.text == "close")
				{
					close.select();
				}
				if (e.text == "inited")
				{
					inited.select();
				}
				if (e.text == "streaming")
				{
					streaming.select();
				}
				if (e.text == "playing")
				{
					playing.select();
				}
				if (e.text == "play")
				{
					play.select();
				}
				if (e.text == "pause")
				{
					pause.select();
				}
				if (e.text == "buffering")
				{
					buffering.select();
				}
				if (e.text == "full")
				{
					full.select();
				}
				if (e.text == "empty")
				{
					empty.select();
				}
			}
		}
		
	}
	
}