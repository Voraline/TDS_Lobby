-- Script path: ReplicatedStorage.Content.Enemies.Swamp Monster.Animator
-- Decompile time: 2.91 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 11
    -- upvalues: ReplicatedStorage (val), TweenService (val), TimescaleUtilities (val), Animation (val)
    local HumanoidRootPart = a1.Model:WaitForChild("HumanoidRootPart").HumanoidRootPart
    local v1 = (a1.Model:WaitForChild("AnimationController")):LoadAnimation(((a1.Model:WaitForChild("Animations")):WaitForChild("Idle")))
    a1:UpdateWalkAnim()
    v1:Play()
    local u30 = {}
    local Spear_top_l = HumanoidRootPart:WaitForChild("Spear_top_l")
    local Spear_bot_l = HumanoidRootPart:WaitForChild("Spear_bot_l")
    local Spear_top_r = HumanoidRootPart:WaitForChild("Spear_top_r")
    u30[1] = Spear_top_l
    u30[2] = Spear_bot_l
    u30[3] = Spear_top_r
    u30[4] = HumanoidRootPart:WaitForChild("Spear_bot_r")

    function a1.IgnoreList() -- Line: 27
        local v1 = {
            workspace.Towers,
            workspace.Enemies,
            workspace.Units,
            workspace.Map.Boundaries,
            workspace.Map.Environment,
        }
        for k, v in pairs(game.Players:GetChildren()) do
            table.insert(v1, v.Character)
        end
        return v1
    end

    function a1.Spike(a1, a2) -- Line: 41
        -- upvalues: ReplicatedStorage (upval), TweenService (upval), TimescaleUtilities (upval)
        local u9 = ReplicatedStorage.Assets.Effects.Mob.VoidSpike:Clone()
        u9.Color = Color3.fromRGB(93, 226, 177)
        u9.CFrame = CFrame.new(a1)
        u9.Transparency = 1
        u9.Size = Vector3.new(0, 0, 0)
        local v1 = Vector3.new(a2, a2 * 2, a2)
        u9.Parent = workspace.Trash
        TweenService:Create(
            u9,
            TweenInfo.new(0.4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0),
            {Transparency = 0, Size = v1, CFrame = CFrame.new(a1)}
        ):Play()
        TweenService:Create(
            u9,
            TweenInfo.new(0.4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0),
            {Transparency = 0, Size = v1, CFrame = CFrame.new(a1)}
        ):Play()
        u9.Exp:Play()
        TimescaleUtilities.Delay(0.2, function() -- Line: 72 -- upvalues: TweenService (upval), u9 (val), a1 (val), a2 (val), TimescaleUtilities (upval)
            TweenService:Create(u9, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {
                Transparency = 1,
                CFrame = CFrame.new(a1),
                Size = Vector3.new(a2 / 2, a2 / 4, a2 / 2),
            }):Play()
            TimescaleUtilities.Delay(0.4, function() -- Line: 82 -- upvalues: u9 (upval)
                u9:Destroy()
            end)
        end)
    end

    a1.Executables = {
        Throw = function(a1_2, a2, a3, a4) -- Line: 89
            -- upvalues: a1 (val), u30 (val), TweenService (upval), TimescaleUtilities (upval)
            local u12 = a1.Model:WaitForChild("Trident"):Clone()
            local v1 = u30[a1_2].TransformedWorldCFrame * CFrame.Angles(-1.5707963267948966, 0, 0)
            u12.Glow.Transparency = 0
            u12.Handle.Transparency = 0
            u12.Handle.Anchored = true
            u12.Handle.Weld:Destroy()
            u12:SetPrimaryPartCFrame((CFrame.new(v1.p, a2)))
            u12.Parent = workspace.CurrentCamera
            local v2 = (CFrame.new(v1.p, a2)) - v1.p
            TweenService:Create(
                u12.PrimaryPart,
                TweenInfo.new(a3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                {CFrame = CFrame.new(a2) * v2}
            ):Play()
            TimescaleUtilities.Delay(a3 + 2, function() -- Line: 111 -- upvalues: u12 (val)
                u12:Destroy()
            end)
            local v3 = a1.IgnoreList()
            local v4 = Ray.new(a2 + Vector3.new(0, 1, 0), (Vector3.new(0, -100, 0)))
            local v5, v6 = workspace:FindPartOnRayWithIgnoreList(v4, v3)
            if v5 then
                a1:Delay(a3)
                a1.Spike(v6, a4)
            end
        end,
        Death = function() -- Line: 126 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Died,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Died:Play()
        end,
    }
end

return v1