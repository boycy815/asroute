package com.alibado.asroute 
{
	/**
	 * ...
	 * @author clifford.cheny
	 */
	public class OrState extends State
	{
		public function OrState(parent:State = null)
		{
			super(parent);
		}
		
		override protected function selectFromChild(child:State):void
		{
			if (_selected)
			{
				var l:int = _children.length;
				for (var i:int = 0; i < l; i++)
				{
					if (_children[i] != child)
						_children[i].unselect();
				}
			}
			else
			{
				select();
			}
		}
	}

}