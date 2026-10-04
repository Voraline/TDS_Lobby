-- Script path: ReplicatedStorage.Content.NewEnemies.Executioner Skeleton.Animator
-- Decompile time: 3.99 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local v1 = {}
v1.__index = v1

function v1:SetStanceAnimation(a2, a3) -- Line: 10
    local v1 = self.animationStances[a2]
    local v2 = 0
    if v1 then
        if self.currentAnimation == v1 then
            return
        end
        v1:Play()
        if a3 then
            if v1.Looped then
                a3 = math.clamp(a3 - 0.1, 0, (1 / 0))
            end
            v1:AdjustSpeed(a3)
        end
    end
    for k, v in pairs(self.animationStances) do
        if v.IsPlaying and k == a2 then
            v2 = v1.Length * (v.TimePosition / v.Length)
        end
        if v ~= v1 then
            v:Stop()
        end
    end
    if v1 then
        v1.TimePosition = v2
        self.currentAnimation = v1
    end
    self.currentStance = a2
end

function v1:StopAllAnimations() -- Line: 51
    for k, v in pairs(self.animationStances) do
        v:Stop()
    end
end

function v1.Initialize(a1) -- Line: 60 -- upvalues: Animation (val), RunService (val), GameState (val)
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1.currentStance = ""
    a1.currentAnimation = nil
    a1.animationStances = {}
    for k, v in pairs(a1.Model:WaitForChild("Animations"):GetChildren()) do
        a1.animationStances[v.Name] = (Animation.new({IsPersistent = true, Track = v, Target = AnimationController}))
    end
    a1.currentAxe = nil
    a1.serverAxeStarted = 0
    a1.axeTravelTime = 0
    a1.axeRange = 0
    a1.isThrowing = false
    a1.axeDir = CFrame.identity

    function a1.CreateAxe() -- Line: 81 -- upvalues: a1 (val)
        if a1.currentAxe ~= nil then
            a1.currentAxe:Destroy()
        end
        local v1 = a1.Model.Weapon:Clone()
        for k, v in pairs(v1.PrimaryPart:GetChildren()) do
            if v:IsA("WeldConstraint") and v.Part0 == v1.PrimaryPart then
                v:Destroy()
            end
        end
        v1.Parent = workspace.CurrentCamera
        v1:PivotTo(a1.Model.Weapon.PrimaryPart.CFrame)
        for i, j in v1:GetChildren() do
            if j:IsA("BasePart") then
                j.Transparency = 0
            end
        end
        return v1
    end

    function a1.getAxePosition(a1, a2, a3) -- Line: 104
        return a2 * math.sin(3.141592653589793 / a3 * a1)
    end

    a1.Maid:Mark((RunService.RenderStepped:Connect(function(a1_2) -- Line: 108 -- upvalues: a1 (val), GameState (upval)
        if a1.currentAxe ~= nil and a1.isThrowing then
            local v1 = ((workspace:GetServerTimeNow()) - a1.serverAxeStarted) * GameState.TimeScale
            if v1 < a1.axeTravelTime and a1:IsAlive() and a1.currentAxe ~= nil then
                a1.currentAxe:PivotTo(a1.axeDir * CFrame.new(0, 0, -(math.clamp(a1.getAxePosition(v1, a1.axeRange, a1.axeTravelTime), 0, (1 / 0)))) * CFrame.Angles(0, v1 * 18.84955592153876, 1.5707963267948966))
                return
            end
            a1.isThrowing = false
            if a1.currentAxe ~= nil then
                a1.currentAxe:Destroy()
                a1.currentAxe = nil
            end
        end
    end)))
    a1.Maid:Mark(function() -- Line: 134 -- upvalues: a1 (val)
        if a1.currentAxe ~= nil then
            a1.currentAxe:Destroy()
            a1.currentAxe = nil
        end
    end)

    function a1.HideAxe(a1_2) -- Line: 141 -- upvalues: a1 (val) -- types: a1_2: boolean
        local v1
        for k, v in pairs(a1.Model.Weapon:GetDescendants()) do
            if v:IsA("BasePart") then
                v1 = if a1_2 ~= true then 0 else 1
                v.Transparency = v1
            end
        end
    end

    a1.Executables = {
        Face = function(a1_2) -- Line: 150 -- upvalues: a1 (val)
            a1:Face(a1_2, (TweenInfo.new(0.3)))
        end,
        Throw = function(a1_2) -- Line: 154 -- upvalues: a1 (val)
            a1:SetStanceAnimation("ThrowIntro", 1)
            a1.animationStances.WalkAnimation:Stop()
            a1.serverAxeStarted = a1_2.ServerTime + a1_2.ThrowDelay
            a1.axeTravelTime = a1_2.TravelTime
            a1.axeRange = a1_2.Range
            a1.axeDir = CFrame.new(a1.Model.Weapon.PrimaryPart.Position, a1_2.End)
            a1:Face(a1_2.End, (TweenInfo.new(0.3)))
            a1:Delay(a1_2.ThrowDelay)
            if a1:IsAlive() then
                a1.currentAxe = a1.CreateAxe()
                a1.isThrowing = true
                a1:SetStanceAnimation("ThrowLoop", 1)
                a1.HideAxe(true)
                if a1.Model:FindFirstChild("Head") then
                    a1.Model.Head.Throw:Play()
                end
                a1:Delay(a1_2.TravelTime)
                a1.isThrowing = false
                a1:SetStanceAnimation("ThrowOutro", 1)
                if a1.Model.Name ~= "Default" then
                    a1.HideAxe(false)
                end
            end
        end,
        ShootState = function(a1_2) -- Line: 185 -- upvalues: a1 (val)
            if a1_2 == false then
                a1.animationStances.WalkAnimation:Play()
            end
        end,
        Death = function(a1_2) -- Line: 191 -- upvalues: a1 (val)
            a1.animationStances.WalkAnimation:Stop()
            a1:StopAllAnimations()
            if a1.Model.Animations:FindFirstChild("Death") then
                a1:SetStanceAnimation("Death", 1)
            end
            a1.Model.Head.Rattle:Play()
        end,
    }
    a1.animationStances.WalkAnimation:Play()
    a1.animationStances.WalkAnimation:AdjustSpeed(2)
end

return v1