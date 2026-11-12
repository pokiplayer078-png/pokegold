	object_const_def
	const BANIBUSDUNES_GUIDE

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

BanibusDunesGuideText:
	text "Beyond these dunes"
	line "stands the AKAR"
	cont "PYRAMID."

	para "Would you like to"
	line "explore its halls?"
	done

BanibusDunes_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8,  2, BANIBUS_OASIS, 3
	warp_event  8, 50, BANIBUS_PYRAMID, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8, 12, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BanibusDunesGuideScript, -1
