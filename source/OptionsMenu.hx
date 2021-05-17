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
import Discord.DiscordClient;
import STOptionsRewrite;

class OptionsMenu extends MusicBeatState
{
	// var selector:FlxText;
	var curSelected:Int = 0;

	var controlsStrings:Array<String> = [];

	// var selector:FlxSprite = new FlxSprite().makeGraphic(5, 5, FlxColor.RED);
	var grpOptionsTexts:FlxTypedGroup<FlxText>;
	var enabledText:FlxTypedGroup<FlxText>;

	// TODO: Add better array for Small Thing's options.
	var textMenuItems:Array<String> = [
		'Debug Mode',
		'Rich Presence',
		'Extra Dialogue',
		'Instrumental Mode',
		'Lyrics',
		'Song Indicators',
		'Unknown Icons',
		// 'Control Scheme ',
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
		grpOptionsTexts = new FlxTypedGroup<FlxText>();
		add(grpOptionsTexts);

		for (i in 0...textMenuItems.length)
		{
			var optionText:FlxText = new FlxText(20, 20 + (i * 50), 0, textMenuItems[i], 32);
			optionText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, RIGHT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
			optionText.ID = i;
			grpOptionsTexts.add(optionText);
		}
		super.create();

		// Yaknow what, fuck you! *un-substates your menu*
		// openSubState(new OptionsSubState());
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (controls.UP_P)
			curSelected -= 1;

		if (controls.DOWN_P)
			curSelected += 1;

		if (curSelected < 0)
			curSelected = textMenuItems.length - 1;

		if (curSelected >= textMenuItems.length)
			curSelected = 0;

		grpOptionsTexts.forEach(function(txt:FlxText)
		{
			txt.color = FlxColor.WHITE;

			switch (txt.ID) {
				case 0:
					if (STOptionsRewrite._variables.debug == false)
						txt.color = FlxColor.RED;
					else
						txt.color = FlxColor.LIME;

				// case 7:
				// 	if (STOptions.st_inputMode == 0)
				// 		txt.text = "Control Scheme [WASD]";
				// 	else
				// 		txt.text = "Control Scheme [DFJK]";

			}

			if (txt.ID == curSelected)
				txt.color = FlxColor.YELLOW;
		});

		if (controls.ACCEPT){
			FlxG.sound.play(Paths.sound('confirmMenu'));
			
			switch (curSelected) {
				// I didn't wanna do this all manually, but, well, here we are.
				case 0:
					if (STOptionsRewrite._variables.debug == false)
						STOptionsRewrite._variables.debug = true;
					else
						STOptionsRewrite._variables.debug = false;
			}
		}

		if (controls.BACK)
			FlxG.switchState(new MainMenuState());
	}

	function waitingInput():Void
	{
		if (FlxG.keys.getIsDown().length > 0)
		{
			PlayerSettings.player1.controls.replaceBinding(Control.LEFT, Keys, FlxG.keys.getIsDown()[0].ID, null);
		}
		// PlayerSettings.player1.controls.replaceBinding(Control)
	}

	var isSettingControl:Bool = false;

	function changeBinding():Void
	{
		if (!isSettingControl)
		{
			isSettingControl = true;
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
