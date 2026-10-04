-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewTowerRange.init.story
-- Decompile time: 1.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Selection = game:GetService("Selection")
local Parent = require(script.Parent)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement

local function Component(a1) -- Line: 9 -- upvalues: createElement (val), Parent (val)
    return createElement(Parent, {
        Range = 13,
        Boundary = 3,
        Deadzone = 6,
        Buildzone = 10,
        Valid = false,
        Target = a1.Target,
    })
end

return function(a1) -- Line: 44 -- upvalues: Selection (val), createElement (val), Component (val), ReactRoblox (val)
    local RANGE_TARGET = workspace.Terrain:FindFirstChild("RANGE_TARGET")
    if RANGE_TARGET then
        RANGE_TARGET:Destroy()
    end
    local Part = Instance.new("Part")
    Part.Name = "RANGE_TARGET"
    Part.CFrame = CFrame.identity
    Part.Size = Vector3.new(1, 1, 1)
    Part.Transparency = 1
    Part.Parent = workspace.Terrain
    Selection:Set({Part})
    local v1 = createElement(Component, {Target = Part})
    local u32 = ReactRoblox.createRoot(Part)
    u32:render(v1)
    return function() -- Line: 65 -- upvalues: Part (val), u32 (val)
        Part:Destroy()
        u32:unmount()
    end
end