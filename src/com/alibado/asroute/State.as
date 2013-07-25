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
			}
			_parent = parent;
		}
		
		public function select():void 
		{
			if (!_selected)
			{
				selectParent();
				_selected = true;
				dispatchEvent(new Event(StateEventConst.ENTER));
			}
		}
		
		public function get selected():Boolean 
		{
			return _selected;
		}
		
		internal function unselect():void
		{
			if (_selected)
			{
				unselectChildren();
				_selected = false;
				dispatchEvent(new Event(StateEventConst.EXIT));
			}
		}
		
		protected function unselectChildren():void
		{
			var l:int = _children.length;
			for (var i:int = 0; i < l; i++)
			{
				_children[i].unselect();
			}
		}
		
		protected function selectParent():void
		{
			if (_parent)
			{
				_parent.selectFromChild(this);
			}
		}
		
		protected function selectFromChild(child:State):void
		{
			select();
		}
	}
}