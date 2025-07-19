package;

import lime.utils.Assets;
import haxe.io.Path;

import lime.media.AudioSource;
import lime.ui.KeyCode;
import lime.ui.KeyModifier;

#if cpp
import hxdr_libs.Flac;
import hxdr_libs.Mp3;
import hxdr_libs.Wav;
#end

@:nullSafety
class Main extends lime.app.Application
{
	#if desktop
	@:noCompletion
	private static function __init__():Void
	{
		final programDirectory:String = Path.directory(Path.withoutExtension(Sys.programPath() ?? ''));

		if (programDirectory.length > 0)
			Sys.putEnv("ALSOFT_CONF", Path.join([programDirectory, 'alsoft.ini']));
	}
	#end

	var again:Null<AudioSource>;
	var complex:Null<AudioSource>;
	var nextToYou:Null<AudioSource>;

	public override function onPreloadComplete():Void
	{
		#if (desktop && cpp)
		if (again == null)
			again = new AudioSource(Flac.fromFile(Assets.getPath("assets/AGAIN.flac")));

		if (complex == null)
			complex = new AudioSource(Mp3.fromFile(Assets.getPath("assets/COMPLEX.mp3")));

		if (nextToYou == null)
			nextToYou = new AudioSource(Wav.fromFile(Assets.getPath("assets/NEXT TO YOU.wav")));
		#elseif cpp
		if (again == null)
			again = new AudioSource(Flac.fromBytes(Assets.getBytes("assets/AGAIN.flac")));

		if (complex == null)
			complex = new AudioSource(Mp3.fromBytes(Assets.getBytes("assets/COMPLEX.mp3")));

		if (nextToYou == null)
			nextToYou = new AudioSource(Wav.fromBytes(Assets.getBytes("assets/NEXT TO YOU.wav")));
		#end
	}

	public override function onKeyDown(keyCode:KeyCode, modifier:KeyModifier):Void
	{
		super.onKeyDown(keyCode, modifier);

		if (keyCode == KeyCode.A)
		{
			again?.play();
		}
		else if (keyCode == KeyCode.B)
		{
			again?.pause();
		}

		if (keyCode == KeyCode.G)
		{
			complex?.play();
		}
		else if (keyCode == KeyCode.H)
		{
			complex?.pause();
		}

		if (keyCode == KeyCode.N)
		{
			nextToYou?.play();
		}
		else if (keyCode == KeyCode.M)
		{
			nextToYou?.pause();
		}
	}

	public override function render(context:lime.graphics.RenderContext):Void
	{
		switch (context.type)
		{
			case CAIRO:
				context.cairo.setSourceRGB(0.75, 1, 0);
				context.cairo.paint();
			case CANVAS:
				context.canvas2D.fillStyle = '#BFFF00';
				context.canvas2D.fillRect(0, 0, window.width, window.height);
			case DOM:
				context.dom.style.backgroundColor = '#BFFF00';
			case FLASH:
				context.flash.graphics.beginFill(0xBFFF00);
				context.flash.graphics.drawRect(0, 0, window.width, window.height);
			case OPENGL | OPENGLES | WEBGL:
				context.webgl.clearColor(0.75, 1, 0, 1);
				context.webgl.clear(context.webgl.COLOR_BUFFER_BIT);
			default:
		}
	}
}
