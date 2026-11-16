	object_const_def
	const BANIBUSCANYONCAMP_GUIDE
	const BANIBUSCANYONCAMP_SUPPLIES

BanibusCanyonCamp_MapScripts:
	def_scene_scripts

	def_callbacks

BanibusCanyonCampGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BANIBUS_BEAT_GYM3
	iffalse .Locked
	writetext BanibusCanyonCampGuideOpenText
	yesorno
	iffalse .Stay
	closetext
	warp BANIBUS_CANYON, 8, 12
.Stay:
	waitbutton
	closetext
	end
.Locked:
	writetext BanibusCanyonCampGuideLockedText
	waitbutton
	closetext
	end

BanibusCanyonCampSuppliesScript:
	faceplayer
	opentext
	writetext BanibusCampSuppliesText
	yesorno
	iffalse .Stay
	closetext
	warp BANIBUS_SAPPHIRE_CITY, 31, 26
.Stay:
	waitbutton
	closetext
	end

BanibusCanyonCampGuideOpenText:
	text "The canyon trail"
	line "leads to ZENITH."
	para "Ready to brave"
	line "the high winds?"
	done

BanibusCanyonCampGuideLockedText:
	text "The trail is"
	line "dangerous."
	para "Win the CANYON"
	line "GYM BADGE first."
	done

BanibusCampSuppliesText:
	text "SAPPHIRE CITY is"
	line "the nearest town"
	cont "with supplies."
	para "Travel there now?"
	done

BanibusCanyonCamp_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 7, BANIBUS_CANYON_GYM, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 32, 6, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BanibusCanyonCampGuideScript, -1
	object_event 7, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BanibusCanyonCampSuppliesScript, -1
