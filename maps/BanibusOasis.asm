	object_const_def
	const BANIBUSOASIS_GUIDE
	const BANIBUSOASIS_BOATMAN

BanibusOasis_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, BanibusOasisFirstVisitCallback

BanibusOasisFirstVisitCallback:
	checkevent EVENT_BANIBUS_HATME_RECEIVED
	iftrue .Done
	givepoke HATME, 5
	iffalse .Done
	setevent EVENT_BANIBUS_HATME_RECEIVED
.Done:
	endcallback

BanibusOasisGuideScript:
	faceplayer
	opentext
	writetext BanibusOasisGuideText
	yesorno
	iffalse .Stay
	closetext
	warp BANIBUS_DUNES, 8, 8
.Stay:
	waitbutton
	closetext
	end

BanibusOasisBoatmanScript:
	faceplayer
	opentext
	writetext BanibusOasisBoatmanText
	yesorno
	iffalse .Stay
	closetext
	warp ROUTE_29, 25, 9
.Stay:
	waitbutton
	closetext
	end

BanibusOasisGuideText:
	text "Welcome to the"
	line "OASIS OF MIRAGE!"

	para "The desert trails"
	line "begin beyond the"
	cont "western gate."

	para "Shall I guide you"
	line "to the DUNES?"
	done

BanibusOasisBoatmanText:
	text "My boat returns"
	line "to ROUTE 29."

	para "Ready to sail back"
	line "to JOHTO?"
	done

BanibusOasis_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 23,  3, BANIBUS_MART, 2
	warp_event 29,  3, BANIBUS_POKECENTER_1F, 1
	warp_event 17,  7, BANIBUS_DUNES, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 32,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BanibusOasisGuideScript, -1
	object_event  7, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BanibusOasisBoatmanScript, -1
