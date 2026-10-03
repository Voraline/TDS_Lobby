-- Script path: ReplicatedStorage.Content.Tower.Cryomancer.Upgrade
-- Decompile time: 1.67 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)

local function showUpgradeParts(a1, a2) -- Line: 7
    local v1 = 0
    if a1.Name == "Ghost" then
        v1 = 0.6
    end
    for i, j in a2:GetDescendants() do
        if j:IsA("BasePart") then
            j.Transparency = v1
        end
    end
end

local function replaceFireAnimation(a1, a2) -- Line: 20 -- upvalues: Animation (val)
    local FireAnim = a2.FireAnim
    local v1 = FireAnim and FireAnim.IsPlaying == true
    if not v1 and type(FireAnim) == "table" and FireAnim.Controller then
        v1 = FireAnim.Controller.IsPlaying == true
    end
    if FireAnim then
        FireAnim:Stop()
    end
    local Animations = a1:FindFirstChild("Animations")
    local Fire = Animations and Animations:FindFirstChild("Fire")
    local v2 = Fire and Fire:FindFirstChild("5")
    if v2 and v2:IsA("Animation") then
        a2.FireAnim = Animation.new({Track = v2, Target = a1.AnimationController})
        if v1 then
            a2.FireAnim:Play()
        end
        return
    end
    a2.FireAnim = nil
end

return {
    function(a1, a2, a3) -- Line: 49 -- upvalues: RunService (val), showUpgradeParts (val)
        if RunService:IsClient() then
            showUpgradeParts(a1, a2)
            return
        end
        a3.Width = 1.5
    end,
    function(a1, a2, a3) -- Line: 57 -- upvalues: RunService (val), showUpgradeParts (val)
        if RunService:IsClient() then
            showUpgradeParts(a1, a2)
            return
        end
        a3.DefenseMelt = 5
    end,
    function(a1, a2, a3) -- Line: 65 -- upvalues: RunService (val), showUpgradeParts (val)
        if RunService:IsClient() then
            showUpgradeParts(a1, a2)
            return
        end
        a3.BurnTime = 5
        a3.BurnDamage = 2
    end,
    function(a1, a2, a3) -- Line: 74 -- upvalues: RunService (val), showUpgradeParts (val)
        if RunService:IsClient() then
            showUpgradeParts(a1, a2)
            a1.Upgrades["0"].Pack:Destroy()
            a3.Width = 1.75
            return
        end
        if not a3.GoldenPerks then
            a3.BurnDamage = 3
        else
            a3.BurnDamage = 4
        end
        a3.BurnTime = 6
        a3.BurnTick = 0.5
        a3.Width = 1.75
    end,
    function(a1, a2, a3) -- Line: 92 -- upvalues: RunService (val), showUpgradeParts (val), replaceFireAnimation (val)
        if not RunService:IsClient() then
            if not a3.GoldenPerks then
                a3.BurnDamage = 8
            else
                a3.BurnDamage = 10
            end
            a3.BurnTime = 8
            a3.Width = 2.5
            a3.DefenseMelt = 10
            return
        end
        local Enabled = a1.Weapon.Handle.Start.Fire.Enabled
        showUpgradeParts(a1, a2)
        if not a2:FindFirstChild("Handle") then
            a2.Handle2.Start.Flame.Enabled = true
            a2.Handle2.Start.Fire.Enabled = Enabled
            a2.Handle2.Parent = a1.Weapon
        else
            a2.Handle.Start.Flame.Enabled = true
            a2.Handle.Start.Fire.Enabled = Enabled
            a1.Weapon:ClearAllChildren()
            a2.Handle.Parent = a1.Weapon
        end
        replaceFireAnimation(a1, a3)
        a1.Upgrades["2"].Mask:Destroy()
        a3.Width = 2.5
    end,
}