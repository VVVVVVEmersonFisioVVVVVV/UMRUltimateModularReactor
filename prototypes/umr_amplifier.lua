local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")

local tint = {r = 1, g = 0.5, b = 0.5, a = 1}

local function sprite(name)
    return '__ultimateCore__/graphics/umr_amplifier/umr_amplifier_'..name
end

data:extend({
     {
        name = 'umr_amplifier_entity',
        type = 'item',
        icons = {{icon = "__ultimateCore__/graphics/umr_amplifier/umr_amplifier_icon.png", icon_size = 64, tint = {r = 1, g = 0.5, b = 0.5, a = 1}}},
        place_result = 'umr_amplifier_entity',
        stack_size = 20,
        subgroup = 'umr_item_subgroup_b',
        order = 'a-a',
        inventory_move_sound = item_sounds.reactor_inventory_move,
        pick_sound = item_sounds.reactor_inventory_pickup,
        drop_sound = item_sounds.reactor_inventory_move,
    },
    {
        name = 'umr_amplifier_entity',
        type = 'recipe',
        enabled = false,
        ingredients = {
            {type="item", name="copper-plate", amount=500},
            {type="item", name="steel-plate", amount=500},
            {type="item", name="advanced-circuit", amount=500},
            {type="item", name="concrete", amount=500},
            {type="item", name="accumulator", amount=500},
            {type="item", name="nuclear-reactor", amount=10},
        },
        results = {
            {type="item", name="umr_amplifier_entity", amount=1},
        },
        energy_required = 10,
    },
    {
        name = 'umr_amplifier_entity',
        type = 'assembling-machine',
        icon = sprite('icon.png'),
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
        collision_box = {{-1.9,-1.9},{1.9,1.9}},
        selection_box = {{-1.9,-1.9},{1.9,1.9}},
        map_color = {r=0.7, g=0.2, b=0.7, a=1},
        minable = {
            mining_time = 5,
            result = 'umr_amplifier_entity',
        },
        crafting_categories = {'umr_amplifier_category'},
        crafting_speed = 1,
        energy_source = {
            type = 'void',
        },
        energy_usage = '1W',
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
        --fluid boxes
        fluid_boxes = {
            { 
              filter = "steam",
              volume = 2500,
              pipe_picture = assembler2pipepictures(),
              pipe_covers = pipecoverspictures(),
              pipe_connections =
              {
                {flow_direction = "input-output", direction = defines.direction.north, position = {-0.5, -1.5}},
                {flow_direction = "input-output", direction = defines.direction.north, position = {0.5, -1.5}},
                {flow_direction = "input-output", direction = defines.direction.south, position = {-0.5, 1.5}},
                {flow_direction = "input-output", direction = defines.direction.south, position = {0.5, 1.5}}
              },
              production_type = "input",
            },
            { 
              filter = "umr_interface_fluid",
              volume = 1000,
              pipe_picture = assembler2pipepictures(),
              pipe_covers = pipecoverspictures(),
              pipe_connections =
              {
                {flow_direction = "input", direction = defines.direction.east, position = {1.5, -0.5}},
                {flow_direction = "input", direction = defines.direction.east, position = {1.5, 0.5}}
              },
              production_type = "input"
            },
            { 
                filter = "umr_amplifier_fluid",
                volume = 1000,
                pipe_picture = assembler2pipepictures(),
                pipe_covers = pipecoverspictures(),
                pipe_connections =
                {
                  {flow_direction = "output", direction = defines.direction.west, position = {-1.5, -0.5}},
                  {flow_direction = "output", direction = defines.direction.west, position = {-1.5, 0.5}}
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
            filename = sprite('hr_shadow.png'),
            size = {700, 500},
            shift = {0, 0},
            scale = 0.5,
            line_length = 1,
            frame_count = 1,
            repeat_count = 60,
            draw_as_shadow = true,
            animation_speed = 1,
          },
          {
            filename = sprite('animation.png'),
            size = {280, 320},
            shift = {0, 0},
            scale = 0.5,
            line_length = 8,
            lines_per_file = 8,
            frame_count = 60,
            animation_speed = 1,
          },
          {
            filename = sprite('color1.png'),
            size = {280, 320},
            shift = {0, 0},
            scale = 0.5,
            line_length = 8,
            lines_per_file = 8,
            frame_count = 60,
            tint= tint,
            animation_speed = 1,
          },
          {
            filename = sprite('color2.png'),
            size = {280, 320},
            shift = {0, 0},
            scale = 0.5,
            line_length = 8,
            lines_per_file = 8,
            frame_count = 60,
            tint= tint,
            animation_speed = 1,
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
              filename = sprite('emission1.png'),
              size = {280, 320},
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