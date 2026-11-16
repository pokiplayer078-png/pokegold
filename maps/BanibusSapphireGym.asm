	object_const_def
	const BANIBUSSAPPHIREGYM_LEADER
	const BANIBUSSAPPHIREGYM_GUIDE

BanibusSapphireGym_MapScripts:
	def_scene_scripts

	def_callbacks

BanibusSapphireGymLeaderScript:
	faceplayer
	opentext
	checkevent EVENT_BANIBUS_BEAT_GYM2
	iftrue .FightDone
	writetext BanibusSapphireGymIntroText
	waitbutton
	closetext
	winlosstext BanibusSapphireGymWinText, 0
	loadtrainer POKEMANIAC, BANIBUS_GYM2
	startbattle
	reloadmapafterbattle
	setevent EVENT_BANIBUS_BEAT_GYM2
	opentext
	writetext BanibusSapphireGymBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	waitbutton
	closetext
	end
.FightDone:
	writetext BanibusSapphireGymAfterText
	waitbutton
	closetext
	end

BanibusSapphireGymGuideScript:
	jumptextfaceplayer BanibusSapphireGymGuideText

BanibusSapphireGymIntroText:
	text "I am NABIL, the"
	line "SAPPHIRE LEADER!"
	para "Stone can seem"
	line "unyielding, but"
	cont "every rock has"
	cont "a weak point."
	done

BanibusSapphireGymWinText:
	text "Your strength"
	line "shattered my"
	cont "stone defense!"
	para "Take the SAPPHIRE"
	line "BADGE!"
	done

BanibusSapphireGymBadgeText:
	text "You received the"
	line "SAPPHIRE BADGE!"
	done

BanibusSapphireGymAfterText:
	text "The SAPPHIRE"
	line "BADGE proves your"
	cont "steady resolve."
	done

BanibusSapphireGymGuideText:
	text "Fighting and"
	line "water moves can"
	cont "break through"
	cont "rock defenses."
	done

BanibusSapphireGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 4, 15, BANIBUS_SAPPHIRE_CITY, 1
	warp_event 5, 15, BANIBUS_SAPPHIRE_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 5, 1, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BanibusSapphireGymLeaderScript, -1
	object_event 7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BanibusSapphireGymGuideScript, -1
