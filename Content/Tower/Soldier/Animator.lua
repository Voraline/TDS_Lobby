-- Script path: ReplicatedStorage.Content.Tower.Soldier.Animator
-- Decompile time: 3.78 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local SoundPool = require(ReplicatedStorage.Shared.Modules.SoundPool)
local SharedControllerFunctions = require(ReplicatedStorage.Client.Modules.SharedControllerFunctions)
local v1 = {}
v1.__index = v1

function v1:Fire(a2) -- Line: 17 -- upvalues: SoundPool (val), SharedControllerFunctions (val), Animation (val)
    local Attribute
    if not a2.PrimaryPart then
        return
    end
    local PrimaryPart = self.Model.PrimaryPart
    local Gun = self.Model.Weapon.Gun
    local Configuration = Gun:FindFirstChild("Configuration")
    local Value = Configuration and Configuration.Start.Value or Gun.Handle:FindFirstChild("Start")
    local Value_2 = Configuration and Configuration.Fire.Value or Gun.Handle:FindFirstChild("Fire")
    if Value_2 and Value_2:IsA("Sound") then
        local _soundPools = self._soundPools or {}
        self._soundPools = _soundPools
        local v1 = self._soundPools[Value_2]
        if not v1 then
            local v2 = string.match(Value_2.SoundId or "", "%d+")
            local v3 = v2 and tonumber(v2)
            if v3 then
                v1 = SoundPool.new({
                    size = 6,
                    audioGroup = "Towers",
                    timeScaled = true,
                    id = v3,
                    parent = PrimaryPart,
                    volume = Value_2.Volume,
                })
                self._soundPools[Value_2] = v1
            end
        end
        if v1 then
            v1:play({
                playbackSpeed = (Random.new()):NextNumber(Value_2.PlaybackSpeed * 0.9, Value_2.PlaybackSpeed * 1.2),
                volume = Value_2.Volume,
            })
        end
    end
    local p = a2.PrimaryPart.CFrame.p
    local Head = a2:FindFirstChild("Head")
    local Position = Head and Head.Position or p
    self:Face(p)
    SharedControllerFunctions.AimArmsAt(self, p)
    SharedControllerFunctions.AimHeadAt(self, Position)
    local v4 = false
    local v5 = nil
    if self.Model.Name == "Patriotic" then
        local v6 = {"Blue", "Red", "White"}
        v5 = v6[math.random(1, 3)] .. "Patriotic"
        v4 = true
    end
    local v7 = {
        Start = Value.WorldPosition,
        End = p,
        Spread = 50,
        Speed = 140,
        NoColor = v4,
        Bullet = v5,
    }
    v7.Color = Configuration and Configuration.Color.Value or nil
    self:Bullet(v7)
    if self.fireOutro ~= nil and self.fireOutro.Controller.IsPlaying then
        self.fireOutro:Stop()
        self.fireOutro = nil
        if self.outroThread ~= nil then
            task.cancel(self.outroThread)
            self.outroThread = nil
        end
    end
    if self.fireAnim ~= nil and self.fireAnim.Controller.IsPlaying then
        self.fireAnim:Stop()
        self.fireAnim = nil
    end
    self.fireAnim = Animation.new({
        Track = self.Model.Animations.Fire[0].Fire,
        Target = self.Model.AnimationController,
    })
    self.fireAnim:Play()
    for k, v in pairs(Value:GetChildren()) do
        if v:IsA("ParticleEmitter") then
            Attribute = v:GetAttribute("EmitCount")
            if Attribute then
                v:Emit(Attribute)
            end
        end
    end
    self:Delay(self.Stats.Cooldown)
end

function v1.Initialize(a1) -- Line: 118 -- upvalues: SharedControllerFunctions (val), Animation (val)
    a1.reloading = false
    a1.fireAnim = nil
    a1.fireOutro = nil
    a1.outroThread = nil
    a1.FBXModel = a1.Model.PrimaryPart:FindFirstChildOfClass("Bone")
    if not a1.FBXModel then
        SharedControllerFunctions.RegisterJoints(a1, {
            a1.Model.Torso["Left Shoulder"],
            a1.Model.Torso["Right Shoulder"],
            a1.Model.PrimaryPart.Handle,
        })
    end
    a1:Thread(function() -- Line: 133 -- upvalues: a1 (val)
        if a1:FindTarget() and not a1.reloading then
            local v1 = a1:FindTarget()
            if v1 then
                a1:Fire(v1)
            end
        end
    end)
    a1.Maid:Mark(function() -- Line: 144 -- upvalues: a1 (val)
        if a1._soundPools then
            for i, j in a1._soundPools do
                j:destroy()
            end
            a1._soundPools = nil
        end
    end)
    a1.OnUpgrade:Connect(function() -- Line: 153 -- upvalues: a1 (val)
        if a1._soundPools then
            for i, j in a1._soundPools do
                j:destroy()
            end
            for k in a1._soundPools do
                a1._soundPools[k] = nil
            end
        end
    end)
    a1.Executables = {
        Reloading = function(a1_2) -- Line: 165 -- upvalues: a1 (val), Animation (upval) -- types: a1_2: boolean
            a1.reloading = a1_2
            if a1.Model.Animations.Fire[0]:FindFirstChild("Outro") and a1_2 == true then
                a1.outroThread = task.spawn(function() -- Line: 170 -- upvalues: a1 (upval), Animation (upval)
                    if a1.fireAnim then
                        a1.fireAnim.Controller.Stopped:Wait()
                        if a1.fireAnim.Controller.IsPlaying == false then
                            a1.fireOutro = Animation.new({
                                Track = a1.Model.Animations.Fire[0].Idle,
                                Target = a1.Model.AnimationController,
                            })
                            a1.fireOutro:Play(0)
                        end
                        task.wait(2)
                        if a1.fireOutro ~= nil and a1.fireOutro.Controller.IsPlaying then
                            a1.fireOutro:Stop()
                            a1.fireOutro = Animation.new({
                                Track = a1.Model.Animations.Fire[0].Outro,
                                Target = a1.Model.AnimationController,
                            })
                            a1.fireOutro:Play(0)
                        end
                    end
                end)
            end
        end,
    }
end

return v1