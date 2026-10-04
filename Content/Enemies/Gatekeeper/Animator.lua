-- Script path: ReplicatedStorage.Content.Enemies.Gatekeeper.Animator
-- Decompile time: 3.23 ms

game:GetService("Lighting")
game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
game:GetService("SoundService")
local TweenService = game:GetService("TweenService")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
require(ReplicatedStorage.Client.Modules.Laser)
require(ReplicatedStorage.Shared.Modules.Projectile)
require(ReplicatedStorage.Client.Modules.Shaker)
require(ReplicatedStorage.Client.Modules.Replicators.ClientGameMiddleware)
require(ReplicatedStorage.Shared.Modules.EmitterManager)
require(ReplicatedStorage.Shared.Modules.Enum)
require(ReplicatedStorage.Shared.Modules.ItemDrop)
require(ReplicatedStorage.Shared.Modules.Lightning.LightningBolt)
require(ReplicatedStorage.Shared.Modules.Network)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
Random.new()
game:GetService("ReplicatedStorage").Assets.Effects.Mob:WaitForChild("Gatekeeper")

function v1.Initialize(a1) -- Line: 33 -- upvalues: Animation (val), RunService (val), spr (val), TweenService (val)
    a1.Shooting = false
    Random.new()

    function a1.Face(a1_2) -- Line: 43 -- upvalues: a1 (val)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        return CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1_2.X, HumanoidRootPart.Position.Y, a1_2.Z)))
    end

    function a1.IgnoreList() -- Line: 52 -- upvalues: a1 (val)
        local v1 = {
            a1.Model,
            workspace.Map.Boundaries,
            workspace.Towers,
            workspace.ClientUnits,
            workspace.CurrentCamera,
            workspace.Replicate,
        }
        for k, v in pairs(game.Players:GetChildren()) do
            table.insert(v1, v.Character)
        end
        return v1
    end

    local u14 = Animation.new({
        Track = a1.Model.Animations.Throw,
        Target = a1.Model.AnimationController,
    })
    local u15 = false
    local u16 = 0
    local identity = CFrame.identity
    local u18 = 0
    local u23 = a1.Model.Handle:Clone()
    u23.Transparency = 1
    u23.Parent = workspace.Trash
    local Size = u23.Size
    a1.Maid:Mark(u23)
    a1._hitInfluence = 0
    a1.Model:WaitForChild("Head")
    a1.Maid:Mark((RunService.Heartbeat:Connect(function(a1_2) -- Line: 90 -- upvalues: u15 (ref), u16 (ref), identity (ref), u18 (ref), u23 (val), a1 (val)
        if not u15 then
            return
        end
        u16 = u16 + a1_2 * 2.8
        local Position = (identity * (CFrame.new((math.sin(-u16)) * u18, 0, (math.cos(-u16)) * u18))).Position
        u23:PivotTo(((a1.Model.Handle.CFrame * CFrame.Angles(1.5707963267948966, 0, 0)):Lerp(
            (CFrame.new(Position)) * CFrame.Angles(0, u16 * 6, 0),
            a1._hitInfluence
        )))
        u23.Transparency = 0
        if u16 > 6.283185307179586 then
            u15 = false
            u23.Transparency = 1
        end
    end)))

    local function doSwing(a1_2) -- Line: 117
        -- upvalues: u16 (ref), a1 (val), identity (ref), u18 (ref), u15 (ref), spr (upval), TweenService (upval)
        u16 = 0
        local Position = a1.Model.Handle.Position
        a1.Model.Handle.Transparency = 1
        identity = CFrame.lookAt(Position:Lerp(a1_2, 0.5), a1_2)
        u18 = (Position - a1_2).Magnitude * 0.5
        local v1 = a1.Face(a1_2)
        u15 = true
        spr.target(a1, 1, 4, {_hitInfluence = 1})
        TweenService:Create(
            a1.Model.HumanoidRootPart,
            TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
            {CFrame = v1}
        ):Play()
        a1:Delay(1.7951958020513104)
        spr.target(a1, 1, 3, {_hitInfluence = 0})
        a1:Delay(2.243994752564138)
    end

    a1.Executables = {
        Death = function() -- Line: 146 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Death,
                Target = a1.Model.AnimationController,
            }):Play()
        end,
        SwingStart = function() -- Line: 153 -- upvalues: u14 (val)
            u14:Play()
        end,
        SwingEnd = function() -- Line: 141 -- upvalues: a1 (val)
            a1.Model.Handle.Transparency = 0
        end,
        Shoot = function(a1) -- Line: 158 -- upvalues: doSwing (val)
            doSwing(a1)
        end,
        Face = function(a1_2) -- Line: 161 -- upvalues: a1 (val), TweenService (upval)
            local v1 = a1.Face(a1_2)
            TweenService:Create(
                a1.Model.HumanoidRootPart,
                TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
                {CFrame = v1}
            ):Play()
        end,
    }
end

return v1