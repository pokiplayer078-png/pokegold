	object_const_def
	const BANIBUSOASISGYM_LEADER
	const BANIBUSOASISGYM_GUIDE

BanibusOasisGym_MapScripts:
	def_scene_scripts

	def_callbacks

BanibusOasisGymLeaderScript:
	faceplayer
	opentext
	checkevent EVENT_BANIBUS_BEAT_GYM1
	iftrue .FightDone
	writetext BanibusOasisGymIntroText
	waitbutton
	closetext
	winlosstext BanibusOasisGymWinText, 0
	loadtrainer HIKER, BANIBUS_GYM1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BANIBUS_BEAT_GYM1
	opentext
	writetext BanibusOasisGymBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	waitbutton
	closetext
	end
.FightDone:
	writetext BanibusOasisGymAfterText
	waitbutton
	closetext
	end

BanibusOasisGymGuideScript:
	jumptextfaceplayer BanibusOasisGymGuideText

BanibusOasisGymIntroText:
	text "I am SAHRA, the"
	line "OASIS GYM LEADER!"
	para "The desert tests"
	line "your patience."
	para "Show me a team"
	line "that can endure!"
	done

BanibusOasisGymWinText:
	text "You found your"
	line "way through the"
	cont "shifting sands!"
	para "Take the DUNE"
	line "BADGE. You earned"
	cont "it, challenger!"
	done

BanibusOasisGymBadgeText:
	text "You received the"
	line "DUNE BADGE!"
	done

BanibusOasisGymAfterText:
	text "The DUNE BADGE"
	line "marks your first"
	cont "step in Banibus."
	done

BanibusOasisGymGuideText:
	text "Ground types are"
	line "strong, but water"
	cont "can wash them"
	cont "away."
	done

BanibusOasisGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 4, 15, BANIBUS_OASIS, 3
	warp_event 5, 15, BANIBUS_OASIS, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event 5, 1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BanibusOasisGymLeaderScript, -1
	object_event 7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BanibusOasisGymGuideScript, -1
