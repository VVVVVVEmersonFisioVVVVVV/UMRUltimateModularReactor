local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")

local tint1 = {r = 0.7, g = 0.5, b = 0.7, a = 1}
local tint2 = {r = 1, g = 0.5, b = 1, a = 1}

local function sprite(name)
    return '__ultimateCore__/graphics/umr_machine/umr_machine'..name
end

data:extend({
    {
        name = 'umr_interface_entity',
        type = 'item',
        icons = {{icon = "__ultimateCore__/graphics/umr_machine/umr_machine_icon.png", icon_size = 64, tint = {r = 0.7, g = 0.5, b = 0.7, a = 1}}},
        place_result = 'umr_interface_entity',
        stack_size = 20,
        subgroup = 'umr_item_subgroup_a',
        order = 'a-a',
        inventory_move_sound = item_sounds.reactor_inventory_move,
        pick_sound = item_sounds.reactor_inventory_pickup,
        drop_sound = item_sounds.reactor_inventory_move,
    },
    {
        name = 'umr_interface_entity',
        type = 'recipe',
        enabled = false,
        ingredients = {
            {type="item", name="copper-plate", amount=500},
            {type="item", name="steel-plate", amount=500},
            {type="item", name="advanced-circuit", amount=500},
            {type="item", name="concrete", amount=500},
            {type="item", name="accumulator", amount=500},
            {type="item", name="nuclear-reactor", amount=5},
        },
        results = {
            {type="item", name="umr_interface_entity", amount=1},
        },
        energy_required = 10,
    },
    {
        name = 'umr_interface_entity',
        type = 'assembling-machine',
        icon = sprite('_icon.png'),
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        max_health = 5250,
        corpse = "nuclear-reactor-remnants",
        dying_explosion = "nuclear-reactor-explosion",
        open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.65 },
        close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.65 },
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
        circuit_connector = circuit_connector_definitions["assembling-machine"],
        damaged_trigger_effect = hit_effects.entity(),
        impact_category = "metal-large",
        collision_box = {{-2.5,-2.5},{2.5,2.5}},
        selection_box = {{-2.5,-2.5},{2.5,2.5}},
        map_color = {r=0.7, g=0.2, b=0.7, a=1},
        minable = {
            mining_time = 5,
            result = 'umr_interface_entity',
        },
        crafting_categories = {'umr_interface_basic_category'},
        crafting_speed = 2,
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
            type = 'electric',
            usage_priority = "secondary-input",
        },
        allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
        module_slots = 4,
        icons_positioning =
        {
          {inventory_index = defines.inventory.assembling_machine_modules, shift = {0, -1.5}, max_icons_per_row = 8}
        },
        icon_draw_specification = {shift = {0, 0.8}},
        energy_usage = '12.1MW',
        --fluid boxes
        fluid_boxes = {
            { 
              volume = 2500,
              pipe_covers = pipecoverspictures(),
              pipe_connections =
              {
                {flow_direction = "input", direction = defines.direction.east, position = {2, -1}}
              },
              production_type = "input",
              pipe_picture = assembler2pipepictures()
            },
            { 
              volume = 2500,
              pipe_covers = pipecoverspictures(),
              pipe_connections =
                {
                  {flow_direction = "input", direction = defines.direction.east, position = {2, 1}}
                },
                production_type = "input",
                pipe_picture = assembler2pipepictures()
            },
            { 
              volume = 2500,
              pipe_covers = pipecoverspictures(),
              pipe_connections =
                {
                  {flow_direction = "input", direction = defines.direction.south, position = {1, 2}},
                },
                production_type = "input",
                pipe_picture = assembler2pipepictures()
            },
            { 
              volume = 2500,
              pipe_covers = pipecoverspictures(),
              pipe_connections =
                {
                  {flow_direction = "input", direction = defines.direction.north, position = {1, -2}},
                },
                production_type = "input",
                pipe_picture = assembler2pipepictures()
            },
            { 
              filter = 'umr_interface_fluid',
              volume = 1000,
              pipe_covers = pipecoverspictures(),
              pipe_connections =
              {
                {flow_direction = "output", direction = defines.direction.south, position = {-1, 2}},
              },
              production_type = "output",
              pipe_picture = assembler2pipepictures()
            },
            { 
              filter = 'umr_interface_fluid',
              volume = 1000,
              pipe_covers = pipecoverspictures(),
              pipe_connections =
              {
                {flow_direction = "output", direction = defines.direction.north, position = {-1, -2}},
              },
              production_type = "output",
              pipe_picture = assembler2pipepictures()
            },
            { 
              filter = 'umr_interface_fluid',
              volume = 1000,
              pipe_covers = pipecoverspictures(),
              pipe_connections =
              {
                {flow_direction = "output", direction = defines.direction.west, position = {-2, 1}},
              },
              production_type = "output",
              pipe_picture = assembler2pipepictures()
            },
            {
              filter = 'umr_interface_fluid',
              volume = 1000,
              pipe_covers = pipecoverspictures(),
              pipe_connections =
              {
                {flow_direction = "output", direction = defines.direction.west, position = {-2, -1}},
              },
              production_type = "output",
              pipe_picture = assembler2pipepictures()
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
            size = {1200, 700},
            shift = {0, -0.5},
            scale = 0.3,
            line_length = 1,
            frame_count = 1,
            repeat_count = 80,
            draw_as_shadow = true,
            animation_speed = 0.05,
          },
          {
            filename = sprite('_animation.png'),
            size = {590, 640},
            shift = {0, -0.5},
            scale = 0.3,
            line_length = 10,
            lines_per_file = 8,
            frame_count = 80,
            animation_speed = 0.05,
          },
          {
            filename = sprite('_color1.png'),
            size = {590, 640},
            shift = {0, -0.5},
            scale = 0.3,
            line_length = 10,
            lines_per_file = 8,
            tint= tint1,
            frame_count = 80,
            animation_speed = 0.05,
          },
        },
      },
      working_visualisations = {{
        fadeout = true,
        light = {
          type = "basic",
          intensity = 1,
          size = 15
        },
        secondary_draw_order = 20,
        animation = {
          layers = {
            {
              filename = sprite('_color2.png'),
              size = {590, 640},
              shift = {0, -0.5},
              scale = 0.3,
              line_length = 10,
              lines_per_file = 8,
              frame_count = 80,
              tint= tint2,
              blend_mode = "additive",
              animation_speed = 0.05,
            },
            {
              filename = sprite('_color3.png'),
              size = {590, 640},
              shift = {0, -0.5},
              scale = 0.3,
              line_length = 10,
              lines_per_file = 8,
              frame_count = 80,
              tint= tint2,
              blend_mode = "additive",
              animation_speed = 0.05,
            },
          },
        },
      }},
    },
        working_sound = { 
            sound = { filename = '__base__/sound/accumulator-working-05.ogg'},
            idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.2 },
            apparent_volume = 0.4,
        },
    }
})