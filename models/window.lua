local window = {
    is_open = true,
    is_minimized = false,
    title = 'Goblin Ventures',
    size = { 700, 350 }
};

-- Update window state
function window:update_state(imgui)
    self.is_minimized = imgui.IsWindowCollapsed();
end

-- Get window title with completion info
function window:get_title(highest_completion, highest_area, highest_position)
    if self.is_minimized and highest_completion > 0 then
        return string.format('Goblin Ventures - %s%s: %d%%###ventures_window', 
            highest_area, 
            highest_position ~= '' and ' ' .. highest_position or '',
            highest_completion);
    end
    return 'Goblin Ventures###ventures_window';
end

return window;