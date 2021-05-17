package;

import Controls.Control;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;

class OptionsMenu extends MusicBeatState
{
	// var selector:FlxText;
	var curSelected:Int = 0;

	var controlsStrings:Array<String> = [];

	// var selector:FlxSprite = new FlxSprite().makeGraphic(5, 5, FlxColor.RED);
	var grpOptionsTexts:FlxTypedGroup<Alphabet>;
	var grpOptionsIndicator:FlxTypedGroup<FlxSprite>;

	// TODO: Add better array for Small Thing's options.
	var textMenuItems:Array<String> = [
		'Debug Mode'
	];

	private var grpControls:FlxTypedGroup<Alphabet>;

	override function create()
	{
		var menuBG:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		// controlsStrings = CoolUtil.coolTextFile(Paths.txt('controls'));
		menuBG.color = 0xFFea71fd;
		menuBG.setGraphicSize(Std.int(menuBG.width * 1.1));
		menuBG.updateHitbox();
		menuBG.screenCenter();
		menuBG.antialiasing = true;
		add(menuBG);


		// Options menu text
		grpOptionsTexts = new FlxTypedGroup<Alphabet>();
		add(grpOptionsTexts);

		for (i in 0...textMenuItems.length)
		{
			var optionText:Alphabet = new Alphabet(16, 20 + (i * 82), textMenuItems[i], true);
			optionText.ID = i;

			optionText.x += 70;
			
			grpOptionsTexts.add(optionText);
		}
		
		// Options menu indicators
		grpOptionsIndicator = new FlxTypedGroup<FlxSprite>();
		add(grpOptionsIndicator);

		for (i in 0...textMenuItems.length)
		{
			var optionIndicator:FlxSprite = new FlxSprite(16, 20 + (i * 82));
			optionIndicator.ID = i;

			optionIndicator.frames = Paths.getSparrowAtlas('st_ui_assets');
			optionIndicator.animation.addByPrefix("true", "checkmark", 24, false);
			optionIndicator.animation.addByPrefix("false", "xmark", 24, false);

			optionIndicator.scale.x = 0.4;
			optionIndicator.scale.y = 0.4;

			/*
			optionIndicator.x = optionIndicator.x - (optionIndicator.width / 2);
			*/
			optionIndicator.x -= 88;
			optionIndicator.y -= 26;

			grpOptionsIndicator.add(optionIndicator);
		}

		super.create();

		// Yaknow what, fuck you! *un-substates your menu*
		// openSubState(new OptionsSubState());
	}

	override function update(elapsed:Float)
	{
		/*
		== IDS ==
		0: Debug Mode
		*/

		super.update(elapsed);

		if (controls.UP_P)
			curSelected -= 1;

		if (controls.DOWN_P)
			curSelected += 1;

		if (curSelected < 0)
			curSelected = textMenuItems.length - 1;

		if (curSelected >= textMenuItems.length)
			curSelected = 0;

		if (controls.ACCEPT) {
			FlxG.sound.play(Paths.sound('confirmMenu'));
			
			// Manual way of setting the values using a switch statement
			// TODO: Get this shitty code out of here and make it actually good.
			switch (curSelected) {
				case 0:
					if (STOptionsRewrite._variables.debug == false) {
						STOptionsRewrite._variables.debug = true;
						grpOptionsIndicator.members[0].animation.play("true");
					} else {
						STOptionsRewrite._variables.debug = false;
						grpOptionsIndicator.members[0].animation.play("false");
					}
			}
		}

		if (controls.BACK) {
			STOptionsRewrite.Save();
			FlxG.switchState(new MainMenuState());
		}

		// graphic updater
		if (STOptionsRewrite._variables.debug == false) {
			grpOptionsIndicator.members[0].animation.play("false");
		} else {
			grpOptionsIndicator.members[0].animation.play("true");
		}
	}

	function changeSelection(change:Int = 0)
	{
		#if !switch
		// NGio.logEvent('Fresh');
		#end

		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

		curSelected += change;

		if (curSelected < 0)
			curSelected = grpControls.length - 1;
		if (curSelected >= grpControls.length)
			curSelected = 0;

		// selector.y = (70 * curSelected) + 30;

		var bullShit:Int = 0;

		for (item in grpControls.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			// item.setGraphicSize(Std.int(item.width * 0.8));

			if (item.targetY == 0)
			{
				item.alpha = 1;
				// item.setGraphicSize(Std.int(item.width));
			}
		}
	}
}
