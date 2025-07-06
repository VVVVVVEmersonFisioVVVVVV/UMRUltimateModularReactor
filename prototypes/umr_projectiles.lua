local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
  -- Explosion entities
  {
    type = "explosion",
    name = "umr_nuke-explosion",
    flags = {"not-on-map"},
    hidden = true,
    icons = {
      {icon = "__base__/graphics/icons/explosion.png"},
      {icon = "__base__/graphics/icons/atomic-bomb.png"}
    },
    order = "a-d-a",
    subgroup = "explosions",
    height = 0,
    animations = umr_explosion_animations.umr_custom_nuke(),
    sound = sounds.large_explosion(1.0)
  },

  {
    type = "explosion",
    name = "umr_big-explosion",
    localised_name = {"entity-name.umr_big-explosion"},
    icons = {
      {icon = "__base__/graphics/icons/explosion.png"},
      {icon = "__base__/graphics/icons/explosive-cannon-shell.png"}
    },
    order = "a-c-b",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "explosions",
    animations = umr_explosion_animations.umr_big_explosion(),
    sound = sounds.large_explosion(1.0)
  },

  -- Nuke smoke shockwave entity (spawns the animation)
  {
    type = "explosion",
    name = "umr-custom-smoke-shockwave",
    icon = "__base__/graphics/icons/atomic-bomb.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "explosions",
    rotate = true,
    correct_rotation = true,
    fade_out_duration = 20,
    scale_out_duration = 20,
    scale_in_duration = 5,
    scale_initial = 0.1,
    scale = 1.5,
    scale_end = 0.2,
    scale_increment_per_tick = 0.015,
    scale_animation_speed = true,
    height = 1.4,
    animations = umr_explosion_animations.umr_custom_shockwave()
  },

  {
    type = "explosion",
    name = "umr-electric-shockwave",
    icon = "__base__/graphics/icons/laser-turret.png", -- ou um ícone custom
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "explosions",
    rotate = true,
    correct_rotation = true,
    fade_out_duration = 15,
    scale_out_duration = 15,
    scale_in_duration = 3,
    scale_initial = 0.1,
    scale = 1.5,
    scale_end = 0.2,
    scale_increment_per_tick = 0.015,
    scale_animation_speed = true,
    height = 1.2,
    animations = umr_explosion_animations.umr_electric_shockwave()
  },

  -- Projectile that moves and spawns the smoke shockwave along its path
  {
    type = "projectile",
    name = "umr-wave-spawns-smoke-shockwave",
    flags = {"not-on-map"},
    hidden = true,
    acceleration = 0,
    speed_modifier = {1, 0.707},
    action = {
      {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "create-explosion",
              entity_name = "umr-custom-smoke-shockwave",
              max_movement_distance = 2.5,
              max_movement_distance_deviation = 2,
              inherit_movement_distance_from_projectile = true,
              cycle_while_moving = true
            }
          }
        }
      }
    },
    animation = nil,
    shadow = nil
  },

  {
    type = "projectile",
    name = "umr-wave-spawns-electric-shockwave",
    flags = {"not-on-map"},
    hidden = true,
    acceleration = 0,
    speed_modifier = {1, 0.707},
    action = {
      {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "create-explosion",
              entity_name = "umr-electric-shockwave",
              max_movement_distance = 2.5,
              max_movement_distance_deviation = 2,
              inherit_movement_distance_from_projectile = true,
              cycle_while_moving = true
            }
          }
        }
      }
    },
    animation = nil,
    shadow = nil
  },

  -- Plasma round Projectile
  {
    type = "projectile",
    name = "umr_plasma_round",
    -- flags = {"not-on-map"},
    hidden = true,
    collision_box = {{-0.3, -4}, {0.3, 4}},
    acceleration = 0,
    piercing_damage = 3000,
    force_condition = "not-same",
    direction_only = true,
    hit_collision_mask = {
        layers = {
            object = true,
            player = true,
            trigger_target=true,
            train = true
        }
    },
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "damage",
            damage = {amount = 20, type = "physical"}
          },
          {
            type = "create-entity",
            entity_name = "umr_big-explosion"
          }
        }
      }
    },
    final_action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-entity",
            entity_name = "umr_nuke-explosion"
          },
          {
            type = "camera-effect",
            duration = 30,
            ease_in_duration = 5,
            ease_out_duration = 60,
            delay = 0,
            strength = 6,
            full_strength_max_distance = 200,
            max_distance = 800
          },
          {
            type = "play-sound",
            sound = sounds.nuclear_explosion(0.9),
            play_on_target_position = false,
            max_distance = 1000
          },
          {
            type = "play-sound",
            sound = sounds.nuclear_explosion_aftershock(0.4),
            play_on_target_position = false,
            max_distance = 1000
          },
          {
            type = "create-entity",
            entity_name = "big-scorchmark",
            check_buildability = true
          },
          {
            type = "invoke-tile-trigger",
            repeat_count = 1
          },
          {
            type = "destroy-decoratives",
            from_render_layer = "decorative",
            to_render_layer = "object",
            include_soft_decoratives = true,
            include_decals = false,
            invoke_decorative_trigger = true,
            decoratives_with_trigger_only = false,
            radius = 9
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              radius = 18,
              action_delivery = {
                type = "instant",
                target_effects = {
                  {
                    type = "damage",
                    damage = {amount = 20, type = "physical"}
                  },
                  {
                    type = "damage",
                    damage = {amount = 20, type = "explosion"}
                  },
                  {
                    type = "damage",
                    damage = {amount = 20, type = "electric"}
                  }
                }
              }
            }
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              show_in_tooltip = false,
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 1000,
              radius = 8,
              action_delivery = {
                type = "projectile",
                projectile = "umr-wave-spawns-smoke-shockwave",
                starting_speed = 1,
                starting_speed_deviation = 0.15
              }
            }
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              show_in_tooltip = false,
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 1000,
              radius = 8,
              action_delivery = {
                type = "projectile",
                projectile = "umr-wave-spawns-electric-shockwave",
                starting_speed = 0.9,
                starting_speed_deviation = 0.9
              }
            }
          }
        }
      }
    },
    animation = {
      filename = "__ultimateCore__/graphics/animation/ufp_bullet_460mm.png",
      draw_as_glow = true,
      width = 80,
      height = 310,
      priority = "high"
    }
  },
})