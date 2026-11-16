object_const_def
	const BANIBUSRAMSESHOUSE_RAMSES

BanibusRamsesHouse_MapScripts:
	def_scene_scripts

	def_callbacks

BanibusRamsesHouseRamsesScript:
	faceplayer
	opentext
	checkevent EVENT_BANIBUS_RAMSES_EEVEE_RECEIVED
	iftrue .Quest
	checkpoke EEVEE
	iftrue .EeveeAlreadyOwned
	givepoke EEVEE, 5
	iffalse .PartyFull
.EeveeAlreadyOwned:
	setevent EVENT_BANIBUS_RAMSES_EEVEE_RECEIVED
	writetext BanibusRamsesEeveeText
	waitbutton
.Quest:
	checkevent EVENT_BANIBUS_RAMSES_STONE_RECEIVED
	iftrue .QuestDone
	checkevent EVENT_BANIBUS_RAMSES_POTIONS_GIVEN
	iftrue .ChooseStone
	writetext BanibusRamsesRequestText
	yesorno
	iffalse .Later
	takeitem POTION, 5
	iffalse .NeedPotions
	setevent EVENT_BANIBUS_RAMSES_POTIONS_GIVEN
.ChooseStone:
	checkevent EVENT_BANIBUS_RAMSES_CHOICE_WATER
	iftrue .GiveWater
	checkevent EVENT_BANIBUS_RAMSES_CHOICE_FIRE
	iftrue .GiveFire
	checkevent EVENT_BANIBUS_RAMSES_CHOICE_THUNDER
	iftrue .GiveThunder
	checkevent EVENT_BANIBUS_RAMSES_CHOICE_LEAF
	iftrue .GiveLeaf
	writetext BanibusRamsesChooseWaterText
	yesorno
	iftrue .SelectWater
	writetext BanibusRamsesChooseFireText
	yesorno
	iftrue .SelectFire
	writetext BanibusRamsesChooseThunderText
	yesorno
	iftrue .SelectThunder
	writetext BanibusRamsesChooseLeafText
	yesorno
	iffalse .NoChoice
.SelectLeaf:
	setevent EVENT_BANIBUS_RAMSES_CHOICE_LEAF
	sjump .GiveLeaf
.SelectThunder:
	setevent EVENT_BANIBUS_RAMSES_CHOICE_THUNDER
	sjump .GiveThunder
.SelectFire:
	setevent EVENT_BANIBUS_RAMSES_CHOICE_FIRE
	sjump .GiveFire
.SelectWater:
	setevent EVENT_BANIBUS_RAMSES_CHOICE_WATER
	sjump .GiveWater
.GiveWater:
	verbosegiveitem WATER_STONE
	iffalse .BagFull
	setevent EVENT_BANIBUS_RAMSES_STONE_RECEIVED
	writetext BanibusRamsesStoneThanksText
	waitbutton
	closetext
	end
.GiveFire:
	verbosegiveitem FIRE_STONE
	iffalse .BagFull
	setevent EVENT_BANIBUS_RAMSES_STONE_RECEIVED
	writetext BanibusRamsesStoneThanksText
	waitbutton
	closetext
	end
.GiveThunder:
	verbosegiveitem THUNDERSTONE
	iffalse .BagFull
	setevent EVENT_BANIBUS_RAMSES_STONE_RECEIVED
	writetext BanibusRamsesStoneThanksText
	waitbutton
	closetext
	end
.GiveLeaf:
	verbosegiveitem LEAF_STONE
	iffalse .BagFull
	setevent EVENT_BANIBUS_RAMSES_STONE_RECEIVED
	writetext BanibusRamsesStoneThanksText
	waitbutton
	closetext
	end
.PartyFull:
	writetext BanibusRamsesPartyFullText
	waitbutton
	closetext
	end
.NeedPotions:
	writetext BanibusRamsesNeedPotionsText
	waitbutton
	closetext
	end
.BagFull:
	writetext BanibusRamsesBagFullText
	waitbutton
	closetext
	end
.Later:
.NoChoice:
	writetext BanibusRamsesLaterText
	waitbutton
	closetext
	end
.QuestDone:
	writetext BanibusRamsesQuestDoneText
	waitbutton
	closetext
	end

BanibusRamsesEeveeText:
	text "RAMSES: This little"
	line "EEVEE needs a kind"
	cont "trainer."
	para "Please take good"
	line "care of it!"
	done

BanibusRamsesRequestText:
	text "RAMSES: I study"
	line "how #MON evolve."
	para "Bring me 5 POTIONS"
	line "and I will trade"
	cont "you an evolution"
	cont "stone of your"
	cont "choice."
	para "Can you help me?"
	done

BanibusRamsesChooseWaterText:
	text "Choose a WATER"
	line "STONE as your"
	cont "reward?"
	done
BanibusRamsesChooseFireText:
	text "Choose a FIRE"
	line "STONE instead?"
	done
BanibusRamsesChooseThunderText:
	text "Choose a THUNDER"
	line "STONE instead?"
	done
BanibusRamsesChooseLeafText:
	text "Choose a LEAF"
	line "STONE instead?"
	done
BanibusRamsesStoneThanksText:
	text "RAMSES: A fair"
	line "trade. Use it"
	cont "wisely!"
	done
BanibusRamsesNeedPotionsText:
	text "RAMSES: I need"
	line "all 5 POTIONS."
	para "Bring them when"
	line "you have enough."
	done
BanibusRamsesPartyFullText:
	text "RAMSES: Party full."
	line "Make some room."
	para "Make room and"
	line "come speak to me"
	cont "for your EEVEE."
	done
BanibusRamsesBagFullText:
	text "RAMSES: Your BAG"
	line "is full."
	para "Make room and"
	line "I will give you"
	cont "the stone you"
	cont "already chose."
	done
BanibusRamsesLaterText:
	text "RAMSES: No rush."
	line "Come back when"
	cont "you are ready."
	done
BanibusRamsesQuestDoneText:
	text "RAMSES: Thank you"
	line "for helping my"
	cont "research. Good"
	cont "luck, trainer!"
	done

BanibusRamsesHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 2, 7, BANIBUS_OASIS, 4
	warp_event 3, 7, BANIBUS_OASIS, 4

	def_coord_events

	def_bg_events
	bg_event 0, 1, BGEVENT_READ, BanibusRamsesHouseBookshelf
	bg_event 1, 1, BGEVENT_READ, BanibusRamsesHouseBookshelf

	def_object_events
	object_event 2, 3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BanibusRamsesHouseRamsesScript, -1

BanibusRamsesHouseBookshelf:
	jumpstd MagazineBookshelfScript
