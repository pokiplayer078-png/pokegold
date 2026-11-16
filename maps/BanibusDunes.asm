	object_const_def
	const BANIBUSDUNES_GUIDE
	const BANIBUSDUNES_SAPPHIRE_GATE

BanibusDunes_MapScripts:
	def_scene_scripts

	def_callbacks

BanibusDunesGuideScript:
	faceplayer
	opentext
	writetext BanibusDunesGuideText
	yesorno
	iffalse .Stay
	closetext
	warp BANIBUS_PYRAMID, 10, 11
.Stay:
	waitbutton
	closetext
	end

BanibusDunesSapphireGateScript:
	faceplayer
	opentext
	checkevent EVENT_BANIBUS_BEAT_GYM1
	iffalse .Locked
	writetext BanibusDunesSapphireOpenText
	yesorno
	iffalse .Stay
	closetext
	warp BANIBUS_SAPPHIRE_CITY, 8, 12
.Stay:
	waitbutton
	closetext
	end
.Locked:
	writetext BanibusDunesSapphireLockedText
	waitbutton
	closetext
	end

BanibusDunesGuideText:
	text "Beyond these dunes"
	line "stands the AKAR"
	cont "PYRAMID."
	para "Would you like to"
	line "explore its halls?"
	done

BanibusDunesSapphireOpenText:
	text "SAPPHIRE CITY"
	line "lies beyond the"
	cont "western dunes."
	para "Ready to continue?"
	done

BanibusDunesSapphireLockedText:
	text "The trail to"
	line "SAPPHIRE CITY is"
	cont "not open yet."
	para "Win the OASIS GYM"
	line "challenge first."
	done

BanibusDunes_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 8, 2, BANIBUS_OASIS, 4
	warp_event 8, 32, BANIBUS_PYRAMID, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 8, 12, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BanibusDunesGuideScript, -1
	object_event 14, 18, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BanibusDunesSapphireGateScript, -1
