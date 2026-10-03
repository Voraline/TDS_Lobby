-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.OwnedTower.story
-- Decompile time: 1.10 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Selection = game:GetService("Selection")
local OwnedTower = require(script.Parent.OwnedTower)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: Selection (val), createElement (val), OwnedTower (val), ReactRoblox (val)
    local OWN_TARGET = workspace.Terrain:FindFirstChild("OWN_TARGET")
    if OWN_TARGET then
        OWN_TARGET:Destroy()
    end
    local Part = Instance.new("Part")
    Part.Name = "OWN_TARGET"
    Part.CFrame = CFrame.identity
    Part.Size = Vector3.new(1, 1, 1)
    Part.Transparency = 1
    Part.Parent = workspace.Terrain
    Selection:Set({Part})
    local v1 = createElement(OwnedTower, {Boundary = 5, Target = Part})
    local u32 = ReactRoblox.createRoot(Part)
    u32:render(v1)
    return function() -- Line: 31 -- upvalues: Part (val), u32 (val)
        Part:Destroy()
        u32:unmount()
    end
end