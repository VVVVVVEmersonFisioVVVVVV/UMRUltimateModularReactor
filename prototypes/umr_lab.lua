local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")

local tint1 = {r = 1, g = 0.2, b = 0.2, a = 1}
local tint2 = {r = 0.4, g = 0.1, b = 0.1, a = 1}

local function sprite(name)
    return '__ultimateCore__/graphics/umr_machine/umr_machine'..name
end

data:extend({
    {
        name = 'umr_lab_entity',
        type = 'item',
        icons = {{icon = "__ultimateCore__/graphics/umr_machine/umr_machine_icon.png", icon_size = 64, tint = {r = 1, g = 0.2, b = 0.2, a = 1}}},
        place_result = 'umr_lab_entity',
        stack_size = 20,
        subgroup = 'umr_item_subgroup_k',
        order = 'a-a',
        inventory_move_sound = item_sounds.reactor_inventory_move,
        pick_sound = item_sounds.reactor_inventory_pickup,
        drop_sound = item_sounds.reactor_inventory_move,
    },
    {
        name = 'umr_lab_entity',
        type = 'recipe',
        enabled = false,
        ingredients = {
            {type="item", name="copper-plate", amount=500},
            {type="item", name="steel-plate", amount=500},
            {type="item", name="advanced-circuit", amount=500},
            {type="item", name="concrete", amount=500},
            {type="item", name="accumulator", amount=100},
            {type="item", name="nuclear-reactor", amount=1},
        },
        results = {
            {type="item", name="umr_lab_entity", amount=1},
        },
        energy_required = 10,
    },
    {
        name = 'umr_lab_entity',
        type = 'lab',
        icon = sprite('_icon.png'),
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        max_health = 5250,
        corpse = "nuclear-reactor-remnants",
        dying_explosion = "nuclear-reactor-explosion",
        open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.65 },
        close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.65 },
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        fast_replaceable_group = "lab",
        collision_box = {{-3.5,-3.5},{3.5,3.5}},
        selection_box = {{-3.5,-3.5},{3.5,3.5}},
        map_color = {r=0.7, g=0.2, b=0.7, a=1},
        damaged_trigger_effect = hit_effects.entity(),
        effect_receiver = { base_effect = { productivity = 1 }},
        impact_category = "metal-large",
        minable = {
            mining_time = 5,
            result = 'umr_lab_entity',
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
        energy_source = {
            emissions_per_minute = {
                pollution = 6
                },
            type = 'fluid',
            effectivity = 0.74,
            fluid_box = {
                filter = "umr_core_fluid",
                volume = 250,
                pipe_covers = pipecoverspictures(),
                pipe_picture = assembler2pipepictures(),
                pipe_connections =
                {
                  {flow_direction = "input-output", direction = defines.direction.south, position = {0, 3}},
                  {flow_direction = "input-output", direction = defines.direction.north, position = {0, -3}},
                  {flow_direction = "input-output", direction = defines.direction.east, position = {3, 0}},
                  {flow_direction = "input-output", direction = defines.direction.west, position = {-3, 0}}
                },
                production_type = "input-output"
            },
            scale_fluid_usage = true,
            burns_fluid = true
        },
        energy_usage = '68kJ',
        researching_speed = 7,
        inputs = {},
        allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
        module_slots = 20,
        icons_positioning =
        {
          {inventory_index = defines.inventory.lab_modules, shift = {0, 0.8}, max_icons_per_row = 10},
          {inventory_index = defines.inventory.lab_input, shift = {0, -1.8}, max_icons_per_row = 6, scale = 0.8}
        },
        --animation
    on_animation =
    {
      layers =
      {
          {
            filename = sprite('_hr_shadow.png'),
            size = {1200, 700},
            shift = {0, -0.5},
            scale = 0.45,
            line_length = 1,
            frame_count = 1,
            repeat_count = 80,
            draw_as_shadow = true,
            animation_speed = 0.5,
          },
          {
            filename = sprite('_animation.png'),
            size = {590, 640},
            shift = {0, -0.5},
            scale = 0.45,
            line_length = 10,
            lines_per_file = 8,
            frame_count = 80,
            animation_speed = 0.5,
          },
          {
            filename = sprite('_color1.png'),
            size = {590, 640},
            shift = {0, -0.5},
            scale = 0.45,
            line_length = 10,
            lines_per_file = 8,
            tint= tint1,
            frame_count = 80,
            animation_speed = 0.5,
          },   
          {
            filename = sprite('_color2.png'),
            size = {590, 640},
            shift = {0, -0.5},
            scale = 0.45,
            line_length = 10,
            lines_per_file = 8,
            frame_count = 80,
            tint= tint1,
            blend_mode = "additive",
            animation_speed = 0.5,
          },
          {
            filename = sprite('_color3.png'),
            size = {590, 640},
            shift = {0, -0.5},
            scale = 0.45,
            line_length = 10,
            lines_per_file = 8,
            frame_count = 80,
            tint= tint1,
            blend_mode = "additive",
            animation_speed = 0.5,
          },
      }
    },
    off_animation =
    {
      layers =
      {
          {
            filename = sprite('_hr_shadow.png'),
            size = {1200, 700},
            shift = {0, -0.5},
            scale = 0.45,
            line_length = 1,
            frame_count = 1,
            repeat_count = 80,
            draw_as_shadow = true,
            animation_speed = 0.5,
          },
          {
            filename = sprite('_animation.png'),
            size = {590, 640},
            shift = {0, -0.5},
            scale = 0.45,
            line_length = 10,
            lines_per_file = 8,
            frame_count = 80,
            animation_speed = 0.5,
          },
          {
            filename = sprite('_color1.png'),
            size = {590, 640},
            shift = {0, -0.5},
            scale = 0.45,
            line_length = 10,
            lines_per_file = 8,
            tint= tint1,
            frame_count = 80,
            animation_speed = 0.5,
          },       
      }
    },
        working_sound = { 
            sound = { filename = "__base__/sound/lab.ogg" },
            idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
            apparent_volume = 0.7,
        },
    },
    {
        name = 'umr_lab_entity_2',
        type = 'item',
        icons = {{icon = "__ultimateCore__/graphics/umr_machine/umr_machine_icon.png", icon_size = 64, tint = {r = 0.5, g = 0.1, b = 0.1, a = 1}}},
        place_result = 'umr_lab_entity_2',
        stack_size = 20,
        subgroup = 'umr_item_subgroup_k',
        order = 'a-b',
        inventory_move_sound = item_sounds.reactor_inventory_move,
        pick_sound = item_sounds.reactor_inventory_pickup,
        drop_sound = item_sounds.reactor_inventory_move,
    },
    {
        name = 'umr_lab_entity_2',
        type = 'recipe',
        enabled = false,
        ingredients = {
            {type="item", name="copper-plate", amount=500},
            {type="item", name="steel-plate", amount=500},
            {type="item", name="advanced-circuit", amount=500},
            {type="item", name="concrete", amount=500},
            {type="item", name="accumulator", amount=500},
            {type="item", name="umr_lab_entity", amount=50},
        },
        results = {
            {type="item", name="umr_lab_entity_2", amount=1},
        },
        energy_required = 10,
    },
    {
        name = 'umr_lab_entity_2',
        type = 'lab',
        icon = sprite('_icon.png'),
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        max_health = 10550,
        corpse = "nuclear-reactor-remnants",
        dying_explosion = "nuclear-reactor-explosion",
        open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.65 },
        close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.65 },
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        fast_replaceable_group = "lab",
        collision_box = {{-6.5,-6.5},{6.5,6.5}},
        selection_box = {{-6.5,-6.5},{6.5,6.5}},
        map_color = {r=0.7, g=0.2, b=0.7, a=1},
        damaged_trigger_effect = hit_effects.entity(),
        effect_receiver = { base_effect = { productivity = 3 }},
        impact_category = "metal-large",
        minable = {
            mining_time = 5,
            result = 'umr_lab_entity_2',
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
        energy_source = {
            emissions_per_minute = {
                pollution = 7
                },
            type = 'fluid',
            effectivity = 0.74,
            fluid_box = {
                filter = "umr_core_fluid",
                volume = 250,
                pipe_covers = pipecoverspictures(),
                pipe_picture = assembler2pipepictures(),
                pipe_connections =
                {
                  {flow_direction = "input-output", direction = defines.direction.south, position = {0, 6}},
                  {flow_direction = "input-output", direction = defines.direction.north, position = {0, -6}},
                  {flow_direction = "input-output", direction = defines.direction.east, position = {6, 0}},
                  {flow_direction = "input-output", direction = defines.direction.west, position = {-6, 0}}
                },
                production_type = "input-output"
            },
            scale_fluid_usage = true,
            burns_fluid = true
        },
        energy_usage = '272kJ',
        researching_speed = 64,
        inputs = {},
        allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
        module_slots = 40,
        icons_positioning =
        {
          {inventory_index = defines.inventory.lab_modules, shift = {0, 0.8}, max_icons_per_row = 10},
          {inventory_index = defines.inventory.lab_input, shift = {0, -1.8}, max_icons_per_row = 10, scale = 0.8}
        },
        --animation
    on_animation =
    {
      layers =
      {
          {
            filename = sprite('_hr_shadow.png'),
            size = {1200, 700},
            shift = {0, -1},
            scale = 0.75,
            line_length = 1,
            frame_count = 1,
            repeat_count = 80,
            draw_as_shadow = true,
            animation_speed = 0.5,
          },
          {
            filename = sprite('_animation.png'),
            size = {590, 640},
            shift = {0, -1},
            scale = 0.75,
            line_length = 10,
            lines_per_file = 8,
            frame_count = 80,
            animation_speed = 0.5,
          },
          {
            filename = sprite('_color1.png'),
            size = {590, 640},
            shift = {0, -1},
            scale = 0.75,
            line_length = 10,
            lines_per_file = 8,
            tint= tint2,
            frame_count = 80,
            animation_speed = 0.5,
          },   
          {
            filename = sprite('_color2.png'),
            size = {590, 640},
            shift = {0, -1},
            scale = 0.75,
            line_length = 10,
            lines_per_file = 8,
            frame_count = 80,
            tint= tint1,
            blend_mode = "additive",
            animation_speed = 0.5,
          },
          {
            filename = sprite('_color3.png'),
            size = {590, 640},
            shift = {0, -1},
            scale = 0.75,
            line_length = 10,
            lines_per_file = 8,
            frame_count = 80,
            tint= tint1,
            blend_mode = "additive",
            animation_speed = 0.5,
          },
      }
    },
    off_animation =
    {
      layers =
      {
          {
            filename = sprite('_hr_shadow.png'),
            size = {1200, 700},
            shift = {0, -1},
            scale = 0.75,
            line_length = 1,
            frame_count = 1,
            repeat_count = 80,
            draw_as_shadow = true,
            animation_speed = 0.5,
          },
          {
            filename = sprite('_animation.png'),
            size = {590, 640},
            shift = {0, -1},
            scale = 0.75,
            line_length = 10,
            lines_per_file = 8,
            frame_count = 80,
            animation_speed = 0.5,
          },
          {
            filename = sprite('_color1.png'),
            size = {590, 640},
            shift = {0, -1},
            scale = 0.75,
            line_length = 10,
            lines_per_file = 8,
            tint= tint2,
            frame_count = 80,
            animation_speed = 0.5,
          },       
      }
    },
        working_sound = { 
            sound = { filename = "__base__/sound/lab.ogg" },
            idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
            apparent_volume = 0.7,
        },
    }
})