-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useActiveSeasons
-- Decompile time: 1.05 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local Seasons = require(ReplicatedStorage.Shared.Data.Seasons)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useEvent = require(ReplicatedStorage.Client.Interfaces.Hooks.useEvent)
local useState = React.useState

local function getActiveSeasons() -- Line: 12 -- upvalues: table (val), Seasons (val)
    return table.keys(Seasons.ActiveSeasons)
end

return function() -- Line: 16 -- upvalues: useState (val), getActiveSeasons (val), useEvent (val), Seasons (val)
    local v1, u3 = useState(getActiveSeasons)
    useEvent(Seasons.UpdatedSeasons, function() -- Line: 19 -- upvalues: u3 (val), getActiveSeasons (upval)
        u3(getActiveSeasons())
    end)
    return v1
end