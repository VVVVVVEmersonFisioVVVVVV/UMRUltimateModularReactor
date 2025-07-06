local util = require("util")

umr_explosion_animations = {}

umr_explosion_animations.umr_custom_shockwave = function()
  return {
    {
      filename = "__ultimateCore__/graphics/animation/ufp_nuke-shockwave-1.png",
      draw_as_glow = true,
      priority = "high",
      flags = {"smoke"},
      line_length = 8,
      width = 132,
      height = 136,
      frame_count = 32,
      animation_speed = 0.5,
      shift = util.by_pixel(-0.5, 0),
      scale = 1.5,
      -- tint = {r = 1, g = 0.9, b = 1, a = 1},
      usage = "explosion"
    },
    {
      filename = "__ultimateCore__/graphics/animation/ufp_nuke-shockwave-2.png",
      draw_as_glow = true,
      priority = "high",
      flags = {"smoke"},
      line_length = 8,
      width = 110,
      height = 128,
      frame_count = 32,
      animation_speed = 0.5,
      shift = util.by_pixel(0, 3),
      scale = 1.5,
      -- tint = {r = 1, g = 0.9, b = 1, a = 1},
      usage = "explosion"
    }
  }
end

umr_explosion_animations.umr_custom_nuke = function()
  return {
    width = 628,
    height = 720,
    frame_count = 100,
    draw_as_glow = true,
    priority = "very-low",
    flags = {"linear-magnification"},
    shift = util.by_pixel(0.5, -122.5),
    animation_speed = 0.5 * 0.75,
    scale = 1,
    -- tint = {r = 1, g = 0.9, b = 1, a = 1},
    dice_y = 5,
    allow_forced_downscale = true,
    stripes = {
      {
        filename = "__ultimateCore__/graphics/animation/ufp_nuke-explosion-1.png",
        width_in_frames = 5,
        height_in_frames = 5
      },
      {
        filename = "__ultimateCore__/graphics/animation/ufp_nuke-explosion-2.png",
        width_in_frames = 5,
        height_in_frames = 5
      },
      {
        filename = "__ultimateCore__/graphics/animation/ufp_nuke-explosion-3.png",
        width_in_frames = 5,
        height_in_frames = 5
      },
      {
        filename = "__ultimateCore__/graphics/animation/ufp_nuke-explosion-4.png",
        width_in_frames = 5,
        height_in_frames = 5
      }
    },
    usage = "explosion"
  }
end

umr_explosion_animations.umr_big_explosion = function()
  return
  {
    {
      filename = "__ultimateCore__/graphics/animation/ufp_big-explosion.png",
      draw_as_glow = true,
      width = 197,
      height = 245,
      frame_count = 47,
      line_length = 6,
      shift = {0.1875, -0.75},
      animation_speed = 0.5,
      usage = "explosion"
    }
  }
end

umr_explosion_animations.umr_electric_shockwave = function()
  local animations = {}

  for i = 1, 6 do
    table.insert(animations, {
      filename = "__base__/graphics/entity/beam/beam-body-" .. i .. ".png",
      flags = {"smoke"},
      draw_as_glow = true,
      line_length = 16,
      width = 32,
      height = 39,
      frame_count = 16,
      tint = {r=1, g=0.8, b=1, a = 1},
      scale = 1.5,
      usage = "explosion"
    })
  end

  return animations
end