package com.alibado.asroute 
{
	/**
	 * ...
	 * @author clifford.cheny
	 */
	public class AndState extends ComplexState
	{
		
		public function AndState(name:String)
		{
			super(name);
		}
		
		private function unselectChildren():void
		{
			if (!_children) return;
			for (var n:String in _children)
			{
				_children[n].unselect();
			}
		}
		
		override internal function unselect():void
		{
			if (selected)
			{
				unselectChildren();
				super.unselect();
			}
		}
	}

}