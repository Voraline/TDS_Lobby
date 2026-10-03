-- Script path: ReplicatedStorage.Content.Tower.Turret.Animator
-- Decompile time: 8.90 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
local SoundPool = require(ReplicatedStorage.Shared.Modules.SoundPool)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local v1 = {}
v1.__index = v1
local u31 = {}
u31.Default = {
    [0] = CFrame.Angles(1.5707963267948966, 3.141592653589793, 3.141592653589793),
    [3] = CFrame.Angles(1.5707963267948966, 3.141592653589793, 3.141592653589793),
    [5] = CFrame.Angles(1.5707963267948966, 3.141592653589793, 3.141592653589793),
}
u31.XR300 = {
    [0] = CFrame.Angles(1.5707963267948966, 3.141592653589793, 3.141592653589793),
    [3] = CFrame.Angles(1.5707963267948966, 3.141592653589793, 3.141592653589793),
    [5] = CFrame.Angles(1.5707963267948966, 3.141592653589793, 3.141592653589793),
}
u31.XR500 = {
    [0] = CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966),
    CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966),
    CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966),
    CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966),
    CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966),
    (CFrame.Angles(-1.5707963267948966, 0, 0)),
}
u31.Crossbow = {
    [0] = CFrame.Angles(-1.5707963267948966, 0, 0),
    [3] = CFrame.Angles(0.6981317007977318, 0, 0),
    [5] = CFrame.Angles(0.5235987755982988, 0, 0),
}
u31.Jetski = {[0] = CFrame.Angles(1.5707963267948966, 0, 0)}
u31.Bunny = {
    [0] = CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966),
    CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966),
    CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966),
    CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966),
    CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966),
    (CFrame.Angles(1.5707963267948966, 3.141592653589793, 3.141592653589793)),
}
local u154 = {}
u154.Jetski = {[0] = CFrame.Angles(1.5707963267948966, 0, 0)}
u154.Grinch = {[0] = CFrame.Angles(0, 0, 0)}
local u169 = {Default = true, XR300 = true, Crossbow = true}
local u173 = {Default = true, XR300 = true}

function v1:FaceAngle(a2) -- Line: 104 -- upvalues: u154 (val), u31 (val)
    local v1
    local Configuration = (self.Model:WaitForChild("Weapon")):FindFirstChild("Configuration", true)
    local Value = Configuration.Bones.Head.Value
    local Value_2 = Configuration.Bones.Pivot.Value
    local v2 = CFrame.new(Value_2.WorldCFrame.Position, a2)
    local Unit = (a2 - v2.Position).Unit
    local v3 = v2.Position + (Vector3.new(Unit.X, 0, Unit.Z)).Unit
    local v4 = CFrame.new()
    local v5 = u154[self.Model.Name]
    if v5 then
        local v6
        local Level = self:GetLevel()
        v1 = nil
        local v7 = (1 / 0)
        for i, j in v5 do
            if i <= Level then
                v6 = Level - i
                if v6 < v7 then
                    v1 = i
                end
            end
        end
        if v1 then
            v4 = v5[v1]
        end
    end
    Value_2.WorldCFrame = CFrame.new(v2.Position, v3) * v4
    local v8 = CFrame.new()
    v1 = u31[self.Model.Name]
    if v1 then
        local v9
        local Level_2 = self:GetLevel()
        local v10 = nil
        local v11 = (1 / 0)
        for k, n in v1 do
            if k <= Level_2 then
                v9 = Level_2 - k
                if v9 < v11 then
                    v10 = k
                end
            end
        end
        if v10 then
            v8 = v1[v10]
        end
    end
    Value.WorldCFrame = CFrame.new(Value.WorldCFrame.Position, a2) * v8
end

function v1:_findAnimation(a2, a3) -- Line: 158
    -- upvalues: Animation (val)
    local v1 = ((self.Model:WaitForChild("Animations")):WaitForChild(a2)):FindFirstChild(a3)
    if not v1 then
        return nil
    end
    local v2 = Animation.new({Track = v1, Target = self.Model.AnimationController.Animator})
    self.currentAnimations[a3] = v2
    return v2
end

function v1:Fire(a2) -- Line: 174
    -- upvalues: SoundPool (val), TimescaleUtilities (val), Laser (val), u169 (val), u173 (val)
    local PrimaryPart = a2.PrimaryPart
    local Configuration = (self.Model:WaitForChild("Weapon")):FindFirstChild("Configuration", true)
    if PrimaryPart and Configuration then
        local Position, v1
        self.lastShot = tick()
        local Torso = a2:FindFirstChild("Torso") or a2:FindFirstChild("Upper Torso")
        if not Torso then
            Position = PrimaryPart.Position
        else
            Position = Torso.Position
            if not Position then
                Position = PrimaryPart.Position
            end
        end
        self:FaceAngle(Position)

        local function shootEffects(a1) -- Line: 190
            -- upvalues: Configuration (val), self (val), SoundPool (upval), TimescaleUtilities (upval), Laser (upval)
            -- upvalues: Position (val)
            local Attribute, Parent, _soundPools, v1, v2, v3, v4, v5, v6, v7, v8
            local Descendants = Configuration.Attachments.Start:GetDescendants()
            local v9 = if not Configuration.Attachments:FindFirstChild("BulletDrop") then nil else Configuration.Attachments.BulletDrop:FindFirstChild(a1 or "BulletDrop")
            if v9 then
                Descendants = {v9, unpack(Descendants)}
            end
            local v10 = nil
            local v11 = nil
            local v12 = a1
            for i, j in Descendants, v10, v11 do
                if j:IsA("ObjectValue") then
                    v7 = {j.Value, (unpack((j.Value:GetDescendants())))}
                    v8 = nil
                    v1 = nil
                    for k, n in v7, v8, v1 do
                        if v12 == nil or not n:GetAttribute("Side") or n:GetAttribute("Side") == v12 then
                            if n:IsA("Sound") then
                                v2 = string.match(n.SoundId or "", "%d+")
                                v3 = v2 and tonumber(v2)
                                if v3 then
                                    Parent = n.Parent
                                    while Parent do
                                        if Parent:IsA("BasePart") then
                                            break
                                        end
                                        Parent = Parent.Parent
                                    end
                                    v4 = Parent or self.Model.PrimaryPart
                                    _soundPools = self._soundPools or {}
                                    self._soundPools = _soundPools
                                    v5 = self._soundPools[v4]
                                    if not v5 then
                                        self._soundPools[v4] = {}
                                    end
                                    v6 = v5[v3]
                                    if not v6 then
                                        v5[v3] = (SoundPool.new({
                                            size = 6,
                                            audioGroup = "Towers",
                                            timeScaled = true,
                                            id = v3,
                                            parent = v4,
                                            volume = n.Volume,
                                        }))
                                    end
                                    local u150 = v6:play({
                                        playbackSpeed = (Random.new()):NextNumber(n.PlaybackSpeed * 0.9, n.PlaybackSpeed * 1.2),
                                        volume = n.Volume,
                                    })
                                    Attribute = n:GetAttribute("LengthLimit")
                                    if Attribute and u150 then
                                        TimescaleUtilities.Delay(Attribute, function() -- Line: 248 -- upvalues: u150 (val)
                                            if u150.IsPlaying then
                                                u150:Stop()
                                            end
                                        end)
                                    end
                                end
                            elseif n:IsA("ParticleEmitter") then
                                v2 = n:GetAttribute("EmitCount") or 1
                                if v2 then
                                    n:Emit(v2)
                                end
                            elseif n:IsA("Attachment") and n.Name == "Start" then
                                Laser:Cast({
                                    Start = n.WorldPosition,
                                    Pos = Position,
                                    Fade = 90,
                                    Type = "Bullet",
                                    Color = BrickColor.new("Cork"),
                                    Bullet = Configuration:GetAttribute("SpecialBullet") or "Normal",
                                })
                            end
                        end
                    end
                end
            end
        end

        local Level_3 = if not u169[self.Model.Name] then self:GetLevel() else if self:GetLevel() == 5 then 5 else if not ((self:GetLevel()) < 5) then 0 else if not (3 <= (self:GetLevel())) then 0 else 3
        if u173[self.Model.Name] and Level_3 == 3 then
            if self.isShootLeft then
                v1 = self:_findAnimation("Fire", "3L")
                if v1 then
                    v1:Play()
                end
                shootEffects("Left")
                self.isShootLeft = false
                return
            end
            v1 = self:_findAnimation("Fire", "3R")
            if v1 then
                v1:Play()
            end
            shootEffects("Right")
            self.isShootLeft = true
            return
        end
        v1 = self.currentAnimations[Level_3]
        if not v1 then
            local v2 = self:_findAnimation("Fire", (tostring(Level_3)))
            if v2 then
                v2:Play()
            end
        else
            v1:Play()
        end
        shootEffects()
        return
    end
end

function v1.Initialize(a1) -- Line: 313 -- upvalues: GameState (val)
    a1.lastShot = tick() - a1.State.Cooldown
    a1.currentTarget = nil
    a1.currentAnimations = {}
    a1.Maid:Mark(function() -- Line: 319 -- upvalues: a1 (val)
        if a1._soundPools then
            local v1 = nil
            local v2 = nil
            for i, j in a1._soundPools, v1, v2 do
                for k, n in j do
                    n:destroy()
                end
            end
            a1._soundPools = nil
        end
    end)
    a1.OnUpgrade:Connect(function() -- Line: 330 -- upvalues: a1 (val)
        if a1._soundPools then
            local v1 = nil
            local v2 = nil
            for i, j in a1._soundPools, v1, v2 do
                for k, n in j do
                    n:destroy()
                end
            end
            for m in a1._soundPools do
                a1._soundPools[m] = nil
            end
        end
    end)
    a1:Thread(function() -- Line: 343 -- upvalues: a1 (val), GameState (upval)
        a1.currentTarget = a1:FindTarget()
        if a1.State.Cooldown <= (tick() - a1.lastShot) * GameState.TimeScale and a1.currentTarget then
            a1:Fire(a1.currentTarget)
        end
    end)
end

return v1