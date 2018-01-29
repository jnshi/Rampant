-- imports

local acidBall = require("utils/AttackBall")
local biterUtils = require("utils/BiterUtils")
local stickerUtils = require("utils/StickerUtils")
local swarmUtils = require("SwarmUtils")
package.path = "../libs/?.lua;" .. package.path
local constants = require("Constants")

-- constants

local SUICIDE_UNIT_TIERS = constants.SUICIDE_UNIT_TIERS
local SUICIDE_UNIT_VARIATIONS = constants.SUICIDE_UNIT_VARIATIONS

local SUICIDE_NEST_TIERS = constants.SUICIDE_NEST_TIERS
local SUICIDE_NEST_VARIATIONS = constants.SUICIDE_NEST_VARIATIONS

local SUICIDE_WORM_TIERS = constants.SUICIDE_WORM_TIERS
local SUICIDE_WORM_VARIATIONS = constants.SUICIDE_WORM_VARIATIONS

-- imported functions

local makeSticker = stickerUtils.makeSticker
local buildUnitSpawner = swarmUtils.buildUnitSpawner
local buildWorm = swarmUtils.buildWorm
local createAttackBall = acidBall.createAttackBall
local createStreamAttack = biterUtils.createStreamAttack
local createSuicideAttack = biterUtils.createSuicideAttack

local softSmoke = "the-soft-smoke-rampant"


local makeUnitAlienLootTable = biterUtils.makeUnitAlienLootTable
local makeSpawnerAlienLootTable = biterUtils.makeSpawnerAlienLootTable
local makeWormAlienLootTable = biterUtils.makeWormAlienLootTable

local biterLoot = makeUnitAlienLootTable("yellow")
local spawnerLoot = makeSpawnerAlienLootTable("yellow")
local wormLoot = makeWormAlienLootTable("yellow")



-- suicide biters
buildUnitSpawner(
    {
	unit = {
	    name = "suicide-biter",

	    loot = biterLoot,
	    attributes = {
		explosion = "blood-explosion-small"
	    },
	    attack = {
		scorchmark = "small-scorchmark"
	    },
	    resistances = {},

	    type = "biter",
	    scales = {
		[1] = 0.5,
		[2] = 0.6,
		[3] = 0.7,
		[4] = 0.8,
		[5] = 0.9,
		[6] = 1,
		[7] = 1.1,
		[8] = 1.2,
		[9] = 1.3,
		[10] = 1.4
	    },
	    tint1 = {r=0.56, g=0.46, b=0, a=0.65},
	    tint2 = {r=0.56, g=0.46, b=0, a=0.65}
	},

	unitSpawner = {
	    name = "suicide-biter-nest",

	    loot = spawnerLoot,
	    attributes = {},	    
	    resistances = {},
	    scales = {
		[1] = 0.5,
		[2] = 0.5,
		[3] = 0.5,
		[4] = 0.5,
		[5] = 0.5,
		[6] = 0.5,
		[7] = 0.5,
		[8] = 0.5,
		[9] = 0.5,
		[10] = 0.5
	    },
	    tint = {r=0.56, g=0.46, b=0, a=0.65}
	}
    },

    {
	unit = {
	    {

		type = "attribute",
		name = "health",
		[1] = 7,
		[2] = 42,
		[3] = 75,
		[4] = 125,
		[5] = 200,
		[6] = 350,
		[7] = 750,
		[8] = 1500,
		[9] = 3000,
		[10] = 5000

	    },

	    {		
		type = "attack",
		name = "cooldown",
		[1] = 35,
		[2] = 35,
		[3] = 35,
		[4] = 35,
		[5] = 35,
		[6] = 35,
		[7] = 50,
		[8] = 50,
		[9] = 55,
		[10] = 57
		
	    },
	    
	    {		
		type = "attribute",
		name = "spawningTimeModifer",
		[1] = 0,
		[2] = 0,
		[3] = 1,
		[4] = 2,
		[5] = 3,
		[6] = 5,
		[7] = 6,
		[8] = 6,
		[9] = 8,
		[10] = 8
		
	    },

	    {
		
		type = "attribute",
		name = "pollutionToAttack",
		[1] = 200,
		[2] = 750,
		[3] = 1750,
		[4] = 3500,
		[5] = 5000,
		[6] = 10000,
		[7] = 20000,
		[8] = 25000,
		[9] = 30000,
		[10] = 40000
		
	    },

	    {
		
		type = "attack",
		mapping = "explosion",
		[1] = "explosion",
		[2] = "explosion",
		[3] = "big-explosion",
		[4] = "big-explosion",
		[5] = "big-explosion",
		[6] = "big-explosion",
		[7] = "massive-explosion",
		[8] = "massive-explosion",
		[9] = "massive-explosion",
		[10] = "massive-explosion"		
	    },

	    {
		
		type = "attack",
		name = "radius",
		[1] = 3.5,
		[2] = 3.5,
		[3] = 4,
		[4] = 5,
		[5] = 6,
		[6] = 6,
		[7] = 7,
		[8] = 7,
		[9] = 7.5,
		[10] = 8
		
	    },
	    
	    {
		
		type = "attack",
		name = "explosionDistance",
		[1] = 2,
		[2] = 2,
		[3] = 2,
		[4] = 2,
		[5] = 2,
		[6] = 2.5,
		[7] = 2.5,
		[8] = 2.5,
		[9] = 3,
		[10] = 3
		
	    },

	    {
		
		type = "attack",
		name = "explosionCount",
		min = 2,
		[1] = 2,
		[2] = 3,
		[3] = 4,
		[4] = 5,
		[5] = 6,
		[6] = 8,
		[7] = 10,
		[8] = 12,
		[9] = 13,
		[10] = 14
		
	    },
	    
	    {
		
		type = "attack",
		name = "damage",
		[1] = 20,
		[2] = 25,
		[3] = 30,
		[4] = 35,
		[5] = 45,
		[6] = 60,
		[7] = 75,
		[8] = 80,
		[9] = 100,
		[10] = 150
		
	    },
	    
	    {
		
		type = "attribute",
		name = "healing",
		[1] = 0.01,
		[2] = 0.01,
		[3] = 0.015,
		[4] = 0.02,
		[5] = 0.05,
		[6] = 0.075,
		[7] = 0.1,
		[8] = 0.12,
		[9] = 0.14,
		[10] = 0.16
		
	    },

	    {
		
		type = "attribute",
		name = "movement",
		[1] = 0.23,
		[2] = 0.23,
		[3] = 0.22,
		[4] = 0.22,
		[5] = 0.21,
		[6] = 0.21,
		[7] = 0.2,
		[8] = 0.2,
		[9] = 0.19,
		[10] = 0.19
	    },
	    {
		type = "attribute",
		name = "distancePerFrame",
		[1] = 0.12,
		[2] = 0.145,
		[3] = 0.17,
		[4] = 0.21,
		[5] = 0.21,
		[6] = 0.22,
		[7] = 0.22,
		[8] = 0.23,
		[9] = 0.23,
		[10] = 0.24
	    },

	    {
		type = "resistance",
		name = "physical",
		decrease = {
		    [1] = 0,
		    [2] = 0,
		    [3] = 4,
		    [4] = 5,
		    [5] = 6,
		    [6] = 8,
		    [7] = 9,
		    [8] = 9,
		    [9] = 10,
		    [10] = 10
		},
		percent = {
		    [1] = 0,
		    [2] = 0,
		    [3] = 0,
		    [4] = 10,
		    [5] = 12,
		    [6] = 12,
		    [7] = 13,
		    [8] = 13,
		    [9] = 14,
		    [10] = 15
		}
	    },

	    {
		type = "resistance",
		name = "explosion",
		decrease = {
		    [1] = -7,
		    [2] = -7,
		    [3] = -10,
		    [4] = -10,
		    [5] = -13,
		    [6] = -13,
		    [7] = -16,
		    [8] = -16,
		    [9] = -19,
		    [10] = -23
		},
		percent = {
		    [1] = -65,
		    [2] = -65,
		    [3] = -70,
		    [4] = -75,
		    [5] = -75,
		    [6] = -80,
		    [7] = -85,
		    [8] = -85,
		    [9] = -90,
		    [10] = -90
		}
	    },

	    {		
		type = "attack",
		name = "range",
		[1] = 0.5,
		[2] = 0.5,
		[3] = 0.75,
		[4] = 0.75,
		[5] = 1.0,
		[6] = 1.0,
		[7] = 1.25,
		[8] = 1.50,
		[9] = 1.75,
		[10] = 2.0		
	    }
	},
	
	unitSpawner = {

	    {		
		type = "attribute",
		name = "health",
		[1] = 350,
		[2] = 500,
		[3] = 750,
		[4] = 1500,
		[5] = 2500,
		[6] = 3500,
		[7] = 5000,
		[8] = 7000,
		[9] = 10000,
		[10] = 15000		
	    },

	    {
		type = "attribute",
		name = "healing",
		[1] = 0.02,
		[2] = 0.02,
		[3] = 0.022,
		[4] = 0.024,
		[5] = 0.026,
		[6] = 0.028,
		[7] = 0.03,
		[8] = 0.032,
		[9] = 0.034,
		[10] = 0.036		
	    },

	    {
		
		type = "attribute",
		name = "spawingCooldownStart",
		[1] = 330,
		[2] = 330,
		[3] = 325,
		[4] = 325,
		[5] = 320,
		[6] = 320,
		[7] = 315,
		[8] = 315,
		[9] = 310,
		[10] = 310		
	    },

	    {
		
		type = "attribute",
		name = "spawingCooldownEnd",
		[1] = 120,
		[2] = 120,
		[3] = 115,
		[4] = 115,
		[5] = 110,
		[6] = 110,
		[7] = 105,
		[8] = 105,
		[9] = 100,
		[10] = 100
	    },

	    {		
		type = "attribute",
		name = "evolutionRequirement",
		[1] = 0,
		[2] = 0.1,
		[3] = 0.2,
		[4] = 0.3,
		[5] = 0.4,
		[6] = 0.5,
		[7] = 0.6,
		[8] = 0.7,
		[9] = 0.8,
		[10] = 0.9		
	    },

	    {				
		type = "attribute",
		name = "unitsOwned",
		[1] = 6,
		[2] = 6,
		[3] = 7,
		[4] = 7,
		[5] = 8,
		[6] = 8,
		[7] = 9,
		[8] = 9,
		[9] = 10,
		[10] = 10		
	    },

	    {		
		type = "attribute",
		name = "unitsToSpawn",
		[1] = 3,
		[2] = 3,
		[3] = 4,
		[4] = 5,
		[5] = 5,
		[6] = 6,
		[7] = 6,
		[8] = 7,
		[9] = 7,
		[10] = 8
	    },
	    
	    {
		type = "resistance",
		name = "physical",
		decrease = {
		    [1] = 2,
		    [2] = 2,
		    [3] = 4,
		    [4] = 4,
		    [5] = 6,
		    [6] = 6,
		    [7] = 10,
		    [8] = 12,
		    [9] = 12,
		    [10] = 14
		},
		percent = {
		    [1] = 15,
		    [2] = 15,
		    [3] = 17,
		    [4] = 17,
		    [5] = 18,
		    [6] = 18,
		    [7] = 19,
		    [8] = 19,
		    [9] = 20,
		    [10] = 20
		}
	    },

	    {
		type = "resistance",
		name = "explosion",
		decrease = {
		    [1] = 7,
		    [2] = 7,
		    [3] = 10,
		    [4] = 10,
		    [5] = 13,
		    [6] = 13,
		    [7] = 16,
		    [8] = 16,
		    [9] = 19,
		    [10] = 23
		},
		percent = {
		    [1] = 65,
		    [2] = 65,
		    [3] = 70,
		    [4] = 75,
		    [5] = 75,
		    [6] = 80,
		    [7] = 85,
		    [8] = 85,
		    [9] = 90,
		    [10] = 90
		}
	    },

	    {
		type = "resistance",
		name = "fire",
		decrease = {
		    [1] = 1,
		    [2] = 1,
		    [3] = 2,
		    [4] = 2,
		    [5] = 3,
		    [6] = 3,
		    [7] = 4,
		    [8] = 4,
		    [9] = 5,
		    [10] = 5
		},
		percent = {
		    [1] = 40,
		    [2] = 40,
		    [3] = 42,
		    [4] = 42,
		    [5] = 43,
		    [6] = 43,
		    [7] = 44,
		    [8] = 44,
		    [9] = 45,
		    [10] = 45
		}
	    }
	},

	probabilityTable = {
	    [1] = 1,
	    [2] = 1,
	    [3] = 1,
	    [4] = 1,
	    [5] = 1,
	    [6] = 1,
	    [7] = 1,
	    [8] = 1,
	    [9] = 1,
	    [10] = 1,
	}
    },

    createSuicideAttack,

    {
	unit = SUICIDE_UNIT_VARIATIONS,
	unitSpawner = SUICIDE_NEST_VARIATIONS
    },

    {
	unit = SUICIDE_UNIT_TIERS,
	unitSpawner = SUICIDE_NEST_TIERS
    }
)

-- suicide worms
buildWorm(
    {
	name = "suicide-worm",

	loot = wormLoot,
	attributes = {},
	attack = {
	    stickerAnimation = {
		filename = "__base__/graphics/entity/slowdown-sticker/slowdown-sticker.png",
		priority = "extra-high",
		width = 11,
		height = 11,
		frame_count = 13,
		animation_speed = 0.4
	    },
	    areaEffects = function (attributes)
		return {
		    {
			type = "damage",
			damage = { amount = attributes.damage, type = "acid" }
		    },
		    {
			type = "create-sticker",
			sticker = attributes.name .. "-sticker-rampant"
		    }
		}    
	    end,
	    softSmokeName = softSmoke
	},
	resistances = {},

	scales = {
	    [1] = 0.5,
	    [2] = 0.6,
	    [3] = 0.7,
	    [4] = 0.8,
	    [5] = 0.9,
	    [6] = 1,
	    [7] = 1.1,
	    [8] = 1.2,
	    [9] = 1.3,
	    [10] = 1.4
	},
	attackName = "suicide-worm",
	tint = {r=0.56, g=0.46, b=0, a=0.65},
	pTint = {r=0, g=1, b=1, a=0.5},
	sTint = {r=0, g=1, b=1, a=0.5}
    },

    {
	{    
	    type = "attribute",
	    name = "health",
	    [1] = 200,
	    [2] = 350,
	    [3] = 500,
	    [4] = 750,
	    [5] = 900,
	    [6] = 1000,
	    [7] = 1500,
	    [8] = 3000,
	    [9] = 5000,
	    [10] = 9000
	},

	{    
	    type = "attack",
	    name = "cooldown",
	    [1] = 50,
	    [2] = 50,
	    [3] = 45,
	    [4] = 45,
	    [5] = 40,
	    [6] = 40,
	    [7] = 35,
	    [8] = 35,
	    [9] = 30,
	    [10] = 30
	},

	{    
	    type = "attack",
	    name = "stickerMovementModifier",
	    [1] = 1.2,
	    [2] = 1.2,
	    [3] = 1.3,
	    [4] = 1.3,
	    [5] = 1.4,
	    [6] = 1.4,
	    [7] = 1.5,
	    [8] = 1.5,
	    [9] = 1.6,
	    [10] = 1.6
	},
	
	{    
	    type = "attack",
	    name = "stickerDuration",
	    [1] = 1800,
	    [2] = 1800,
	    [3] = 1900,
	    [4] = 1900,
	    [5] = 2000,
	    [6] = 2000,
	    [7] = 2100,
	    [8] = 2100,
	    [9] = 2200,
	    [10] = 2200
	},

	{    
	    type = "attribute",
	    name = "evolutionRequirement",
	    [1] = 0,
	    [2] = 0.1,
	    [3] = 0.2,
	    [4] = 0.3,
	    [5] = 0.4,
	    [6] = 0.5,
	    [7] = 0.6,
	    [8] = 0.7,
	    [9] = 0.8,
	    [10] = 0.9
	},
	
	{    
	    type = "attack",
	    name = "damage",
	    [1] = 12,
	    [2] = 20,
	    [3] = 25,
	    [4] = 30,
	    [5] = 35,
	    [6] = 40,
	    [7] = 50,
	    [8] = 60,
	    [9] = 70,
	    [10] = 80
	},
	
	{    
	    type = "attribute",
	    name = "healing",
	    [1] = 0.01,
	    [2] = 0.01,
	    [3] = 0.015,
	    [4] = 0.02,
	    [5] = 0.05,
	    [6] = 0.075,
	    [7] = 0.1,
	    [8] = 0.12,
	    [9] = 0.14,
	    [10] = 0.16
	},

	{    
	    type = "attribute",
	    name = "prepareRange",
	    [1] = 30,
	    [2] = 30,
	    [3] = 31,
	    [4] = 31,
	    [5] = 32,
	    [6] = 32,
	    [7] = 33,
	    [8] = 33,
	    [9] = 34,
	    [10] = 34
	},
	
	{    
	    type = "attribute",
	    name = "foldingSpeed",
	    [1] = 0.15,
	    [2] = 0.15,
	    [3] = 0.16,
	    [4] = 0.16,
	    [5] = 0.16,
	    [6] = 0.17,
	    [7] = 0.17,
	    [8] = 0.18,
	    [9] = 0.18,
	    [10] = 0.19
	},
	
	{    
	    type = "attribute",
	    name = "preparingSpeed",
	    [1] = 0.025,
	    [2] = 0.025,
	    [3] = 0.026,
	    [4] = 0.026,
	    [5] = 0.027,
	    [6] = 0.027,
	    [7] = 0.028,
	    [8] = 0.028,
	    [9] = 0.029,
	    [10] = 0.029
	},

	{
	    type = "resistance",
	    name = "physical",
	    decrease = {
		[1] = 0,
		[2] = 0,
		[3] = 5,
		[4] = 5,
		[5] = 8,
		[6] = 8,
		[7] = 10,
		[8] = 10,
		[9] = 12,
		[10] = 12
	    }
	},

	{
	    type = "resistance",
	    name = "explosion",
	    decrease = {
		[1] = 7,
		[2] = 7,
		[3] = 10,
		[4] = 10,
		[5] = 13,
		[6] = 13,
		[7] = 16,
		[8] = 16,
		[9] = 19,
		[10] = 23
	    },
	    percent = {
		[1] = 65,
		[2] = 65,
		[3] = 70,
		[4] = 75,
		[5] = 75,
		[6] = 80,
		[7] = 85,
		[8] = 85,
		[9] = 90,
		[10] = 90
	    }
	},

	{
	    type = "resistance",
	    name = "fire",
	    decrease = {
		[1] = 1,
		[2] = 1,
		[3] = 2,
		[4] = 2,
		[5] = 3,
		[6] = 3,
		[7] = 4,
		[8] = 4,
		[9] = 5,
		[10] = 5
	    },
	    percent = {
		[1] = 40,
		[2] = 40,
		[3] = 42,
		[4] = 42,
		[5] = 43,
		[6] = 43,
		[7] = 44,
		[8] = 44,
		[9] = 45,
		[10] = 45
	    }
	},

	{
	    type = "attack",
	    name = "range",
	    [1] = 21,
	    [2] = 22,
	    [3] = 23,
	    [4] = 23,
	    [5] = 24,
	    [6] = 26,
	    [7] = 26,
	    [8] = 28,
	    [9] = 30,
	    [10] = 32
	},

	{
	    type = "attack",
	    name = "radius",
	    [1] = 1.5,
	    [2] = 1.6,
	    [3] = 1.7,
	    [4] = 1.8,
	    [5] = 1.9,
	    [6] = 2.0,
	    [7] = 2.2,
	    [8] = 2.3,
	    [9] = 2.5,
	    [10] = 3.0
	},

	{
	    type = "attack",
	    name = "particleVerticalAcceleration",
	    [1] = 0.01,
	    [2] = 0.01,
	    [3] = 0.02,
	    [4] = 0.02,
	    [5] = 0.03,
	    [6] = 0.03,
	    [7] = 0.04,
	    [8] = 0.04,
	    [9] = 0.05,
	    [10] = 0.05
	},

	{	      
	    type = "attack",
	    name = "particleHoizontalSpeed",
	    [1] = 0.6,
	    [2] = 0.6,
	    [3] = 0.7,
	    [4] = 0.7,
	    [5] = 0.8,
	    [6] = 0.8,
	    [7] = 0.9,
	    [8] = 0.9,
	    [9] = 1,
	    [10] = 1
	},

	{	    
	    type = "attack",
	    name = "particleHoizontalSpeedDeviation",
	    [1] = 0.0025,
	    [2] = 0.0025,
	    [3] = 0.0024,
	    [4] = 0.0024,
	    [5] = 0.0023,
	    [6] = 0.0023,
	    [7] = 0.0022,
	    [8] = 0.0022,
	    [9] = 0.0021,
	    [10] = 0.0021
	}
    },

    function (attributes)
	makeSticker(attributes)
	return createStreamAttack(attributes, createAttackBall(attributes))
    end,

    SUICIDE_WORM_VARIATIONS,
    SUICIDE_WORM_TIERS
)