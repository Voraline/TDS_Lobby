-- Script path: ReplicatedStorage.Client.Controllers.Shared.DebugController.Tools.TowerStatEditor
-- Decompile time: 4.25 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Client.Controllers.Shared.DebugController.Tools.Types)
local u18 = nil
local u19 = {Name = "Tower Stat Editor", _towers = {}}

local function replicateStats(a1, a2) -- Line: 12
    -- upvalues: HttpService (val), u19 (val), ReplicatedStorage (val)
    local v1 = HttpService:JSONEncode({[a1] = a2})
    if not u19._cmdrFunction then
        u19._cmdrFunction = (ReplicatedStorage:WaitForChild("CmdrClient")):WaitForChild("CmdrFunction")
    end
    u19._cmdrFunction:InvokeServer((("set_tower_stats \"%*\""):format((v1:gsub("\"", "\\\"")))))
end

function u19.canRun() -- Line: 25
    return workspace:FindFirstChild("Type").Value == "Game"
end

function u19.createWindows() -- Line: 29 -- upvalues: u18 (ref), u19 (val)
    u18.Window({
        [u18.Args.Window.Title] = "Tower Stat Editor",
        [u18.Args.Window.NoClose] = true,
    }, {
        size = u18.State(Vector2.new(400, 200)),
        position = u18.State(Vector2.new(500, 200)),
    })
    u18.ComboArray({"Tower Selection"}, {index = u19._tower}, u19._allTowers)
    u18.Separator()
    u18.EditableTable({}, {table = u19._towerState})
    u18.End()
end

function u19.init() -- Line: 53 -- upvalues: u18 (ref), u19 (val), ReplicatedStorage (val), replicateStats (val)
    local Stats
    u18 = u19.Iris
    local v1 = {}
    for i, j in (ReplicatedStorage:WaitForChild("Content")):WaitForChild("Tower"):GetChildren() do
        Stats = require(j:WaitForChild("Stats"))
        u19._towers[j.Name] = Stats.Stats
        table.insert(v1, j.Name)
    end
    table.sort(v1, function(a1, a2) -- Line: 64
        return a1 < a2
    end)
    u19._allTowers = v1
    u19._tower = u18.State(v1[1])
    u19._towerState = u18.State(u19._towers[v1[1]])
    u19._tower:onChange(function(a1) -- Line: 73 -- upvalues: u19 (upval)
        u19._towerState:set(u19._towers[a1])
    end)
    u19._towerState:onChange(function(a1) -- Line: 77 -- upvalues: u19 (upval), replicateStats (upval)
        local v1 = u19._tower:get()
        if u19._towers[v1] ~= a1 then
            return
        end
        replicateStats(v1, a1)
    end)
end

return u19