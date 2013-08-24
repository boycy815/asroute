package com.alibado.asroute 
{
	import flash.events.IEventDispatcher;
	
	/**
	 * ...
	 * @author clifford.cheny
	 */
	public interface IState extends IEventDispatcher
	{
		function get selected():Boolean;
	}
	
}