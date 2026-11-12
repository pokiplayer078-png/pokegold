	db HATMENUBIS ; 253

	db  75,  55,  60, 145, 125,  70
	;   hp  atk  def  spd  sat  sdf

	db WATER, GROUND ; type
	db 45 ; catch rate
	db 205 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
IF DEF(_GOLD)
	INCBIN "gfx/pokemon/hatmenubis/front_gold.dimensions"
ELIF DEF(_SILVER)
	INCBIN "gfx/pokemon/hatmenubis/front_silver.dimensions"
ENDC
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_2, EGG_WATER_2 ; egg groups

	; tm/hm learnset
	tmhm SURF, WATERFALL, WHIRLPOOL, BLIZZARD, HYPER_BEAM, RAIN_DANCE, EARTHQUAKE, DIG, MUD_SLAP, PROTECT, RETURN, HIDDEN_POWER, REST, ATTRACT, IRON_TAIL, STRENGTH
	; end
