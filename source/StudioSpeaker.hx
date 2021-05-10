package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class StudioSpeaker extends FlxSprite
{
	public function new(x:Float, y:Float)
	{
		super(x, y);

		frames = Paths.getSparrowAtlas("studio/studio_speaker", "cyrix");
		animation.addByPrefix('bump', 'speaker', 24);
		animation.play('bump');
		antialiasing = true;
	}

	var danceDir:Bool = false;

	public function dance():Void
	{
		danceDir = !danceDir;

		if (danceDir)
			animation.play('bump', true);
		else
			animation.play('bump', true);
	}
}
