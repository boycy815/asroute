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
		
		override protected function selectFromChild():Boolean
		{
			if (_selected)
			{
				return unselectChildren();
			}
			else
			{
				return select();
			}
		}
	}

}