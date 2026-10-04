-- Script path: ReplicatedStorage.Content.Unit.Executioner Skeleton.Animator
-- Decompile time: 4.97 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local v1 = {}
v1.__index = v1

function v1:SetStanceAnimation(a2, a3) -- Line: 11
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

function v1:StopAllAnimations() -- Line: 52
    for k, v in pairs(self.animationStances) do
        v:Stop()
    end
end

function v1.Initialize(a1) -- Line: 60 -- upvalues: Animation (val), RunService (val), GameState (val), EasySound (val)
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1.currentStance = ""
    a1.currentAnimation = nil
    a1.animationStances = {}
    for k, v in pairs(a1.Model:WaitForChild("Animations"):GetChildren()) do
        a1.animationStances[v.Name] = (Animation.new({IsPersistent = true, Track = v, Target = AnimationController}))
    end

    function a1.DoWalk() -- Line: 74 -- upvalues: a1 (val)
        a1.animationStances.Walk:Play()
    end

    a1.DoWalk()
    a1.currentAxe = nil
    a1.serverAxeStarted = 0
    a1.axeTravelTime = 0
    a1.axeRange = 0
    a1.isThrowing = false
    a1.axeDir = CFrame.identity

    function a1.CreateAxe() -- Line: 86 -- upvalues: a1 (val)
        if a1.currentAxe ~= nil then
            a1.currentAxe:Destroy()
        end
        local v1 = a1.Model.Weapon:Clone()
        for k, v in pairs(v1.Handle:GetChildren()) do
            if v:IsA("Motor6D") then
                v:Destroy()
            end
            if v:IsA("WeldConstraint") and v.Part0 == v1.Handle then
                v:Destroy()
            end
        end
        v1.Parent = workspace.CurrentCamera
        if v1.ClassName ~= "Folder" or not v1:FindFirstChild("Handle") then
            v1:PivotTo(a1.Model.Weapon.Handle.CFrame)
        else
            v1.Handle.CFrame = a1.Model.Weapon.Handle.CFrame
        end
        for i, j in v1:GetChildren() do
            if j:IsA("BasePart") then
                j.Transparency = 0
            end
        end
        return v1
    end

    function a1.getAxePosition(a1, a2, a3) -- Line: 118
        return a2 * math.sin(3.141592653589793 / a3 * a1)
    end

    a1.Maid:Mark((RunService.RenderStepped:Connect(function(a1_2) -- Line: 122 -- upvalues: a1 (val), GameState (upval)
        if a1.currentAxe ~= nil and a1.isThrowing then
            local v1 = ((workspace:GetServerTimeNow()) - a1.serverAxeStarted) * GameState.TimeScale
            if v1 < a1.axeTravelTime and a1:IsAlive() and a1.currentAxe ~= nil then
                local v2 = a1.axeDir * CFrame.new(0, 0, -(math.clamp(a1.getAxePosition(v1, a1.axeRange, a1.axeTravelTime), 0, (1 / 0)))) * CFrame.Angles(0, v1 * 18.84955592153876, 1.5707963267948966)
                if a1.Model.Name == "Creepy Santa" then
                    v2 = v2 * CFrame.Angles(0, 3.141592653589793, 1.5707963267948966)
                end
                if a1.currentAxe.ClassName == "Folder" and a1.currentAxe:FindFirstChild("Handle") then
                    a1.currentAxe.Handle.CFrame = v2
                    return
                end
                if a1.currentAxe.ClassName ~= "Model" then
                    return
                end
                a1.currentAxe:PivotTo(v2)
                return
            end
            a1.isThrowing = false
            if a1.currentAxe ~= nil then
                a1.currentAxe:Destroy()
                a1.currentAxe = nil
            end
        end
    end)))
    a1.Maid:Mark(function() -- Line: 159 -- upvalues: a1 (val)
        if a1.currentAxe ~= nil then
            a1.currentAxe:Destroy()
            a1.currentAxe = nil
        end
    end)

    function a1.HideAxe(a1_2) -- Line: 166 -- upvalues: a1 (val) -- types: a1_2: boolean
        local v1
        for k, v in pairs(a1.Model.Weapon:GetDescendants()) do
            if v:IsA("BasePart") then
                v1 = if a1_2 ~= true then 0 else 1
                v.Transparency = v1
            end
        end
    end

    a1.Executables = {
        Face = function(a1_2) -- Line: 175 -- upvalues: a1 (val)
            a1:Face(a1_2, (TweenInfo.new(0.3)))
        end,
        Throw = function(a1_2) -- Line: 179 -- upvalues: a1 (val), EasySound (upval)
            a1:SetStanceAnimation("ThrowIntro", 1)
            a1.serverAxeStarted = a1_2.ServerTime + a1_2.ThrowDelay
            a1.axeTravelTime = a1_2.TravelTime
            a1.axeRange = a1_2.Range
            a1.axeDir = CFrame.new(a1.Model.Weapon.Handle.Position, a1_2.End)
            a1:Face(a1_2.End, (TweenInfo.new(0.3)))
            a1:Delay(a1_2.ThrowDelay)
            if a1:IsAlive() then
                a1.currentAxe = a1.CreateAxe()
                a1.isThrowing = true
                a1:SetStanceAnimation("ThrowLoop", 1)
                a1.HideAxe(true)
                if a1.Model:FindFirstChild("Head") then
                    local Throw = a1.Model.Head:FindFirstChild("Throw")
                    if Throw and Throw:IsA("Sound") then
                        EasySound.Play({
                            destroyOnEnd = true,
                            audioGroup = "Towers",
                            id = Throw.SoundId,
                            parent = Throw.Parent,
                            volume = Throw.Volume,
                        })
                    end
                end
                a1:Delay(a1_2.TravelTime)
                a1.isThrowing = false
                a1:SetStanceAnimation("ThrowOutro", 1)
                if a1.Model.Name ~= "Default" then
                    a1.HideAxe(false)
                end
            end
        end,
        ShootState = function(a1_2) -- Line: 218 -- upvalues: a1 (val)
            if a1_2 == false then
                a1.DoWalk()
            end
        end,
        Death = function(a1_2) -- Line: 224 -- upvalues: a1 (val), EasySound (upval)
            if a1.Model.Animations:FindFirstChild("Death") then
                a1:SetStanceAnimation("Death", 1)
            end
            if a1.Model:FindFirstChild("Head") then
                local Rattle = a1.Model.Head:FindFirstChild("Rattle")
                if Rattle and Rattle:IsA("Sound") then
                    EasySound.Play({
                        destroyOnEnd = true,
                        audioGroup = "Towers",
                        id = Rattle.SoundId,
                        parent = Rattle.Parent,
                        volume = Rattle.Volume,
                    })
                end
            end
            a1:StopAllAnimations()
        end,
    }
end

return v1