data:extend({
     --amplifier
    {
        name = 'umr_amplifier_blank_recipe',
        type = 'recipe',
        enabled = false,
        category = 'umr_amplifier_category',
        main_product = "",
        subgroup = "umr_item_subgroup_n",
        order = "a-a",
        icons = {{icon = "__ultimateCore__/graphics/umr_amplifier/umr_amplifier_fluid.png", icon_size = 64}},
        ingredients = {
            {type="fluid", name="umr_interface_fluid", amount=70, temperature=100, fluidbox_index = 2},
            {type="fluid", name="steam", amount=1200, temperature=900, fluidbox_index = 1}
        },
        results = {
            {type="fluid", name="umr_amplifier_fluid", amount=70, temperature=6500},
        },
        energy_required = 10,
    },
    --core
    {
        name = 'umr_core_low_recipe',
        type = 'recipe',
        enabled = false,
        category = 'umr_core_category',
        main_product = "",
        subgroup = "umr_item_subgroup_n",
        order = "b-b",
        icons = {{icon = "__ultimateCore__/graphics/umr_core/umr_core_fluid.png", icon_size = 64}},
        ingredients = {
            {type="fluid", name="umr_amplifier_fluid", amount=140, temperature=6500},
        },
        results = {
            {type="fluid", name="umr_core_fluid", amount=140, temperature=6500},
        },
        energy_required = 10,
    },
    {
        name = 'umr_core_medium_recipe',
        type = 'recipe',
        enabled = false,
        category = 'umr_core_category',
        main_product = "",
        subgroup = "umr_item_subgroup_n",
        order = "c-c",
        icons = {{icon = "__ultimateCore__/graphics/umr_core/umr_core_fluid.png", icon_size = 64}},
        ingredients = {
            {type="fluid", name="umr_amplifier_fluid", amount=1400, temperature=6500},
        },
        results = {
            {type="fluid", name="umr_core_fluid", amount=1400, temperature=6500},
        },
        energy_required = 10,
    },
    {
        name = 'umr_core_max_recipe',
        type = 'recipe',
        enabled = false,
        category = 'umr_core_category',
        main_product = "",
        subgroup = "umr_item_subgroup_n",
        order = "d-d",
        icons = {{icon = "__ultimateCore__/graphics/umr_core/umr_core_fluid.png", icon_size = 64}},
        ingredients = {
            {type="fluid", name="umr_amplifier_fluid", amount=14000, temperature=6500},
        },
        results = {
            {type="fluid", name="umr_core_fluid", amount=14000, temperature=6500},
        },
        energy_required = 10,
    },
    --output
    {
        name = 'umr_output_max_recipe',
        type = 'recipe',
        enabled = false,
        category = 'umr_output_category',
        main_product = "",
        subgroup = "umr_item_subgroup_n",
        order = "e-e",
        icons = {{icon = "__ultimateCore__/graphics/umr_output/umr_output_fluid.png", icon_size = 64}},
        ingredients = {
            {type="fluid", name="umr_core_fluid", amount=60, temperature=6500, fluidbox_index = 2},
            {type="fluid", name="steam", amount=1200, temperature=900, fluidbox_index = 1}
        },
        results = {
            {type="fluid", name="umr_output_fluid", amount=240, temperature=6500},
        },
        energy_required = 10,
    },
})