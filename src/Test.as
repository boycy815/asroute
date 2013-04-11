package 
{
	import com.alibado.asroute.AndState;
	import com.alibado.asroute.ComplexState;
	import com.alibado.asroute.LeafState;
	import com.alibado.asroute.OrState;
	import com.alibado.asroute.StateEventConst;
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
			var c:ComplexState = new AndState("c");
			var d:LeafState = new LeafState("d");
			var e:LeafState = new LeafState("e");
			var f:ComplexState = new OrState("f");
			var g:ComplexState = new OrState("g");
			
			g.addChild(c);
			g.addChild(f);
			
			c.addChild(a)
			c.addChild(b)
			
			f.addChild(d)
			f.addChild(e);
			
			a.addEventListener(StateEventConst.ENTER, function(e:Event):void { trace("a enter") } );
			a.addEventListener(StateEventConst.EXIT, function(e:Event):void { trace("a exit") } );
			b.addEventListener(StateEventConst.ENTER, function(e:Event):void { trace("b enter") } );
			b.addEventListener(StateEventConst.EXIT, function(e:Event):void { trace("b exit") } );
			c.addEventListener(StateEventConst.ENTER, function(e:Event):void { trace("c enter") } );
			c.addEventListener(StateEventConst.EXIT, function(e:Event):void { trace("c exit") } );
			d.addEventListener(StateEventConst.ENTER, function(e:Event):void { trace("d enter") } );
			d.addEventListener(StateEventConst.EXIT, function(e:Event):void { trace("d exit") } );
			e.addEventListener(StateEventConst.ENTER, function(e:Event):void { trace("e enter") } );
			e.addEventListener(StateEventConst.EXIT, function(e:Event):void { trace("e exit") } );
			f.addEventListener(StateEventConst.ENTER, function(e:Event):void { trace("f enter") } );
			f.addEventListener(StateEventConst.EXIT, function(e:Event):void { trace("f exit") } );
			g.addEventListener(StateEventConst.ENTER, function(e:Event):void { trace("g enter") } );
			g.addEventListener(StateEventConst.EXIT, function(e:Event):void { trace("g exit") } );
			
			a.select();
			b.select();
			e.select();
			b.select();
		}
		
	}
	
}