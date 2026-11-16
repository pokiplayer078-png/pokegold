	object_const_def
	const BANIBUSSAPPHIRECITY_GUIDE
	const BANIBUSSAPPHIRECITY_SUPPLIES
	const BANIBUSSAPPHIRECITY_SIGN

BanibusSapphireCity_MapScripts:
	def_scene_scripts

	def_callbacks

BanibusSapphireGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BANIBUS_BEAT_GYM2
	iffalse .Locked
	writetext BanibusSapphireGuideOpenText
	yesorno
	iffalse .Stay
	closetext
	warp BANIBUS_CANYON_CAMP, 15, 10
.Stay:
	waitbutton
	closetext
	end
.Locked:
	writetext BanibusSapphireGuideLockedText
	waitbutton
	closetext
	end

BanibusSapphireSuppliesScript:
	faceplayer
	opentext
	writetext BanibusSupplyReturnText
	yesorno
	iffalse .Stay
	closetext
	warp BANIBUS_OASIS, 29, 4
.Stay:
	waitbutton
	closetext
	end

BanibusSapphireSign:
	jumptext BanibusSapphireSignText

BanibusSapphireGymSign:
	jumptext BanibusSapphireGymSignText
BanibusSapphireMartSign:
	jumptext BanibusSapphireMartSignText
BanibusSapphirePokecenterSign:
	jumptext BanibusSapphirePokecenterSignText

BanibusSapphireGymSignText:
	text "SAPPHIRE CITY GYM"
	cont "LEADER: NABIL"
	para "ROCK-type #MON"
	done
BanibusSapphireMartSignText:
	text "SAPPHIRE CITY MART"
	done
BanibusSapphirePokecenterSignText:
	text "SAPPHIRE CITY"
	line "#MON CENTER"
	done

BanibusSapphireGuideOpenText:
	text "CANYON CAMP is"
	line "beyond the next"
	cont "ridge."
	para "Ready to continue"
	line "your expedition?"
	done

BanibusSapphireGuideLockedText:
	text "The canyon pass"
	line "is still sealed."
	para "Win the SAPPHIRE"
	line "GYM challenge"
	cont "first."
	done

BanibusSupplyReturnText:
	text "The OASIS OF"
	line "MIRAGE has a"
	cont "MART and a"
	cont "#MON CENTER."
	para "Return there now?"
	done

BanibusSapphireSignText:
	text "SAPPHIRE CITY"
	para "The City of"
	line "Ancient Stone"
	done

BanibusSapphireCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 18, 17, BANIBUS_SAPPHIRE_GYM, 1
	warp_event 9, 17, BANIBUS_MART, 1
	warp_event 31, 25, BANIBUS_POKECENTER_1F, 2
	warp_event 21, 29, BANIBUS_RESIDENT_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 24, 20, BGEVENT_READ, BanibusSapphireSign
	bg_event 15, 17, BGEVENT_READ, BanibusSapphireGymSign
	bg_event 10, 17, BGEVENT_READ, BanibusSapphireMartSign
	bg_event 32, 25, BGEVENT_READ, BanibusSapphirePokecenterSign

	def_object_events
	object_event 32, 6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BanibusSapphireGuideScript, -1
	object_event 7, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BanibusSapphireSuppliesScript, -1
