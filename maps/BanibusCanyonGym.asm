	object_const_def
	const BANIBUSCANYONGYM_LEADER
	const BANIBUSCANYONGYM_GUIDE

BanibusCanyonGym_MapScripts:
	def_scene_scripts

	def_callbacks

BanibusCanyonGymLeaderScript:
	faceplayer
	opentext
	checkevent EVENT_BANIBUS_BEAT_GYM3
	iftrue .FightDone
	writetext BanibusCanyonGymIntroText
	waitbutton
	closetext
	winlosstext BanibusCanyonGymWinText, 0
	loadtrainer BIRD_KEEPER, BANIBUS_GYM3
	startbattle
	reloadmapafterbattle
	setevent EVENT_BANIBUS_BEAT_GYM3
	opentext
	writetext BanibusCanyonGymBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	waitbutton
	closetext
	end
.FightDone:
	writetext BanibusCanyonGymAfterText
	waitbutton
	closetext
	end

BanibusCanyonGymGuideScript:
	jumptextfaceplayer BanibusCanyonGymGuideText

BanibusCanyonGymIntroText:
	text "I am ZAYD, the"
	line "CANYON LEADER!"
	para "The wind is wild"
	line "above the cliffs."
	para "Can you keep your"
	line "balance in battle?"
	done

BanibusCanyonGymWinText:
	text "You rose above"
	line "the canyon winds!"
	para "Take the WIND"
	line "BADGE!"
	done

BanibusCanyonGymBadgeText:
	text "You received the"
	line "WIND BADGE!"
	done

BanibusCanyonGymAfterText:
	text "The WIND BADGE"
	line "shows you can"
	cont "stand your ground."
	done

BanibusCanyonGymGuideText:
	text "Watch out for"
	line "fast flying foes."
	para "Rock and electric"
	line "moves can help."
	done

BanibusCanyonGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 4, 15, BANIBUS_CANYON_CAMP, 1
	warp_event 5, 15, BANIBUS_CANYON_CAMP, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 5, 1, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BanibusCanyonGymLeaderScript, -1
	object_event 7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BanibusCanyonGymGuideScript, -1
