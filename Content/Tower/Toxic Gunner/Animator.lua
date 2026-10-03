-- Script path: ReplicatedStorage.Content.Tower.Toxic Gunner.Animator
-- Decompile time: 3.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local SharedControllerFunctions = require(ReplicatedStorage.Client.Modules.SharedControllerFunctions)
local SoundPool = require(ReplicatedStorage.Shared.Modules.SoundPool)
local v1 = {}
v1.__index = v1

function v1:_rebuildSoundPools() -- Line: 12 -- upvalues: SoundPool (val)
    if not self._soundPools then
        self._soundPools = {}
    else
        for i, j in self._soundPools do
            j:destroy()
            self._soundPools[i] = nil
        end
    end
    local Value = self.Model.Weapon.Weapon.Configuration.FireSFX.Value
    if Value and Value:IsA("Sound") then
        local v1 = SoundPool.new({
            size = 6,
            audioGroup = "Towers",
            timeScaled = true,
            id = Value.SoundId,
            parent = Value.Parent,
        })
        self._soundPools[Value] = v1
    end
end

function v1:CreateSound(a2, a3) -- Line: 40
    -- upvalues: SoundPool (val)
    local v1 = self._soundPools[a2]
    if not v1 then
        v1 = SoundPool.new({
            size = 6,
            audioGroup = "Towers",
            timeScaled = true,
            id = a2.SoundId,
            parent = a3,
        })
        self._soundPools[a2] = v1
    end
    local Attribute = a2:GetAttribute("PlaybackSpeed") or a2.PlaybackSpeed
    v1:play({playbackSpeed = (Random.new()):NextNumber(Attribute * 0.9, Attribute * 1.2)})
end

function v1:Fire(a2) -- Line: 57 -- upvalues: SharedControllerFunctions (val), EmitterManager (val)
    local PrimaryPart = a2.PrimaryPart
    if not PrimaryPart then
        return
    end
    local Magnitude = (self.Model.PrimaryPart.Position - PrimaryPart.Position).Magnitude
    if self:GetRange() < Magnitude then
        return
    end
    local Torso = a2:FindFirstChild("Torso") or a2:FindFirstChild("UpperTorso")
    local Head = a2:FindFirstChild("Head")
    local Position_3 = Torso and Torso.Position or PrimaryPart.Position
    local Position_4 = Head and Head.Position or Position_3
    local Configuration = self.Model.Weapon.Weapon.Configuration
    local Start = Configuration.Start
    local Value = Configuration.FireSFX.Value
    local v1 = #(Start:GetChildren())
    local Value_2 = Start:FindFirstChild((self._fireNum - 1) % v1 + 1).Value
    self:Face(Position_3)
    self:CreateSound(Value, Value.Parent)
    if not self.FBXModel then
        SharedControllerFunctions.AimArmsAt(self, Position_3)
        SharedControllerFunctions.AimHeadAt(self, Position_4)
    end
    self:Animate("Fire")
    EmitterManager.manualEmit(Value_2)
    self:Bullet({
        Start = Value_2.WorldPosition,
        End = Position_3,
        Spread = 50,
        Speed = 140,
        Color = BrickColor.new("Olive").Color,
    })
    self:Delay(self.State.Cooldown)
end

function v1.Initialize(a1) -- Line: 103 -- upvalues: SharedControllerFunctions (val)
    a1._fireNum = 1
    a1._reloading = false
    a1._soundPools = {}
    a1:_rebuildSoundPools()
    if not a1.FBXModel then
        SharedControllerFunctions.RegisterJoints(a1, {a1.Model.Torso["Left Shoulder"], a1.Model.Torso["Right Shoulder"]})
    end
    a1:Thread(function() -- Line: 116 -- upvalues: a1 (val)
        if a1:FindTarget() and not a1._reloading then
            local v1 = a1:FindTarget()
            if v1 then
                local PrimaryPart = a1.Model.PrimaryPart
                local PrimaryPart_2 = v1.PrimaryPart
                if PrimaryPart and PrimaryPart_2 then
                    local Magnitude = (PrimaryPart.Position - PrimaryPart_2.Position).Magnitude
                    if a1:GetRange() < Magnitude then
                        return
                    end
                    a1:Fire(v1)
                    local v2 = a1
                    v2._fireNum = v2._fireNum + 1
                    return
                end
                return
            end
        end
    end)
    a1.Executables = {
        Reloading = function(a1_2) -- Line: 139 -- upvalues: a1 (val) -- types: a1_2: boolean
            a1._reloading = a1_2
            a1._fireNum = 1
        end,
    }
    if a1.Maid then
        a1.Maid:Mark(function() -- Line: 148 -- upvalues: a1 (val)
            if a1._soundPools then
                for i, j in a1._soundPools do
                    j:destroy()
                end
                a1._soundPools = nil
            end
        end)
        a1.OnUpgrade:Connect(function() -- Line: 157 -- upvalues: a1 (val)
            a1:_rebuildSoundPools()
        end)
    end
end

return v1