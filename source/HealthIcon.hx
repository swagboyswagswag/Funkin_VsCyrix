package;

import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		loadGraphic(Paths.image('iconGridXL'), true, 150, 150);

		antialiasing = true;
		animation.add('bf', [0, 1], 0, false, isPlayer);
		animation.add('bf-car', [0, 1], 0, false, isPlayer);
		animation.add('bf-christmas', [0, 1], 0, false, isPlayer);
		animation.add('bf-pixel', [21, 21], 0, false, isPlayer);
		animation.add('spooky', [2, 3], 0, false, isPlayer);
		animation.add('pico', [4, 5], 0, false, isPlayer);
		animation.add('mom', [6, 7], 0, false, isPlayer);
		animation.add('mom-car', [6, 7], 0, false, isPlayer);
		animation.add('tankman', [8, 9], 0, false, isPlayer);
		animation.add('face', [10, 11], 0, false, isPlayer);
		animation.add('dad', [12, 13], 0, false, isPlayer);
		animation.add('senpai', [22, 22], 0, false, isPlayer);
		animation.add('senpai-angry', [23, 23], 0, false, isPlayer);
		animation.add('spirit', [24, 24], 0, false, isPlayer);
		animation.add('bf-old', [14, 15], 0, false, isPlayer);
		animation.add('gf', [16], 0, false, isPlayer);
		animation.add('parents-christmas', [17, 18], 0, false, isPlayer);
		animation.add('monster', [19, 20], 0, false, isPlayer);
		animation.add('monster-christmas', [19, 20], 0, false, isPlayer);
		animation.add('dad-and-bf', [200, 200], 0, false, isPlayer); // small things: dad and bf
		animation.add('unknown', [220, 220], 0, false, isPlayer); // small things: unknown character icon
		animation.add('unknown-pixel', [221, 221], 0, false, isPlayer); // small things: unknown pixel character icon
		animation.add('mic', [222, 222], 0, false, isPlayer); // small things: microphone
		animation.add('cyrix', [25, 26], 0, false, isPlayer); // vs cyrix: cyrix
		animation.add('cyrix-nervous', [25, 26], 0, false, isPlayer); // vs cyrix: cyrix
		animation.add('cyrix-crazy', [27, 28], 0, false, isPlayer); // vs cyrix: crazy cyrix
		animation.add('gf-studio', [16], 0, false, isPlayer); // vs cyrix: gf studio
		animation.play(char);
		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
