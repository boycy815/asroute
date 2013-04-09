package com.alibado.asroute 
{
	import flash.events.IEventDispatcher;
	
	/**
	 * ...
	 * @author clifford.cheny
	 */
	public interface IState extends IEventDispatcher
	{
		function select():void;
		function find(url:String):IState;
		function get name():String;
		function get parent():IComplexState;
	}
	
}