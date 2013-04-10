package com.alibado.asroute 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	/**
	 * ...
	 * @author clifford.cheny
	 */
	public class LeafState extends EventDispatcher
	{
		private var _name:String;
		private var _selected:Boolean;
		internal var _parent:ComplexState;
		
		public function LeafState(name:String) 
		{
			_name = name;
		}
		
		private function selectParent():void
		{
			if (_parent)
			{
				if (_parent._selected)
				{
					if (_parent is OrState)
					{
						OrState(_parent).cancelChildrenSelect();
					}
				}
				else
				{
					_parent.select();
				}
			}
		}
		
		public function select():void
		{
			if (!selected)
			{
				selectParent();
				_selected = true;
				dispatchEvent(new Event(StateEventConst.ENTER));
			}
		}
		
		protected function unselect():void
		{
			if (selected)
			{
				_selected = false;
				dispatchEvent(new Event(StateEventConst.EXIT));
			}
		}
		
		public function find(url:String):LeafState
		{
			return null;
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function get selected():Boolean
		{
			return _selected;
		}
		
		public function get parent():ComplexState
		{
			return _parent;
		}
	}

}