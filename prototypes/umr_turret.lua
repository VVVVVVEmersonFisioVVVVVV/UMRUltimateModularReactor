local util = require("util")
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")

local function umrautocannonsheet()
  return {
    layers = {
      {
        filename = "__ultimateCore__/graphics/umr_turret/umr_autocannon-sheet.png",
        priority = "high",
        scale = 0.5,
        width = 512,
        height = 512,
        direction_count = 64,
        frame_count = 1,
        line_length = 8,
        axially_symmetrical = false,
        shift = {0, 0}
      }
    }
  }
end

local function umrheavyLaserSheet()
  return {
    layers = {
      {
        filename = "__ultimateCore__/graphics/umr_turret/umr_heavylaser-sheet.png",
        priority = "high",
        scale = 0.5,
        width = 512,
        height = 512,
        line_length = 8,
        axially_symmetrical = false,
        direction_count = 64,
        frame_count = 1,
        shift = {0.5, -1.6}
      }
    }
  }
end

local function umrcannonsheet()
  return {
    layers = {
      {
        filename = "__ultimateCore__/graphics/umr_turret/umr_cannon-sheet.png",
        priority = "high",
        scale = 0.4,
        width = 512,
        height = 512,
        direction_count = 64,
        frame_count = 1,
        line_length = 8,
        axially_symmetrical = false,
        shift = {0.6, -0.7}
      }
    }
  }
end

local function umrrocketsheet()
  return {
    layers = {
      {
        filename = "__ultimateCore__/graphics/umr_turret/umr_rocket-sheet.png",
        priority = "high",
        scale = 0.35,
        width = 512,
        height = 512,
        frame_count = 1,
        direction_count = 64,
        line_length = 8,
        axially_symmetrical = false,
        shift = {0, -1}
      },
      {
        filename = "__ultimateCore__/graphics/umr_turret/umr_rocket-sheet-sh.png",
        priority = "high",
        scale = 0.35,
        width = 512,
        height = 512,
        frame_count = 1,
        direction_count = 64,
        line_length = 8,
        axially_symmetrical = false,
        draw_as_shadow = true,
        shift = {0, -1}
      }
    }
  }
end

local function umrflamerSheet()
  return {
    layers = {
      {
        filename = "__ultimateCore__/graphics/umr_turret/umr_flamer-sheet.png",
        priority = "high",
        scale = 0.6,
        width = 512,
        height = 512,
        line_length = 8,
        axially_symmetrical = false,
        direction_count = 64,
        frame_count = 1,
        shift = {0, -0.2}
      }
    }
  }
end

local function umrplasmaSheet()
  return {
    layers = {
      {
        filename = "__ultimateCore__/graphics/umr_turret/umr_plasma-sheet.png",
        priority = "high",
        scale = 0.4,
        width = 512,
        height = 512,
        line_length = 8,
        axially_symmetrical = false,
        direction_count = 64,
        frame_count = 1,
        shift = {0.4, -1.3}
      }
    }
  }
end

data:extend({

-- ******************************************************************
-- ***************** UMR Autocannon Turret **************************
-- ******************************************************************
  {
    type = "item",
    name = "umr_autocannon-turret_entity",
    icons = {
      {
        icon = "__ultimateCore__/graphics/umr_turret/umr_autocannon_item.png",
        icon_size = 64
      }
    },
    place_result = "umr_autocannon-turret_entity",
    stack_size = 20,
    inventory_move_sound = item_sounds.turret_inventory_move,
    pick_sound = item_sounds.turret_inventory_pickup,
    drop_sound = item_sounds.turret_inventory_move,
    subgroup = "umr_item_subgroup_l",
    order = "a-a"
  },
  {
    type = "recipe",
    name = "umr_autocannon-turret_entity",
    enabled = false,
    ingredients = {
      {type = "item", name = "copper-plate", amount = 500},
      {type = "item", name = "steel-plate", amount = 500},
      {type = "item", name = "advanced-circuit", amount = 500},
      {type = "item", name = "concrete", amount = 500},
      {type = "item", name = "accumulator", amount = 100},
      {type = "item", name = "nuclear-reactor", amount = 1}
    },
    results = {
      {type = "item", name = "umr_autocannon-turret_entity", amount = 1}
    },
    energy_required = 10
  },
  {
    type = "ammo-turret",
    name = "umr_autocannon-turret_entity",
    icon = "__ultimateCore__/graphics/umr_turret/umr_autocannon_item.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    max_health = 5250,
    corpse = "nuclear-reactor-remnants",
    dying_explosion = "nuclear-reactor-explosion",
    open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.65},
    close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.65},
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    circuit_connector_sprites = circuit_connector_definitions["gun-turret"].sprites,
    circuit_wire_connection_points = circuit_connector_definitions["gun-turret"].points,
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    damaged_trigger_effect = hit_effects.entity(),
    impact_category = "metal-large",
    collision_box = {{-1.75, -1.75}, {1.75, 1.75}},
    selection_box = {{-2, -2}, {2, 2}},
    preparing_speed = 0.04,
    preparing_sound = sounds.gun_turret_activate,
    folding_sound = sounds.gun_turret_deactivate,
    folding_speed = 0.04,
    inventory_size = 1,
    automated_ammo_count = 10,
    alert_when_attacking = true,
    minable = {
      mining_time = 5,
      result = "umr_autocannon-turret_entity"
    },
    energy_per_shot = "16MJ",
    energy_source = {
      type = "electric",
      buffer_capacity = "160MJ",
      drain = "160kW",
      usage_priority = "primary-input"
    },
    folded_animation = umrautocannonsheet(),
    folding_animation = umrautocannonsheet(),
    prepared_animation = umrautocannonsheet(),
    preparing_animation = umrautocannonsheet(),
    graphics_set = {
      base_animation = umrautocannonsheet()
    },
    rotation_speed = 0.008,
    resistances = {
      {type = "fire", percent = 60},
      {type = "impact", percent = 50},
      {type = "explosion", percent = 50},
      {type = "physical", percent = 50},
      {type = "acid", percent = 50},
      {type = "electric", percent = 50},
      {type = "laser", percent = 50},
      {type = "poison", percent = 50}
    },
    call_for_help_radius = 65,
    prepare_range = 70,
    shoot_in_prepare_state = false,
    attack_parameters = {
      type = "projectile",
      ammo_category = "bullet",
      health_penalty = 1,
      cooldown = 60,
      projectile_creation_distance = 1,
      damage_modifier = 6,
      projectile_creation_offsets = {
        {1, -1.6},
        {-1, -1.6},
      },
      shell_particle = {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {-0.0625, 0},
        creation_distance = -1.925,
        starting_frame_speed = 0.2,
        starting_frame_speed_deviation = 0.1
      },
      range = 65,
      sound = {
        { filename = "__base__/sound/fight/tank-cannon.ogg",   volume = 1 },
        { filename = "__base__/sound/fight/tank-cannon-1.ogg", volume = 1 },
        { filename = "__base__/sound/fight/tank-cannon-2.ogg", volume = 1 },
        { filename = "__base__/sound/fight/tank-cannon-3.ogg", volume = 1 },
        { filename = "__base__/sound/fight/tank-cannon-4.ogg", volume = 1 },
        { filename = "__base__/sound/fight/tank-cannon-5.ogg", volume = 1 }
      }
    }
  },
-- UMR Autocannon Turret 45
  {
    type = "item",
    name = "umr_autocannon-turret45_entity",
    icons = {
      {
        icon = "__ultimateCore__/graphics/umr_turret/umr_autocannon_item.png",
        icon_size = 64
      }
    },
    place_result = "umr_autocannon-turret45_entity",
    stack_size = 20,
    inventory_move_sound = item_sounds.turret_inventory_move,
    pick_sound = item_sounds.turret_inventory_pickup,
    drop_sound = item_sounds.turret_inventory_move,
    subgroup = "umr_item_subgroup_m",
    order = "a-a"
  },
  {
    type = "recipe",
    name = "umr_autocannon-turret45_entity",
    enabled = false,
    ingredients = {
      {type = "item", name = "copper-plate", amount = 500},
      {type = "item", name = "steel-plate", amount = 500},
      {type = "item", name = "advanced-circuit", amount = 500},
      {type = "item", name = "concrete", amount = 500},
      {type = "item", name = "accumulator", amount = 100},
      {type = "item", name = "nuclear-reactor", amount = 1}
    },
    results = {
      {type = "item", name = "umr_autocannon-turret45_entity", amount = 1}
    },
    energy_required = 10
  },
  {
    type = "ammo-turret",
    name = "umr_autocannon-turret45_entity",
    icon = "__ultimateCore__/graphics/umr_turret/umr_autocannon_item.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation", "building-direction-8-way"},
    max_health = 5250,
    corpse = "nuclear-reactor-remnants",
    dying_explosion = "nuclear-reactor-explosion",
    open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.65},
    close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.65},
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    circuit_connector_sprites = circuit_connector_definitions["gun-turret"].sprites,
    circuit_wire_connection_points = circuit_connector_definitions["gun-turret"].points,
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    damaged_trigger_effect = hit_effects.entity(),
    impact_category = "metal-large",
    collision_box = {{-1.75, -1.75}, {1.75, 1.75}},
    selection_box = {{-2, -2}, {2, 2}},
    preparing_speed = 0.04,
    preparing_sound = sounds.gun_turret_activate,
    folding_sound = sounds.gun_turret_deactivate,
    folding_speed = 0.04,
    inventory_size = 1,
    automated_ammo_count = 10,
    alert_when_attacking = true,
    minable = {
      mining_time = 5,
      result = "umr_autocannon-turret45_entity"
    },
    energy_per_shot = "16MJ",
    energy_source = {
      type = "electric",
      buffer_capacity = "160MJ",
      drain = "160kW",
      usage_priority = "primary-input"
    },
    folded_animation = umrautocannonsheet(),
    folding_animation = umrautocannonsheet(),
    prepared_animation = umrautocannonsheet(),
    preparing_animation = umrautocannonsheet(),
    graphics_set = {
      base_animation = umrautocannonsheet()
    },
    rotation_speed = 0.008,
    turret_base_has_direction = true,
    resistances = {
      {type = "fire", percent = 60},
      {type = "impact", percent = 50},
      {type = "explosion", percent = 50},
      {type = "physical", percent = 50},
      {type = "acid", percent = 50},
      {type = "electric", percent = 50},
      {type = "laser", percent = 50},
      {type = "poison", percent = 50}
    },
    call_for_help_radius = 65,
    prepare_range = 70,
    shoot_in_prepare_state = false,
    attack_parameters = {
      type = "projectile",
      ammo_category = "bullet",
      health_penalty = 1,
      cooldown = 60,
      projectile_creation_distance = 1,
      damage_modifier = 6,
      projectile_creation_offsets = {
        {1, -1.6},
        {-1, -1.6},
      },
      shell_particle = {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {-0.0625, 0},
        creation_distance = -1.925,
        starting_frame_speed = 0.2,
        starting_frame_speed_deviation = 0.1
      },
      min_range = 10,
      range = 65,
      turn_range = 0.125,
      sound = {
        { filename = "__base__/sound/fight/tank-cannon.ogg",   volume = 1 },
        { filename = "__base__/sound/fight/tank-cannon-1.ogg", volume = 1 },
        { filename = "__base__/sound/fight/tank-cannon-2.ogg", volume = 1 },
        { filename = "__base__/sound/fight/tank-cannon-3.ogg", volume = 1 },
        { filename = "__base__/sound/fight/tank-cannon-4.ogg", volume = 1 },
        { filename = "__base__/sound/fight/tank-cannon-5.ogg", volume = 1 }
      }
    }
  },
-- ******************************************************************
-- ***************** UMR Heavy Laser Turret *************************
-- ******************************************************************
  {
    type = "item",
    name = "umr_heavylaser-turret_entity",
    icons = {
      {
        icon = "__ultimateCore__/graphics/umr_turret/umr_heavylaser_item.png",
        icon_size = 64
      }
    },
    place_result = "umr_heavylaser-turret_entity",
    stack_size = 20,
    inventory_move_sound = item_sounds.turret_inventory_move,
    pick_sound = item_sounds.turret_inventory_pickup,
    drop_sound = item_sounds.turret_inventory_move,
    subgroup = "umr_item_subgroup_l",
    order = "b-b"
  },
  {
    type = "recipe",
    name = "umr_heavylaser-turret_entity",
    enabled = false,
    ingredients = {
      {type = "item", name = "copper-plate", amount = 500},
      {type = "item", name = "steel-plate", amount = 500},
      {type = "item", name = "advanced-circuit", amount = 500},
      {type = "item", name = "concrete", amount = 500},
      {type = "item", name = "accumulator", amount = 100},
      {type = "item", name = "nuclear-reactor", amount = 1}
    },
    results = {
      {type = "item", name = "umr_heavylaser-turret_entity", amount = 1}
    },
    energy_required = 10
  },
  {
    type = "electric-turret",
    name = "umr_heavylaser-turret_entity",
    icon = "__ultimateCore__/graphics/umr_turret/umr_heavylaser_item.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    max_health = 5250,
    corpse = "nuclear-reactor-remnants",
    dying_explosion = "nuclear-reactor-explosion",
    open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.65},
    close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.65},
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    circuit_connector_sprites = circuit_connector_definitions["gun-turret"].sprites,
    circuit_wire_connection_points = circuit_connector_definitions["gun-turret"].points,
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    damaged_trigger_effect = hit_effects.entity(),
    impact_category = "metal-large",
    collision_box = {{-1.75, -1.75}, {1.75, 1.75}},
    selection_box = {{-2, -2}, {2, 2}},
    preparing_speed = 0.04,
    preparing_sound = sounds.laser_turret_activate,
    folding_sound = sounds.laser_turret_deactivate,
    folding_speed = 0.04,
    alert_when_attacking = true,
    minable = {
      mining_time = 5,
      result = "umr_heavylaser-turret_entity"
    },
    energy_source = {
      type = "electric",
      buffer_capacity = "160MJ",
      drain = "160kW",
      usage_priority = "primary-input"
    },
    folded_animation = umrheavyLaserSheet(),
    folding_animation = umrheavyLaserSheet(),
    prepared_animation = umrheavyLaserSheet(),
    preparing_animation = umrheavyLaserSheet(),
    graphics_set = {
      base_animation = umrheavyLaserSheet()
    },
    rotation_speed = 0.008,
    resistances = {
      {type = "fire", percent = 60},
      {type = "impact", percent = 50},
      {type = "explosion", percent = 50},
      {type = "physical", percent = 50},
      {type = "acid", percent = 50},
      {type = "electric", percent = 50},
      {type = "laser", percent = 50},
      {type = "poison", percent = 50}
    },
    call_for_help_radius = 65,
    prepare_range = 70,
    shoot_in_prepare_state = false,
    attack_parameters = {
        type = "beam",
        cooldown = 40,
        range = 65,
        range_mode = "center-to-bounding-box",
        source_direction_count = 64,
        source_offset = {-0.4, -2.4},
        damage_modifier = 3,
        ammo_category = "laser",
        ammo_type = {
            energy_consumption = "16MJ",
            action = {
                type = "direct",
                action_delivery = {
                    type = "beam",
                    beam = "umr_laser-beam",
                    max_length = 65,
                    duration = 40,
                    source_offset = {0, -1.3 }
              }
           }
        }
     }
  },
-- UMR Heavy Laser Turret 45
  {
    type = "item",
    name = "umr_heavylaser-turret45_entity",
    icons = {
      {
        icon = "__ultimateCore__/graphics/umr_turret/umr_heavylaser_item.png",
        icon_size = 64
      }
    },
    place_result = "umr_heavylaser-turret45_entity",
    stack_size = 20,
    inventory_move_sound = item_sounds.turret_inventory_move,
    pick_sound = item_sounds.turret_inventory_pickup,
    drop_sound = item_sounds.turret_inventory_move,
    subgroup = "umr_item_subgroup_m",
    order = "b-b"
  },
  {
    type = "recipe",
    name = "umr_heavylaser-turret45_entity",
    enabled = false,
    ingredients = {
      {type = "item", name = "copper-plate", amount = 500},
      {type = "item", name = "steel-plate", amount = 500},
      {type = "item", name = "advanced-circuit", amount = 500},
      {type = "item", name = "concrete", amount = 500},
      {type = "item", name = "accumulator", amount = 100},
      {type = "item", name = "nuclear-reactor", amount = 1}
    },
    results = {
      {type = "item", name = "umr_heavylaser-turret45_entity", amount = 1}
    },
    energy_required = 10
  },
  {
    type = "electric-turret",
    name = "umr_heavylaser-turret45_entity",
    icon = "__ultimateCore__/graphics/umr_turret/umr_heavylaser_item.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation", "building-direction-8-way"},
    max_health = 5250,
    corpse = "nuclear-reactor-remnants",
    dying_explosion = "nuclear-reactor-explosion",
    open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.65},
    close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.65},
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    circuit_connector_sprites = circuit_connector_definitions["gun-turret"].sprites,
    circuit_wire_connection_points = circuit_connector_definitions["gun-turret"].points,
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    damaged_trigger_effect = hit_effects.entity(),
    impact_category = "metal-large",
    collision_box = {{-1.75, -1.75}, {1.75, 1.75}},
    selection_box = {{-2, -2}, {2, 2}},
    preparing_speed = 0.04,
    preparing_sound = sounds.laser_turret_activate,
    folding_sound = sounds.laser_turret_deactivate,
    folding_speed = 0.04,
    alert_when_attacking = true,
    minable = {
      mining_time = 5,
      result = "umr_heavylaser-turret45_entity"
    },
    energy_source = {
      type = "electric",
      buffer_capacity = "160MJ",
      drain = "160kW",
      usage_priority = "primary-input"
    },
    folded_animation = umrheavyLaserSheet(),
    folding_animation = umrheavyLaserSheet(),
    prepared_animation = umrheavyLaserSheet(),
    preparing_animation = umrheavyLaserSheet(),
    graphics_set = {
      base_animation = umrheavyLaserSheet()
    },
    rotation_speed = 0.008,
    turret_base_has_direction = true,
    resistances = {
      {type = "fire", percent = 60},
      {type = "impact", percent = 50},
      {type = "explosion", percent = 50},
      {type = "physical", percent = 50},
      {type = "acid", percent = 50},
      {type = "electric", percent = 50},
      {type = "laser", percent = 50},
      {type = "poison", percent = 50}
    },
    call_for_help_radius = 65,
    prepare_range = 70,
    shoot_in_prepare_state = false,
    attack_parameters = {
        type = "beam",
        cooldown = 40,
        range = 65,
        min_range = 6,
        turn_range = 0.125,
        range_mode = "center-to-bounding-box",
        source_direction_count = 64,
        source_offset = {-0.4, -2.4},
        damage_modifier = 3,
        ammo_category = "laser",
        ammo_type = {
            energy_consumption = "16MJ",
            action = {
                type = "direct",
                action_delivery = {
                    type = "beam",
                    beam = "umr_laser-beam",
                    max_length = 65,
                    duration = 40,
                    source_offset = {0, -1.3 }
              }
           }
        }
     }
  },
-- ******************************************************************
-- ********************** UMR Cannon Turret *************************
-- ******************************************************************
  {
    type = "item",
    name = "umr_cannon-turret_entity",
    icons = {
      {
        icon = "__ultimateCore__/graphics/umr_turret/umr_cannon_item.png",
        icon_size = 64
      }
    },
    place_result = "umr_cannon-turret_entity",
    stack_size = 20,
    inventory_move_sound = item_sounds.turret_inventory_move,
    pick_sound = item_sounds.turret_inventory_pickup,
    drop_sound = item_sounds.turret_inventory_move,
    subgroup = "umr_item_subgroup_l",
    order = "c-c"
  },
  {
    type = "recipe",
    name = "umr_cannon-turret_entity",
    enabled = false,
    ingredients = {
      {type = "item", name = "copper-plate", amount = 500},
      {type = "item", name = "steel-plate", amount = 500},
      {type = "item", name = "advanced-circuit", amount = 500},
      {type = "item", name = "concrete", amount = 500},
      {type = "item", name = "accumulator", amount = 100},
      {type = "item", name = "nuclear-reactor", amount = 1}
    },
    results = {
      {type = "item", name = "umr_cannon-turret_entity", amount = 1}
    },
    energy_required = 10
  },
  {
    type = "ammo-turret",
    name = "umr_cannon-turret_entity",
    icon = "__ultimateCore__/graphics/umr_turret/umr_cannon_item.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    max_health = 5250,
    corpse = "nuclear-reactor-remnants",
    dying_explosion = "nuclear-reactor-explosion",
    open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.65},
    close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.65},
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    circuit_connector_sprites = circuit_connector_definitions["gun-turret"].sprites,
    circuit_wire_connection_points = circuit_connector_definitions["gun-turret"].points,
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    damaged_trigger_effect = hit_effects.entity(),
    impact_category = "metal-large",
    collision_box = {{-1.75, -1.75}, {1.75, 1.75}},
    selection_box = {{-2, -2}, {2, 2}},
    preparing_speed = 0.04,
    preparing_sound = sounds.gun_turret_activate,
    folding_sound = sounds.gun_turret_deactivate,
    folding_speed = 0.04,
    inventory_size = 1,
    automated_ammo_count = 10,
    alert_when_attacking = true,
    minable = {
      mining_time = 5,
      result = "umr_cannon-turret_entity"
    },
    energy_per_shot = "16MJ",
    energy_source = {
      type = "electric",
      buffer_capacity = "160MJ",
      drain = "160kW",
      usage_priority = "primary-input"
    },
    folded_animation = umrcannonsheet(),
    folding_animation = umrcannonsheet(),
    prepared_animation = umrcannonsheet(),
    preparing_animation = umrcannonsheet(),
    graphics_set = {
      base_animation = umrcannonsheet()
    },
    rotation_speed = 0.008,
    resistances = {
      {type = "fire", percent = 60},
      {type = "impact", percent = 50},
      {type = "explosion", percent = 50},
      {type = "physical", percent = 50},
      {type = "acid", percent = 50},
      {type = "electric", percent = 50},
      {type = "laser", percent = 50},
      {type = "poison", percent = 50}
    },
    call_for_help_radius = 70,
    prepare_range = 75,
    shoot_in_prepare_state = false,
    attack_parameters = {
      type = "projectile",
      ammo_category = "cannon-shell",
      cooldown = 360,
      damage_modifier = 1.5,
      projectile_creation_offsets = {
        {0, -2.8},
      },
      shell_particle = {
        name = "artillery-shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {0, 0},
        creation_distance = -1.925,
        starting_frame_speed = 0.2,
        starting_frame_speed_deviation = 0.1
      },
      range = 70,
      min_range = 6,
      sound = {
        { filename = "__base__/sound/fight/tank-cannon.ogg",   volume = 1 },
        { filename = "__base__/sound/fight/tank-cannon-1.ogg", volume = 1 },
        { filename = "__base__/sound/fight/tank-cannon-2.ogg", volume = 1 },
        { filename = "__base__/sound/fight/tank-cannon-3.ogg", volume = 1 },
        { filename = "__base__/sound/fight/tank-cannon-4.ogg", volume = 1 },
        { filename = "__base__/sound/fight/tank-cannon-5.ogg", volume = 1 }
      }
    }
  },
-- UMR Cannon Turret 45
  {
    type = "item",
    name = "umr_cannon-turret45_entity",
    icons = {
      {
        icon = "__ultimateCore__/graphics/umr_turret/umr_cannon_item.png",
        icon_size = 64
      }
    },
    place_result = "umr_cannon-turret45_entity",
    stack_size = 20,
    inventory_move_sound = item_sounds.turret_inventory_move,
    pick_sound = item_sounds.turret_inventory_pickup,
    drop_sound = item_sounds.turret_inventory_move,
    subgroup = "umr_item_subgroup_m",
    order = "c-c"
  },
  {
    type = "recipe",
    name = "umr_cannon-turret45_entity",
    enabled = false,
    ingredients = {
      {type = "item", name = "copper-plate", amount = 500},
      {type = "item", name = "steel-plate", amount = 500},
      {type = "item", name = "advanced-circuit", amount = 500},
      {type = "item", name = "concrete", amount = 500},
      {type = "item", name = "accumulator", amount = 100},
      {type = "item", name = "nuclear-reactor", amount = 1}
    },
    results = {
      {type = "item", name = "umr_cannon-turret45_entity", amount = 1}
    },
    energy_required = 10
  },
  {
    type = "ammo-turret",
    name = "umr_cannon-turret45_entity",
    icon = "__ultimateCore__/graphics/umr_turret/umr_cannon_item.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation", "building-direction-8-way"},
    max_health = 5250,
    corpse = "nuclear-reactor-remnants",
    dying_explosion = "nuclear-reactor-explosion",
    open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.65},
    close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.65},
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    circuit_connector_sprites = circuit_connector_definitions["gun-turret"].sprites,
    circuit_wire_connection_points = circuit_connector_definitions["gun-turret"].points,
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    damaged_trigger_effect = hit_effects.entity(),
    impact_category = "metal-large",
    collision_box = {{-1.75, -1.75}, {1.75, 1.75}},
    selection_box = {{-2, -2}, {2, 2}},
    preparing_speed = 0.04,
    preparing_sound = sounds.gun_turret_activate,
    folding_sound = sounds.gun_turret_deactivate,
    folding_speed = 0.04,
    inventory_size = 1,
    automated_ammo_count = 10,
    alert_when_attacking = true,
    minable = {
      mining_time = 5,
      result = "umr_cannon-turret45_entity"
    },
    energy_per_shot = "16MJ",
    energy_source = {
      type = "electric",
      buffer_capacity = "160MJ",
      drain = "160kW",
      usage_priority = "primary-input"
    },
    folded_animation = umrcannonsheet(),
    folding_animation = umrcannonsheet(),
    prepared_animation = umrcannonsheet(),
    preparing_animation = umrcannonsheet(),
    graphics_set = {
      base_animation = umrcannonsheet()
    },
    rotation_speed = 0.008,
    turret_base_has_direction = true,
    resistances = {
      {type = "fire", percent = 60},
      {type = "impact", percent = 50},
      {type = "explosion", percent = 50},
      {type = "physical", percent = 50},
      {type = "acid", percent = 50},
      {type = "electric", percent = 50},
      {type = "laser", percent = 50},
      {type = "poison", percent = 50}
    },
    call_for_help_radius = 70,
    prepare_range = 75,
    shoot_in_prepare_state = false,
    attack_parameters = {
      type = "projectile",
      ammo_category = "cannon-shell",
      cooldown = 360,
      damage_modifier = 1.5,
      projectile_creation_offsets = {
        {0, -2.8},
      },
      shell_particle = {
        name = "artillery-shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {0, 0},
        creation_distance = -1.925,
        starting_frame_speed = 0.2,
        starting_frame_speed_deviation = 0.1
      },
      range = 70,
      min_range = 30,
      turn_range = 0.125,
      sound = {
        { filename = "__base__/sound/fight/tank-cannon.ogg",   volume = 1 },
        { filename = "__base__/sound/fight/tank-cannon-1.ogg", volume = 1 },
        { filename = "__base__/sound/fight/tank-cannon-2.ogg", volume = 1 },
        { filename = "__base__/sound/fight/tank-cannon-3.ogg", volume = 1 },
        { filename = "__base__/sound/fight/tank-cannon-4.ogg", volume = 1 },
        { filename = "__base__/sound/fight/tank-cannon-5.ogg", volume = 1 }
      }
    }
  },
-- ******************************************************************
-- ********************** UMR Rocket Turret *************************
-- ******************************************************************
  {
    type = "item",
    name = "umr_rocket-turret_entity",
    icons = {
      {
        icon = "__ultimateCore__/graphics/umr_turret/umr_rocket_item.png",
        icon_size = 64
      }
    },
    place_result = "umr_rocket-turret_entity",
    stack_size = 20,
    inventory_move_sound = item_sounds.turret_inventory_move,
    pick_sound = item_sounds.turret_inventory_pickup,
    drop_sound = item_sounds.turret_inventory_move,
    subgroup = "umr_item_subgroup_l",
    order = "d-d"
  },
  {
    type = "recipe",
    name = "umr_rocket-turret_entity",
    enabled = false,
    ingredients = {
      {type = "item", name = "copper-plate", amount = 500},
      {type = "item", name = "steel-plate", amount = 500},
      {type = "item", name = "advanced-circuit", amount = 500},
      {type = "item", name = "concrete", amount = 500},
      {type = "item", name = "accumulator", amount = 100},
      {type = "item", name = "nuclear-reactor", amount = 1}
    },
    results = {
      {type = "item", name = "umr_rocket-turret_entity", amount = 1}
    },
    energy_required = 10
  },
  {
    type = "ammo-turret",
    name = "umr_rocket-turret_entity",
    icon = "__ultimateCore__/graphics/umr_turret/umr_rocket_item.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    max_health = 5250,
    corpse = "nuclear-reactor-remnants",
    dying_explosion = "nuclear-reactor-explosion",
    open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.65},
    close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.65},
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    circuit_connector_sprites = circuit_connector_definitions["gun-turret"].sprites,
    circuit_wire_connection_points = circuit_connector_definitions["gun-turret"].points,
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    damaged_trigger_effect = hit_effects.entity(),
    impact_category = "metal-large",
    collision_box = {{-1.75, -1.75}, {1.75, 1.75}},
    selection_box = {{-2, -2}, {2, 2}},
    preparing_speed = 0.04,
    preparing_sound = sounds.gun_turret_activate,
    folding_sound = sounds.gun_turret_deactivate,
    folding_speed = 0.04,
    inventory_size = 1,
    automated_ammo_count = 10,
    alert_when_attacking = true,
    minable = {
      mining_time = 5,
      result = "umr_rocket-turret_entity"
    },
    energy_per_shot = "16MJ",
    energy_source = {
      type = "electric",
      buffer_capacity = "160MJ",
      drain = "160kW",
      usage_priority = "primary-input"
    },
    folded_animation = umrrocketsheet(),
    folding_animation = umrrocketsheet(),
    prepared_animation = umrrocketsheet(),
    preparing_animation = umrrocketsheet(),
    graphics_set = {
      base_animation = umrrocketsheet()
    },
    rotation_speed = 0.008,
    resistances = {
      {type = "fire", percent = 60},
      {type = "impact", percent = 50},
      {type = "explosion", percent = 50},
      {type = "physical", percent = 50},
      {type = "acid", percent = 50},
      {type = "electric", percent = 50},
      {type = "laser", percent = 50},
      {type = "poison", percent = 50}
    },
    call_for_help_radius = 80,
    prepare_range = 85,
    shoot_in_prepare_state = false,
    attack_parameters = {
      type = "projectile",
      ammo_category = "rocket",
      cooldown = 30,
      damage_modifier = 0.25,
      projectile_creation_distance = 8,
      projectile_creation_offsets = {
        -- left tubes
        {-0.7,   6.0},
        {-0.4,   6.0},
        {-0.488, 6.212},
        {-0.7,   6.3},
        {-0.912, 6.212},
        {-1.0,   6.0},
        {-0.912, 5.788},
        {-0.7,   5.7},
        {-0.488, 5.788},
        -- right tubes
        { 0.7,   6.0},
        { 1.0,   6.0},
        { 0.912, 6.212},
        { 0.7,   6.3},
        { 0.488, 6.212},
        { 0.4,   6.0},
        { 0.488, 5.788},
        { 0.7,   5.7},
        { 0.912, 5.788},
      },
      range = 80,
      min_range = 6,
      sound = {
        { filename = "__base__/sound/fight/rocket-launcher.ogg",   volume = 1 }
      }
    }
  },
-- UMR Rocket Turret 45
  {
    type = "item",
    name = "umr_rocket-turret45_entity",
    icons = {
      {
        icon = "__ultimateCore__/graphics/umr_turret/umr_rocket_item.png",
        icon_size = 64
      }
    },
    place_result = "umr_rocket-turret45_entity",
    stack_size = 20,
    inventory_move_sound = item_sounds.turret_inventory_move,
    pick_sound = item_sounds.turret_inventory_pickup,
    drop_sound = item_sounds.turret_inventory_move,
    subgroup = "umr_item_subgroup_m",
    order = "d-d"
  },
  {
    type = "recipe",
    name = "umr_rocket-turret45_entity",
    enabled = false,
    ingredients = {
      {type = "item", name = "copper-plate", amount = 500},
      {type = "item", name = "steel-plate", amount = 500},
      {type = "item", name = "advanced-circuit", amount = 500},
      {type = "item", name = "concrete", amount = 500},
      {type = "item", name = "accumulator", amount = 100},
      {type = "item", name = "nuclear-reactor", amount = 1}
    },
    results = {
      {type = "item", name = "umr_rocket-turret45_entity", amount = 1}
    },
    energy_required = 10
  },
  {
    type = "ammo-turret",
    name = "umr_rocket-turret45_entity",
    icon = "__ultimateCore__/graphics/umr_turret/umr_rocket_item.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation", "building-direction-8-way"},
    max_health = 5250,
    corpse = "nuclear-reactor-remnants",
    dying_explosion = "nuclear-reactor-explosion",
    open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.65},
    close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.65},
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    circuit_connector_sprites = circuit_connector_definitions["gun-turret"].sprites,
    circuit_wire_connection_points = circuit_connector_definitions["gun-turret"].points,
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    damaged_trigger_effect = hit_effects.entity(),
    impact_category = "metal-large",
    collision_box = {{-1.75, -1.75}, {1.75, 1.75}},
    selection_box = {{-2, -2}, {2, 2}},
    preparing_speed = 0.04,
    preparing_sound = sounds.gun_turret_activate,
    folding_sound = sounds.gun_turret_deactivate,
    folding_speed = 0.04,
    inventory_size = 1,
    automated_ammo_count = 10,
    alert_when_attacking = true,
    minable = {
      mining_time = 5,
      result = "umr_rocket-turret45_entity"
    },
    energy_per_shot = "16MJ",
    energy_source = {
      type = "electric",
      buffer_capacity = "160MJ",
      drain = "160kW",
      usage_priority = "primary-input"
    },
    folded_animation = umrrocketsheet(),
    folding_animation = umrrocketsheet(),
    prepared_animation = umrrocketsheet(),
    preparing_animation = umrrocketsheet(),
    graphics_set = {
      base_animation = umrrocketsheet()
    },
    rotation_speed = 0.008,
    turret_base_has_direction = true,
    resistances = {
      {type = "fire", percent = 60},
      {type = "impact", percent = 50},
      {type = "explosion", percent = 50},
      {type = "physical", percent = 50},
      {type = "acid", percent = 50},
      {type = "electric", percent = 50},
      {type = "laser", percent = 50},
      {type = "poison", percent = 50}
    },
    call_for_help_radius = 80,
    prepare_range = 85,
    shoot_in_prepare_state = false,
    attack_parameters = {
      type = "projectile",
      ammo_category = "rocket",
      cooldown = 30,
      damage_modifier = 0.25,
      projectile_creation_distance = 8,
      projectile_creation_offsets = {
        -- left tubes
        {-0.7,   6.0},
        {-0.4,   6.0},
        {-0.488, 6.212},
        {-0.7,   6.3},
        {-0.912, 6.212},
        {-1.0,   6.0},
        {-0.912, 5.788},
        {-0.7,   5.7},
        {-0.488, 5.788},
        -- right tubes
        { 0.7,   6.0},
        { 1.0,   6.0},
        { 0.912, 6.212},
        { 0.7,   6.3},
        { 0.488, 6.212},
        { 0.4,   6.0},
        { 0.488, 5.788},
        { 0.7,   5.7},
        { 0.912, 5.788},
      },
      range = 80,
      min_range = 30,
      turn_range = 0.125,
      sound = {
        { filename = "__base__/sound/fight/rocket-launcher.ogg",   volume = 1 }
      }
    }
  },
-- ******************************************************************
-- ******************* UMR Heavy Flamer Turret **********************
-- ******************************************************************
  {
    type = "item",
    name = "umr_flamer-turret_entity",
    icons = {
      {
        icon = "__ultimateCore__/graphics/umr_turret/umr_flamer_item.png",
        icon_size = 64
      }
    },
    place_result = "umr_flamer-turret_entity",
    stack_size = 20,
    inventory_move_sound = item_sounds.turret_inventory_move,
    pick_sound = item_sounds.turret_inventory_pickup,
    drop_sound = item_sounds.turret_inventory_move,
    subgroup = "umr_item_subgroup_l",
    order = "e-e"
  },
  {
    type = "recipe",
    name = "umr_flamer-turret_entity",
    enabled = false,
    ingredients = {
      {type = "item", name = "copper-plate", amount = 500},
      {type = "item", name = "steel-plate", amount = 500},
      {type = "item", name = "advanced-circuit", amount = 500},
      {type = "item", name = "concrete", amount = 500},
      {type = "item", name = "accumulator", amount = 100},
      {type = "item", name = "nuclear-reactor", amount = 1}
    },
    results = {
      {type = "item", name = "umr_flamer-turret_entity", amount = 1}
    },
    energy_required = 10
  },
  {
    type = "fluid-turret",
    name = "umr_flamer-turret_entity",
    icon = "__ultimateCore__/graphics/umr_turret/umr_flamer_item.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    max_health = 5250,
    corpse = "nuclear-reactor-remnants",
    dying_explosion = "nuclear-reactor-explosion",
    open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.65},
    close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.65},
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    circuit_connector_sprites = circuit_connector_definitions["flamethrower-turret"].sprites,
    circuit_wire_connection_points = circuit_connector_definitions["flamethrower-turret"].points,
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    damaged_trigger_effect = hit_effects.entity(),
    impact_category = "metal-large",
    collision_box = {{-1.75, -1.75}, {1.75, 1.75}},
    selection_box = {{-2, -2}, {2, 2}},
    preparing_speed = 0.04,
    preparing_sound = sounds.flamethrower_turret_activate,
    folding_sound = sounds.flamethrower_turret_deactivate,
    folding_speed = 0.04,
    ending_attack_speed = 0.2,
    minable = {
      mining_time = 5,
      result = "umr_flamer-turret_entity"
    },
    fluid_box =
    {
      production_type = "none", -- FluidTurret has its own logic
      secondary_draw_order = 0,
      render_layer = "lower-object",
      --pipe_picture = fireutil.flamethrower_turret_pipepictures(),
      pipe_picture = assembler2pipepictures(),
      pipe_covers = pipecoverspictures(),
      volume = 100,
      pipe_connections =
      {
        { direction = defines.direction.south, position = {0.5, 1.5} },
        { direction = defines.direction.south, position = {-0.5, 1.5} },
        { direction = defines.direction.north, position = {0.5, -1.5} },
        { direction = defines.direction.north, position = {-0.5, -1.5} },
        { direction = defines.direction.west, position = {-1.5, 0.5} },
        { direction = defines.direction.west, position = {-1.5, -0.5} },
        { direction = defines.direction.east, position = {1.5, 0.5} },
        { direction = defines.direction.east, position = {1.5, -0.5} }
      }
    },
    fluid_buffer_size = 100,
    fluid_buffer_input_flow = 1000,
    activation_buffer_ratio = 0.25,
    folded_animation = umrflamerSheet(),
    folding_animation = umrflamerSheet(),
    prepared_animation = umrflamerSheet(),
    preparing_animation = umrflamerSheet(),
    graphics_set = {
      base_animation = umrflamerSheet()
    },
    rotation_speed = 0.008,
    turret_base_has_direction = true,
    resistances = {
      {type = "fire", percent = 100},
      {type = "impact", percent = 50},
      {type = "explosion", percent = 50},
      {type = "physical", percent = 50},
      {type = "acid", percent = 50},
      {type = "electric", percent = 50},
      {type = "laser", percent = 50},
      {type = "poison", percent = 50}
    },
    call_for_help_radius = 100,
    prepare_range = 105,
    shoot_in_prepare_state = false,
    attack_parameters =
    {
      type = "stream",
      cooldown = 18,
      range = 100,
      min_range = 6,
      fire_penalty = 15,
      -- lead_target_for_projectile_speed = 0.2* 0.75 * 1.5,
      fluids =
      {
        {type = "umr_interface_fluid", damage_modifier = 1},
        {type = "umr_amplifier_fluid", damage_modifier = 2},
        {type = "umr_core_fluid", damage_modifier = 4},
        {type = "umr_output_fluid", damage_modifier = 8}
      },
      fluid_consumption = 1,
      gun_barrel_length = 2.5, -- pushes it forward in firing direction
      gun_center_shift = {0, -2.5},
      ammo_category = "flamethrower",
      ammo_type =
      {
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = "umr_flamethrower-fire-stream"
          }
        }
      },
      cyclic_sound =
      {
        begin_sound = sound_variations("__base__/sound/fight/flamethrower-turret-start", 3, 0.5),
        middle_sound = sound_variations("__base__/sound/fight/flamethrower-turret-mid", 3, 0.5),
        end_sound = sound_variations("__base__/sound/fight/flamethrower-turret-end", 3, 0.5)
      }
    }
  },
-- UMR Heavy Flamer Turret 45
  {
    type = "item",
    name = "umr_flamer-turret45_entity",
    icons = {
      {
        icon = "__ultimateCore__/graphics/umr_turret/umr_flamer_item.png",
        icon_size = 64
      }
    },
    place_result = "umr_flamer-turret45_entity",
    stack_size = 20,
    inventory_move_sound = item_sounds.turret_inventory_move,
    pick_sound = item_sounds.turret_inventory_pickup,
    drop_sound = item_sounds.turret_inventory_move,
    subgroup = "umr_item_subgroup_m",
    order = "e-e"
  },
  {
    type = "recipe",
    name = "umr_flamer-turret45_entity",
    enabled = false,
    ingredients = {
      {type = "item", name = "copper-plate", amount = 500},
      {type = "item", name = "steel-plate", amount = 500},
      {type = "item", name = "advanced-circuit", amount = 500},
      {type = "item", name = "concrete", amount = 500},
      {type = "item", name = "accumulator", amount = 100},
      {type = "item", name = "nuclear-reactor", amount = 1}
    },
    results = {
      {type = "item", name = "umr_flamer-turret45_entity", amount = 1}
    },
    energy_required = 10
  },
  {
    type = "fluid-turret",
    name = "umr_flamer-turret45_entity",
    icon = "__ultimateCore__/graphics/umr_turret/umr_flamer_item.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    max_health = 5250,
    corpse = "nuclear-reactor-remnants",
    dying_explosion = "nuclear-reactor-explosion",
    open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.65},
    close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.65},
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    circuit_connector_sprites = circuit_connector_definitions["flamethrower-turret"].sprites,
    circuit_wire_connection_points = circuit_connector_definitions["flamethrower-turret"].points,
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    damaged_trigger_effect = hit_effects.entity(),
    impact_category = "metal-large",
    collision_box = {{-1.75, -1.75}, {1.75, 1.75}},
    selection_box = {{-2, -2}, {2, 2}},
    preparing_speed = 0.04,
    preparing_sound = sounds.flamethrower_turret_activate,
    folding_sound = sounds.flamethrower_turret_deactivate,
    folding_speed = 0.04,
    ending_attack_speed = 0.2,
    minable = {
      mining_time = 5,
      result = "umr_flamer-turret45_entity"
    },
    fluid_box =
    {
      production_type = "none", -- FluidTurret has its own logic
      secondary_draw_order = 0,
      render_layer = "lower-object",
      --pipe_picture = fireutil.flamethrower_turret_pipepictures(),
      pipe_picture = assembler2pipepictures(),
      pipe_covers = pipecoverspictures(),
      volume = 100,
      pipe_connections =
      {
        { direction = defines.direction.south, position = {0.5, 1.5} },
        { direction = defines.direction.south, position = {-0.5, 1.5} },
        { direction = defines.direction.north, position = {0.5, -1.5} },
        { direction = defines.direction.north, position = {-0.5, -1.5} },
        { direction = defines.direction.west, position = {-1.5, 0.5} },
        { direction = defines.direction.west, position = {-1.5, -0.5} },
        { direction = defines.direction.east, position = {1.5, 0.5} },
        { direction = defines.direction.east, position = {1.5, -0.5} }
      }
    },
    fluid_buffer_size = 100,
    fluid_buffer_input_flow = 1000,
    activation_buffer_ratio = 0.25,
    folded_animation = umrflamerSheet(),
    folding_animation = umrflamerSheet(),
    prepared_animation = umrflamerSheet(),
    preparing_animation = umrflamerSheet(),
    graphics_set = {
      base_animation = umrflamerSheet()
    },
    rotation_speed = 0.008,
    turret_base_has_direction = true,
    resistances = {
      {type = "fire", percent = 100},
      {type = "impact", percent = 50},
      {type = "explosion", percent = 50},
      {type = "physical", percent = 50},
      {type = "acid", percent = 50},
      {type = "electric", percent = 50},
      {type = "laser", percent = 50},
      {type = "poison", percent = 50}
    },
    call_for_help_radius = 100,
    prepare_range = 105,
    shoot_in_prepare_state = false,
    attack_parameters =
    {
      type = "stream",
      cooldown = 18,
      range = 100,
      min_range = 6,
      turn_range = 0.125,
      fire_penalty = 15,
      -- lead_target_for_projectile_speed = 0.2* 0.75 * 1.5,
      fluids =
      {
        {type = "umr_interface_fluid", damage_modifier = 1},
        {type = "umr_amplifier_fluid", damage_modifier = 2},
        {type = "umr_core_fluid", damage_modifier = 4},
        {type = "umr_output_fluid", damage_modifier = 8}
      },
      fluid_consumption = 0.2,
      gun_barrel_length = 2.5, -- pushes it forward in firing direction
      gun_center_shift = {0, -2.5},
      ammo_category = "flamethrower",
      ammo_type =
      {
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = "umr_flamethrower-fire-stream"
          }
        }
      },
      cyclic_sound =
      {
        begin_sound = sound_variations("__base__/sound/fight/flamethrower-turret-start", 3, 0.5),
        middle_sound = sound_variations("__base__/sound/fight/flamethrower-turret-mid", 3, 0.5),
        end_sound = sound_variations("__base__/sound/fight/flamethrower-turret-end", 3, 0.5)
      }
    }
  },
-- ******************************************************************
-- ******************** UMR Ion Cannon Turret ***********************
-- ******************************************************************
  {
    type = "item",
    name = "umr_plasma-turret_entity",
    icons = {
      {
        icon = "__ultimateCore__/graphics/umr_turret/umr_plasma_item.png",
        icon_size = 64
      }
    },
    place_result = "umr_plasma-turret_entity",
    stack_size = 20,
    inventory_move_sound = item_sounds.turret_inventory_move,
    pick_sound = item_sounds.turret_inventory_pickup,
    drop_sound = item_sounds.turret_inventory_move,
    subgroup = "umr_item_subgroup_l",
    order = "f-f"
  },
  {
    type = "recipe",
    name = "umr_plasma-turret_entity",
    enabled = false,
    ingredients = {
      {type = "item", name = "copper-plate", amount = 500},
      {type = "item", name = "steel-plate", amount = 500},
      {type = "item", name = "advanced-circuit", amount = 500},
      {type = "item", name = "concrete", amount = 500},
      {type = "item", name = "accumulator", amount = 100},
      {type = "item", name = "nuclear-reactor", amount = 1}
    },
    results = {
      {type = "item", name = "umr_plasma-turret_entity", amount = 1}
    },
    energy_required = 10
  },
  {
    type = "electric-turret",
    name = "umr_plasma-turret_entity",
    icon = "__ultimateCore__/graphics/umr_turret/umr_plasma_item.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    max_health = 5250,
    corpse = "nuclear-reactor-remnants",
    dying_explosion = "nuclear-reactor-explosion",
    open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.65},
    close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.65},
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    circuit_connector_sprites = circuit_connector_definitions["gun-turret"].sprites,
    circuit_wire_connection_points = circuit_connector_definitions["gun-turret"].points,
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    damaged_trigger_effect = hit_effects.entity(),
    impact_category = "metal-large",
    collision_box = {{-1.75, -1.75}, {1.75, 1.75}},
    selection_box = {{-2, -2}, {2, 2}},
    minable = {
      mining_time = 5,
      result = "umr_plasma-turret_entity"
    },
    energy_source = {
      type = "electric",
      buffer_capacity = "25GJ",
      input_flow_limit = "25GW",
      drain = "80MW",
      usage_priority = "primary-input"
    },
    folded_animation = umrplasmaSheet(),
    folding_animation = umrplasmaSheet(),
    prepared_animation = umrplasmaSheet(),
    preparing_animation = umrplasmaSheet(),
    graphics_set = {
      base_animation = umrplasmaSheet(),
    },
    rotation_speed = 0.002,
    resistances = {
      {type = "fire", percent = 60},
      {type = "impact", percent = 50},
      {type = "explosion", percent = 50},
      {type = "physical", percent = 50},
      {type = "acid", percent = 50},
      {type = "electric", percent = 50},
      {type = "laser", percent = 50},
      {type = "poison", percent = 50}
    },
    call_for_help_radius = 100,
    prepare_range = 105,
    shoot_in_prepare_state = false,
    attack_parameters = {
      type = "projectile",
      cooldown = 600,
      range = 100,
      min_range = 40,
      source_direction_count = 64,
      projectile_creation_distance = 0,
      projectile_creation_offsets = {
        {0, -2.5},
      },
      ammo_category = "laser",
       ammo_type = {
        category = "laser",
        type = "projectile",
        target_type = "position",
        energy_consumption = "24GJ",
        direction_deviation = 0.1,
        range_deviation = 0.1,
        action = {
          type = "direct",
          action_delivery = {
            type = "projectile",
            projectile = "umr_plasma_round",
            starting_speed = 5,
            max_range = 100,
            min_range = 40,
            source_effects = {
              type = "create-explosion",
              entity_name = "umr_big-explosion"
            }
          }
        }
      }
    }
  },
-- UMR Ion Cannon Turret
  {
    type = "item",
    name = "umr_plasma-turret45_entity",
    icons = {
      {
        icon = "__ultimateCore__/graphics/umr_turret/umr_plasma_item.png",
        icon_size = 64
      }
    },
    place_result = "umr_plasma-turret45_entity",
    stack_size = 20,
    inventory_move_sound = item_sounds.turret_inventory_move,
    pick_sound = item_sounds.turret_inventory_pickup,
    drop_sound = item_sounds.turret_inventory_move,
    subgroup = "umr_item_subgroup_m",
    order = "f-f"
  },
  {
    type = "recipe",
    name = "umr_plasma-turret45_entity",
    enabled = false,
    ingredients = {
      {type = "item", name = "copper-plate", amount = 500},
      {type = "item", name = "steel-plate", amount = 500},
      {type = "item", name = "advanced-circuit", amount = 500},
      {type = "item", name = "concrete", amount = 500},
      {type = "item", name = "accumulator", amount = 100},
      {type = "item", name = "nuclear-reactor", amount = 1}
    },
    results = {
      {type = "item", name = "umr_plasma-turret45_entity", amount = 1}
    },
    energy_required = 10
  },
  {
    type = "electric-turret",
    name = "umr_plasma-turret45_entity",
    icon = "__ultimateCore__/graphics/umr_turret/umr_plasma_item.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation", "building-direction-8-way"},
    max_health = 5250,
    corpse = "nuclear-reactor-remnants",
    dying_explosion = "nuclear-reactor-explosion",
    open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.65},
    close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.65},
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    circuit_connector_sprites = circuit_connector_definitions["gun-turret"].sprites,
    circuit_wire_connection_points = circuit_connector_definitions["gun-turret"].points,
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    damaged_trigger_effect = hit_effects.entity(),
    impact_category = "metal-large",
    collision_box = {{-1.75, -1.75}, {1.75, 1.75}},
    selection_box = {{-2, -2}, {2, 2}},
    minable = {
      mining_time = 5,
      result = "umr_plasma-turret45_entity"
    },
    energy_source = {
      type = "electric",
      buffer_capacity = "25GJ",
      input_flow_limit = "25GW",
      drain = "80MW",
      usage_priority = "primary-input"
    },
    folded_animation = umrplasmaSheet(),
    folding_animation = umrplasmaSheet(),
    prepared_animation = umrplasmaSheet(),
    preparing_animation = umrplasmaSheet(),
    graphics_set = {
      base_animation = umrplasmaSheet(),
    },
    rotation_speed = 0.002,
    turret_base_has_direction = true,
    resistances = {
      {type = "fire", percent = 60},
      {type = "impact", percent = 50},
      {type = "explosion", percent = 50},
      {type = "physical", percent = 50},
      {type = "acid", percent = 50},
      {type = "electric", percent = 50},
      {type = "laser", percent = 50},
      {type = "poison", percent = 50}
    },
    call_for_help_radius = 100,
    prepare_range = 105,
    shoot_in_prepare_state = false,
    attack_parameters = {
      type = "projectile",
      cooldown = 600,
      range = 100,
      min_range = 40,
      turn_range = 0.125,
      source_direction_count = 64,
      projectile_creation_distance = 0,
      projectile_creation_offsets = {
        {0, -2.5},
      },
      ammo_category = "laser",
       ammo_type = {
        category = "laser",
        type = "projectile",
        target_type = "position",
        energy_consumption = "24GJ",
        direction_deviation = 0.1,
        range_deviation = 0.1,
        action = {
          type = "direct",
          action_delivery = {
            type = "projectile",
            projectile = "umr_plasma_round",
            starting_speed = 5,
            max_range = 100,
            min_range = 40,
            source_effects = {
              type = "create-explosion",
              entity_name = "umr_big-explosion"
            }
          }
        }
      }
    }
  }
})