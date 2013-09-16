package com.alibado.asroute 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	/**
	 * ...
	 * @author clifford.cheny
	 */
	public class State extends EventDispatcher implements IState 
	{
		protected var _selected:Boolean = false;
		protected var _parent:State;
		protected var _children:Vector.<State>;
		
		public function State(parent:State = null) 
		{
			super(null);
			_children = new Vector.<State>();
			if (parent)
			{
				parent._children.push(this);
				_parent = parent;
			}
		}
		
		public function select():Boolean 
		{
			if (selectParent() && !_selected)
			{
				_selected = true;
				dispatchEvent(new Event(StateEventConst.ENTER));
			}
			return _selected;
		}
		
		public function get selected():Boolean 
		{
			return _selected;
		}
		
		internal function unselect():Boolean
		{
			if (unselectChildren() && _selected)
			{
				_selected = false;
				dispatchEvent(new Event(StateEventConst.EXIT));
			}
			return !_selected;
		}
		
		protected function unselectChildren():Boolean
		{
			for (var i:int = 0; i < _children.length; i++)
			{
				if (_selected)
				{
					_children[i].unselect();
				}
			}
			var l:int = _children.length;
			for (i = 0; i < l; i++)
			{
				if (_children[i].selected)
				{
					return false;
				}
			}
			return true;
		}
		
		protected function selectParent():Boolean
		{
			if (_parent)
			{
				if (_selected)
				{
					return true;
				}
				else
				{
					return _parent.selectFromChild();
				}
			}
			return true;
		}
		
		protected function selectFromChild():Boolean
		{
			return select();
		}
	}
}