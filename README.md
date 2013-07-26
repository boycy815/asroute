#asroute

通过状态树描述系统的各个状态，并且通过事件通知外界

###举例

为一个视频播放器创建一个状态树

我们需要播放器有“close”，“inited”，“streaming”三种状态，其中close表示播放器未载入任何播放信息，inited表示已经载入播放信息随时可以准备开始播放，streaming表示已经连接，三种状态不能同时存在。

其中streaming状态带有“playing”和“buffering”两个子状态，分别从两个角度描述当前播放情况。playing有play和pause两个互斥的子状态，表示用户当前将播放器暂停或者播放；buffering有full和empty两个互斥子状态，表示当前网络加载情况引起的状态。

![状态树](http://img02.taobaocdn.com/tps/i2/T1orxSFkdgXXcdnmz5-835-405.png)

可以通过以下代码建立状态树。

	var player:OrState = new OrState();
	var close:State = new State(player);
	var inited:State = new State(player);
	var streaming:State = new State(player);
	var playing:OrState = new OrState(streaming);
	var play:State = new State(playing);
	var pause:State = new State(playing);
	var buffering:OrState = new OrState(streaming);
	var full:State = new State(buffering);
	var empty:State = new State(buffering);

OrState和State的构造函数参数为状态的父状态，一旦指定父级（或者不指定）就不能更改；OrState为State的子类，其所有子状态最多只能被选中一个。

###当某个状态被选中后发生事件的顺序

当一个状态从未选中转变成选中状态时，会发生StateEventConst.ENTER事件，从选中转变成未选中状态时，会发生StateEventConst.EXIT事件。

如果一个状态在被选中的时候，其父级必定被选中。所以为了维持这个关系，如果一个状态即将被选中而其父级没有被选中，那么系统会自动先将其父级选中，这个规则会一直对其爷爷级祖宗级生效。另外如果对一个状态取消选中，那么在此之前其所有子级状态也会先被取消选中。

OrState的特殊性在于，当其子状态被选中时，其其他已被选中的子级会先被取消选中。

可以通过下面的代码监听状态的改变

	player.addEventListener(StateEventConst.ENTER, function(e:Event):void { trace("player enter") } );
	player.addEventListener(StateEventConst.EXIT, function(e:Event):void { trace("player exit") } );
	close.addEventListener(StateEventConst.ENTER, function(e:Event):void { trace("close enter") } );
	close.addEventListener(StateEventConst.EXIT, function(e:Event):void { trace("close exit") } );
	inited.addEventListener(StateEventConst.ENTER, function(e:Event):void { trace("inited enter") } );
	inited.addEventListener(StateEventConst.EXIT, function(e:Event):void { trace("inited exit") } );
	streaming.addEventListener(StateEventConst.ENTER, function(e:Event):void { trace("streaming enter") } );
	streaming.addEventListener(StateEventConst.EXIT, function(e:Event):void { trace("streaming exit") } );
	playing.addEventListener(StateEventConst.ENTER, function(e:Event):void { trace("playing enter") } );
	playing.addEventListener(StateEventConst.EXIT, function(e:Event):void { trace("playing exit") } );
	play.addEventListener(StateEventConst.ENTER, function(e:Event):void { trace("play enter") } );
	play.addEventListener(StateEventConst.EXIT, function(e:Event):void { trace("play exit") } );
	pause.addEventListener(StateEventConst.ENTER, function(e:Event):void { trace("pause enter") } );
	pause.addEventListener(StateEventConst.EXIT, function(e:Event):void { trace("pause exit") } );
	buffering.addEventListener(StateEventConst.ENTER, function(e:Event):void { trace("buffering enter") } );
	buffering.addEventListener(StateEventConst.EXIT, function(e:Event):void { trace("buffering exit") } );
	full.addEventListener(StateEventConst.ENTER, function(e:Event):void { trace("full enter") } );
	full.addEventListener(StateEventConst.EXIT, function(e:Event):void { trace("full exit") } );
	empty.addEventListener(StateEventConst.ENTER, function(e:Event):void { trace("empty enter") } );

可以通过调用状态对象的select方法让某个状态选中。但是你不能手动让某个状态不选中，因为从概念上讲退出某个状态是因为进入了另外一个状态。