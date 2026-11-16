object_const_def
	const BANIBUSRESIDENTHOUSE_RESIDENT

BanibusResidentHouse_MapScripts:
	def_scene_scripts

	def_callbacks

BanibusResidentHouseResidentScript:
	jumptextfaceplayer BanibusResidentHouseResidentText

BanibusResidentHouseBookshelf:
	jumpstd MagazineBookshelfScript

BanibusResidentHouseResidentText:
	text "The old roads of"
	line "BANIBUS are full"
	cont "of secrets."
	para "The signs around"
	line "the region point"
	cont "the way. Take"
	cont "your time and"
	cont "explore safely!"
	done

BanibusResidentHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 2, 7, BANIBUS_SAPPHIRE_CITY, 4
	warp_event 3, 7, BANIBUS_SAPPHIRE_CITY, 4

	def_coord_events

	def_bg_events
	bg_event 0, 1, BGEVENT_READ, BanibusResidentHouseBookshelf
	bg_event 1, 1, BGEVENT_READ, BanibusResidentHouseBookshelf

	def_object_events
	object_event 2, 3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BanibusResidentHouseResidentScript, -1
