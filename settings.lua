data:extend({
    {
        name            = 'umr_expensive_tech_mode',
        type            = 'bool-setting',
        setting_type    = 'startup',
        default_value   = false,
        order           = 'a-a',    
    },
    {
        name            = 'umr_modded_recipes',
        type            = 'bool-setting',
        setting_type    = 'startup',
        default_value   = true,
        order           = 'a-b',    
    },
    {
        name            = 'umr_modded_crafting_recipes',
        type            = 'bool-setting',
        setting_type    = 'startup',
        default_value   = true,
        order           = 'a-c',    
    },
})
if mods["space-age"] then
    data:extend({
    {
        name            = "umr_metallurgic_science_pack",
        type            = 'bool-setting',
        setting_type    = 'startup',
        default_value   = false,
        order           = 'a-d',
    },
    {
        name            = "umr_electromagnetic_science_pack",
        type            = 'bool-setting',
        setting_type    = 'startup',
        default_value   = false,
        order           = 'a-e',
    },
    {
        name            = "umr_agricultural_science_pack",
        type            = 'bool-setting',
        setting_type    = 'startup',
        default_value   = false,
        order           = 'a-f',
    },
    {
        name            = "umr_cryogenic_science_pack",
        type            = 'bool-setting',
        setting_type    = 'startup',
        default_value   = false,
        order           = 'a-g',
    },
    })
end