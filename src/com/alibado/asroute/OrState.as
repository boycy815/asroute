package com.alibado.asroute 
{
	/**
	 * ...
	 * @author clifford.cheny
	 */
	public class OrState extends ComplexState
	{
		
		public function OrState(name:String)
		{
			super(name);
		}
		
		internal function cancelChildrenSelect():void
		{
			if (!_children) return;
			for (var n:String in _children)
			{
				_children[n].unselect();
			}
		}
	}

}