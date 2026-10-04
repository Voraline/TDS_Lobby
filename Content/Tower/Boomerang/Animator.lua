-- Script path: ReplicatedStorage.Content.Tower.Boomerang.Animator
-- Decompile time: 6.66 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local ArcPath = require(ReplicatedStorage.Shared.Modules.ArcPath)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local ServerTicks = require(ReplicatedStorage.Shared.Modules.ServerTicks)
local Sounds = require(script.Parent.Sounds)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local v1 = {}
v1.__index = v1
local u52 = Random.new()

local function getClosestAsset(a1, a2) -- Line: 28 -- types: a1: userdata, a2: number
    local v1
    local v2 = nil
    for i = 0, a2 do
        v1 = a1:FindFirstChild((tostring(i)))
        if v1 and v1:IsA("Folder") then
            v2 = v1
        end
    end
    return v2
end

function v1:_aim() -- Line: 41
    if self._throwing then
        return
    end
    self._aiming = true
    local u6 = self:Animate("Windup")
    local u7 = nil
    self._aimingMaid:Mark((u6.Stopped:Once(function() -- Line: 50 -- upvalues: u7 (ref), self (val)
        u7 = self:Animate("Windup_Idle", nil, {0})
    end)))
    self._aimingMaid:Mark(function() -- Line: 54 -- upvalues: u6 (val), u7 (ref)
        u6:Stop()
        if u7 then
            u7:Stop()
        end
    end)
    self._aimingMaid:Mark((task.spawn(function() -- Line: 61 -- upvalues: self (val)
        local Position
        local v1 = self:FindTarget()
        while self._aiming do
            if not v1 or not v1.Parent or not v1:IsDescendantOf(workspace) then
                break
            end
            Position = v1.PrimaryPart and v1.PrimaryPart.Position or v1.Position
            if math.isfinite(Position.X) and math.isfinite(Position.Y) and math.isfinite(Position.Z) then
                self:Face(Position)
            end
            task.wait()
            v1 = self:FindTarget()
        end
    end)))
end

function v1:_stopAttacking() -- Line: 80
    self._aiming = false
    self._aimingMaid:Sweep()
end

function v1:_attackAnimation() -- Line: 85
    self._attackAnimationInstance = self:Animate("Attack")
    self._attackLoopHold = self:Animate("Attack_Idle")
end

function v1:_catch() -- Line: 90 -- upvalues: TimescaleUtilities (val)
    if self._attackLoopHold then
        self._attackLoopHold:Stop(0)
        self._attackLoopHold = nil
    end
    if self._attackAnimationInstance then
        self._attackAnimationInstance:Stop(0)
        self._attackAnimationInstance = nil
    end
    self:Animate("Catch", nil, {0})
    TimescaleUtilities.Delay(0.1, function() -- Line: 103 -- upvalues: self (val)
        self._throwing = false
    end)
    self:_playSound("Catch")
end

function v1:_getSound(a2) -- Line: 110
    local Level = self:GetLevel()
    local v1 = nil
    local v2 = self._sounds[a2]
    if v2 then
        for i = 0, Level do
            if v2[i] then
                v1 = v2[i]
            end
        end
    end
    return v1
end

function v1:_playSound(a2, a3) -- Line: 127 -- upvalues: u52 (val), TimescaleUtilities (val)
    local v1 = self:_getSound(a2)
    if v1 then
        if a3 then
            local v2 = v1:Clone()
            v2.Parent = a3
            v2:Play()
            v2.PlaybackSpeed = u52:NextNumber(0.9, 1.1)
            TimescaleUtilities.CleanUp(v2, 5)
            return
        end
        v1:Play()
    end
end

function v1:_getBlade() -- Line: 142 -- upvalues: getClosestAsset (val)
    local v1 = getClosestAsset(self._assets.Blades, (self:GetLevel()))
    return v1 and (v1:GetChildren())[math.random(1, #v1:GetChildren())]:Clone()
end

function v1:_getHitEffect() -- Line: 154 -- upvalues: getClosestAsset (val)
    local v1 = getClosestAsset(self._assets.HitEffects, (self:GetLevel()))
    return v1 and (v1:GetChildren())[math.random(1, #v1:GetChildren())]:Clone()
end

function v1:_getRotationFactor(a2) -- Line: 166
    self._rotationAngle = self._rotationAngle or 0
    self._rotationAngle = self._rotationAngle + a2 * 2880
    return CFrame.fromOrientation(0, math.rad(self._rotationAngle), 0)
end

function v1.Initialize(a1) -- Line: 172
    -- upvalues: Maid (val), ReplicatedStorage (val), Sounds (val), SoundService (val), EmitterManager (val)
    -- upvalues: TimescaleUtilities (val), ArcPath (val), u52 (val), ServerTicks (val), RunService (val)
    -- upvalues: GameState (val)
    local Sound, _sounds, id, v1, v2, v3, v4
    a1._aiming = false
    a1._aimingMaid = Maid.new()
    a1._sounds = {}
    local Default = ((ReplicatedStorage:WaitForChild("Assets")):WaitForChild("BoomerangAssets")):FindFirstChild(a1.Model.Name) or ((ReplicatedStorage:WaitForChild("Assets")):WaitForChild("BoomerangAssets")):FindFirstChild("Default")
    a1._assets = Default
    local v5 = Sounds[a1.Model.Name] or Sounds.Default
    local v6 = nil
    local v7 = nil
    for i, j in v5, v6, v7 do
        v3 = nil
        v4 = nil
        for k, n in j, v3, v4 do
            if typeof(n) ~= "table" then
                id = n
                v1 = 0.5
            else
                id = n.id
                v1 = n.volume or 1
            end
            Sound = Instance.new("Sound")
            Sound.SoundId = "rbxassetid://" .. id
            Sound.Name = i .. "_" .. k
            Sound.Parent = a1.Model.PrimaryPart
            Sound.SoundGroup = SoundService.Towers
            Sound.Volume = v1
            _sounds = a1._sounds
            v2 = a1._sounds[i] or {}
            _sounds[i] = v2
            a1._sounds[i][k] = Sound
        end
    end
    a1.Executables = {
        HitTarget = function(a1_2) -- Line: 208 -- upvalues: a1 (val), EmitterManager (upval), TimescaleUtilities (upval)
            if a1_2 and a1_2.PrimaryPart then
                local v1 = a1:_getHitEffect()
                if v1 then
                    v1:PivotTo((CFrame.new(a1_2.PrimaryPart.Position)))
                    v1.Parent = workspace.Trash
                    EmitterManager.manualEmit(v1)
                    TimescaleUtilities.CleanUp(v1, 3)
                    local Attachment = Instance.new("Attachment")
                    Attachment.Parent = workspace.Trash
                    Attachment.WorldPosition = a1_2.PrimaryPart.Position
                    a1:_playSound("Hit", Attachment)
                    TimescaleUtilities.CleanUp(Attachment, 3)
                end
                return
            end
        end,
        ThrowBoomerang = function(a1_2) -- Line: 228
            -- upvalues: a1 (val), ArcPath (upval), u52 (upval), TimescaleUtilities (upval), ServerTicks (upval)
            -- upvalues: RunService (upval), GameState (upval)
            local v1
            a1._throwing = true
            if not a1_2.reverse then
                a1:_stopAttacking()
                a1:_attackAnimation()
            end
            local v2 = {}
            local v3 = nil
            local v4 = nil
            for i, j in a1_2.points, v3, v4 do
                v1 = a1_2.targets[tostring(i)]
                if not v1 or not v1.Parent then
                    table.insert(v2, j)
                else
                    table.insert(v2, v1.PrimaryPart.Position)
                end
            end
            local u32 = ArcPath.new(v2, a1_2.startTangentUnit, a1_2.endTangentUnit, {Resolution = 200, ArcAngleStep = 0.1})
            local u33 = nil
            local Length = u32.Length
            local speed = a1_2.speed
            local u36 = 0
            local u37 = false
            local u38 = false
            local u39 = false
            local u40 = nil
            if v2[2] then
                a1:Face(v2[2])
            end
            local u50 = a1:_getBlade()
            u50.Parent = workspace.Trash
            local SpinRotation = u50:FindFirstChild("SpinRotation", true)
            local v5 = a1:_getSound("ThrowLoop")
            local u67 = nil
            if v5 then
                u67 = v5:Clone()
                u67.PlaybackSpeed = u52:NextNumber(0.9, 1.1)
                u67.Looped = true
                u67.Parent = u50.PrimaryPart
                u67:Play()
            end
            a1:_playSound("Throw")
            local u84 = 0

            local function onUpdate(a1_3) -- Line: 293
                -- upvalues: u84 (ref), u36 (ref), Length (val), u50 (val), u67 (ref), TimescaleUtilities (upval)
                -- upvalues: u40 (ref), u33 (ref), u37 (ref), a1 (upval), u39 (ref), a1_2 (val), u38 (ref), u32 (val)
                -- upvalues: SpinRotation (val), speed (val)
                u84 = u84 + a1_3
                if Length <= u36 then
                    if u50 then
                        if u67 then
                            u67:Destroy()
                        end
                        for i, j in u50:GetDescendants() do
                            if j:IsA("BasePart") then
                                j.Transparency = 1
                            end
                            if j:IsA("ParticleEmitter") then
                                j.Enabled = false
                            end
                        end
                        TimescaleUtilities.CleanUp(u50, 1)
                    end
                    if u40 then
                        u40:Destroy()
                    end
                    if u33 then
                        u33:Disconnect()
                    end
                    if not u37 then
                        a1:_catch()
                    end
                    u39 = true
                    return
                end
                local v1 = if not a1_2.reverse then u36 / Length else 1 - u36 / Length
                local v2 = u36
                if Length - 17 <= v2 and not u38 and not a1_2.reverse then
                    u38 = true
                    a1:Face(u32:getCFrame(0.9), TweenInfo.new(0.3), true)
                end
                v2 = u36
                if Length - 1 <= v2 and not u37 and not a1_2.reverse then
                    u37 = true
                    a1:_catch()
                end
                if u50 and u50.PrimaryPart then
                    u50.PrimaryPart.CFrame = CFrame.new(u32:getCFrame(v1).Position)
                    if SpinRotation then
                        SpinRotation.C1 = a1:_getRotationFactor(a1_3)
                    end
                end
                if u40 then
                    u40.CFrame = u32:getCFrame(v1)
                end
                u36 = u36 + speed * a1_3
            end

            local v6 = ServerTicks.getTime() - a1_2.startTime
            local v7 = 0
            while v7 < v6 do
                v7 = v7 + 0.016666666666666666
                onUpdate(0.016666666666666666)
            end
            if u39 then
                return
            end
            local v8 = RunService.Stepped:Connect(function(a1, a2) -- Line: 362 -- upvalues: onUpdate (val), GameState (upval)
                onUpdate(a2 * GameState.TimeScale)
            end)
        end,
    }
    a1:Thread(function() -- Line: 368 -- upvalues: a1 (val)
        local v1 = a1:FindTarget()
        if v1 and not a1._aiming then
            a1:_aim()
            return
        end
        if not v1 and a1._aiming then
            a1:_stopAttacking()
        end
    end)
end

return v1