	object_const_def
	const BANIBUSLEAGUE_GROUND
	const BANIBUSLEAGUE_ROCK
	const BANIBUSLEAGUE_WIND
	const BANIBUSLEAGUE_MIND
	const BANIBUSLEAGUE_CHAMPION
	const BANIBUSLEAGUE_ARCHIVIST

BanibusLeague_MapScripts:
	def_scene_scripts

	def_callbacks

BanibusLeagueGroundScript:
	faceplayer
	opentext
	checkevent EVENT_BANIBUS_E4_GROUND
	iftrue .Done
	checkevent EVENT_BANIBUS_BEAT_GYM4
	iffalse .Locked
	writetext BanibusLeagueGroundIntroText
	waitbutton
	closetext
	winlosstext BanibusLeagueGroundWinText, 0
	loadtrainer HIKER, BANIBUS_E4_GROUND
	startbattle
	reloadmapafterbattle
	setevent EVENT_BANIBUS_E4_GROUND
	opentext
	writetext BanibusLeagueGroundAfterText
	waitbutton
	closetext
	end
.Locked:
	writetext BanibusLeagueLockedText
	waitbutton
	closetext
	end
.Done:
	writetext BanibusLeagueAlreadyWonText
	waitbutton
	closetext
	end

BanibusLeagueRockScript:
	faceplayer
	opentext
	checkevent EVENT_BANIBUS_E4_ROCK
	iftrue .Done
	checkevent EVENT_BANIBUS_E4_GROUND
	iffalse .Locked
	writetext BanibusLeagueRockIntroText
	waitbutton
	closetext
	winlosstext BanibusLeagueRockWinText, 0
	loadtrainer POKEMANIAC, BANIBUS_E4_ROCK
	startbattle
	reloadmapafterbattle
	setevent EVENT_BANIBUS_E4_ROCK
	opentext
	writetext BanibusLeagueRockAfterText
	waitbutton
	closetext
	end
.Locked:
	writetext BanibusLeagueLockedText
	waitbutton
	closetext
	end
.Done:
	writetext BanibusLeagueAlreadyWonText
	waitbutton
	closetext
	end

BanibusLeagueWindScript:
	faceplayer
	opentext
	checkevent EVENT_BANIBUS_E4_WIND
	iftrue .Done
	checkevent EVENT_BANIBUS_E4_ROCK
	iffalse .Locked
	writetext BanibusLeagueWindIntroText
	waitbutton
	closetext
	winlosstext BanibusLeagueWindWinText, 0
	loadtrainer BIRD_KEEPER, BANIBUS_E4_WIND
	startbattle
	reloadmapafterbattle
	setevent EVENT_BANIBUS_E4_WIND
	opentext
	writetext BanibusLeagueWindAfterText
	waitbutton
	closetext
	end
.Locked:
	writetext BanibusLeagueLockedText
	waitbutton
	closetext
	end
.Done:
	writetext BanibusLeagueAlreadyWonText
	waitbutton
	closetext
	end

BanibusLeagueMindScript:
	faceplayer
	opentext
	checkevent EVENT_BANIBUS_E4_MIND
	iftrue .Done
	checkevent EVENT_BANIBUS_E4_WIND
	iffalse .Locked
	writetext BanibusLeagueMindIntroText
	waitbutton
	closetext
	winlosstext BanibusLeagueMindWinText, 0
	loadtrainer PSYCHIC_T, BANIBUS_E4_MIND
	startbattle
	reloadmapafterbattle
	setevent EVENT_BANIBUS_E4_MIND
	opentext
	writetext BanibusLeagueMindAfterText
	waitbutton
	closetext
	end
.Locked:
	writetext BanibusLeagueLockedText
	waitbutton
	closetext
	end
.Done:
	writetext BanibusLeagueAlreadyWonText
	waitbutton
	closetext
	end

BanibusLeagueChampionScript:
	faceplayer
	opentext
	checkevent EVENT_BANIBUS_LEAGUE_CLEAR
	iftrue .Rewards
	checkevent EVENT_BANIBUS_E4_MIND
	iffalse .Locked
	writetext BanibusLeagueChampionIntroText
	waitbutton
	closetext
	winlosstext BanibusLeagueChampionWinText, 0
	loadtrainer CHAMPION, BANIBUS_CHAMPION
	startbattle
	reloadmapafterbattle
	setevent EVENT_BANIBUS_LEAGUE_CLEAR
	opentext
	writetext BanibusLeagueChampionAfterText
	waitbutton
.Rewards:
	checkevent EVENT_BANIBUS_REWARD_CHOICE_KABUTOPS
	iftrue .KabutopsReward
	checkevent EVENT_BANIBUS_REWARD_CHOICE_OCTILLERY
	iftrue .OctilleryReward
	checkevent EVENT_BANIBUS_REWARD_CHOICE_OMASTAR
	iftrue .OmastarReward
	checkevent EVENT_BANIBUS_REWARD_CHOICE_SCIZOR
	iftrue .ScizorReward
	; Carry forward the original Kabutops + Master Ball reward on old saves.
	checkevent EVENT_BANIBUS_REWARD_KABUTOPS
	iftrue .MigrateOldReward
	checkevent EVENT_BANIBUS_REWARD_MASTER_BALL
	iftrue .MigrateOldReward
	writetext BanibusLeagueChooseKabutopsText
	yesorno
	iftrue .ChooseKabutops
	writetext BanibusLeagueChooseOctilleryText
	yesorno
	iftrue .ChooseOctillery
	writetext BanibusLeagueChooseOmastarText
	yesorno
	iftrue .ChooseOmastar
	writetext BanibusLeagueChooseScizorText
	yesorno
	iffalse .NoChoice
.ChooseScizor:
	setevent EVENT_BANIBUS_REWARD_CHOICE_SCIZOR
	sjump .ScizorReward
.ChooseOmastar:
	setevent EVENT_BANIBUS_REWARD_CHOICE_OMASTAR
	sjump .OmastarReward
.ChooseOctillery:
	setevent EVENT_BANIBUS_REWARD_CHOICE_OCTILLERY
	sjump .OctilleryReward
.ChooseKabutops:
	setevent EVENT_BANIBUS_REWARD_CHOICE_KABUTOPS
	sjump .KabutopsReward
.MigrateOldReward:
	setevent EVENT_BANIBUS_REWARD_CHOICE_KABUTOPS
	sjump .KabutopsReward
.KabutopsReward:
	checkevent EVENT_BANIBUS_REWARD_KABUTOPS
	iftrue .KabutopsBall
	givepoke KABUTOPS, 42
	iffalse .PartyFull
	setevent EVENT_BANIBUS_REWARD_KABUTOPS
.KabutopsBall:
	checkevent EVENT_BANIBUS_REWARD_MASTER_BALL
	iftrue .AllDone
	verbosegiveitem MASTER_BALL
	iffalse .BagFull
	setevent EVENT_BANIBUS_REWARD_MASTER_BALL
	sjump .AllDone
.OctilleryReward:
	checkevent EVENT_BANIBUS_REWARD_OCTILLERY
	iftrue .OctilleryBalls
	givepoke OCTILLERY, 39
	iffalse .PartyFull
	setevent EVENT_BANIBUS_REWARD_OCTILLERY
.OctilleryBalls:
	checkevent EVENT_BANIBUS_REWARD_ULTRA_BALLS
	iftrue .AllDone
	verbosegiveitem ULTRA_BALL, 30
	iffalse .BagFull
	setevent EVENT_BANIBUS_REWARD_ULTRA_BALLS
	sjump .AllDone
.OmastarReward:
	checkevent EVENT_BANIBUS_REWARD_OMASTAR
	iftrue .OmastarMoney
	givepoke OMASTAR, 41
	iffalse .PartyFull
	setevent EVENT_BANIBUS_REWARD_OMASTAR
.OmastarMoney:
	checkevent EVENT_BANIBUS_REWARD_MONEY
	iftrue .AllDone
	givemoney YOUR_MONEY, 25000
	setevent EVENT_BANIBUS_REWARD_MONEY
	sjump .AllDone
.ScizorReward:
	checkevent EVENT_BANIBUS_REWARD_SCIZOR
	iftrue .ScizorMonolith
	givepoke SCIZOR, 28
	iffalse .PartyFull
	setevent EVENT_BANIBUS_REWARD_SCIZOR
.ScizorMonolith:
	checkevent EVENT_BANIBUS_REWARD_MONOLITH
	iftrue .AllDone
	verbosegiveitem SMALL_MONOLITH
	iffalse .BagFull
	setevent EVENT_BANIBUS_REWARD_MONOLITH
.AllDone:
	writetext BanibusLeagueRewardCompleteText
	waitbutton
	closetext
	end
.PartyFull:
	writetext BanibusLeaguePartyFullText
	waitbutton
	closetext
	end
.BagFull:
	writetext BanibusLeagueBagFullText
	waitbutton
	closetext
	end
.NoChoice:
	writetext BanibusLeagueNoRewardText
	waitbutton
	closetext
	end
.Locked:
	writetext BanibusLeagueLockedText
	waitbutton
	closetext
	end

BanibusLeagueArchivistScript:
	faceplayer
	opentext
	checkevent EVENT_BANIBUS_LEAGUE_CLEAR
	iffalse .Empty
	writetext BanibusLeagueHallOfFameText
	waitbutton
	closetext
	end
.Empty:
	writetext BanibusLeagueHallEmptyText
	waitbutton
	closetext
	end

BanibusLeagueGroundIntroText:
	text "I am TAREK."
	line "I guard the first"
	cont "League chamber."
	done
BanibusLeagueGroundWinText:
	text "The earth yields"
	line "to your strength."
	done
BanibusLeagueGroundAfterText:
	text "The first seal"
	line "is broken."
	done

BanibusLeagueRockIntroText:
	text "I am JAMIL."
	line "Your next test is"
	cont "unyielding stone."
	done
BanibusLeagueRockWinText:
	text "Your resolve is"
	line "stronger than rock."
	done
BanibusLeagueRockAfterText:
	text "The second seal"
	line "is broken."
	done

BanibusLeagueWindIntroText:
	text "I am RASHID."
	line "Let the canyon"
	cont "winds judge you."
	done
BanibusLeagueWindWinText:
	text "You stood firm"
	line "against the gale."
	done
BanibusLeagueWindAfterText:
	text "The third seal"
	line "is broken."
	done

BanibusLeagueMindIntroText:
	text "I am LAILA."
	line "Your final test"
	cont "is the mind."
	done
BanibusLeagueMindWinText:
	text "Your focus broke"
	line "through illusion."
	done
BanibusLeagueMindAfterText:
	text "The final seal"
	line "is broken."
	done

BanibusLeagueChampionIntroText:
	text "I am KHALED,"
	line "the BANIBUS CHAMPION."
	para "Show me the full"
	line "strength of your"
	cont "expedition team!"
	done
BanibusLeagueChampionWinText:
	text "You have become"
	line "the champion of"
	cont "BANIBUS!"
	done
BanibusLeagueChampionAfterText:
	text "Your name is now"
	line "held in the"
	cont "BANIBUS HALL OF"
	cont "FAME!"
	done

BanibusLeagueLockedText:
	text "You must defeat"
	line "the previous"
	cont "challenger first."
	done
BanibusLeagueAlreadyWonText:
	text "You have already"
	line "cleared this"
	cont "League chamber."
	done
BanibusLeagueHallOfFameText:
	text "The BANIBUS HALL"
	line "OF FAME remembers"
	cont "its first champion:"
	cont "KHALED!"
	done
BanibusLeagueHallEmptyText:
	text "The HALL OF FAME"
	line "is waiting for"
	cont "its first champion."
	done
BanibusLeagueChooseKabutopsText:
	text "Choose this prize?"
	para "KABUTOPS Lv.42"
	line "and MASTER BALL."
	done
BanibusLeagueChooseOctilleryText:
	text "Choose this prize?"
	para "OCTILLERY Lv.39"
	line "30 ULTRA BALLS."
	done
BanibusLeagueChooseOmastarText:
	text "Choose this prize?"
	para "OMASTAR Lv.41"
	line "and 25000 POKEDOLLARS."
	done
BanibusLeagueChooseScizorText:
	text "Choose this prize?"
	para "SCIZOR Lv.28"
	line "and a SMALL MONOLITH."
	done
BanibusLeaguePartyFullText:
	text "Your party is full."
	para "Make room and"
	line "return to KHALED."
	para "Your chosen prize"
	line "is reserved."
	done
BanibusLeagueBagFullText:
	text "Your BAG is full."
	para "Make room and"
	line "return to KHALED."
	para "Your chosen prize"
	line "is reserved."
	done
BanibusLeagueNoRewardText:
	text "Take your time."
	para "Speak to KHALED"
	line "when you have"
	cont "chosen a prize."
	done
BanibusLeagueRewardCompleteText:
	text "Your chosen prize"
	line "has been delivered!"
	done

BanibusLeague_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 4, 15, BANIBUS_ZENITH_CITY, 2
	warp_event 5, 15, BANIBUS_ZENITH_CITY, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 2, 2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BanibusLeagueGroundScript, -1
	object_event 7, 4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BanibusLeagueRockScript, -1
	object_event 2, 6, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BanibusLeagueWindScript, -1
	object_event 7, 8, SPRITE_SABRINA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BanibusLeagueMindScript, -1
	object_event 5, 11, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BanibusLeagueChampionScript, -1
	object_event 8, 13, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BanibusLeagueArchivistScript, -1
