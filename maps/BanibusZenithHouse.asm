object_const_def
	const BANIBUSZENITHHOUSE_RESIDENT

BanibusZenithHouse_MapScripts:
	def_scene_scripts

	def_callbacks

BanibusZenithHouseResidentScript:
	jumptextfaceplayer BanibusZenithHouseResidentText

BanibusZenithHouseBookshelf:
	jumpstd MagazineBookshelfScript

BanibusZenithHouseResidentText:
	text "The BANIBUS"
	line "LEAGUE is near."
	para "Train hard, but"
	line "remember that"
	cont "a good trainer"
	cont "also cares for"
	cont "their #MON."
	done

BanibusZenithHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 2, 7, BANIBUS_ZENITH_CITY, 3
	warp_event 3, 7, BANIBUS_ZENITH_CITY, 3

	def_coord_events

	def_bg_events
	bg_event 0, 1, BGEVENT_READ, BanibusZenithHouseBookshelf
	bg_event 1, 1, BGEVENT_READ, BanibusZenithHouseBookshelf

	def_object_events
	object_event 2, 3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BanibusZenithHouseResidentScript, -1
