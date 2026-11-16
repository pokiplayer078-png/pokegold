	object_const_def
	const BANIBUSZENITHGYM_LEADER
	const BANIBUSZENITHGYM_GUIDE

BanibusZenithGym_MapScripts:
	def_scene_scripts

	def_callbacks

BanibusZenithGymLeaderScript:
	faceplayer
	opentext
	checkevent EVENT_BANIBUS_BEAT_GYM4
	iftrue .FightDone
	writetext BanibusZenithGymIntroText
	waitbutton
	closetext
	winlosstext BanibusZenithGymWinText, 0
	loadtrainer PSYCHIC_T, BANIBUS_GYM4
	startbattle
	reloadmapafterbattle
	setevent EVENT_BANIBUS_BEAT_GYM4
	opentext
	writetext BanibusZenithGymBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	waitbutton
	closetext
	end
.FightDone:
	writetext BanibusZenithGymAfterText
	waitbutton
	closetext
	end

BanibusZenithGymGuideScript:
	jumptextfaceplayer BanibusZenithGymGuideText

BanibusZenithGymIntroText:
	text "I am NADIA, the"
	line "ZENITH LEADER!"
	para "A clear mind sees"
	line "through every"
	cont "illusion."
	para "Let us begin!"
	done

BanibusZenithGymWinText:
	text "You saw through"
	line "my mirages!"
	para "Take the ZENITH"
	line "BADGE!"
	done

BanibusZenithGymBadgeText:
	text "You received the"
	line "ZENITH BADGE!"
	done

BanibusZenithGymAfterText:
	text "The ZENITH BADGE"
	line "is proof of your"
	cont "clear mind."
	done

BanibusZenithGymGuideText:
	text "Dark moves can"
	line "disrupt psychic"
	cont "tricks. Keep your"
	cont "team balanced."
	done

BanibusZenithGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 4, 15, BANIBUS_ZENITH_CITY, 1
	warp_event 5, 15, BANIBUS_ZENITH_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 5, 1, SPRITE_SABRINA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BanibusZenithGymLeaderScript, -1
	object_event 7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BanibusZenithGymGuideScript, -1
