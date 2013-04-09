package com.alibado.asroute 
{
	
	/**
	 * ...
	 * @author clifford.cheny
	 */
	public interface IComplexState extends IState
	{
		function get children():Vector.<IState>;
	}
	
}