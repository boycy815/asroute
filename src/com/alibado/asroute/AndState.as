package com.alibado.asroute 
{
	/**
	 * ...
	 * @author clifford.cheny
	 */
	public class AndState extends LeafState implements IComplexState 
	{
		
		public function AndState() 
		{
			
		}
		
		public function get children():Vector.<IState>
		{
			return null;
		}
		
	}

}