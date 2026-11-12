	db HATME ; 252

	db  32,  20,  25, 110,  20,  25
	;   hp  atk  def  spd  sat  sdf

	db WATER, GROUND ; type
	db 220 ; catch rate
	db 35 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
IF DEF(_GOLD)
	INCBIN "gfx/pokemon/hatme/front_gold.dimensions"
ELIF DEF(_SILVER)
	INCBIN "gfx/pokemon/hatme/front_silver.dimensions"
ENDC
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_2, EGG_WATER_2 ; egg groups

	; tm/hm learnset
	tmhm SURF, WATERFALL, WHIRLPOOL, RAIN_DANCE, RETURN, DIG, MUD_SLAP, PROTECT, HIDDEN_POWER, REST, ATTRACT
	; end
