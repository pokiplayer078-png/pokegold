	object_const_def
	const BANIBUSMART_CLERK

BanibusMart_MapScripts:
	def_scene_scripts

	def_callbacks

BanibusMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE_DEX
	closetext
	end

BanibusMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, BANIBUS_OASIS, 1
	warp_event  3,  7, BANIBUS_OASIS, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BanibusMartClerkScript, -1
