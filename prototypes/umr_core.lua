local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")

local function sprite(name)
    return '__ultimateCore__/graphics/umr_core/umr_core'..name
end

data:extend({
    {
        name = 'umr_core_entity',
        type = 'item',
        icons = {{icon = "__ultimateCore__/graphics/umr_core/umr_core_icon.png", icon_size = 64}},
        place_result = 'umr_core_entity',
        stack_size = 20,
        subgroup = 'umr_item_subgroup_c',
        order = 'a-a',
        inventory_move_sound = item_sounds.reactor_inventory_move,
        pick_sound = item_sounds.reactor_inventory_pickup,
        drop_sound = item_sounds.reactor_inventory_move,
    },
    {
        name = 'umr_core_entity',
        type = 'recipe',
        enabled = false,
        ingredients = {
            {type="item", name="copper-plate", amount=20000},
            {type="item", name="steel-plate", amount=20000},
            {type="item", name="advanced-circuit", amount=20000},
            {type="item", name="concrete", amount=20000},
            {type="item", name="accumulator", amount=2000},
            {type="item", name="nuclear-reactor", amount=100},
        },
        results = {
            {type="item", name="umr_core_entity", amount=1},
        },
        energy_required = 10,
    },
    {
        name = 'umr_core_entity',
        type = 'assembling-machine',
        icon = sprite('_icon.png'),
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        max_health = 125550,
        corpse = "nuclear-reactor-remnants",
        dying_explosion = "nuclear-reactor-explosion",
        open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.65 },
        close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.65 },
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
        circuit_connector = circuit_connector_definitions["assembling-machine"],
        damaged_trigger_effect = hit_effects.entity(),
        impact_category = "metal-large",
        collision_box = {{-5.5,-5.5},{5.5,5.5}},
        selection_box = {{-5.5,-5.5},{5.5,5.5}},
        map_color = {r=0.7, g=0.2, b=0.7, a=1},
        minable = {
            mining_time = 5,
            result = 'umr_core_entity',
        },
        crafting_categories = {'umr_core_category'},
        crafting_speed = 1,
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
            type = 'void',
        },
        energy_usage = '1W',
        --fluid boxes
        fluid_boxes = {
            { 
              volume = 2500,
              pipe_picture = assembler2pipepictures(),
              pipe_covers = pipecoverspictures(),
              pipe_connections =
              {
                {flow_direction = "input", direction = defines.direction.east, position = {5, -1}}
              },
              production_type = "input"
            },
            { 
              volume = 2500,
              pipe_picture = assembler2pipepictures(),
              pipe_covers = pipecoverspictures(),
              pipe_connections =
              {
                {flow_direction = "input", direction = defines.direction.east, position = {5, 0}}
              },
              production_type = "input"
            },
            { 
              volume = 2500,
              pipe_picture = assembler2pipepictures(),
              pipe_covers = pipecoverspictures(),
              pipe_connections =
              {
                {flow_direction = "input", direction = defines.direction.east, position = {5, 1}}
              },
              production_type = "input"
            },
            { 
                volume = 2500,
                pipe_picture = assembler2pipepictures(),
                pipe_covers = pipecoverspictures(),
                pipe_connections =
                {
                  {flow_direction = "input", direction = defines.direction.west, position = {-5, -1}}
                },
                production_type = "input"
            },
            { 
                volume = 2500,
                pipe_picture = assembler2pipepictures(),
                pipe_covers = pipecoverspictures(),
                pipe_connections =
                {
                  {flow_direction = "input", direction = defines.direction.west, position = {-5, 0}}
                },
                production_type = "input"
            },
            { 
                volume = 2500,
                pipe_picture = assembler2pipepictures(),
                pipe_covers = pipecoverspictures(),
                pipe_connections =
                {
                  {flow_direction = "input", direction = defines.direction.west, position = {-5, 1}}
                },
                production_type = "input"
            },
            { 
                filter = "umr_core_fluid",
                volume = 2500,
                pipe_picture = assembler2pipepictures(),
                pipe_covers = pipecoverspictures(),
                pipe_connections =
                {
                  {flow_direction = "output", direction = defines.direction.south, position = {-1, 5}},
                },
                production_type = "output"
            },
            { 
                filter = "umr_core_fluid",
                volume = 2500,
                pipe_picture = assembler2pipepictures(),
                pipe_covers = pipecoverspictures(),
                pipe_connections =
                {
                  {flow_direction = "output", direction = defines.direction.south, position = {0, 5}},
                },
                production_type = "output"
            },
            { 
                filter = "umr_core_fluid",
                volume = 2500,
                pipe_picture = assembler2pipepictures(),
                pipe_covers = pipecoverspictures(),
                pipe_connections =
                {
                  {flow_direction = "output", direction = defines.direction.south, position = {1, 5}},
                },
                production_type = "output"
            },
            { 
                filter = "umr_core_fluid",
                volume = 2500,
                pipe_picture = assembler2pipepictures(),
                pipe_covers = pipecoverspictures(),
                pipe_connections =
                {
                  {flow_direction = "output", direction = defines.direction.north, position = {-1, -5}},
                },
                production_type = "output"
            },
            { 
                filter = "umr_core_fluid",
                volume = 2500,
                pipe_picture = assembler2pipepictures(),
                pipe_covers = pipecoverspictures(),
                pipe_connections =
                {
                  {flow_direction = "output", direction = defines.direction.north, position = {0, -5}},
                },
                production_type = "output"
            },
            { 
                filter = "umr_core_fluid",
                volume = 2500,
                pipe_picture = assembler2pipepictures(),
                pipe_covers = pipecoverspictures(),
                pipe_connections =
                {
                  {flow_direction = "output", direction = defines.direction.north, position = {1, -5}},
                },
                production_type = "output"
            },
        },
        --animation
    graphics_set = {
      always_draw_idle_animation = true,
      secondary_draw_order = 10,
      idle_animation = {
        layers = {
          {
            filename = sprite('_hr_shadow.png'),
            size = {1400, 1200},
            shift = {0, 0},
            scale = 0.5,
            line_length = 1,
            frame_count = 1,
            repeat_count = 60,
            draw_as_shadow = true,
            animation_speed = 1,
          },
          {
            filename = sprite('_animation.png'),
            size = {800, 800},
            shift = {0, 0},
            scale = 0.5,
            line_length = 8,
            lines_per_file = 8,
            frame_count = 60,
            animation_speed = 1,
          },
        },
      },
      working_visualisations = {{
        fadeout = true,
        light = {
          type = "basic",
          intensity = 1,
          size = 30
        },
        secondary_draw_order = 20,
        animation = {
          layers = {
            {
              filename = sprite('_emission1.png'),
              size = {800, 800},
              shift = {0, 0},
              scale = 0.5,
              line_length = 8,
              lines_per_file = 8,
              frame_count = 60,
              blend_mode = "additive",
              animation_speed = 1,
            },
          },
        },
      }},
    },
        working_sound = { 
            sound = { filename = '__base__/sound/nuclear-reactor-1.ogg'},
            idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
            apparent_volume = 0.7,
        },
    },
})