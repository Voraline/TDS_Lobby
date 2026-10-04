-- Script path: ReplicatedStorage.Content.Enemies.Unstable Ice.Animator
-- Decompile time: 0.81 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 11
    -- upvalues: EffectsController (val), TweenService (val), TimescaleUtilities (val)
    a1.Executables = {
        Explode = function(a1, a2) -- Line: 13 -- upvalues: EffectsController (upval), TweenService (upval), TimescaleUtilities (upval)
            EffectsController.Explosion({
                Position = a2,
                Radius = a1,
                Color = BrickColor.new("Medium blue"),
                Sound = "",
                Material = Enum.Material.Neon,
                Particles = false,
                Visible = true,
                Type = "Sphere",
            })
            local Attachment = Instance.new("Attachment")
            Attachment.Parent = workspace.Terrain
            Attachment.WorldPosition = a2
            local PointLight = Instance.new("PointLight")
            PointLight.Parent = Attachment
            PointLight.Brightness = 8
            PointLight.Range = a1 * 1.5
            PointLight.Color = Color3.fromRGB(147, 245, 255)
            TweenService:Create(PointLight, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0), {
                (TweenService:Create(
                    PointLight,
                    TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0),
                    {Brightness = 0}
                ):Play()),
            }):Play()
            TimescaleUtilities.Delay(2, function() -- Line: 65 -- upvalues: Attachment (val)
                Attachment:Destroy()
            end)
        end,
    }
end

return v1