-- =============================================
-- UMR WELCOME MESSAGE SYSTEM
-- =============================================

-- Constants
local UMR_NTH_TICK_ID = 90126
local WELCOME_DELAY_TICK = 10

-- global initialization
local function init_globals()
    -- First ensure global exists (critical for on_load)
    if not global then
        if _G.global then
            global = _G.global
        else
            global = {}
        end
    end
    
    -- Then initialize our namespace
    global.umr = global.umr or {
        message_shown = false,
        game_ready = false,
        _version = 5  -- New version for this fix
    }
end

-- single-player check
local function is_single_player()
    -- Check if game API is available first
    if not game then return true end
    if not game.is_multiplayer then return true end
    return not game.is_multiplayer()
end

-- message display
local function print_welcome_message()
    -- Triple-check everything before proceeding
    if not is_single_player() then return end
    if not global or not global.umr then return end
    if global.umr.message_shown or not global.umr.game_ready then return end
    
    -- message construction
    local msg = "[img=virtual-signal/signal-info] [color=0,255,255]UMR Advisor online:[/color] "..
               "All qualified fuels validated, UMR interface ready. Welcome Engineer! "..
               "[img=virtual-signal/signal-info]"
    
    -- force iteration
    if game and game.forces then
        for _, force in pairs(game.forces) do
            if force and force.valid and force.print then
                pcall(force.print, msg)  -- Absolute safety
            end
        end
    end
end

-- Main handler
local function show_welcome_message()
    if not is_single_player() then return end
    pcall(function()
        init_globals()
        if not global.umr.message_shown then
            print_welcome_message()
            global.umr.message_shown = true
        end
        script.on_nth_tick(UMR_NTH_TICK_ID, nil)
    end)
end

-- =============================================
-- EVENT HANDLERS
-- =============================================

-- Initialization
script.on_init(function()
    pcall(function()
        init_globals()
        global.umr.message_shown = false
        
        if is_single_player() then
            script.on_nth_tick(WELCOME_DELAY_TICK, function()
                if game and game.tick and game.tick >= WELCOME_DELAY_TICK then
                    global.umr.game_ready = true
                    show_welcome_message()
                end
            end)
        end
    end)
end)

-- on_load
script.on_load(function()
    pcall(function()
        -- Only proceed if in single-player
        if not is_single_player() then return end
        
        -- Initialize globals if they don't exist
        if not global then
            if _G.global then
                global = _G.global
            else
                return  -- No globals available at all
            end
        end
        
        -- Check if we need to show message
        if global.umr and not global.umr.message_shown then
            script.on_nth_tick(WELCOME_DELAY_TICK, function()
                if game and game.tick and game.tick >= WELCOME_DELAY_TICK then
                    global.umr.game_ready = true
                    show_welcome_message()
                end
            end)
        end
    end)
end)

-- Configuration changes (triple-checked)
script.on_configuration_changed(function(data)
    pcall(function()
        init_globals()
        
        -- Only reset if our mod changed (verified 3 ways)
        if data and data.mod_changes and data.mod_changes["umrFixed"] then
            global.umr.message_shown = false
            if is_single_player() then
                script.on_nth_tick(WELCOME_DELAY_TICK, function()
                    if game and game.tick and game.tick >= WELCOME_DELAY_TICK then
                        global.umr.game_ready = true
                        show_welcome_message()
                    end
                end)
            end
        end
    end)
end)

-- Cleanup handlers (just in case)
script.on_nth_tick(WELCOME_DELAY_TICK, nil)
script.on_nth_tick(UMR_NTH_TICK_ID, nil)