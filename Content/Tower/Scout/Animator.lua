-- Script path: ReplicatedStorage.Content.Tower.Scout.Animator
-- Decompile time: 8.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local SoundPool = require(ReplicatedStorage.Shared.Modules.SoundPool)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local SharedControllerFunctions = require(ReplicatedStorage.Client.Modules.SharedControllerFunctions)
local u46 = nil
local v1 = {}
v1.__index = v1
local u49 = Random.new()

function v1:Fire(a2) -- Line: 20
    -- upvalues: SharedControllerFunctions (val), Animation (val), SoundPool (val), u49 (val), u46 (ref)
    -- upvalues: EmitterManager (val), TweenService (val), TimescaleUtilities (val)
    local Handle
    local PrimaryPart = a2.PrimaryPart
    if not PrimaryPart then
        return
    end
    local Torso = a2:FindFirstChild("Torso")
    local Head = a2:FindFirstChild("Head")
    local Weapon = self.Model.Weapon
    local Level = self:GetLevel()
    local Position = Torso and Torso.Position or PrimaryPart.Position
    local Position_2 = Head and Head.Position or Position
    self:Face(Position)
    SharedControllerFunctions.AimArmsAt(self, Position)
    SharedControllerFunctions.AimHeadAt(self, Position_2)
    if self.lastFireAnim then
        self.lastFireAnim:Stop()
        self.lastFireAnim = nil
    end
    if not (Level < 4) then
        if not self.right then
            Handle = self.Model.Weapon.Gun2.Handle
            self.lastFireAnim = Animation.new({
                Track = self.Model.Animations.Fire[4].Left,
                Target = self.Model.AnimationController,
            })
        else
            Handle = self.Model.Weapon.Gun1.Handle
            self.lastFireAnim = Animation.new({
                Track = self.Model.Animations.Fire[4].Right,
                Target = self.Model.AnimationController,
            })
        end
        self.lastFireAnim:Play()
        self.right = not self.right
    else
        Handle = self.Model.Weapon.Gun1.Handle
        self.lastFireAnim = Animation.new({
            Track = self.Model.Animations.Fire[0].Fire,
            Target = self.Model.AnimationController,
        })
        self.lastFireAnim:Play()
    end
    if Handle then
        local v1
        if self.FBXModel then
            local Gun1 = Weapon:FindFirstChild(if not self.right then "Gun2" else if not (Level >= 4) then "Gun2" else "Gun1") or Weapon:FindFirstChild("Gun1")
            if not Gun1 then
                return
            end
            local Configuration = Gun1:FindFirstChild("Configuration")
            if Configuration then
                local Value_2
                local Value = Configuration.Sounds.Fire.Value
                if Value and Value:IsA("Sound") then
                    local _firePools_2 = self._firePools or {}
                    self._firePools = _firePools_2
                    v1 = self._firePools[Value]
                    if not v1 then
                        local v2 = string.match(Value.SoundId or "", "%d+")
                        local v3 = v2 and tonumber(v2)
                        if v3 then
                            v1 = SoundPool.new({
                                size = 6,
                                id = v3,
                                parent = Value.Parent,
                                volume = Value.Volume,
                            })
                            self._firePools[Value] = v1
                        end
                    end
                    if v1 then
                        v1:play({playbackSpeed = u49:NextNumber(0.8, 1.2), volume = Value.Volume})
                    end
                end
                local Starts = Configuration.Attachments:FindFirstChild("Starts")
                for i, j in Starts and Starts:GetChildren() or {Configuration.Attachments.Start} do
                    Value_2 = j.Value
                    EmitterManager.manualEmit(Value_2)
                    self:Bullet({Start = Value_2.WorldPosition, End = Position, Spread = 30, Speed = 100})
                end
            end
        else
            local u217, v4, v5
            local Start = Handle:WaitForChild("Start")
            local Fire = Handle:FindFirstChild("Fire")
            if Fire and Fire:IsA("Sound") then
                local _firePools = self._firePools or {}
                self._firePools = _firePools
                local v6 = self._firePools[Handle]
                if not v6 then
                    v4 = string.match(Fire.SoundId or "", "%d+")
                    v1 = v4 and tonumber(v4)
                    if v1 then
                        v6 = SoundPool.new({size = 6, id = v1, parent = Handle, volume = Fire.Volume})
                        self._firePools[Handle] = v6
                    end
                end
                if v6 then
                    v6:play({
                        playbackSpeed = u49:NextNumber(Fire.PlaybackSpeed * 0.9, Fire.PlaybackSpeed * 1.2),
                        volume = Fire.Volume,
                    })
                end
            end
            for k, v in pairs(Start:GetChildren()) do
                if v:IsA("ParticleEmitter") then
                    v5 = v:GetAttribute("EmitCount") or 1
                    if v5 then
                        v:Emit(v5)
                    end
                end
            end
            if self.Model.Name == "Guest" then
                u217 = u46:Clone()
                u217.CFrame = CFrame.new(Handle.Start.WorldPosition, Position)
                u217.Parent = workspace
                if self.Model.Name == "Champion" then
                    EmitterManager.toggle(u217, true)
                end
                v4 = (u217.Position - Position).Magnitude / 100
                TweenService:Create(u217, TweenInfo.new(v4, Enum.EasingStyle.Linear), {Position = Position}):Play()
                TimescaleUtilities.Delay(v4, function() -- Line: 131 -- upvalues: u217 (val)
                    u217:Destroy()
                end)
            elseif self.Model.Name ~= "Champion" then
                self:Bullet({
                    Start = Handle.Start.WorldPosition,
                    End = Position,
                    Spread = 30,
                    Speed = 100,
                })
            else
                u217 = u46:Clone()
                u217.CFrame = CFrame.new(Handle.Start.WorldPosition, Position)
                u217.Parent = workspace
                if self.Model.Name == "Champion" then
                    EmitterManager.toggle(u217, true)
                end
                v4 = (u217.Position - Position).Magnitude / 100
                TweenService:Create(u217, TweenInfo.new(v4, Enum.EasingStyle.Linear), {Position = Position}):Play()
                TimescaleUtilities.Delay(v4, function() -- Line: 131 -- upvalues: u217 (val)
                    u217:Destroy()
                end)
            end
        end
    end
    self:Delay((self:GetCooldown()))
end

function v1.Initialize(a1) -- Line: 202
    -- upvalues: Animation (val), u46 (ref), Create (val), TextChatService (val), SharedControllerFunctions (val)
    if a1.Model.Name == "Guest" then
        Animation.new({
            Preload = true,
            IgnorePriority = true,
            Track = a1.Model.Animations.PlaceAnimation,
            Target = a1.Model.AnimationController,
        }):Play(0)
        u46 = Create("Part", {
            Size = Vector3.new(0.25, 0.25, 1.25),
            Anchored = true,
            CanCollide = false,
            CanQuery = false,
            BrickColor = BrickColor.Yellow(),
        })
        local u22 = {"101", "1234", "1337", "0"}
        local u27 = {
            "Happy Easter",
            "Go to sleep",
            "Happy trails",
            "Thanks for playing",
            "I like your style",
            "Hello",
            "Hi",
            "What's new?",
            "I can only use quick chat!",
            "Wanna be friends?",
        }

        local function updateGuestUI(a1_2) -- Line: 242
            -- upvalues: TextChatService (upval), a1 (val), u27 (val), u22 (val)
            if a1_2 == 4 then
                TextChatService:DisplayBubble(a1.Model.Head, u27[math.random(1, #u27)], 5, (Color3.fromRGB(255, 255, 255)))
            end
            a1.Model.Head.Guest.BillboardGui.Label.Text = ("Guest %*"):format(u22[a1_2] or "10")
        end

        a1.OnUpgrade:Connect(updateGuestUI)
        updateGuestUI(a1:GetLevel())
    elseif a1.Model.Name == "Champion" then
        u46 = a1.Model.Effects.Bullet0
    end
    a1.right = true
    a1.lastFireAnim = nil
    local Handle1 = a1.Model.PrimaryPart:FindFirstChild("Handle1")
    local Handle2 = a1.Model.PrimaryPart:FindFirstChild("Handle2")
    if a1.Model:FindFirstChild("Torso") then
        SharedControllerFunctions.RegisterJoints(a1, {a1.Model.Torso["Right Shoulder"]})
    end
    if Handle1 then
        SharedControllerFunctions.RegisterJoints(a1, {Handle1})
    end
    a1.OnUpgrade:Connect(function(a1_2) -- Line: 276 -- upvalues: a1 (val), u46 (upval), SharedControllerFunctions (upval), Handle2 (val)
        if a1_2 >= 4 then
            if a1.Model.Name == "Champion" then
                u46 = a1.Model.Effects.Bullet4
            end
            if a1.Model:FindFirstChild("Torso") then
                SharedControllerFunctions.AppendJoints(a1, {a1.Model.Torso["Left Shoulder"]})
            end
            if Handle2 then
                SharedControllerFunctions.AppendJoints(a1, {Handle2})
            end
        end
    end)
    a1.Maid:Mark(function() -- Line: 291 -- upvalues: a1 (val)
        if a1._firePools then
            for i, j in a1._firePools do
                j:destroy()
            end
            a1._firePools = nil
        end
    end)
    a1:Thread(function() -- Line: 301 -- upvalues: a1 (val)
        local v1 = a1:FindTarget()
        if v1 then
            a1:Fire(v1)
        end
    end)
end

return v1