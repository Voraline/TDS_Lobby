-- Script path: ReplicatedStorage.Client.Controllers.Shared.DebugController.Tools.EnemyStatEditor
-- Decompile time: 2.47 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Client.Controllers.Shared.DebugController.Tools.Types)
local u18 = nil
local u19 = {Name = "Enemy Stat Editor", _enemies = {}}

local function replicateStats(a1, a2) -- Line: 13
    -- upvalues: HttpService (val), u19 (val), ReplicatedStorage (val)
    local v1 = true
    local v2 = a1:match("^Legacy - (.+)$")
    if v2 then
        a1 = v2
        v1 = false
    end
    local v3 = HttpService:JSONEncode({[a1] = a2})
    if not u19._cmdrFunction then
        u19._cmdrFunction = (ReplicatedStorage:WaitForChild("CmdrClient")):WaitForChild("CmdrFunction")
    end
    u19._cmdrFunction:InvokeServer((("set_enemy_stats %* \"%*\""):format(v1, (v3:gsub("\"", "\\\"")))))
end

function u19.canRun() -- Line: 36
    return workspace:FindFirstChild("Type").Value == "Game"
end

function u19.createWindows() -- Line: 40 -- upvalues: u18 (ref), u19 (val)
    u18.Window({
        [u18.Args.Window.Title] = "Enemy Stat Editor",
        [u18.Args.Window.NoClose] = true,
    }, {
        size = u18.State(Vector2.new(400, 200)),
        position = u18.State(Vector2.new(600, 450)),
    })
    u18.ComboArray({"Enemy Selection"}, {index = u19._enemy}, u19._allEnemies)
    u18.Separator()
    u18.EditableTable({}, {table = u19._enemyState})
    u18.End()
end

function u19.init() -- Line: 64 -- upvalues: u18 (ref), u19 (val), ReplicatedStorage (val), replicateStats (val)
    local Stats, v1, v2
    if workspace:FindFirstChild("Type").Value ~= "Game" then
        return
    end
    u18 = u19.Iris
    local v3 = {}
    local Content = ReplicatedStorage:WaitForChild("Content")
    local v4 = {"Enemies", "NewEnemies"}
    local v5 = nil
    local v6 = nil
    for i, j in v4, v5, v6 do
        v2 = j == "Enemies"
        for k, n in Content:WaitForChild(j):GetChildren() do
            if n:FindFirstChild("Stats") then
                Stats = require(n.Stats)
                v1 = ("%*%*"):format(if not v2 then "" else "Legacy - ", n.Name)
                u19._enemies[v1] = Stats
                table.insert(v3, v1)
            else
                warn("WARNING: Enemy " .. n.Name .. " does not have a Stats module")
            end
        end
    end
    table.sort(v3, function(a1, a2) -- Line: 91
        return a1 < a2
    end)
    u19._allEnemies = v3
    u19._enemy = u18.State(v3[1])
    u19._enemyState = u18.State(u19._enemies[v3[1]])
    u19._enemy:onChange(function(a1) -- Line: 100 -- upvalues: u19 (upval)
        u19._enemyState:set(u19._enemies[a1])
    end)
    u19._enemyState:onChange(function(a1) -- Line: 104 -- upvalues: u19 (upval), replicateStats (upval)
        local v1 = u19._enemy:get()
        if u19._enemies[v1] ~= a1 then
            return
        end
        replicateStats(v1, a1)
    end)
end

return u19