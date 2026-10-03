-- Script path: ReplicatedStorage.Client.Controllers.Shared.DebugController.Tools.ServerSettings
-- Decompile time: 4.88 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local TagReplicator = require(ReplicatedStorage.Client.Modules.TagReplicator)
require(script.Parent.Types)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u31 = nil
local u32 = nil
local u33 = {Name = "Server Settings"}

local function runCommand(a1) -- Line: 16 -- upvalues: u33 (val), ReplicatedStorage (val) -- types: a1: string
    task.spawn(function() -- Line: 17 -- upvalues: u33 (upval), ReplicatedStorage (upval), a1 (val)
        if not u33._cmdrFunction then
            u33._cmdrFunction = (ReplicatedStorage:WaitForChild("CmdrClient")):WaitForChild("CmdrFunction")
        end
        u33._cmdrFunction:InvokeServer(a1)
    end)
end

function u33.createWindows() -- Line: 27
    -- upvalues: u32 (ref), u33 (val), ReplicatedStorage (val), Enum (val), table (val)
    local v1
    u32.Window({
        [u32.Args.Window.Title] = "Server Settings",
        [u32.Args.Window.NoClose] = true,
    }, {
        size = u32.State(Vector2.new(400, 200)),
        position = u32.State(Vector2.new(600, 450)),
    })
    if u32.SliderNum({"Time-Scale", 0.1, 0, 20}, {number = u33.timeScale}).numberChanged() then
        local u50 = ("time-scale %*"):format((u33.timeScale:get()))
        task.spawn(function() -- Line: 17 -- upvalues: u33 (upval), ReplicatedStorage (upval), u50 (val)
            if not u33._cmdrFunction then
                u33._cmdrFunction = (ReplicatedStorage:WaitForChild("CmdrClient")):WaitForChild("CmdrFunction")
            end
            u33._cmdrFunction:InvokeServer(u50)
        end)
    end
    if u32.InputNum({
        [u32.Args.InputNum.Text] = "Desired Wave",
        [u32.Args.InputNum.NoButtons] = true,
        [u32.Args.InputNum.Min] = 0,
        [u32.Args.InputNum.Max] = 60,
        [u32.Args.InputNum.Increment] = 1,
        [u32.Args.InputNum.Format] = {"%d"},
    }, {number = u33.desiredWave}) then
        local u100 = ("wave %*"):format((u33.desiredWave:get()))
        task.spawn(function() -- Line: 17 -- upvalues: u33 (upval), ReplicatedStorage (upval), u100 (val)
            if not u33._cmdrFunction then
                u33._cmdrFunction = (ReplicatedStorage:WaitForChild("CmdrClient")):WaitForChild("CmdrFunction")
            end
            u33._cmdrFunction:InvokeServer(u100)
        end)
    end
    u32.SameLine()
    if u32.Button({"Cancel Timer"}).clicked() then
        local spawn_3 = task.spawn
        local u115 = "cancel_timer"
        spawn_3(function() -- Line: 17 -- upvalues: u33 (upval), ReplicatedStorage (upval), u115 (val)
            if not u33._cmdrFunction then
                u33._cmdrFunction = (ReplicatedStorage:WaitForChild("CmdrClient")):WaitForChild("CmdrFunction")
            end
            u33._cmdrFunction:InvokeServer(u115)
        end)
    end
    if u32.Button({"God Mode"}).clicked() then
        local spawn_4 = task.spawn
        local u126 = "god"
        spawn_4(function() -- Line: 17 -- upvalues: u33 (upval), ReplicatedStorage (upval), u126 (val)
            if not u33._cmdrFunction then
                u33._cmdrFunction = (ReplicatedStorage:WaitForChild("CmdrClient")):WaitForChild("CmdrFunction")
            end
            u33._cmdrFunction:InvokeServer(u126)
        end)
    end
    if u32.Button({"Uncap Towers"}).clicked() then
        local spawn_5 = task.spawn
        local u137 = "disable_tower_limit true"
        spawn_5(function() -- Line: 17 -- upvalues: u33 (upval), ReplicatedStorage (upval), u137 (val)
            if not u33._cmdrFunction then
                u33._cmdrFunction = (ReplicatedStorage:WaitForChild("CmdrClient")):WaitForChild("CmdrFunction")
            end
            u33._cmdrFunction:InvokeServer(u137)
        end)
    end
    u32.End()
    u32.SameLine()
    if u32.Button({"Kill All"}).clicked() then
        local spawn_6 = task.spawn
        local u154 = "kill_all"
        spawn_6(function() -- Line: 17 -- upvalues: u33 (upval), ReplicatedStorage (upval), u154 (val)
            if not u33._cmdrFunction then
                u33._cmdrFunction = (ReplicatedStorage:WaitForChild("CmdrClient")):WaitForChild("CmdrFunction")
            end
            u33._cmdrFunction:InvokeServer(u154)
        end)
    end
    if u32.Button({"Win Game"}).clicked() then
        local spawn_7 = task.spawn
        local u165 = "end_game Win"
        spawn_7(function() -- Line: 17 -- upvalues: u33 (upval), ReplicatedStorage (upval), u165 (val)
            if not u33._cmdrFunction then
                u33._cmdrFunction = (ReplicatedStorage:WaitForChild("CmdrClient")):WaitForChild("CmdrFunction")
            end
            u33._cmdrFunction:InvokeServer(u165)
        end)
    end
    if u32.Button({"Lose Game"}).clicked() then
        local spawn_8 = task.spawn
        local u176 = "end_game Lose"
        spawn_8(function() -- Line: 17 -- upvalues: u33 (upval), ReplicatedStorage (upval), u176 (val)
            if not u33._cmdrFunction then
                u33._cmdrFunction = (ReplicatedStorage:WaitForChild("CmdrClient")):WaitForChild("CmdrFunction")
            end
            u33._cmdrFunction:InvokeServer(u176)
        end)
    end
    u32.End()
    u32.Text({"Modifiers"})
    u32.Table({
        4,
        [u32.Args.Table.RowBg] = false,
        [u32.Args.Table.BordersOuter] = false,
        [u32.Args.Table.BordersInner] = false,
    })
    local v2 = 1
    for i = 1, 10 do
        for j = 1, 4 do
            u32.NextColumn()
            v1 = Enum.GameModifier.ToString(v2)
            if not v1 then
                break
            end
            if table.find(u33.modifiers:get(), v2) then
                u32.Text({v1})
            elseif u32.Button({v1}).clicked() then
                local u247 = ("add_modifier %*"):format(v1)
                task.spawn(function() -- Line: 17 -- upvalues: u33 (upval), ReplicatedStorage (upval), u247 (val)
                    if not u33._cmdrFunction then
                        u33._cmdrFunction = (ReplicatedStorage:WaitForChild("CmdrClient")):WaitForChild("CmdrFunction")
                    end
                    u33._cmdrFunction:InvokeServer(u247)
                end)
            end
            v2 = v2 + 1
        end
    end
    u32.End()
    u32.End()
end

function u33.init() -- Line: 121
    -- upvalues: u32 (ref), u33 (val), u31 (ref), TagReplicator (val), ReplicatedStorage (val), GameState (val)
    -- upvalues: table (val)
    local v1, v2
    u32 = u33.Iris
    u31 = TagReplicator.getReplicatorEntityFromFolder(ReplicatedStorage:WaitForChild("Modifiers"))
    u33.timeScale = u32.State(GameState.State.TimeScale)
    u33.desiredWave = u32.State(0)
    u33.modifiers = u32.State({})
    u31.Changed:Connect(function(a1, a2) -- Line: 130 -- upvalues: u33 (upval), table (upval)
        local v1 = tonumber(a1)
        if not v1 then
            return
        end
        local v2 = a2 == true
        local v3 = u33.modifiers:get()
        if not v2 then
            table.remove(v3, table.find(v3, v1))
            u33.modifiers:set(v3)
            return
        end
        if table.find(v3, v1) then
            return
        end
        table.insert(v3, v1)
        u33.modifiers:set(v3)
    end)
    for i in u31:GetAllStates() do
        v1 = tonumber(i)
        if v1 then
            v2 = u33.modifiers:get()
            if not table.find(v2, v1) then
                table.insert(v2, v1)
                u33.modifiers:set(v2)
            end
        end
    end
    ;(GameState.Replicator:GetStateChangedSignal("TimeScale")):Connect(function(a1) -- Line: 163 -- upvalues: u33 (upval) -- types: a1: number
        u33.timeScale:set(a1)
    end)
end

return u33