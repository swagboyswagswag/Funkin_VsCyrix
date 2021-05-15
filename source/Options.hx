package;

import lime.utils.Assets;
import haxe.Json;
import Controls;

class Options
{
	public static var masterVolume:Float = 1;
}

class CyrixOptions
{
	public static var cy_version:String = "VS Cyrix v1.0 (Pre-Release)";	// VS Cyrix: Version string
}

class STOptions
{
	public static var st_optionsState:Array<STOptionFileSection>;
	public static var st_version:String = "2.1";

	// small things
	public static var st_customIntro:Bool = true;					// Small Things: Custom intro sequence
	public static var st_disableFnfVersionCheck:Bool = true;		// Small Things: Disable FNF version check
	public static var st_debug:Bool = false;						// Small Things: Small Things debug
	public static var st_discordRpc:Bool = false;					// Small Things: Discord RPC
	public static var st_extraDialogue:Bool = true;					// Small Things: Extra dialogue
	public static var st_extraSongs:Bool = true;					// Small Things: Extra songs
	public static var st_fixMonsterIconFreeplay:Bool = true;		// Small Things: Fix Monster's icon for Monster on Freeplay
	public static var st_fixScoreLayout:Bool = true;				// Small Things: Fix Score layout
	public static var st_fixWeek6CountSounds:Bool = true;			// Small Things: Fix Week6 Countdown sounds
	public static var st_hideOptionsMenu:Bool = true;				// Small Things: Hide options menu
	public static var st_inputMode:Int = 0;							// Small Things: Input Mode (0: WASD - 1: DFJK)
	public static var st_instMode:Bool = false;						// Small Things: Instrumental mode
	public static var st_logNg:Bool = true;							// Small Things: Log Newgrounds
	public static var st_lyrics:Bool = true;						// Small Things: [PROTO] Lyrics
	public static var st_makeSpacesConsistent:Bool = true;			// Small Things: Make song spaces consistent
	public static var st_monsterIntro:Bool = true;					// Small Things: Monster Intro
	public static var st_noticeEnabled:Bool = false;				// Small Things: Notice enabled
	public static var st_outlinePauseInfo:Bool = true;				// Small Things: Outline pause info
	public static var st_outlineScore:Bool = true;					// Small Things: Outline score
	public static var st_songIndicator:Bool = true;					// Small Things: Song indicator
	public static var st_startWinterHorrorlandP2Invis:Bool = true;	// Small Things: Start Winter Horrorland P2 invisible
	public static var st_unknownIcons:Bool = true;					// Small Things: Enable the unknown icons
	public static var st_updatedInputSystem:Bool = true;			// Small Things: MtH Input re-write

	public static function readSTOptionsFromFile()
	{
		st_optionsState = cast Json.parse(Assets.getText(Paths.json('options')));

		// trace(st_optionsState);

		for (i in st_optionsState)
		{
			if (i.name == "debug")
				STOptions.st_debug = i.value;

			/*
			if (i.name == "discordRPC")
				STOptions.st_discordRpc = i.value;
			*/

			if (i.name == "extraDialogue")
				STOptions.st_extraDialogue = i.value;

			/*
			if (i.name == "extraSongs")
				STOptions.st_extraSongs = i.value;
			*/

			if (i.name == "inputMode")
				STOptions.st_inputMode = i.intValue;

			if (i.name == "instMode")
				STOptions.st_instMode = i.value;

			if (i.name == "songIndicator")
				STOptions.st_songIndicator = i.value;

			if (i.name == "lyrics")
				STOptions.st_lyrics = i.value;

			if (i.name == "unknownIcons")
				STOptions.st_unknownIcons = i.value;
		}
	}
}

typedef STOptionFileSection = {
	var name:String;
	var value:Bool;
	var intValue:Int;
	var comment:String;
}