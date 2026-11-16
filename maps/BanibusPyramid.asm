	object_const_def
	const BANIBUSPYRAMID_GUARDIAN

BanibusPyramid_MapScripts:
	def_scene_scripts

	def_callbacks

BanibusPyramidGuardianScript:
	faceplayer
	opentext
	checkevent EVENT_BANIBUS_PYRAMID_TABLET_FOUND
	iftrue .Found
	writetext BanibusPyramidGuardianText
	yesorno
	iffalse .Declined
	verbosegiveitem RARE_CANDY
	iffalse .BagFull
	setevent EVENT_BANIBUS_PYRAMID_TABLET_FOUND
	writetext BanibusPyramidTabletText
	waitbutton
	closetext
	end
.Found:
	writetext BanibusPyramidFoundText
	waitbutton
	closetext
	end
.Declined:
	closetext
	end
.BagFull:
	writetext BanibusPyramidBagFullText
	waitbutton
	closetext
	end

BanibusPyramidGuardianText:
	text "The AKAR PYRAMID"
	line "was built to guard"
	cont "the desert wells."

	para "Only careful"
	line "trainers should"
	cont "explore its halls."
	done

BanibusPyramidTabletText:
	text "The tablet is"
	line "yours. Keep it"
	cont "as a token of"
	cont "your expedition!"
	done

BanibusPyramidFoundText:
	text "The guardian"
	line "nods silently."
	done

BanibusPyramidBagFullText:
	text "Your BAG is full."
	line "Return when you"
	cont "have room."
	done

BanibusPyramid_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 13, BANIBUS_DUNES, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 10, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BanibusPyramidGuardianScript, -1
