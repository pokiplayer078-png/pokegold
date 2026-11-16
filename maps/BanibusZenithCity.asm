	object_const_def
	const BANIBUSZENITHCITY_LEAGUE_GUIDE
	const BANIBUSZENITHCITY_CANYON_GUIDE
	const BANIBUSZENITHCITY_SUPPLIES

BanibusZenithCity_MapScripts:
	def_scene_scripts

	def_callbacks

BanibusZenithLeagueGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BANIBUS_BEAT_GYM4
	iffalse .Locked
	writetext BanibusZenithLeagueOpenText
	yesorno
	iffalse .Stay
	closetext
	warp BANIBUS_LEAGUE, 5, 13
.Stay:
	waitbutton
	closetext
	end
.Locked:
	writetext BanibusZenithLeagueLockedText
	waitbutton
	closetext
	end

BanibusZenithCanyonGuideScript:
	faceplayer
	opentext
	writetext BanibusZenithCanyonText
	yesorno
	iffalse .Stay
	closetext
	warp BANIBUS_CANYON, 8, 25
.Stay:
	waitbutton
	closetext
	end

BanibusZenithSuppliesScript:
	faceplayer
	opentext
	writetext BanibusZenithSuppliesText
	yesorno
	iffalse .Stay
	closetext
	warp BANIBUS_CANYON_CAMP, 15, 10
.Stay:
	waitbutton
	closetext
	end

BanibusZenithLeagueOpenText:
	text "The BANIBUS"
	line "LEAGUE awaits."
	para "You earned all"
	line "four GYM BADGES."
	para "Enter the League?"
	done

BanibusZenithLeagueLockedText:
	text "The League doors"
	line "are sealed."
	para "Earn all four"
	line "Banibus BADGES."
	done

BanibusZenithCanyonText:
	text "The canyon road"
	line "returns to camp."
	para "Would you like"
	line "to travel back?"
	done

BanibusZenithSuppliesText:
	text "CANYON CAMP has"
	line "a guide back to"
	cont "SAPPHIRE CITY."
	para "Return there now?"
	done

BanibusZenithCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 24, 7, BANIBUS_ZENITH_GYM, 1
	warp_event 5, 25, BANIBUS_LEAGUE, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 32, 6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BanibusZenithLeagueGuideScript, -1
	object_event 7, 12, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BanibusZenithCanyonGuideScript, -1
	object_event 13, 18, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BanibusZenithSuppliesScript, -1
