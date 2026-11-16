	object_const_def
	const BANIBUSCANYON_GUIDE

BanibusCanyon_MapScripts:
	def_scene_scripts

	def_callbacks

BanibusCanyonGuideScript:
	faceplayer
	opentext
	writetext BanibusCanyonGuideText
	waitbutton
	closetext
	end

BanibusCanyonGuideText:
	text "The winds grow"
	line "stronger above."
	para "ZENITH CITY lies"
	line "beyond the pass."
	done

BanibusCanyon_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 8, 2, BANIBUS_CANYON_CAMP, 1
	warp_event 8, 32, BANIBUS_ZENITH_CITY, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event 5, 17, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BanibusCanyonGuideScript, -1
