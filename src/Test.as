package 
{
	import com.alibado.asroute.LeafState;
	import com.alibado.asroute.OrState;
	import flash.display.Sprite;
	import flash.events.Event;
	
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
			
			var a:LeafState = new LeafState("a");
			var b:LeafState = new LeafState("b");
			var c:OrState = new OrState("c");
			var d:LeafState = new LeafState("d");
			var e:LeafState = new LeafState("e");
			var f:OrState = new OrState("f");
			var g:OrState = new OrState("g");
			
			g.addChild(c);
			g.addChild(f);
			
			c.addChild(a)
			c.addChild(b)
			
			f.addChild(d)
			f.addChild(e);
			
			
		}
		
	}
	
}