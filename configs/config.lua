-- config.lua
local default_settings = {
    show_gui = true;
    enable_alerts = true;
    enable_audio = true;
    alert_threshold = 90;
    audio_alert_threshold = 100;
    auto_refresh_interval = 60; -- seconds
    selected_sound = 0;
    sort_by = 'completion'; -- 'level', 'area', 'completion'
    sort_ascending = false;
    debug = false;
    show_config_gui = false;
};

local settings = require('settings');
local config_data = settings.load(default_settings);  -- Only holds settings data

-- Define a helper table to wrap logic around the config data
local config = {};

function config.get(key)
    return config_data[key];
end;

function config.set(key, value)
    config_data[key] = value;
    settings.save();
end;

function config.toggle(key)
    if type(config_data[key]) == 'boolean' then
        config_data[key] = not config_data[key];
        settings.save();
        return config_data[key];
    end;
    return nil;
end;

function config.raw()
    return config_data;
end;

return config;
