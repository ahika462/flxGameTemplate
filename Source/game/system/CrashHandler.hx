package game.system;

import haxe.CallStack;
import flixel.FlxG;
import openfl.events.UncaughtErrorEvent;
import openfl.Lib;

class CrashHandler {
	public static function init() {
		Lib.current.loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, onUncaughtError);
	}

	static function onUncaughtError(e:UncaughtErrorEvent) {
		var stack = CallStack.exceptionStack(true);
		var stackString = CallStack.toString(stack);
		FlxG.stage.window.alert('${e.error}\n\n$stackString', 'Uncaught error');
	}
}