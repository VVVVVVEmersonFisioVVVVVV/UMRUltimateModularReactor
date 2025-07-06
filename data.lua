--============================================================================================================================================================
--prototypes
--============================================================================================================================================================
require('prototypes/umr_animation')
require('prototypes/umr_projectiles')
require('prototypes/umr_beams')
require('prototypes/umr_recipe')
require('prototypes/umr_core')
require('prototypes/umr_output')
require('prototypes/umr_interface')
require('prototypes/umr_amplifier')
require('prototypes/umr_converter')
require('prototypes/umr_furnace')
require('prototypes/umr_heavyforge')
require('prototypes/umr_crafting')
require('prototypes/umr_tech')
require('prototypes/umr_fluid')
require('prototypes/umr_reactorpipe')
require('prototypes/umr_item_group')
require('prototypes/umr_recipe_category')
require('prototypes/umr_oilrefinery')
require('prototypes/umr_chemicalplant')
require('prototypes/umr_lab')
require('prototypes/umr_robot')
require('prototypes/umr_turret')

--SE
-- if mods["space-exploration"] then
--     require('scripts/SE/data')
--end

--============================================================================================================================================================
--global functions
--============================================================================================================================================================
if not umrlib then 
    umrlib = {}
end
require("scripts/umr_interface_recipe")