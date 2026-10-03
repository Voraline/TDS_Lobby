-- Script path: ReplicatedStorage.Content.NewEnemies.Gatekeeper.Animator
-- Decompile time: 3.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 15
    -- upvalues: Animation (val), RunService (val), GameState (val), spr (val), TweenService (val)
    a1.Shooting = false

    function a1.Face(a1_2) -- Line: 18 -- upvalues: a1 (val)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        return CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1_2.X, HumanoidRootPart.Position.Y, a1_2.Z)))
    end

    function a1.IgnoreList() -- Line: 27 -- upvalues: a1 (val)
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

    local u12 = Animation.new({
        Track = a1.Model.Animations.Throw,
        Target = a1.Model.AnimationController,
    })
    local u13 = false
    local u14 = 0
    local identity = CFrame.identity
    local u16 = 0
    local u21 = a1.Model.Handle:Clone()
    u21.Transparency = 1
    u21.Parent = workspace.Trash
    a1.Maid:Mark(u21)
    a1._hitInfluence = 0
    a1.Model:WaitForChild("Head")
    a1.Maid:Mark((RunService.Heartbeat:Connect(function(a1_2) -- Line: 64
        -- upvalues: u13 (ref), u14 (ref), GameState (upval), identity (ref), u16 (ref), u21 (val), a1 (val)
        if not u13 then
            return
        end
        u14 = u14 + a1_2 * 2.8 * GameState.TimeScale
        local Position = (identity * (CFrame.new((math.sin(-u14)) * u16, 0, (math.cos(-u14)) * u16))).Position
        u21:PivotTo(((a1.Model.Handle.CFrame * CFrame.Angles(1.5707963267948966, 0, 0)):Lerp(
            (CFrame.new(Position)) * CFrame.Angles(0, u14 * 6, 0),
            a1._hitInfluence
        )))
        u21.Transparency = 0
        if u14 > 6.283185307179586 then
            u13 = false
            u21.Transparency = 1
        end
    end)))

    local function doSwing(a1_2) -- Line: 91
        -- upvalues: u14 (ref), a1 (val), identity (ref), u16 (ref), u13 (ref), spr (upval), TweenService (upval)
        u14 = 0
        local Position = a1.Model.Handle.Position
        a1.Model.Handle.Transparency = 1
        identity = CFrame.lookAt(Position:Lerp(a1_2, 0.5), a1_2)
        u16 = (Position - a1_2).Magnitude * 0.5
        local v1 = a1.Face(a1_2)
        u13 = true
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
        Death = function() -- Line: 120 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Death,
                Target = a1.Model.AnimationController,
            }):Play()
        end,
        SwingStart = function() -- Line: 127 -- upvalues: u12 (val)
            u12:Play()
        end,
        SwingEnd = function() -- Line: 115 -- upvalues: a1 (val)
            a1.Model.Handle.Transparency = 0
        end,
        Shoot = function(a1) -- Line: 132 -- upvalues: doSwing (val)
            doSwing(a1)
        end,
        Face = function(a1_2) -- Line: 135 -- upvalues: a1 (val), TweenService (upval)
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