-- Script path: ReplicatedStorage.Client.Controllers.Shared.DebugController.Tools.SystemsProfiler
-- Decompile time: 6.43 ms

local ContextActionService = game:GetService("ContextActionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("UserInputService")
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
require(script.Parent.Types)
local u25 = nil
local u26 = {Name = "Systems Profiler"}
local u28 = {"Custom", "RenderStepped", "Heartbeat", "Stepped", "PreSimulation"}
local u34 = {}

local function getSeenStates() -- Line: 23 -- upvalues: u28 (val), Scheduler (val), u34 (val)
    local v1
    local v2 = nil
    local v3 = nil
    for i, j in u28, v2, v3 do
        v1 = Scheduler.profiles[j]
        if v1 then
            for k in v1 do
                if not u34[k] then
                    u34[k] = true
                end
            end
        end
    end
    return u34
end

function u26.canRun() -- Line: 40
    return true
end

function u26.createWindows() -- Line: 44
    -- upvalues: u25 (ref), u26 (val), u28 (val), Scheduler (val), getSeenStates (val)
    local disabledSystems, v1, v2, v3, v4
    local Window = u25.Window
    local v5 = {}
    v5[u25.Args.Window.Title] = u26.Name
    v5[u25.Args.Window.NoClose] = true
    Window(v5, {
        size = u25.State(Vector2.new(400, 200)),
        position = u25.State(Vector2.new(600, 450)),
    })
    u25.Text("Press Shift + F4 to pause/resume")
    v5 = nil
    local v6 = nil
    for i, j in u28, v5, v6 do
        v1 = u25.State({})
        v2 = u25.State(false)
        v3 = Scheduler.profiles[j]
        if v3 then
            u25.CollapsingHeader({(("%* Systems"):format(j))}, {isUncollapsed = v2})
            if v2:get() then
                if not u26._paused:get() then
                    v4 = {}
                    for k, n in v3 do
                        if not Scheduler.disabledSystems[k] then
                            table.insert(v4, {name = k, value = n.average})
                        end
                    end
                    v1:set(v4)
                end
                u25.PlotTimeGraph({""}, {values = v1})
            end
            u25.End()
        end
    end
    u25.End()
    u25.Window({
        [u25.Args.Window.Title] = "Toggle Systems",
        [u25.Args.Window.NoClose] = true,
    }, {
        size = u25.State(Vector2.new(400, 200)),
        position = u25.State(Vector2.new(600, 700)),
    })
    for m in getSeenStates() do
        v1 = u25.State(Scheduler.disabledSystems[m] ~= true)
        v3 = {m}
        u25.Checkbox(v3, {isChecked = v1})
        if v1:changed() then
            disabledSystems = Scheduler.disabledSystems
            v3 = v1:get() == false
            disabledSystems[m] = v3
        end
    end
    u25.End()
end

function u26.init() -- Line: 109 -- upvalues: u25 (ref), u26 (val), ContextActionService (val)
    u25 = u26.Iris
    u26._disabled = u25.State({})
    u26._paused = u25.State(false)
    local v1 = ContextActionService
    local F4 = Enum.KeyCode.F4
    v1:BindAction("TOGGLE_SCHEDULER_PAUSED", function(a1, a2, a3) -- Line: 115 -- upvalues: u26 (upval)
        if a2 == Enum.UserInputState.Begin and a3:IsModifierKeyDown(Enum.ModifierKey.Shift) then
            u26._paused:set(not (u26._paused:get()))
            return
        end
    end, false, F4)
end

return u26