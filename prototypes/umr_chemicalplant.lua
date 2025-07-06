local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")

local tint = {r = 1, g = 1, b = 0.1, a = 1}

local function sprite(name)
    return '__ultimateCore__/graphics/umr_machine/umr_machine'..name
end

data:extend({
    {
        name = 'umr_chemicalplant_entity',
        type = 'item',
        icons = {{icon = "__ultimateCore__/graphics/umr_machine/umr_machine_icon.png", icon_size = 64, tint = {r = 1, g = 1, b = 0.1, a = 1}}},
        place_result = 'umr_chemicalplant_entity',
        stack_size = 20,
        subgroup = 'umr_item_subgroup_j',
        order = 'a-a',
        inventory_move_sound = item_sounds.reactor_inventory_move,
        pick_sound = item_sounds.reactor_inventory_pickup,
        drop_sound = item_sounds.reactor_inventory_move,
    },
    {
        name = 'umr_chemicalplant_entity',
        type = 'recipe',
        enabled = false,
        ingredients = {
            {type="item", name="copper-plate", amount=500},
            {type="item", name="steel-plate", amount=500},
            {type="item", name="advanced-circuit", amount=500},
            {type="item", name="concrete", amount=500},
            {type="item", name="accumulator", amount=100},
            {type="item", name="nuclear-reactor", amount=1},
            {type="item", name="storage-tank", amount=10},
        },
        results = {
            {type="item", name="umr_chemicalplant_entity", amount=1},
        },
        energy_required = 10,
    },
    {
        name = 'umr_chemicalplant_entity',
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
        damaged_trigger_effect = hit_effects.entity(),
        impact_category = "metal-large",
        collision_box = {{-3.5,-3.5},{3.5,3.5}},
        selection_box = {{-3.5,-3.5},{3.5,3.5}},
        fast_replaceable_group = "chemical-plant",
        effect_receiver = { base_effect = { productivity = 1 }},
        circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
        circuit_connector = circuit_connector_definitions["chemical-plant"],
        map_color = {r=0.7, g=0.2, b=0.7, a=1},
        minable = {
            mining_time = 5,
            result = 'umr_chemicalplant_entity',
        },
        scale_entity_info_icon = true,
        crafting_categories = {'chemistry'},
        crafting_speed = 64,
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
                pipe_connections =
                {
                  {flow_direction = "input-output", direction = defines.direction.south, position = {0, 3}},
                  {flow_direction = "input-output", direction = defines.direction.north, position = {0, -3}}
                },
                production_type = "input-output"
            },
            scale_fluid_usage = true,
            burns_fluid = true
        },
        energy_usage = '68kJ',
        allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
        module_slots = 20,
        icon_draw_specification = {shift = {0, 0.8}},
        icons_positioning =
        {
          {inventory_index = defines.inventory.assembling_machine_modules, shift = {0, -2.2}, max_icons_per_row = 10}
        },
        fluid_boxes =
        {
          {
            production_type = "input",
            pipe_picture = assembler2pipepictures(),
            pipe_covers = pipecoverspictures(),
            volume = 2500,
            base_level = -1,
            pipe_connections =
            {
              {
                flow_direction = "input",
                direction = defines.direction.east,
                position = {3, 1}
              }
            }
          },
          {
            production_type = "input",
            pipe_picture = assembler2pipepictures(),
            pipe_covers = pipecoverspictures(),
            volume = 2500,
            base_level = -1,
            pipe_connections =
            {
              {
                flow_direction = "input",
                direction = defines.direction.east,
                position = {3, 2}
              }
            }
          },
          {
            production_type = "input",
            pipe_picture = assembler2pipepictures(),
            pipe_covers = pipecoverspictures(),
            volume = 2500,
            base_level = -1,
            pipe_connections =
            {
              {
                flow_direction = "input",
                direction = defines.direction.east,
                position = {3, -1}
              }
            }
          },
          {
            production_type = "input",
            pipe_picture = assembler2pipepictures(),
            pipe_covers = pipecoverspictures(),
            volume = 2500,
            base_level = -1,
            pipe_connections =
            {
              {
                flow_direction = "input",
                direction = defines.direction.east,
                position = {3, -2}
              }
            }
          },
          {
            production_type = "output",
            pipe_picture = assembler2pipepictures(),
            pipe_covers = pipecoverspictures(),
            volume = 2500,
            base_level = 1,
            pipe_connections =
            {
              {
                flow_direction = "output",
                direction = defines.direction.west,
                position = {-3, 3}
              }
            }
          },
          {
            production_type = "output",
            pipe_picture = assembler2pipepictures(),
            pipe_covers = pipecoverspictures(),
            volume = 2500,
            base_level = 1,
            pipe_connections =
            {
              {
                flow_direction = "output",
                direction = defines.direction.west,
                position = {-3, 2}
              }
            }
          },
          {
            production_type = "output",
            pipe_picture = assembler2pipepictures(),
            pipe_covers = pipecoverspictures(),
            volume = 2500,
            base_level = 1,
            pipe_connections =
            {
              {
                flow_direction = "output",
                direction = defines.direction.west,
                position = {-3, 1}
              }
            }
          },
          {
            production_type = "output",
            pipe_picture = assembler2pipepictures(),
            pipe_covers = pipecoverspictures(),
            volume = 2500,
            base_level = 1,
            pipe_connections =
            {
              {
                flow_direction = "output",
                direction = defines.direction.west,
                position = {-3, -1}
              }
            }
          },
          {
            production_type = "output",
            pipe_picture = assembler2pipepictures(),
            pipe_covers = pipecoverspictures(),
            volume = 2500,
            base_level = 1,
            pipe_connections =
            {
              {
                flow_direction = "output",
                direction = defines.direction.west,
                position = {-3, -2}
              }
            }
          },
          {
            production_type = "output",
            pipe_picture = assembler2pipepictures(),
            pipe_covers = pipecoverspictures(),
            volume = 2500,
            base_level = 1,
            pipe_connections =
            {
              {
                flow_direction = "output",
                direction = defines.direction.west,
                position = {-3, -3}
              }
            }
          }
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
            scale = 0.45,
            line_length = 1,
            frame_count = 1,
            repeat_count = 80,
            draw_as_shadow = true,
            animation_speed = 0.01,
          },
          {
            filename = sprite('_animation.png'),
            size = {590, 640},
            shift = {0, -0.5},
            scale = 0.45,
            line_length = 10,
            lines_per_file = 8,
            frame_count = 80,
            animation_speed = 0.01,
          },
          {
            filename = sprite('_color1.png'),
            size = {590, 640},
            shift = {0, -0.5},
            scale = 0.45,
            line_length = 10,
            lines_per_file = 8,
            tint= tint,
            frame_count = 80,
            animation_speed = 0.01,
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
              scale = 0.45,
              line_length = 10,
              lines_per_file = 8,
              frame_count = 80,
              tint= tint,
              blend_mode = "additive",
              animation_speed = 0.01,
            },
            {
              filename = sprite('_color3.png'),
              size = {590, 640},
              shift = {0, -0.5},
              scale = 0.45,
              line_length = 10,
              lines_per_file = 8,
              frame_count = 80,
              tint= tint,
              blend_mode = "additive",
              animation_speed = 0.01,
            },
          },
        },
      }},
    },
        working_sound = { 
            sound = { filename = "__base__/sound/oil-refinery.ogg"},
            idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
            apparent_volume = 0.7,
        },
    }
})