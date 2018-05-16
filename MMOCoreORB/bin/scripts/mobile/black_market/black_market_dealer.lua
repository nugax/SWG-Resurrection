black_market_dealer = Creature:new {
	objectName = "@mob/creature_names:commoner",
	customName = "Shady Black Market Dealer",
	socialGroup = "townsperson",
	pvpFaction = "townsperson",
	faction = "townsperson",
	level = 1,
	chanceHit = 0.25,
	damageMin = 50,
	damageMax = 55,
	baseXp = 113,
	baseHAM = 180,
	baseHAMmax = 220,
	armor = 0,
	resists = {0,0,0,0,0,0,0,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = NONE,
	creatureBitmask = NONE,
	optionsBitmask = 264, --for conversation
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_criminal_pirate_human_male_01.iff",
    "object/mobile/dressed_criminal_pirate_human_female_01.iff",
    "object/mobile/dressed_criminal_slicer_human_male_01.iff",
    "object/mobile/dressed_criminal_slicer_human_female_01.iff"
    },
	lootGroups = {},
	weapons = {},
	conversationTemplate = "black_market_template",
	attacks = {
	}
}

CreatureTemplates:addCreatureTemplate(black_market_dealer, "black_market_dealer")
