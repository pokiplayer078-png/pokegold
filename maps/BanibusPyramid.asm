	object_const_def
	const BANIBUSPYRAMID_GUARDIAN

BanibusPyramid_MapScripts:
	def_scene_scripts

	def_callbacks

BanibusPyramidGuardianScript:
	jumptextfaceplayer BanibusPyramidGuardianText

BanibusPyramidGuardianText:
	text "The AKAR PYRAMID"
	line "was built to guard"
	cont "the desert wells."

	para "Only careful"
	line "trainers should"
	cont "explore its halls."
	done

BanibusPyramid_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 13, BANIBUS_DUNES, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 10, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BanibusPyramidGuardianScript, -1
