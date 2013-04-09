package com.alibado.asroute 
{
	import flash.events.EventDispatcher;
	
	/**
	 * ...
	 * @author clifford.cheny
	 */
	public class LeafState extends EventDispatcher implements IState 
	{
		
		public function LeafState() 
		{
			
		}
		
		public function select():void
		{
			
		}
		
		public function find(url:String):IState
		{
			return null;
		}
		
		public function get name():String
		{
			return '';
		}
		
		public function get parent():IComplexState
		{
			return null;
		}
	}

}