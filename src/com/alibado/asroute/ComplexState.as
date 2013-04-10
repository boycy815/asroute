package com.alibado.asroute 
{
	/**
	 * ...
	 * @author clifford.cheny
	 */
	public class ComplexState extends LeafState
	{
		private var _count:int = 0;
		protected var _children:Object;
		
		public function ComplexState(name:String) 
		{
			super(name);
		}
		
		public function getChild(name:String):LeafState
		{
			if (!_children) return null;
			return _children[name];
		}
		
		public function addChild(child:LeafState):void
		{
			if (!_children) _children = { };
			_children[child.name] = child;
			child._parent = this;
			_count++;
		}
		
		public function removeChild(child:LeafState):void
		{
			if (_children[child.name] == child)
			{
				_children[child.name].parent = null;
				_children[child.name] = null;
				_count--;
			}
		}
		
		public function get count():int
		{
			return _count;
		}
	}

}