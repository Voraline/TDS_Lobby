-- Script path: ReplicatedStorage.Client.Controllers.Shared.DebugController.Tools.PlacementEditor
-- Decompile time: 1.90 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(script.Parent.Types)
local u10 = nil
local u11 = {Name = "Placement Editor"}

local function runCommand(a1) -- Line: 10 -- upvalues: u11 (val), ReplicatedStorage (val) -- types: a1: string
    task.spawn(function() -- Line: 11 -- upvalues: u11 (upval), ReplicatedStorage (upval), a1 (val)
        if not u11._cmdrFunction then
            u11._cmdrFunction = (ReplicatedStorage:WaitForChild("CmdrClient")):WaitForChild("CmdrFunction")
        end
        if a1 == "save_placement" then
            u11.savePlacementJson:set((u11._cmdrFunction:InvokeServer(a1)))
            return
        end
        u11._cmdrFunction:InvokeServer(a1)
    end)
end

function u11.canRun() -- Line: 28
    return workspace:FindFirstChild("Type").Value == "Game"
end

function u11.createWindows() -- Line: 32 -- upvalues: u10 (ref), u11 (val), ReplicatedStorage (val)
    u10.Window({
        [u10.Args.Window.Title] = "Placement Editor",
        [u10.Args.Window.NoClose] = true,
    }, {
        size = u10.State(Vector2.new(400, 200)),
        position = u10.State(Vector2.new(600, 450)),
    })
    local value = u10.InputText({[u10.Args.InputText.Text] = "Placement JSON"}, {text = u11.placementJson}).state.text.value
    if value then
        u11.placementJson:set("")
        local u54 = ("load_placement %*"):format(value)
        task.spawn(function() -- Line: 11 -- upvalues: u11 (upval), ReplicatedStorage (upval), u54 (val)
            if not u11._cmdrFunction then
                u11._cmdrFunction = (ReplicatedStorage:WaitForChild("CmdrClient")):WaitForChild("CmdrFunction")
            end
            if u54 == "save_placement" then
                u11.savePlacementJson:set((u11._cmdrFunction:InvokeServer(u54)))
                return
            end
            u11._cmdrFunction:InvokeServer(u54)
        end)
    end
    if u10.Button({"Save"}).clicked() then
        local spawn_2 = task.spawn
        local u66 = "save_placement"
        spawn_2(function() -- Line: 11 -- upvalues: u11 (upval), ReplicatedStorage (upval), u66 (val)
            if not u11._cmdrFunction then
                u11._cmdrFunction = (ReplicatedStorage:WaitForChild("CmdrClient")):WaitForChild("CmdrFunction")
            end
            if u66 == "save_placement" then
                u11.savePlacementJson:set((u11._cmdrFunction:InvokeServer(u66)))
                return
            end
            u11._cmdrFunction:InvokeServer(u66)
        end)
    end
    u10.InputText({
        [u10.Args.InputText.Text] = "Placement Output",
        [u10.Args.InputText.ReadOnly] = true,
        [u10.Args.InputText.MultiLine] = true,
    }, {text = u11.savePlacementJson})
    u10.End()
end

function u11.init() -- Line: 67 -- upvalues: u10 (ref), u11 (val)
    u10 = u11.Iris
    u11.placementJson = u10.State("")
    u11.savePlacementJson = u10.State("")
end

return u11