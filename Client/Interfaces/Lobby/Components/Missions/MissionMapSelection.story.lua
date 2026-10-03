-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Missions.MissionMapSelection.story
-- Decompile time: 1.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local MissionMapSelection = require(script.Parent.MissionMapSelection)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
local useState = React.useState
local mount = React.mount
local unmount = React.unmount

local function Content() -- Line: 12
    -- upvalues: useState (val), Enum (val), createElement (val), MissionMapSelection (val)
    local v1, u3 = useState({})
    local v2, u7 = useState(true)
    local u11 = {"Candy Valley", "Chess Board", "Dusty Bridges", "Black Spot Exchange", "Atlas Colosseum"}
    return createElement(MissionMapSelection, {
        maps = u11,
        mode = Enum.Gamemode.Survival,
        completed = v1,
        Visible = v2,
        cancelled = function() -- Line: 31 -- upvalues: u7 (val), u11 (val), u3 (val)
            print("canclled!")
            u7(false)
            task.delay(1, function() -- Line: 36 -- upvalues: u11 (upval), u3 (upval), u7 (upval)
                local v1 = {}
                for i, v in ipairs(u11) do
                    if (math.random(1, 4)) <= 2 then
                        table.insert(v1, v)
                    end
                end
                u3(v1)
                u7(true)
            end)
        end,
    })
end

return function(a1) -- Line: 52 -- upvalues: createElement (val), Content (val), ReactRoblox (val)
    local v1 = createElement(Content)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 57 -- upvalues: u7 (val)
        u7:unmount()
    end
end