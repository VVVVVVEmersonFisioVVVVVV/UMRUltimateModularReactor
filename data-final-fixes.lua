local function config(name)
    return settings.startup[name].value
end

--=============================================
--UMR techs
--============================================= 
local umr_techs = {
  { name = "umr_tech",          count = 640000 },
  { name = "umr_tech_machine",  count = 6400000 },
  { name = "umr_tech_military", count = 6400000 }
}
--=============================================
--make UMR expensive mode
--=============================================
if settings.startup["umr_expensive_tech_mode"] and settings.startup["umr_expensive_tech_mode"].value then
  for _, entry in pairs(umr_techs) do
    local tech = data.raw.technology[entry.name]
    if tech and tech.unit then
      tech.unit.count = entry.count
    end
  end
end
--============================================================================================================================================================
--make UMR fuel recipes
--============================================================================================================================================================
-- =============================================
-- EXCLUDED FUELS CONFIGURATION
-- =============================================
-- player you can add bad fuels that are crashing here
-- fluids in the first local solids in the second local
-- umr already have its own fuels excluded 
-- those -- two dashes disable a line so put the crash fuel over the examples and remove the dashs 
-- the lines need a comma in the end
-- if it still dont work wait for a umr update or look your mods
-- if it work you need to do all this again in every umr update or tell me and i add here to the global version

local excluded_fluids = {
    ["umr_amplifier_fluid"] = true,
    ["umr_core_fluid"] = true,
    ["umr_interface_fluid"] = true,
    ["umr_output_fluid"] = true
}

local excluded_solids = {
    -- ["wood"] = true,
    -- ["coal"] = true,
    -- ["crazymod_infinitefuel"] = true,
    -- ["leet-sunbiofuel"] = true
}
-- =============================================
-- EXCLUDED FUELS CONFIGURATION END
-- =============================================

-- Check if the string is a valid energy string 
local function is_valid_energy_string(energy_str)
    return type(energy_str) == "string" and string.match(energy_str, "^%s*%d+[%.,]?%d*%s*[kMGT]?J%s*$")
end

-- Identify common fuel containers
local function is_container_item(item_name)
    if string.find(item_name, "barrel") or 
       string.find(item_name, "canister") or
       string.find(item_name, "tank") or
       string.find(item_name, "bottle") then
        return true
    end

    local item = data.raw.item[item_name]
    if not item then return false end

    if item.place_as_tile or item.place_as_equipment_result then return true end

    if item.place_result and 
       (string.find(item.place_result, "barrel") or
        string.find(item.place_result, "canister")) then
        return true
    end

    return false
end

-- Validate solid fuel properties
local function is_valid_solid_fuel(item)
    return item.fuel_value and is_valid_energy_string(item.fuel_value)
        and item.fuel_category and item.fuel_category ~= ""
        and (not item.burnt_result or item.burnt_result ~= "")
        and not item.hidden  -- Exclude hidden solid fuels
end

-- Validate fluid fuel properties
local function is_valid_fluid_fuel(fluid)
    return fluid.fuel_value and is_valid_energy_string(fluid.fuel_value)
        and not fluid.hidden  -- Exclude hidden fluid fuels
end

-- REGISTER FLUID FUELS
for name, fluid in pairs(data.raw.fluid) do
    if type(name) == "string" and name ~= "" 
       and not excluded_fluids[name]
       and not string.find(name, "barrel") then

        if is_valid_fluid_fuel(fluid) then
            local success = umrlib.interface_fluid_recipe(name)
            if success then
                log("[UMR] Registered fluid fuel: " .. name)
            else
                log("[UMR] Failed to register fluid fuel: " .. name)
            end
        else
            log("[UMR] Skipped invalid fluid fuel (missing/invalid fuel_value or hidden): " .. name)
        end
    end
end

-- REGISTER SOLID FUELS
for name, item in pairs(data.raw.item) do
    if type(name) == "string" and name ~= "" and item.fuel_value then
        if not excluded_solids[name] and not is_container_item(name) then
            if is_valid_solid_fuel(item) then
                local success = umrlib.interface_solid_recipe(name)
                if success then
                    log("[UMR] Registered solid fuel: " .. name)
                else
                    log("[UMR] Failed to register solid fuel: " .. name)
                end
            else
                log("[UMR] Skipped invalid solid fuel (invalid fuel_value, category, burnt_result, or hidden): " .. name)
            end
        else
            log("[UMR] Skipped excluded or container item: " .. name)
        end
    end
end
--============================================================================================================================================================
--all imputs for lab
--============================================================================================================================================================
local inputs = {}
for _, lab in pairs(data.raw.lab) do
    for _, input in pairs(lab.inputs) do
        inputs[input] = true
    end
end

local umrlab = data.raw.lab["umr_lab_entity"]
local umrlab2 = data.raw.lab["umr_lab_entity_2"]

local c = 0
for input in pairs(inputs) do
    c = c + 1
    umrlab.inputs[c] = input
    umrlab2.inputs[c] = input
end
--============================================================================================================================================================
--all recipes for heavy manufacturing facility except ultimate gimmick lol
--============================================================================================================================================================
if config("umr_modded_crafting_recipes") then
  local excluded_categories = {
    ["umr_converter_category"] = true,
    ["umr_amplifier_category"] = true,
    ["umr_core_category"] = true,
    ["umr_interface_basic_category"] = true,
    ["umr_output_category"] = true,
    ["tur_converter_category"] = true,
  }

  -- UFP if present
  if mods["ufpFixed"] then
    local ufp_categories = {
      "ufp_electric_boiler_category",
      "ufp_electrolyser_category",
      "ufp_gas_mixer_category",
      "ufp_deuterium_extractor_category",
      "ufp_plasma_heater_entity",
      "ufp_neutronic_reactor_entity",
      "ufp_aneutronic_reactor_entity",
      "ufp_black_hole_category",
      "ufp_white_hole_category",
    }
    for _, cat in ipairs(ufp_categories) do
      excluded_categories[cat] = true
    end
  end

  local allowed_categories = {}

  -- Add only non-excluded categories
  for name, _ in pairs(data.raw["recipe-category"]) do
    if not excluded_categories[name] then
      table.insert(allowed_categories, name)
    end
  end

  -- Apply the allowed list
  data.raw["assembling-machine"]["umr_crafting_entity_2"]["crafting_categories"] = allowed_categories
end
--============================================================================================================================================================
--make blah blah for space age
--============================================================================================================================================================
if mods["space-age"] then

-- aquillo freeze and item weight
local umr_entities = {
    -- Crafting machines
    "umr_crafting_entity",
    "umr_crafting_entity_2",
    "umr_furnace_entity",
    "umr_furnace_entity_2",
    "umr_core_entity",
    "umr_interface_entity",
    "umr_output_entity",
    "umr_reactorpipe_entity",
    "umr_oilrefinery_entity",
    "umr_chemicalplant_entity",
    "umr_heavyforge_entity",
    "umr_converter_entity",
    "umr_converter_entity_2",
    "umr_converter_heat_entity",
    "umr_converter_heat_2_entity",
    "umr_amplifier_entity",
    "umr_lab_entity",
    "umr_lab_entity_2",
    "umr_roboport_entity",
    
    -- Turrets
    "umr_autocannon-turret_entity",
    "umr_autocannon-turret45_entity",
    "umr_heavylaser-turret_entity",
    "umr_heavylaser-turret45_entity",
    "umr_cannon-turret_entity",
    "umr_cannon-turret45_entity",
    "umr_rocket-turret_entity",
    "umr_rocket-turret45_entity",
    "umr_flamer-turret_entity",
    "umr_flamer-turret45_entity",
    "umr_plasma-turret_entity",
    "umr_plasma-turret45_entity"
}

-- entity types
local known_entity_types = {
    "assembling-machine",
    "furnace",
    "reactor",
    "lab",
    "offshore-pump",
    "mining-drill",
    "boiler",
    "generator",
    "chemical-plant",
    "roboport",
    "ammo-turret",
    "electric-turret",
    "fluid-turret"
}

-- Apply heating energy to all UMR entities
for _, entity_name in pairs(umr_entities) do
    local applied = false
    for _, entity_type in pairs(known_entity_types) do
        local proto = data.raw[entity_type] and data.raw[entity_type][entity_name]
        if proto then
            -- Safe modification with pcall to prevent crashes
            local success, err = pcall(function()
                proto.heating_energy = "300kW"
            end)
            
            if success then
                log("[UMR] Applied heating_energy to " .. entity_name .. " (" .. entity_type .. ")")
                applied = true
                break
            else
                log("[UMR] ERROR applying heating_energy to " .. entity_name .. ": " .. err)
            end
        end
    end
    
    if not applied then
        log("[UMR] WARNING: Failed to apply heating_energy to " .. entity_name .. " - entity type not found")
    end
end

-- Set item weight for all machines and turrets
local umr_weight = 50000
for _, entity_name in pairs(umr_entities) do
    -- Convert entity name to item name if needed
    local item_name = entity_name
    
    -- Safe item modification with pcall
    local success, err = pcall(function()
        if data.raw.item[item_name] then
            data.raw.item[item_name].weight = umr_weight
            log("[UMR] Set weight for " .. item_name)
        else
            log("[UMR] WARNING: Item not found for " .. item_name)
        end
    end)
    
    if not success then
        log("[UMR] ERROR processing item weight for " .. item_name .. ": " .. err)
    end
end

-- Additional turret-specific adjustments if needed
local turret_prototypes = {
    "ammo-turret",
    "electric-turret",
    "fluid-turret"
}

for _, turret_type in pairs(turret_prototypes) do
    if data.raw[turret_type] then
        for name, proto in pairs(data.raw[turret_type]) do
            if name:find("^umr_") then
                -- Safe turret modifications
                local success, err = pcall(function()
                    -- Apply any turret-specific modifications here
                    -- Example: proto.attack_parameters = ...
                    log("[UMR] Processed turret prototype: " .. name)
                end)
                
                if not success then
                    log("[UMR] ERROR processing turret " .. name .. ": " .. err)
                end
            end
        end
    end
end

  --some space age recipes for exotic asssembling machine and exotic heavy stamping press facility

  table.insert(data.raw["assembling-machine"]["umr_crafting_entity"].crafting_categories,"electronics")
  table.insert(data.raw["assembling-machine"]["umr_furnace_entity_2"].crafting_categories,"electronics")
  table.insert(data.raw["assembling-machine"]["umr_crafting_entity_2"].crafting_categories,"electronics")

  table.insert(data.raw["assembling-machine"]["umr_crafting_entity"].crafting_categories,"electronics-with-fluid")
  table.insert(data.raw["assembling-machine"]["umr_furnace_entity_2"].crafting_categories,"electronics-with-fluid")
  table.insert(data.raw["assembling-machine"]["umr_crafting_entity_2"].crafting_categories,"electronics-with-fluid")

  table.insert(data.raw["assembling-machine"]["umr_crafting_entity"].crafting_categories,"electronics-or-assembling")
  table.insert(data.raw["assembling-machine"]["umr_furnace_entity_2"].crafting_categories,"electronics-or-assembling")
  table.insert(data.raw["assembling-machine"]["umr_crafting_entity_2"].crafting_categories,"electronics-or-assembling")

  table.insert(data.raw["assembling-machine"]["umr_furnace_entity_2"].crafting_categories,"metallurgy")
  table.insert(data.raw["assembling-machine"]["umr_crafting_entity_2"].crafting_categories,"metallurgy")

  table.insert(data.raw["assembling-machine"]["umr_furnace_entity_2"].crafting_categories,"pressing")
  table.insert(data.raw["assembling-machine"]["umr_crafting_entity_2"].crafting_categories,"pressing")

  table.insert(data.raw["assembling-machine"]["umr_furnace_entity_2"].crafting_categories,"crafting-with-fluid-or-metallurgy")
  table.insert(data.raw["assembling-machine"]["umr_crafting_entity_2"].crafting_categories,"crafting-with-fluid-or-metallurgy")

  table.insert(data.raw["assembling-machine"]["umr_furnace_entity_2"].crafting_categories,"metallurgy-or-assembling")
  table.insert(data.raw["assembling-machine"]["umr_crafting_entity_2"].crafting_categories,"metallurgy-or-assembling")

  --table.insert(data.raw["assembling-machine"]["umr_furnace_entity_2"].crafting_categories,"organic")
  table.insert(data.raw["assembling-machine"]["umr_crafting_entity_2"].crafting_categories,"organic")

  --table.insert(data.raw["assembling-machine"]["umr_furnace_entity_2"].crafting_categories,"organic-or-hand-crafting")
  table.insert(data.raw["assembling-machine"]["umr_crafting_entity_2"].crafting_categories,"organic-or-hand-crafting")

  --table.insert(data.raw["assembling-machine"]["umr_furnace_entity_2"].crafting_categories,"organic-or-assembling")
  table.insert(data.raw["assembling-machine"]["umr_crafting_entity_2"].crafting_categories,"organic-or-assembling")

  --table.insert(data.raw["assembling-machine"]["umr_furnace_entity_2"].crafting_categories,"organic-or-chemistry")
  table.insert(data.raw["assembling-machine"]["umr_crafting_entity_2"].crafting_categories,"organic-or-chemistry")

  --table.insert(data.raw["assembling-machine"]["umr_furnace_entity_2"].crafting_categories,"electromagnetics")
  table.insert(data.raw["assembling-machine"]["umr_crafting_entity_2"].crafting_categories,"electromagnetics")

  --table.insert(data.raw["assembling-machine"]["umr_furnace_entity_2"].crafting_categories,"cryogenics")
  table.insert(data.raw["assembling-machine"]["umr_crafting_entity_2"].crafting_categories,"cryogenics")

  --table.insert(data.raw["assembling-machine"]["umr_furnace_entity_2"].crafting_categories,"chemistry-or-cryogenics")
  table.insert(data.raw["assembling-machine"]["umr_crafting_entity_2"].crafting_categories,"chemistry-or-cryogenics")

  --table.insert(data.raw["assembling-machine"]["umr_furnace_entity_2"].crafting_categories,"cryogenics-or-assembling")
  table.insert(data.raw["assembling-machine"]["umr_crafting_entity_2"].crafting_categories,"cryogenics-or-assembling")

  --space age tech cost
  local function add_science_pack_if_enabled(setting, pack, techs)
    if settings.startup[setting] and settings.startup[setting].value then
      for _, entry in pairs(techs) do
        local tech = data.raw.technology[entry.name]
        if tech and tech.unit and tech.unit.ingredients then
          table.insert(tech.unit.ingredients, { pack, 1 })
        end
      end
    end
  end

  -- Apply science packs based on startup settings
  add_science_pack_if_enabled("umr_metallurgic_science_pack",     "metallurgic-science-pack",       umr_techs)
  add_science_pack_if_enabled("umr_electromagnetic_science_pack", "electromagnetic-science-pack",   umr_techs)
  add_science_pack_if_enabled("umr_agricultural_science_pack",    "agricultural-science-pack",      umr_techs)
  add_science_pack_if_enabled("umr_cryogenic_science_pack",       "cryogenic-science-pack",         umr_techs)

end
--============================================================================================================================================================
--make mods recipes
--============================================================================================================================================================
if config("umr_modded_recipes") then

    if mods["248k"] then
        if data.raw.item["gr_materials_fusion_cell_item"] then
            table.insert(data.raw.recipe["umr_interface_entity"].ingredients, {
                type = "item",
                name = "gr_materials_fusion_cell_item",
                amount = 5
            })
        else
            log("[UMR] Warning: 'gr_materials_fusion_cell_item' item not found, cannot add to recipe 'umr_interface_recipe'")
        end
    end

    if mods["Krastorio2"] then
        if data.raw.item["kr-energy-control-unit"] then
            table.insert(data.raw.recipe["umr_interface_entity"].ingredients, {
                type = "item",
                name = "kr-energy-control-unit",
                amount = 40
            })
        else
            log("[UMR] Warning: 'kr-energy-control-unit' item not found, cannot add to recipe 'umr_interface_recipe'")
        end
    end

    if mods["RealisticFusionPower"] then
        if data.raw.item["rfp-aneutronic-reactor"] then
            table.insert(data.raw.recipe["umr_interface_entity"].ingredients, {
                type = "item",
                name = "rfp-aneutronic-reactor",
                amount = 1
            })
        else
            log("[UMR] Warning: 'rfp-aneutronic-reactor' item not found, cannot add to recipe 'umr_interface_recipe'")
        end
    end

end

--============================================================================================================================================================
--make blah blah for turrets
--============================================================================================================================================================
-- cannon shells will ignore your force and now hit asteroids
for _, name in pairs({
  "cannon-projectile",
  "uranium-cannon-projectile",
  "explosive-cannon-projectile",
  "explosive-uranium-cannon-projectile"
}) do
  local proj = data.raw.projectile[name]
  if proj then
    -- Ensure it hits asteroids and entities
    proj.force_condition = "not-same"
    proj.flags = nil
    proj.hit_collision_mask = {
      layers = {
        object = true,
        player = true,
        trigger_target = true,
        train = true
      }
    }
  else
    log("UMR Warning: projectile '" .. name .. "' not found in data.raw.projectile.")
  end
end

local function override_max_range(ammo_name, new_range)
  local ammo = data.raw.ammo[ammo_name]
  if not ammo then return end

  local action = ammo.ammo_type and ammo.ammo_type.action
  local delivery = action and action.action_delivery

  if delivery and delivery.max_range then
    delivery.max_range = new_range
  end
end

-- more range for cannon shells
override_max_range("cannon-shell", 70)
override_max_range("explosive-cannon-shell", 70)
override_max_range("uranium-cannon-shell", 70)
override_max_range("explosive-uranium-shell", 70)