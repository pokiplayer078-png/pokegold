	object_const_def
	const BANIBUSCANYON_GUIDE

BanibusCanyon_MapScripts:
	def_scene_scripts

	def_callbacks

BanibusCanyonGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BANIBUS_BEAT_GYM3
	iffalse .Locked
	writetext BanibusCanyonGuideText
	yesorno
	iffalse .Stay
	closetext
	warp BANIBUS_ZENITH_CITY, 15, 28
.Stay:
	waitbutton
	closetext
	end
.Locked:
	writetext BanibusCanyonLockedText
	waitbutton
	closetext
	end

BanibusCanyonReturnScript:
	faceplayer
	opentext
	writetext BanibusCanyonReturnText
	yesorno
	iffalse .Stay
	closetext
	warp BANIBUS_CANYON_CAMP, 8, 12
.Stay:
	waitbutton
	closetext
	end

BanibusCanyonGuideText:
	text "The winds grow"
	line "stronger above."
	para "ZENITH CITY lies"
	line "beyond the pass."
	para "Would you like to"
	line "travel there now?"
	done

BanibusCanyonLockedText:
	text "The path is too"
	line "dangerous."
	para "Win the CANYON"
	line "GYM first."
	done

BanibusCanyonReturnText:
	text "CANYON CAMP is"
	line "behind you."
	para "Return to camp?"
	done

BanibusCanyon_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event 5, 7, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BanibusCanyonGuideScript, -1
	object_event 5, 27, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BanibusCanyonReturnScript, -1
