-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.DeepSea
-- Decompile time: 1.30 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local v1 = {DesiredType = "Word", Particle = "DeepSea"}
local CurrentCamera = workspace.CurrentCamera

function v1.getColor(a1) -- Line: 11
    return ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 9, 35)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 200, 255))),
    })
end

function v1:onCreate() -- Line: 18 -- upvalues: Players (val)
    local adornee = self.adornee
    if not adornee then
        return
    end
    local v1 = Players:FindFirstChild(adornee.Name)
    if not v1 then
        return
    end
    local Root = adornee:FindFirstChild("Root")
    if not Root then
        return
    end
    local Ground = adornee:FindFirstChild("Ground")
    if not Ground then
        return
    end
    local Up = adornee:FindFirstChild("Up")
    if not Up then
        return
    end
    self._rootAttach = Root
    self._groundAttach = Ground
    self._upAttach = Up
    self._upHeight = Up.CFrame.Y
    self._groundAttach.Beam.Attachment0 = self._groundAttach
    self._groundAttach.Beam.Attachment1 = self._upAttach
    self._player = v1
end

function v1.render(a1) -- Line: 55 -- upvalues: Create (val)
    local v1 = a1.labels:Get()[1]
    if not a1.created then
        v1.TextColor3 = Color3.fromRGB(255, 255, 255)
        Create("UIGradient", {Rotation = -90, Color = a1:getColor(), Parent = v1})
        Create("UIStroke", {Thickness = 3, Color = Color3.fromRGB(174, 0, 190), Parent = v1})
        task.defer(function() -- Line: 73 -- upvalues: a1 (val)
            a1:onCreate()
        end)
        a1.created = true
    end
    if a1._rootAttach then
        a1._rootAttach.WorldCFrame = (CFrame.new(a1._rootAttach.Parent.Position - Vector3.new(0, 3, 0))) * CFrame.Angles(0, 3.141592653589793, 0)
    end
    if a1._groundAttach and a1._rootAttach then
        a1._groundAttach.WorldCFrame = a1._groundAttach.WorldCFrame - Vector3.new(0, 3, 0)
    end
end

return v1