-- Script path: ReplicatedStorage.Content.Tower.Freezer.Animator
-- Decompile time: 4.79 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local SharedControllerFunctions = require(ReplicatedStorage.Client.Modules.SharedControllerFunctions)
local v1 = {}
v1.__index = v1
local u32 = Random.new()

function v1:Fire(a2) -- Line: 15 -- upvalues: u32 (val), EasySound (val), EmitterManager (val)
    local PrimaryPart = a2.PrimaryPart
    if not PrimaryPart then
        return
    end
    local Torso = a2:FindFirstChild("Torso")
    local Head = a2:FindFirstChild("Head")
    local Position = Torso and Torso.Position or PrimaryPart.Position
    self.AimAt(Position, Head and Head.Position or Position)
    if self.lastAnimation then
        self.lastAnimation:Stop()
    end
    self.fireAnimation:Play()
    self.lastAnimation = self.fireAnimation
    local Value = nil
    local Value_2 = nil
    local Name = nil
    local Color = BrickColor.new("Toothpaste").Color
    if not self.FBXModel then
        local Handle = self.Model.Weapon.Gun.Handle
        Value = Handle.Start
        Value_2 = Handle:FindFirstChild("Fire")
    else
        local Configuration = self.Model.Weapon:FindFirstChild("Configuration", true)
        if Configuration then
            Value = Configuration.Attachments.Start.Value
            Value_2 = Configuration.Sounds.Fire.Value
            Name = Configuration:GetAttribute("BulletType")
            local RandomBullets = Configuration:FindFirstChild("RandomBullets")
            if RandomBullets and #RandomBullets:GetChildren() > 0 then
                local Children = RandomBullets:GetChildren()
                Name = Children[u32:NextInteger(1, #Children)].Name
                Color = nil
            end
        end
    end
    if Value_2 and Value_2:IsA("Sound") then
        local v1 = string.match(Value_2.SoundId or "", "%d+")
        local v2 = v1 and tonumber(v1)
        if v2 then
            EasySound.Play({
                soundGroupName = "Towers",
                destroyOnEnd = true,
                id = v2,
                parent = Value_2.Parent,
                volume = Value_2.Volume,
                playbackSpeed = u32:NextNumber(Value_2.PlaybackSpeed * 0.9, Value_2.PlaybackSpeed * 1.2),
            })
        end
    end
    self:Bullet({
        Start = Value.WorldPosition,
        End = Position,
        Spread = 50,
        Speed = 140,
        Color = Color,
        Bullet = Name,
    })
    EmitterManager.manualEmit(Value)
    self:Delay(self.State.Cooldown)
end

function v1.ToggleModel(a1, a2, a3) -- Line: 90
    for k, v in pairs(a2:GetChildren()) do
        if v:IsA("BasePart") then
            v.Transparency = if not a3 then 1 else 0
        end
    end
end

function v1.Initialize(a1) -- Line: 98
    -- upvalues: Animation (val), SharedControllerFunctions (val), EasySound (val), u32 (val), ItemDrop (val)
    -- upvalues: EmitterManager (val)
    a1.throwing = false
    a1.reloading = false
    a1.lastAnimation = nil
    a1.fireAnimation = nil

    local function updateAnimations(a1_2) -- Line: 104 -- upvalues: a1 (val), Animation (upval) -- types: a1_2: number
        a1.fireAnimation = Animation.new({
            Track = a1.Model.Animations.Fire[a1_2].Fire,
            Target = a1.Model.AnimationController,
        })
    end

    a1.fireAnimation = Animation.new({
        Track = a1.Model.Animations.Fire[0].Fire,
        Target = a1.Model.AnimationController,
    })
    a1.OnUpgrade:Connect(function(a1_2) -- Line: 112 -- upvalues: a1 (val), Animation (upval) -- types: a1_2: number
        if a1_2 == 3 then
            a1.fireAnimation = Animation.new({
                Track = a1.Model.Animations.Fire[a1_2].Fire,
                Target = a1.Model.AnimationController,
            })
        end
    end)
    if not a1.FBXModel then
        SharedControllerFunctions.RegisterJoints(a1, {a1.Model.Torso["Left Shoulder"], a1.Model.Torso["Right Shoulder"]})
    end

    function a1.AimAt(a1_2, a2) -- Line: 125 -- upvalues: a1 (val), SharedControllerFunctions (upval)
        a1:Face(a1_2)
        SharedControllerFunctions.AimArmsAt(a1, a1_2)
        SharedControllerFunctions.AimHeadAt(a1, a2 or a1_2)
    end

    a1:Thread(function() -- Line: 131 -- upvalues: a1 (val)
        local v1 = a1:FindTarget()
        if v1 and not a1.reloading and not a1.throwing then
            a1:Fire(v1)
        end
    end)
    a1.Executables = {
        Reloading = function(a1_2) -- Line: 140 -- upvalues: a1 (val) -- types: a1_2: boolean
            a1.reloading = a1_2
        end,
        Grenade = function(a1_2, a2) -- Line: 144
            -- upvalues: a1 (val), Animation (upval), EasySound (upval), u32 (upval), ItemDrop (upval)
            -- upvalues: EmitterManager (upval)
            a1.throwing = true
            local Grenade = a1.Model.Grenade
            local u11 = workspace:GetServerTimeNow() - a2
            a1:ToggleModel(Grenade, true)
            if a1.lastAnimation then
                a1.lastAnimation:Stop()
            end
            a1.lastAnimation = Animation.new({
                Track = a1.Model.Animations.Grenade,
                Target = a1.Model.AnimationController,
            })
            a1.lastAnimation:Play()
            task.spawn(function() -- Line: 160
                -- upvalues: a1 (upval), u11 (val), a1_2 (val), Grenade (val), EasySound (upval), u32 (upval)
                -- upvalues: ItemDrop (upval), EmitterManager (upval)
                task.wait((math.clamp(a1.Stats.Attributes.GrenadeEquip - u11, 0, a1.Stats.Attributes.GrenadeEquip)))
                a1.AimAt(a1_2.goal)
                local Fire = Grenade.Grenade:FindFirstChild("Fire")
                local Value = nil
                if not Fire and a1.FBXModel then
                    local Configuration = a1.Model.Grenade:FindFirstChild("Configuration", true)
                    if Configuration then
                        Fire = Configuration.Sounds.Fire.Value
                        local Explosion = Configuration:FindFirstChild("Explosion")
                        if Explosion and Explosion:IsA("ObjectValue") then
                            Value = Explosion.Value
                        end
                    end
                end
                if Fire and Fire:IsA("Sound") then
                    local v1 = string.match(Fire.SoundId or "", "%d+")
                    local v2 = v1 and tonumber(v1)
                    if v2 then
                        EasySound.Play({
                            soundGroupName = "Towers",
                            destroyOnEnd = true,
                            id = v2,
                            parent = Grenade.Grenade,
                            volume = Fire.Volume,
                        })
                    end
                end
                local u75 = Grenade:Clone()
                u75.Parent = workspace.CurrentCamera
                if a1.FBXModel then
                    for i, j in u75:GetDescendants() do
                        if j:IsA("Motor6D") then
                            j:Destroy()
                        end
                    end
                end
                a1:ToggleModel(Grenade, false)
                a1:ToggleModel(u75, true)
                local u116 = u32:NextNumber()
                ;(ItemDrop.Drop(a1_2.start, a1_2.goal, u75, a1_2.dtMultiplier, a1_2.gravity, a1_2.velocity, function(a1, a2, a3) -- Line: 215 -- upvalues: u116 (val)
                    local v1 = (CFrame.lookAt(a2, a3)) * CFrame.Angles(u116 + a1, u116 + a1, 0)
                    return v1 - v1.Position
                end)):andThen(function() -- Line: 221
                    -- upvalues: u75 (val), Value (ref), a1_2 (upval), EmitterManager (upval), EasySound (upval)
                    -- upvalues: a1 (upval)
                    u75:Destroy()
                    if not Value then
                        EmitterManager.Emit("IceExplosion", CFrame.new(a1_2.goal), a1.Stats.Attributes.ExplosionRadius)
                        return
                    end
                    local v1 = Value:Clone()
                    v1.Position = a1_2.goal
                    v1.Parent = workspace
                    v1.Anchored = true
                    EmitterManager.manualEmit(v1)
                    EasySound.Play({
                        id = 6635977730,
                        audioGroupName = "Towers",
                        destroyOnEnd = true,
                        volume = 0.5,
                        parent = v1,
                    })
                    game.Debris:AddItem(v1, 2)
                end)
            end)
            a1:Delay(1.5)
            a1.throwing = false
        end,
    }
end

return v1