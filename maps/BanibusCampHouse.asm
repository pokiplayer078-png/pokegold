object_const_def
	const BANIBUSCAMPHOUSE_RESIDENT

BanibusCampHouse_MapScripts:
	def_scene_scripts

	def_callbacks

BanibusCampHouseResidentScript:
	jumptextfaceplayer BanibusCampHouseResidentText

BanibusCampHouseBookshelf:
	jumpstd MagazineBookshelfScript

BanibusCampHouseResidentText:
	text "The canyon winds"
	line "can change in"
	cont "an instant."
	para "Keep your team"
	line "healthy before"
	cont "climbing higher."
	done

BanibusCampHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 2, 7, BANIBUS_CANYON_CAMP, 2
	warp_event 3, 7, BANIBUS_CANYON_CAMP, 2

	def_coord_events

	def_bg_events
	bg_event 0, 1, BGEVENT_READ, BanibusCampHouseBookshelf
	bg_event 1, 1, BGEVENT_READ, BanibusCampHouseBookshelf

	def_object_events
	object_event 2, 3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BanibusCampHouseResidentScript, -1
