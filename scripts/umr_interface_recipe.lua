-- =============================================
-- INTERFACE FUEL CONFIGURATION 
-- =============================================
local CONFIG = {
    fluid_per_mj = 0.00125,     -- 1 fluid per 800MJ
    min_input_amount = 1,
    base_energy_cost = 10,
    burnt_result_ratio = 1,
    fluid_input_multiplier = 1,
    max_input_amount = 65000
}

local ENERGY_UNITS = {
    J  = 0.000001,
    KJ = 0.001,
    MJ = 1,
    GJ = 1000,
    TJ = 1e6,
    PJ = 1e9,
    EJ = 1e12,
    ZJ = 1e15
}

-- Base template with ALL required fields
local INTERFACE_BASE = {
    type = "recipe",
    enabled = false,
    category = "umr_interface_basic_category",
    main_product = "umr_interface_fluid",
    subgroup = "umr_item_subgroup_m",
    icons = {{icon = "__ultimateCore__/graphics/umr_interface/umr_interface_fluid.png", icon_size = 64}},
    energy_required = CONFIG.base_energy_cost
}

-- =============================================
-- CRASH-PROOF FUEL FUNCTIONS
-- =============================================

-- Sanitize names to avoid invalid textualID crashes
local function make_safe_name(name)
    local sanitized = tostring(name):gsub("[^%w_%-]", "_")
    if sanitized == "" or sanitized == "_" then
        return nil
    end
    return sanitized
end

-- Solid
function umrlib.FueltoMJ(fuel_value)
    if not fuel_value then return 1 end
    local num, unit = tostring(fuel_value):match("^(%d+%.?%d*)(%a*)")
    return (tonumber(num) or 1) * (ENERGY_UNITS[unit:upper()] or 1)
end

function umrlib.interface_solid_recipe(item)
    -- Validation with error logging
    if not item or type(item) ~= "string" or item:match("^%s*$") then
        log("UMR ERROR: Invalid or empty item name")
        return nil
    end
    if not data.raw.item[item] then
        log("UMR ERROR: Missing item "..tostring(item))
        return nil
    end

    local item_data = data.raw.item[item]
    if not item_data.fuel_value then
        log("UMR ERROR: Item "..item.." has no fuel_value")
        return nil
    end

    -- Calculation
    local fuel_mj = umrlib.FueltoMJ(item_data.fuel_value)

    -- Protection for weak fuels
    local estimated_input = 1 / (fuel_mj * CONFIG.fluid_per_mj)
    if fuel_mj <= 0 or estimated_input > CONFIG.max_input_amount then
        log("UMR SKIP: "..item.." has too low fuel_value ("..item_data.fuel_value..") to create a safe recipe.")
        return nil
    end

    local input_amount = math.max(CONFIG.min_input_amount, math.ceil(estimated_input))
    input_amount = math.min(input_amount, CONFIG.max_input_amount)
    local fluid_output = math.max(1, math.floor(fuel_mj * input_amount * CONFIG.fluid_per_mj))

    -- Safe name
    local safe_name = make_safe_name(item)
    if not safe_name then
        log("UMR ERROR: Generated invalid recipe name for item "..tostring(item))
        return nil
    end

    -- Recipe construction
    local recipe = {
        type = "recipe",
        name = "umr_interface_"..safe_name.."_recipe",
        enabled = false,
        category = "umr_interface_basic_category",
        ingredients = {{type = "item", name = item, amount = input_amount}},
        results = {
            {type = "fluid", name = "umr_interface_fluid", amount = fluid_output}
        },
        energy_required = CONFIG.base_energy_cost,
        subgroup = "umr_item_subgroup_n",
        icons = {{icon = "__ultimateCore__/graphics/umr_interface/umr_interface_fluid.png", icon_size = 64}}
    }

    -- Optional burnt result
    if item_data.burnt_result then
        table.insert(recipe.results, {
            type = "item",
            name = item_data.burnt_result,
            amount = math.max(1, math.floor(input_amount * CONFIG.burnt_result_ratio))
        })
    end

    -- Safe registration
    if not recipe.name or recipe.name == "" then
        log("UMR ERROR: Attempted to register recipe with invalid name for item "..item)
        return nil
    end

    data:extend({recipe})
    if data.raw.technology["umr_tech"] then
        table.insert(data.raw.technology["umr_tech"].effects, {
            type = "unlock-recipe",
            recipe = recipe.name
        })
    end

    return recipe.name
end

-- Fluid
function umrlib.interface_fluid_recipe(fluid)
    -- Validation with error logging
    if not fluid or type(fluid) ~= "string" or fluid:match("^%s*$") then
        log("UMR ERROR: Invalid or empty fluid name")
        return nil
    end
    if not data.raw.fluid[fluid] then
        log("UMR ERROR: Missing fluid "..tostring(fluid))
        return nil
    end

    local fluid_data = data.raw.fluid[fluid]
    if not fluid_data.fuel_value then
        log("UMR ERROR: Fluid "..fluid.." has no fuel_value")
        return nil
    end

    -- Calculation
    local fuel_mj = umrlib.FueltoMJ(fluid_data.fuel_value)

    -- Protection for weak fuels
    local estimated_input = CONFIG.fluid_input_multiplier / (fuel_mj * CONFIG.fluid_per_mj)
    if fuel_mj <= 0 or estimated_input > CONFIG.max_input_amount then
        log("UMR SKIP: "..fluid.." has too low fuel_value ("..fluid_data.fuel_value..") to create a safe recipe.")
        return nil
    end

    local input_amount = math.max(CONFIG.min_input_amount, math.ceil(estimated_input))
    input_amount = math.min(input_amount, CONFIG.max_input_amount)
    local fluid_output = math.max(1, math.floor(fuel_mj * input_amount * CONFIG.fluid_per_mj))

    -- Safe name
    local safe_name = make_safe_name(fluid)
    if not safe_name then
        log("UMR ERROR: Generated invalid recipe name for fluid "..tostring(fluid))
        return nil
    end

    -- Recipe construction
    local recipe = {
        type = "recipe",
        name = "umr_interface_"..safe_name.."_recipe",
        enabled = false,
        category = "umr_interface_basic_category",
        ingredients = {{type = "fluid", name = fluid, amount = input_amount}},
        results = {
            {type = "fluid", name = "umr_interface_fluid", amount = fluid_output}
        },
        energy_required = math.max(2, CONFIG.base_energy_cost * (input_amount / 100)),
        subgroup = "umr_item_subgroup_n",
        icons = {{icon = "__ultimateCore__/graphics/umr_interface/umr_interface_fluid.png", icon_size = 64}}
    }

    if not recipe.name or recipe.name == "" then
        log("UMR ERROR: Attempted to register recipe with invalid name for fluid "..fluid)
        return nil
    end

    -- Safe registration
    data:extend({recipe})
    if data.raw.technology["umr_tech"] then
        table.insert(data.raw.technology["umr_tech"].effects, {
            type = "unlock-recipe",
            recipe = recipe.name
        })
    end

    return recipe.name
end