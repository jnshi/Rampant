local vanillaUpdates = require("prototypes/enemies/UpdatesVanilla")
local bobsUpdates = require("prototypes/enemies/UpdatesBobs")
local NEUpdates = require("prototypes/enemies/UpdatesNE")

local function bobsDetected()
    return data.raw["turret"]["bob-big-explosive-worm-turret"] ~= nil
end

local function NEDetected()
    return data.raw["unit"]["medium-spitter-Mk3"] ~= nil
end

if settings.startup["rampant-useDumbProjectiles"].value then
    vanillaUpdates.useDumbProjectiles()
    if bobsDetected() then
    	require("prototypes/enemies/AttackBobs")
    	bobsUpdates.useDumbProjectiles()
    end
    if NEDetected() then
    	require("prototypes/enemies/AttackNE")
    	NEUpdates.useDumbProjectiles()
    	if settings.startup["rampant-useNEUnitLaunchers"].value then
    	    NEUpdates.useNEUnitLaunchers()
    	end
    end
end



