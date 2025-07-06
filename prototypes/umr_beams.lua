local util = require("util")
local fireutil = require("__base__.prototypes.fire-util")
local sounds = require("__base__.prototypes.entity.sounds")
local math3d = require "math3d"

local umr_laser_beam_blend_mode = "additive"
local umr_beam_non_light_flags = { "trilinear-filtering" }

local name = "umr_flamethrower-fire-stream"

--- ******************************************************************
--- ************************* UMR LASER ******************************
--- ******************************************************************

function umr_make_laser_beam(sound)
  local result =
  {
    type = "beam",
    flags = {"not-on-map"},
    hidden = true,
    width = 0.5,
    damage_interval = 20,
    random_target_offset = true,
    action_triggered_automatically = false,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            damage = { amount = 5, type = "laser"}
          },
          {
            type = "damage",
            damage = { amount = 5, type = "electric"}
          },
        }
      }
    },
    graphics_set =
    {
      beam =
      {
        head =
        {
          layers =
          {
            {
              filename = "__ultimateCore__/graphics/animation/ufp_laser-body.png",
              flags = umr_beam_non_light_flags,
              line_length = 8,
              width = 64,
              height = 12,
              frame_count = 8,
              scale = 0.5,
              animation_speed = 0.5,
              blend_mode = umr_laser_beam_blend_mode
            },
            {
              filename = "__ultimateCore__/graphics/animation/ufp_laser-body-light.png",
              draw_as_light = true,
              flags = {"light"},
              line_length = 8,
              width = 64,
              height = 12,
              frame_count = 8,
              scale = 0.5,
              animation_speed = 0.5
            }
          }
        },
        tail =
        {
          layers =
          {
            {
              filename = "__ultimateCore__/graphics/animation/ufp_laser-end.png",
              flags = umr_beam_non_light_flags,
              width = 110,
              height = 62,
              frame_count = 8,
              shift = util.by_pixel(11.5, 1),
              scale = 0.5,
              animation_speed = 0.5,
              blend_mode = umr_laser_beam_blend_mode
            },
            {
              filename = "__ultimateCore__/graphics/animation/ufp_laser-end-light.png",
              draw_as_light = true,
              flags = {"light"},
              width = 110,
              height = 62,
              frame_count = 8,
              shift = util.by_pixel(11.5, 1),
              scale = 0.5,
              animation_speed = 0.5
            }
          }
        },
        body =
        {
          {
            layers =
            {
              {
                filename = "__ultimateCore__/graphics/animation/ufp_laser-body.png",
                flags = umr_beam_non_light_flags,
                line_length = 8,
                width = 64,
                height = 12,
                frame_count = 8,
                scale = 0.5,
                animation_speed = 0.5,
                blend_mode = umr_laser_beam_blend_mode
              },
              {
                filename = "__ultimateCore__/graphics/animation/ufp_laser-body-light.png",
                draw_as_light = true,
                flags = {"light"},
                line_length = 8,
                width = 64,
                height = 12,
                frame_count = 8,
                scale = 0.5,
                animation_speed = 0.5
              }
            }
          }
        },
        -- render_layer = "projectile"
      },

      ground =
      {
        head =
        {
          filename = "__base__/graphics/entity/laser-turret/laser-ground-light-head.png",
          draw_as_light = true,
          flags = {"light"},
          line_length = 1,
          width = 256,
          height = 256,
          repeat_count = 8,
          scale = 0.5,
          shift = util.by_pixel(-32, 0),
          animation_speed = 0.5,
          tint = {0.5, 0.05, 0.05}
        },
        tail =
        {
          filename = "__base__/graphics/entity/laser-turret/laser-ground-light-tail.png",
          draw_as_light = true,
          flags = {"light"},
          line_length = 1,
          width = 256,
          height = 256,
          repeat_count = 8,
          scale = 0.5,
          shift = util.by_pixel(32, 0),
          animation_speed = 0.5,
          tint = {0.5, 0.05, 0.05}
        },
        body =
        {
          filename = "__base__/graphics/entity/laser-turret/laser-ground-light-body.png",
          draw_as_light = true,
          flags = {"light"},
          line_length = 1,
          width = 64,
          height = 256,
          repeat_count = 8,
          scale = 0.5,
          animation_speed = 0.5,
          tint = {0.5, 0.05, 0.05}
        }
        -- render_layer = "projectile"
      }
    }
  }

  if sound then
    result.working_sound =
    {
      sound =
      {
        category = "weapon",
        filename = "__base__/sound/fight/laser-beam.ogg",
        volume = 0.75,
        modifiers = volume_multiplier("main-menu", 2.5)
      },
      max_sounds_per_prototype = 1
    }
    result.name = "umr_laser-beam"
  else
    result.name = "umr_laser-beam-no-sound"
  end
  return result
end

data:extend(
{
  umr_make_laser_beam(true)
}
)

--- ******************************************************************
--- ************************* UMR FIRE *******************************
--- ******************************************************************

data:extend(
{
  {
    type = "sticker",
    name = "umr_fire-sticker",
    flags = {"not-on-map"},
    hidden = true,

    animation =
    {
      filename = "__ultimateCore__/graphics/animation/ufp_fire-flame-01.png",
      line_length = 10,
      width = 84,
      height = 130,
      frame_count = 90,
      blend_mode = "normal",
      animation_speed = 1,
      scale = 0.4,
      tint = { r = 0.5, g = 0.5, b = 0.5, a = 0.18 }, --{ r = 1, g = 1, b = 1, a = 0.35 },
      shift = math3d.vector2.mul({-0.078125, -1.8125}, 0.1),
      draw_as_glow = true
    },

    duration_in_ticks = 30 * 60,
    damage_interval = 10,
    target_movement_modifier = 0.8,
    damage_per_tick = { amount = 14 * 100 / 60, type = "fire" },
    spread_fire_entity = "fire-flame-on-tree",
    fire_spread_cooldown = 30,
    fire_spread_radius = 0.75
  }
})

data:extend({
  {
    type = "fire",
    name = "umr_fire-flame",
    flags = {"placeable-off-grid", "not-on-map"},
    hidden = true,
    
    -- Required properties
    pictures = fireutil.create_fire_pictures({}),  -- This provides default fire animations
    light = {intensity = 0.2, size = 4, color = {r=1.0, g=0.5, b=0.0}},  -- Basic light properties
    
    -- Damage properties
    damage_per_tick = { amount = 15 / 60, type = "fire" },
    maximum_damage_multiplier = 10,
    damage_multiplier_increase_per_added_fuel = 1,
    damage_multiplier_decrease_per_tick = 0.005,
    
    -- Spread properties
    spawn_entity = "fire-flame-on-tree",
    spread_delay = 300,
    spread_delay_deviation = 180,
    maximum_spread_count = 100,
    
    -- Lifetime properties
    initial_lifetime = 120,
    lifetime_increase_by = 150,
    lifetime_increase_cooldown = 4,
    maximum_lifetime = 1800,
    delay_between_initial_flames = 10,
    
    -- Effects
    smoke =
    {
      {
        name = "fire-smoke",
        deviation = {0.5, 0.5},
        frequency = 0.125,
        position = {0.0, -0.8},
        starting_vertical_speed = 0.05,
        starting_vertical_speed_deviation = 0.005,
        vertical_speed_slowdown = 0.99,
        starting_frame_deviation = 60,
        height = -0.5
      }
    },
    emissions_per_second = { pollution = 0.005 },

    -- Working sound
    working_sound = {
        sound = {
            variations = {
                {
                    filename = "__base__/sound/fire-1.ogg",
                    volume = 0.7
                },
                {
                    filename = "__base__/sound/fire-2.ogg",
                    volume = 0.7
                }
            }
        },
        fade_in_ticks = 30,
        fade_out_ticks = 30
    }
  }
})

local umr_stream_sprites =
{
  umr_spine_animation = util.draw_as_glow
  {
    filename = "__ultimateCore__/graphics/animation/ufp_flamethrower-fire-stream-spine.png",
    blend_mode = "normal",
    tint = {r=1, g=1, b=1, a=0.2},
    line_length = 6,
    width = 54,
    height = 104,
    frame_count = 36,
    animation_speed = 2,
    shift = {0, 0}
  },

  umr_shadow =
  {
    filename = "__base__/graphics/entity/acid-projectile/projectile-shadow.png",
    line_length = 5,
    width = 28,
    height = 16,
    frame_count = 33,
    priority = "high",
    shift = {-0.09, 0.395},
    scale = 1
  },

  umr_particle = util.draw_as_glow
  {
    filename = "__ultimateCore__/graphics/animation/ufp_flamethrower-explosion.png",
    priority = "extra-high",
    blend_mode = "normal",
    tint = {r=0.9, g=0.9, b=0.9, a=0.55},
    line_length = 6,
    width = 248,
    height = 216,
    frame_count = 36,
  }
}

data:extend(
{
  {
    type = "stream",
    name = "umr_flamethrower-fire-stream",
    flags = {"not-on-map"},
    hidden = true,
    -- stream_light = {intensity = 1, size = 4},
    -- ground_light = {intensity = 0.8, size = 4},

    --smoke_sources =
    --{
    --  {
    --    name = "soft-fire-smoke",
    --    frequency = 0,
    --    position = {0.0, 0}, -- -0.8},
    --    starting_frame_deviation = 60
    --  }
    --},
    particle_buffer_size = 36,
    particle_spawn_interval = 5,
    particle_spawn_timeout = 20,
    particle_vertical_acceleration = 0.015 * 0.60,
    particle_horizontal_speed = 0.6* 0.75 * 1.5,
    particle_horizontal_speed_deviation = 0.005 * 0.70,
    particle_start_alpha = 0.5/0.666,
    particle_end_alpha = 1,
    particle_start_scale = 0.2,
    particle_loop_frame_count = 3,
    particle_fade_out_threshold = 0.9,
    particle_loop_exit_threshold = 0.25,
    action =
    {
      {
        type = "area",
        radius = 6,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-sticker",
              sticker = "umr_fire-sticker",
              show_in_tooltip = true
            },
            {
              type = "damage",
              damage = { amount = 12, type = "fire" },
              apply_damage_to_trees = false
            }
          }
        }
      },
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-fire",
              entity_name = "umr_fire-flame",
              show_in_tooltip = true
            }
          }
        }
      }
    },
    spine_animation = umr_stream_sprites.umr_spine_animation,
    --shadow = umr_stream_sprites.umr_shadow,
    particle = umr_stream_sprites.umr_particle
  }
}
)