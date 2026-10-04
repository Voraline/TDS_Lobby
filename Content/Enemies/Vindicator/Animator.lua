-- Script path: ReplicatedStorage.Content.Enemies.Vindicator.Animator
-- Decompile time: 2.91 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 9 -- upvalues: Animation (val), TweenService (val), EffectsController (val)
    local u1 = nil

    function a1.Face(a1_2) -- Line: 12 -- upvalues: a1 (val)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        HumanoidRootPart.CFrame = CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1_2.X, HumanoidRootPart.Position.Y, a1_2.Z)))
    end

    local u14 = Animation.new({
        Track = a1.Model.Animations.Shield,
        Target = a1.Model.AnimationController,
    }):Play()
    a1.Executables = {
        Face = function(a1_2) -- Line: 28 -- upvalues: a1 (val)
            a1.Face(a1_2)
        end,
        Hammer = function(a1_2, a2, a3) -- Line: 31
            -- upvalues: a1 (val), Animation (upval), u1 (ref), TweenService (upval), EffectsController (upval)
            local u3 = false
            local u10 = a3 or a1.Stats.HammerRadius or 5
            local u24 = Animation.new({
                Track = a1.Model.Animations.Throw,
                Target = a1.Model.AnimationController,
            }):Play()
            ;(u24:GetMarkerReachedSignal("Action")):Connect(function(a1_3) -- Line: 40
                -- upvalues: u1 (upval), a1 (upval), a1_2 (val), u3 (ref), TweenService (upval), a2 (val)
                -- upvalues: EffectsController (upval), u10 (ref), u24 (val)
                if a1_3 ~= "Throw" then
                    if a1_3 == "Return" then
                        u3 = true
                        TweenService:Create(
                            u1.PrimaryPart,
                            TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                            {CFrame = a1.Model.Hammer.PrimaryPart.CFrame}
                        ):Play()
                        a1:Delay(0.2)
                        u1:Destroy()
                        for k, v in pairs(a1.Model.Hammer:GetDescendants()) do
                            if v:IsA("BasePart") or v:IsA("Decal") then
                                v.Transparency = 0
                            end
                        end
                    end
                    return
                end
                u1 = a1.Model.Hammer:Clone()
                u1.PrimaryPart.Anchored = true
                u1.Parent = workspace.CurrentCamera
                for k2, i in pairs(a1.Model.Hammer:GetDescendants()) do
                    if i:IsA("BasePart") or i:IsA("Decal") then
                        i.Transparency = 1
                    end
                end
                local v1 = #a1_2
                for j = 1, v1 do
                    if u1 ~= nil and u3 == false then
                        TweenService:Create(u1.PrimaryPart, TweenInfo.new(a2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
                            CFrame = (CFrame.new(a1_2[j], u1.PrimaryPart.Position)) * CFrame.Angles(1.5707963267948966, 0, 0),
                        }):Play()
                        a1:Delay(a2)
                        if u1 ~= nil then
                            u1.Grip["Hit" .. j]:Play()
                            coroutine.wrap(function(a1) -- Line: 74 -- upvalues: EffectsController (upval), a1_2 (upval), j (val), u10 (upval)
                                EffectsController.Explosion({
                                    Position = a1_2[j],
                                    Radius = u10,
                                    Color = BrickColor.new("White"),
                                    Sound = 440145223,
                                    Material = Enum.Material.Neon,
                                    Particles = false,
                                    Visible = true,
                                })
                            end)(a1)
                        end
                    end
                end
                u24.TimePosition = 1.4
            end)
        end,
        Shield = function() -- Line: 116 -- upvalues: a1 (val), u14 (val)
            a1.Model.Shield.Emitter:Emit((math.random(35, 45)))
            a1.Model.Shield.Break:Play()
            a1.Model.Shield.Transparency = 1
            u14:Stop()
        end,
        Death = function() -- Line: 123 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Died,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Dead:Play()
        end,
    }
end

return v1