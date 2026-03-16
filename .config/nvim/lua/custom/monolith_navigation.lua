-- Custom functions implemented by AA
-- ==========
local M = {}

-- Simple hello_world function to test module loading
function M.hello_world()
    local current_path = vim.fn.expand('%:p')
    local current_note = string.match(current_path, '(%d%d%d%d%-%d%d%-%d%d)%.md$')

    if current_note then
        print("Hello, your current daily note is: " .. current_note)
    else
        print("Hello, you are not in a daily note!")
    end
end

-- Function for jumping and navigating obsidian daily notes
-- # ported from nvim.init to lua 
function M.jump_daily_note(direction)
    local current_path = vim.fn.expand('%:p')
    local current_note = string.match(current_path, '(%d%d%d%d%-%d%d%-%d%d)%.md$')
    local path = "/home/aman/obsidian/monolith/daily/"

    -- Default to today's note if not in a daily note and no specific direction
    if not current_note and (direction == '' or direction == nil) then
        local today_date = os.date("%Y-%m-%d")
        local today_path = path .. today_date .. ".md"
        vim.cmd("edit " .. today_path)
        return
    end

    -- If the direction is empty and in a daily note, navigate to today's note
    if direction == '' or direction == nil then
        local today_date = os.date("%Y-%m-%d")
        local today_path = path .. today_date .. ".md"
        vim.cmd("edit " .. today_path)
        return
    end

    -- For forward/backward navigation, require a valid daily note
    if not current_note then
        vim.api.nvim_err_writeln("Not in a valid daily note")
        return
    end

    local current_note_date = current_note
    local destination_date

    if direction == 'forward' then
        destination_date = vim.fn.systemlist("date -d '" .. current_note_date .. " +1 day' +'%Y-%m-%d'")[1]
    elseif direction == 'backward' then
        destination_date = vim.fn.systemlist("date -d '" .. current_note_date .. " -1 day' +'%Y-%m-%d'")[1]
    else
        vim.api.nvim_err_writeln("Invalid direction")
        return
    end

    local destination_fname = destination_date .. ".md"
    local destination_path = path .. destination_fname

    -- Check if the destination note exists
    local max_attempts = 365 -- Limit the number of attempts to avoid infinite loop
    local attempt = 0

    while not vim.loop.fs_stat(destination_path) and attempt < max_attempts do
        if direction == 'forward' then
            destination_date = vim.fn.systemlist("date -d '" .. destination_date .. " +1 day' +'%Y-%m-%d'")[1]
        elseif direction == 'backward' then
            destination_date = vim.fn.systemlist("date -d '" .. destination_date .. " -1 day' +'%Y-%m-%d'")[1]
        end

        destination_fname = destination_date .. ".md"
        destination_path = path .. destination_fname
        attempt = attempt + 1
    end

    if vim.loop.fs_stat(destination_path) then
        vim.cmd("edit " .. destination_path)
    else
        vim.api.nvim_err_writeln("No note available for " .. direction .. " : " .. destination_path)
    end
end


return M
