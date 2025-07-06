local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")

local function sprite(name)
    return '__ultimateCore__/graphics/umr_converter/umr_converter_'..name
end

data:extend({
    {
        name = 'umr_converter_entity',
        type = 'item',
        icons = {{icon = "__ultimateCore__/graphics/umr_converter/umr_converter_icon1.png", icon_size = 64}},
        place_result = 'umr_converter_entity',
        stack_size = 20,
        subgroup = 'umr_item_subgroup_e',
        order = 'a-a',
        inventory_move_sound = item_sounds.reactor_inventory_move,
        pick_sound = item_sounds.reactor_inventory_pickup,
        drop_sound = item_sounds.reactor_inventory_move,
    },
    {
        name = 'umr_converter_entity',
        type = 'recipe',
        enabled = false,
        ingredients = {
            {type="item", name="copper-plate", amount=500},
            {type="item", name="steel-plate", amount=500},
            {type="item", name="advanced-circuit", amount=500},
            {type="item", name="concrete", amount=500},
            {type="item", name="accumulator", amount=500},
            {type="item", name="nuclear-reactor", amount=15},
        },
        results = {
            {type="item", name="umr_converter_entity", amount=1},
        },
        energy_required = 10,
    },
    {
        name = 'umr_converter_entity',
        type = 'generator',
        icon = sprite('icon1.png'),
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        max_health = 5250,
        corpse = "nuclear-reactor-remnants",
        dying_explosion = "nuclear-reactor-explosion",
        open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.65 },
        close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.65 },
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        damaged_trigger_effect = hit_effects.entity(),
        impact_category = "metal-large",
        collision_box = {{-1.9,-1.9},{1.9,1.9}},
        selection_box = {{-1.9,-1.9},{1.9,1.9}},
        map_color = {r=0.7, g=0.2, b=0.7, a=1},
        minable = {
            mining_time = 5,
            result = 'umr_converter_entity',
        },
        resistances =
        {
            {
            type = "fire",
            percent = 90
            },
            {
            type = "explosion",
            percent = 30
            },
            {
            type = "impact",
            percent = 30
            }
        },
        --energy
        burns_fluid = false,
        scale_fluid_usage = true,
        maximum_temperature = 6500,
        fluid_usage_per_tick = 0.4,
        max_power_output = '17.088GW',
        effectivity = 0.89,
        fluid_box = {
            volume = 1000,
            pipe_picture = assembler2pipepictures(),
            pipe_covers = pipecoverspictures(),
            pipe_connections =
            {
                {flow_direction = "input", direction = defines.direction.north, position = {-0.5, -1.5}},
                {flow_direction = "input", direction = defines.direction.north, position = {0.5, -1.5}}
            },
            production_type = "input",
            filter = 'umr_output_fluid',
            minimum_temperature = 100,
            maximum_temperature = 6500,
        },
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-output',
        },
        --animation
        vertical_animation = 
        {
          layers =
          {
            {
              filename = sprite('hr_shadow.png'),
              size = {600, 400},
              scale = 0.7,
              line_length = 1,
              frame_count = 1,
              repeat_count = 60,
              animation_speed = 1,
              draw_as_shadow = true,
              shift = {0,0}
            },
            {
              filename = sprite('animation1.png'),
              size = {200, 290},
              scale = 0.7,
              line_length = 8,
              lines_per_file = 8,
              frame_count = 60,
              animation_speed = 1,
              shift = {0,0}
            },
            {
              filename = sprite('emission1.png'),
              size = {200, 290},
              scale = 0.7,
              line_length = 8,
              lines_per_file = 8,
              frame_count = 60,
              animation_speed = 1,
              blend_mode = "additive",
              shift = {0,0}
            },
          },
        },
        horizontal_animation =
        {
          layers =
          {
            {
              filename = sprite('hr_shadow.png'),
              size = {600, 400},
              scale = 0.7,
              line_length = 1,
              lines_per_file = 1,
              frame_count = 1,
              repeat_count = 60,
              animation_speed = 1,
              draw_as_shadow = true,
              shift = {0,0}
            },
            {
              filename = sprite('animation1.png'),
              size = {200, 290},
              scale = 0.7,
              line_length = 8,
              lines_per_file = 8,
              frame_count = 60,
              animation_speed = 1,
              shift = {0,0}
            },
            {
              filename = sprite('emission1.png'),
              size = {200, 290},
              scale = 0.7,
              line_length = 8,
              lines_per_file = 8,
              frame_count = 60,
              animation_speed = 1,
              blend_mode = "additive",
              shift = {0,0}
            },
          },
        },
        working_sound = { 
            sound = { filename = '__base__/sound/nuclear-reactor-1.ogg'},
            idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
            apparent_volume = 0.7,
        },
    },
    {
        name = 'umr_converter_entity_2',
        type = 'item',
        icons = {{icon = "__ultimateCore__/graphics/umr_converter/umr_converter_icon2.png", icon_size = 64}},
        place_result = 'umr_converter_entity_2',
        stack_size = 20,
        subgroup = 'umr_item_subgroup_e',
        order = 'a-b',
        inventory_move_sound = item_sounds.reactor_inventory_move,
        pick_sound = item_sounds.reactor_inventory_pickup,
        drop_sound = item_sounds.reactor_inventory_move,
    },
    {
        name = 'umr_converter_entity_2',
        type = 'recipe',
        enabled = false,
        ingredients = {
            {type="item", name="copper-plate", amount=500},
            {type="item", name="steel-plate", amount=500},
            {type="item", name="advanced-circuit", amount=500},
            {type="item", name="concrete", amount=500},
            {type="item", name="accumulator", amount=500},
            {type="item", name="nuclear-reactor", amount=15},
        },
        results = {
            {type="item", name="umr_converter_entity_2", amount=1},
        },
        energy_required = 10,
    },
    {
        name = 'umr_converter_entity_2',
        type = 'generator',
        icon = sprite('icon2.png'),
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        max_health = 5250,
        corpse = "nuclear-reactor-remnants",
        dying_explosion = "nuclear-reactor-explosion",
        open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.65 },
        close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.65 },
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        damaged_trigger_effect = hit_effects.entity(),
        impact_category = "metal-large",
        collision_box = {{-1.9,-1.9},{1.9,1.9}},
        selection_box = {{-1.9,-1.9},{1.9,1.9}},
        map_color = {r=0.7, g=0.2, b=0.7, a=1},
        minable = {
            mining_time = 5,
            result = 'umr_converter_entity_2',
        },
        resistances =
        {
            {
            type = "fire",
            percent = 90
            },
            {
            type = "explosion",
            percent = 30
            },
            {
            type = "impact",
            percent = 30
            }
        },
        --energy
        burns_fluid = false,
        scale_fluid_usage = true,
        maximum_temperature = 6500,
        fluid_usage_per_tick = 0.4,
        max_power_output = '17.088GW',
        effectivity = 0.89,
        fluid_box = {
            volume = 1000,
            pipe_picture = assembler2pipepictures(),
            pipe_covers = pipecoverspictures(),
            pipe_connections =
            {
                {flow_direction = "input", direction = defines.direction.south, position = {-0.5, 1.5}},
                {flow_direction = "input", direction = defines.direction.south, position = {0.5, 1.5}}
            },
            production_type = "input",
            filter = 'umr_output_fluid',
            minimum_temperature = 100,
            maximum_temperature = 6500,
        },
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-output',
        },
        --animation
        vertical_animation = 
        {
          layers =
          {
            {
              filename = sprite('hr_shadow.png'),
              size = {600, 400},
              scale = 0.7,
              line_length = 1,
              frame_count = 1,
              repeat_count = 60,
              animation_speed = 1,
              draw_as_shadow = true,
              shift = {0,0}
            },
            {
              filename = sprite('animation1.png'),
              size = {200, 290},
              scale = 0.7,
              line_length = 8,
              lines_per_file = 8,
              frame_count = 60,
              animation_speed = 1,
              shift = {0,0}
            },
            {
              filename = sprite('emission1.png'),
              size = {200, 290},
              scale = 0.7,
              line_length = 8,
              lines_per_file = 8,
              frame_count = 60,
              animation_speed = 1,
              blend_mode = "additive",
              shift = {0,0}
            },
          },
        },
        horizontal_animation =
        {
          layers =
          {
            {
              filename = sprite('hr_shadow.png'),
              size = {600, 400},
              scale = 0.7,
              line_length = 1,
              lines_per_file = 1,
              frame_count = 1,
              repeat_count = 60,
              animation_speed = 1,
              draw_as_shadow = true,
              shift = {0,0}
            },
            {
              filename = sprite('animation1.png'),
              size = {200, 290},
              scale = 0.7,
              line_length = 8,
              lines_per_file = 8,
              frame_count = 60,
              animation_speed = 1,
              shift = {0,0}
            },
            {
              filename = sprite('emission1.png'),
              size = {200, 290},
              scale = 0.7,
              line_length = 8,
              lines_per_file = 8,
              frame_count = 60,
              animation_speed = 1,
              blend_mode = "additive",
              shift = {0,0}
            },
          },
        },
        working_sound = { 
            sound = { filename = '__base__/sound/nuclear-reactor-1.ogg'},
            idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
            apparent_volume = 0.7,
        },
    },
    
    --heat variant
    {
        name = 'umr_converter_heat_entity',
        type = 'item',
        icons = {{icon = "__ultimateCore__/graphics/umr_converter/umr_converter_icon1.png", icon_size = 64}},
        place_result = 'umr_converter_heat_entity',
        stack_size = 20,
        subgroup = 'umr_item_subgroup_e',
        order = 'a-c',
        inventory_move_sound = item_sounds.reactor_inventory_move,
        pick_sound = item_sounds.reactor_inventory_pickup,
        drop_sound = item_sounds.reactor_inventory_move,
    },
    {
        name = 'umr_converter_heat_entity',
        type = 'recipe',
        enabled = false,
        ingredients = {
            {type="item", name="copper-plate", amount=500},
            {type="item", name="steel-plate", amount=500},
            {type="item", name="advanced-circuit", amount=500},
            {type="item", name="concrete", amount=500},
            {type="item", name="accumulator", amount=500},
            {type="item", name="nuclear-reactor", amount=15},
        },
        results = {
            {type="item", name="umr_converter_heat_entity", amount=1},
        },
        energy_required = 10,
    },
    {
        name = 'umr_converter_heat_entity',
        type = 'reactor',
        icon = sprite('icon1.png'),
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        max_health = 5250,
        corpse = "nuclear-reactor-remnants",
        dying_explosion = "nuclear-reactor-explosion",
        open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.65 },
        close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.65 },
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        damaged_trigger_effect = hit_effects.entity(),
        impact_category = "metal-large",
        collision_box = {{-1.9,-1.9},{1.9,1.9}},
        selection_box = {{-1.9,-1.9},{1.9,1.9}},
        map_color = {r=0.7, g=0.2, b=0.7, a=1},
        minable = {
            mining_time = 5,
            result = 'umr_converter_heat_entity',
        },
        resistances =
        {
            {
            type = "fire",
            percent = 90
            },
            {
            type = "explosion",
            percent = 30
            },
            {
            type = "impact",
            percent = 30
            }
        },
        --energy
        consumption = "1.872GW",
        energy_source = {
            type = "fluid",
            fluid_box = {
                volume = 1000,
                light_flicker =
                {
                   color = {1,0,1},
                   minimum_intensity = 0.7,
                   maximum_intensity = 0.95
                },
                pipe_covers = pipecoverspictures(),
                pipe_connections =
                {
                    {flow_direction = "input", direction = defines.direction.north, position = {-0.5, -1.5}},
                    {flow_direction = "input", direction = defines.direction.north, position = {0.5, -1.5}}
                },
                production_type = "input",
                filter = 'umr_output_fluid',
                minimum_temperature = 100,
                maximum_temperature = 6500
            },
            effectivity = 0.39,
            burns_fluid = true,
            scale_fluid_usage = true,
            fluid_usage_per_tick = 0.1
        },
        heat_buffer = {
            max_temperature = 20000,
            specific_heat = "100MJ",
            max_transfer = "1PW",
            connections = {
                {position = {-0.5,1.5}, direction = defines.direction.south},                
                {position = {0.5,1.5}, direction = defines.direction.south},
                {position = {1.5,1.5}, direction = defines.direction.south},                
                {position = {-1.5,1.5}, direction = defines.direction.south}
            }
        },
        neighbour_bonus = 3.33,
        scale_energy_usage = true,
        --animation
        picture = 
        {
          layers =
          {
            {
              filename = sprite('hr_shadow.png'),
              size = {600, 400},
              scale = 0.7,
              line_length = 1,
              frame_count = 1,
              repeat_count = 60,
              animation_speed = 1,
              draw_as_shadow = true,
              shift = {0,0}
            },
            {
              filename = sprite('animation1.png'),
              size = {200, 290},
              scale = 0.7,
              line_length = 8,
              lines_per_file = 8,
              frame_count = 60,
              animation_speed = 1,
              shift = {0,0}
            },
            {
              filename = sprite('emission1.png'),
              size = {200, 290},
              scale = 0.7,
              line_length = 8,
              lines_per_file = 8,
              frame_count = 60,
              animation_speed = 1,
              blend_mode = "additive",
              shift = {0,0}
            },
          },
        },
        working_sound = { 
            sound = { filename = '__base__/sound/nuclear-reactor-1.ogg'},
            idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
            apparent_volume = 0.7,
        },
    },
    {
        name = 'umr_converter_heat_2_entity',
        type = 'item',
        icons = {{icon = "__ultimateCore__/graphics/umr_converter/umr_converter_icon2.png", icon_size = 64}},
        place_result = 'umr_converter_heat_2_entity',
        stack_size = 20,
        subgroup = 'umr_item_subgroup_e',
        order = 'a-d',
        inventory_move_sound = item_sounds.reactor_inventory_move,
        pick_sound = item_sounds.reactor_inventory_pickup,
        drop_sound = item_sounds.reactor_inventory_move,
    },
    {
        name = 'umr_converter_heat_2_entity',
        type = 'recipe',
        enabled = false,
        ingredients = {
            {type="item", name="copper-plate", amount=500},
            {type="item", name="steel-plate", amount=500},
            {type="item", name="advanced-circuit", amount=500},
            {type="item", name="concrete", amount=500},
            {type="item", name="accumulator", amount=500},
            {type="item", name="nuclear-reactor", amount=15},
        },
        results = {
            {type="item", name="umr_converter_heat_2_entity", amount=1},
        },
        energy_required = 10,
    },
    {
        name = 'umr_converter_heat_2_entity',
        type = 'reactor',
        icon = sprite('icon2.png'),
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        max_health = 5250,
        corpse = "nuclear-reactor-remnants",
        dying_explosion = "nuclear-reactor-explosion",
        open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.65 },
        close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.65 },
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        damaged_trigger_effect = hit_effects.entity(),
        impact_category = "metal-large",
        collision_box = {{-1.9,-1.9},{1.9,1.9}},
        selection_box = {{-1.9,-1.9},{1.9,1.9}},
        map_color = {r=0.7, g=0.2, b=0.7, a=1},
        minable = {
            mining_time = 5,
            result = 'umr_converter_heat_2_entity',
        },
        resistances =
        {
            {
            type = "fire",
            percent = 90
            },
            {
            type = "explosion",
            percent = 30
            },
            {
            type = "impact",
            percent = 30
            }
        },
        --energy
        consumption = "1.872GW",
        energy_source = {
            type = "fluid",
            fluid_box = {
                volume = 1000,
                light_flicker =
                {
                   color = {1,0,1},
                   minimum_intensity = 0.7,
                   maximum_intensity = 0.95
                },
                pipe_covers = pipecoverspictures(),
                pipe_connections =
                {
                    {flow_direction = "input", direction = defines.direction.south, position = {-0.5, 1.5}},
                    {flow_direction = "input", direction = defines.direction.south, position = {0.5, 1.5}}
                },
                production_type = "input",
                filter = 'umr_output_fluid',
                minimum_temperature = 100,
                maximum_temperature = 6500
            },
            effectivity = 0.39,
            burns_fluid = true,
            scale_fluid_usage = true,
            fluid_usage_per_tick = 0.1
        },
        heat_buffer = {
            max_temperature = 20000,
            specific_heat = "100MJ",
            max_transfer = "1PW",
            connections = {
                {position = {-0.5,-1.5}, direction = defines.direction.north},                
                {position = {0.5,-1.5}, direction = defines.direction.north},
                {position = {1.5,-1.5}, direction = defines.direction.north},                
                {position = {-1.5,-1.5}, direction = defines.direction.north}  
            }
        },
        neighbour_bonus = 3.33,
        scale_energy_usage = true,
        --animation
        picture = 
        {
          layers =
          {
            {
              filename = sprite('hr_shadow.png'),
              size = {600, 400},
              scale = 0.7,
              line_length = 1,
              frame_count = 1,
              repeat_count = 60,
              animation_speed = 1,
              draw_as_shadow = true,
              shift = {0,0}
            },
            {
              filename = sprite('animation1.png'),
              size = {200, 290},
              scale = 0.7,
              line_length = 8,
              lines_per_file = 8,
              frame_count = 60,
              animation_speed = 1,
              shift = {0,0}
            },
            {
              filename = sprite('emission1.png'),
              size = {200, 290},
              scale = 0.7,
              line_length = 8,
              lines_per_file = 8,
              frame_count = 60,
              animation_speed = 1,
              blend_mode = "additive",
              shift = {0,0}
            },
          },
        },
        working_sound = { 
            sound = { filename = '__base__/sound/nuclear-reactor-1.ogg'},
            idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
            apparent_volume = 0.7,
        },
    },
})