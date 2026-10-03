-- Script path: ReplicatedStorage.Client.Controllers.Game.NyanCatController.NyanCats
-- Decompile time: 2.38 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Sift = require(ReplicatedStorage.Packages.Sift)
local SpriteSheet = require(ReplicatedStorage.Client.Interfaces.Components.SpriteSheet)
local createElement = React.createElement
local v1 = {}

function NyanCat(a1) -- Line: 20
    -- upvalues: createElement (val), SpriteSheet (val), ReactRoblox (val)
    local part = a1.part
    return ReactRoblox.createPortal(createElement("SurfaceGui", {Adornee = part}, {
        createElement(SpriteSheet, {
            BackgroundTransparency = 1,
            frameRate = 18,
            Size = UDim2.fromScale(1, 1),
            sheets = {
                {
                    id = 104735412893211,
                    max = 5,
                    grid = Vector2.new(4, 1),
                    size = Vector2.new(204.2, 143),
                },
            },
        }),
    }), part)
end

function NyanCatApp(a1) -- Line: 44 -- upvalues: Sift (val), createElement (val) -- types: a1: table
    return Sift.Array.map(a1.parts, function(a1, a2) -- Line: 45 -- upvalues: createElement (upval)
        return createElement(NyanCat, {key = a2, part = a1})
    end)
end

function v1.create() -- Line: 50 -- upvalues: Maid (val), ReactRoblox (val), createElement (val), RunService (val)
    local Part
    local u2 = Maid.new()
    local Folder = Instance.new("Folder")
    Folder.Name = "NyanCats"
    u2:Mark(Folder)
    local u11 = {}
    for i = 1, 20 do
        Part = Instance.new("Part")
        Part.Transparency = 1
        Part.Anchored = true
        Part.CanCollide = false
        Part.Size = Vector3.new(26, 16, 1)
        Part.Parent = Folder
        table.insert(u11, Part)
    end
    local u40 = ReactRoblox.createRoot(Instance.new("Folder"))
    u2:Mark(function() -- Line: 70 -- upvalues: u40 (val)
        u40:unmount()
    end)
    u40:render((createElement(NyanCatApp, {parts = u11})))
    local u55 = 0
    RunService:BindToRenderStep("nyan-cats", Enum.RenderPriority.Camera.Value - 1, function(a1) -- Line: 78 -- upvalues: u55 (ref), u11 (val)
        local v1, v2
        u55 = u55 + a1
        for i = 1, 20 do
            v1 = u11[i]
            if v1 then
                v2 = (i - 1) / 20 * 3.141592653589793 * 2 + u55 * 0.5235987755982988
                v1.CFrame = (CFrame.new(math.cos(v2) * 90, math.sin(v2 * 4 + i * 3.141592653589793 / 7 * 33) * 4 + 15, math.sin(v2) * 90)) * CFrame.Angles(0, -v2 + 1.5707963267948966, 0)
            end
        end
    end)
    u2:Mark(function() -- Line: 98 -- upvalues: RunService (upval)
        RunService:UnbindFromRenderStep("nyan-cats")
    end)
    Folder.Parent = workspace
    return function() -- Line: 104 -- upvalues: u2 (val)
        u2:Sweep()
    end
end

return v1