data:extend({
     {
        name = 'umr_tech',
        type = 'technology',
        icon = '__ultimateCore__/graphics/umr_tech.png',
        icon_size = 256,
        prerequisites = {'space-science-pack'},
        effects = {
            --interface
            { 
                type = 'unlock-recipe',
                recipe = 'umr_interface_entity',
            },
            --amplifier
            { 
                type = 'unlock-recipe',
                recipe = 'umr_amplifier_entity',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'umr_amplifier_blank_recipe',
            },
            --core
            { 
                type = 'unlock-recipe',
                recipe = 'umr_core_entity',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'umr_core_low_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'umr_core_medium_recipe',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'umr_core_max_recipe',
            },
            --output
            { 
                type = 'unlock-recipe',
                recipe = 'umr_output_entity',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'umr_output_max_recipe',
            },
            --converter
            { 
                type = 'unlock-recipe',
                recipe = 'umr_converter_entity',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'umr_converter_entity_2',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'umr_converter_heat_entity',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'umr_converter_heat_2_entity',
            },
            --reactor pipe
            { 
                type = 'unlock-recipe',
                recipe = 'umr_reactorpipe_entity',
            },
            --furnace
            { 
                type = 'unlock-recipe',
                recipe = 'umr_furnace_entity',
            },
            --heavy forge
            { 
                type = 'unlock-recipe',
                recipe = 'umr_heavyforge_entity',
            },
            --crafting
            { 
                type = 'unlock-recipe',
                recipe = 'umr_crafting_entity',
            },
            --oil refinery
            { 
                type = 'unlock-recipe',
                recipe = 'umr_oilrefinery_entity',
            },
            --chemical plant
            { 
                type = 'unlock-recipe',
                recipe = 'umr_chemicalplant_entity',
            },
            --lab
            { 
                type = 'unlock-recipe',
                recipe = 'umr_lab_entity',
            },
            --robot
            { 
                type = 'unlock-recipe',
                recipe = 'umr_roboport_entity',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'umr_robot_logistic_entity',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'umr_robot_construction_entity',
            },
        },
        unit = {
            count = 64000,
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1}, 
                {'space-science-pack',1}, 
            },
            time = 60,
        },
    },
    {
        name = 'umr_tech_machine',
        type = 'technology',
        icon = '__ultimateCore__/graphics/umr_tech_machine.png',
        icon_size = 256,
        prerequisites = {'umr_tech'},
        effects = {
            --furnace 2
            { 
                type = 'unlock-recipe',
                recipe = 'umr_furnace_entity_2',
            },
            -- crafting 2
            { 
                type = 'unlock-recipe',
                recipe = 'umr_crafting_entity_2',
            },
            -- lab 2
            { 
                type = 'unlock-recipe',
                recipe = 'umr_lab_entity_2',
            },
        },
        unit = {
            count = 640000,
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1}, 
                {'space-science-pack',1}, 
            },
            time = 60,
        },
    },
    {
        name = 'umr_tech_military',
        type = 'technology',
        icon = '__ultimateCore__/graphics/umr_tech_military.png',
        icon_size = 256,
        prerequisites = {'umr_tech'},
        effects = {
            { 
                type = 'unlock-recipe',
                recipe = 'umr_autocannon-turret_entity',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'umr_autocannon-turret45_entity',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'umr_heavylaser-turret_entity',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'umr_heavylaser-turret45_entity',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'umr_cannon-turret_entity',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'umr_cannon-turret45_entity',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'umr_rocket-turret_entity',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'umr_rocket-turret45_entity',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'umr_flamer-turret_entity',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'umr_flamer-turret45_entity',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'umr_plasma-turret_entity',
            },
            { 
                type = 'unlock-recipe',
                recipe = 'umr_plasma-turret45_entity',
            },
        },
        unit = {
            count = 640000,
            ingredients = {
                {'chemical-science-pack',1},
                {'automation-science-pack',1},
                {'military-science-pack',1},
                {'logistic-science-pack',1},
                {'production-science-pack',1},
                {'utility-science-pack',1}, 
                {'space-science-pack',1}, 
            },
            time = 60,
        },
    },
})