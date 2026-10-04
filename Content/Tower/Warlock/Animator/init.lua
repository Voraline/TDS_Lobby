-- Script path: ReplicatedStorage.Content.Tower.Warlock.Animator
-- Decompile time: 9.02 ms

local ContentProvider = game:GetService("ContentProvider")
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local NPCReplicator = require(ReplicatedStorage.Client.Modules.Replicators.NPCReplicator)
local u40 = require("@self/Sounds")
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local UpgradesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.UpgradesStore)
local v1 = {}
v1.__index = v1
local u55 = Random.new()
local u56 = {84415102435962, 103397705071315, 74590509036111, 134554240135825}
local u61 = {
    Eyecatcher = {
        {id = 120516940903121, brightness = 10},
        {id = 127734723840046, brightness = 10},
        {id = 83027980975079, brightness = 10},
        {id = 129345402659876, brightness = 10},
    },
    ["Surfs Up"] = {
        {id = 86983101196570, brightness = 2},
        {id = 103968180857774, brightness = 10},
        {id = 92853328536113, brightness = 1},
    },
    Dragon = {
        {id = 91071044784519, brightness = 4},
        {id = 83377221596550, brightness = 4},
        {id = 73702448915053, brightness = 4},
        {id = 85582550531367, brightness = 4},
    },
}

local function normalizeBeamVFXList(a1) -- Line: 53
    local v1 = {}
    for i, j in a1 do
        if type(j) == "number" then
            table.insert(v1, {brightness = 4, id = j})
        elseif type(j) == "table" and type(j.id) == "number" then
            table.insert(v1, {id = j.id, brightness = j.brightness or 4})
        end
    end
    return v1
end

local function getBeamVFXForSkin(a1) -- Line: 73
    -- upvalues: u61 (val), normalizeBeamVFXList (val), u56 (val)
    local v1 = u61[a1]
    if v1 and #v1 > 0 then
        local v2 = normalizeBeamVFXList(v1)
        if #v2 > 0 then
            return v2
        end
    end
    return (normalizeBeamVFXList(u56))
end

local function findRangedAttackByLevel(a1, a2, a3) -- Line: 85 -- types: a1: userdata, a2: number, a3: number?
    local v1
    local RangedAttack = a1:FindFirstChild("RangedAttack")
    if a3 and a3 <= a2 then
        local v2 = a1:FindFirstChild((("RangedAttack%*"):format(a3)))
        if v2 and v2:IsA("ObjectValue") and v2.Value then
            return v2, a3
        end
    end
    for i = a2, 0, -1 do
        v1 = a1:FindFirstChild((("RangedAttack%*"):format(i)))
        if v1 and v1:IsA("ObjectValue") and v1.Value then
            return v1, i
        end
    end
    if RangedAttack and RangedAttack:IsA("ObjectValue") and RangedAttack.Value then
        return RangedAttack, nil
    end
    return nil, nil
end

local function getAssetBeams(a1) -- Line: 113 -- types: a1: userdata
    local Beams = a1:FindFirstChild("Beams")
    if Beams and Beams:IsA("Folder") then
        local v1 = {}
        for i, j in Beams:GetChildren() do
            if j:IsA("Beam") then
                table.insert(v1, j)
            end
        end
        if #v1 > 0 then
            return v1
        end
        return nil
    end
    return nil
end

local function createAssetBeamVFX(a1, a2, a3) -- Line: 129
    -- upvalues: u55 (val), TweenService (val)
    local v1
    local Attachment = Instance.new("Attachment")
    Attachment.Parent = workspace
    Attachment.WorldCFrame = a1.WorldCFrame
    local v2 = table.clone(a3)
    u55:Shuffle(v2)
    local v3 = nil
    local v4 = nil
    local v5, v6 = a2, a1
    for i, j in v2, v3, v4 do
        v1 = j:Clone()
        v1.Attachment0 = v6
        v1.Attachment1 = Attachment
        v1.Enabled = i == 1
        v1.Parent = v6
        v2[i] = v1
    end
    v2[1].Destroying:Once(function() -- Line: 150 -- upvalues: Attachment (val)
        Attachment:Destroy()
    end)
    TweenService:Create(Attachment, TweenInfo.new(0.08333333333333333), {WorldCFrame = v5.CFrame}):Play()
    return v2
end

local function createBeamVFX(a1, a2, a3, a4) -- Line: 160
    -- upvalues: normalizeBeamVFXList (val), u56 (val), u55 (val), TweenService (val)
    local Attachment = Instance.new("Attachment")
    Attachment.Parent = workspace
    Attachment.WorldCFrame = a1.WorldCFrame
    local v1 = table.clone(a4 or normalizeBeamVFXList(u56))
    u55:Shuffle(v1)
    local v2 = {
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 102, 102)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 102, 102))),
    }
    if a3 and #a3:GetChildren() == 2 then
        local Color0 = a3:FindFirstChild("Color0")
        local Color1 = a3:FindFirstChild("Color1")
        if Color0 and Color0:IsA("Color3Value") and Color1 and Color1:IsA("Color3Value") then
            v2 = {
                ColorSequenceKeypoint.new(0, Color0.Value),
                (ColorSequenceKeypoint.new(1, Color1.Value)),
            }
        end
    end
    local Beam = Instance.new("Beam")
    Beam.Name = "Swirlies"
    Beam.Brightness = v1[1].brightness or 4
    Beam.Color = ColorSequence.new(v2)
    Beam.FaceCamera = true
    Beam.Texture = ("rbxassetid://%*"):format(v1[1].id)
    Beam.TextureSpeed = 0
    Beam.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 0))})
    Beam.Attachment0 = a1
    Beam.Attachment1 = Attachment
    Beam.ZOffset = -0.01
    Beam.Parent = a1
    Beam.Destroying:Once(function() -- Line: 204 -- upvalues: Attachment (val)
        Attachment:Destroy()
    end)
    TweenService:Create(Attachment, TweenInfo.new(0.08333333333333333), {WorldCFrame = a2.CFrame}):Play()
    table.remove(v1, 1)
    return Beam, v1
end

function v1:_playAnimation(a2, a3) -- Line: 215 -- types: self: table, a2: string
    return (self:Animate(a2, nil, {a3 or 0.1}))
end

function v1:_playSound(a2) -- Line: 219 -- upvalues: EasySound (val), u55 (val) -- types: self: table, a2: number
    EasySound.Play({
        volume = 0.5,
        audioGroup = "Towers",
        destroyOnEnd = true,
        id = a2,
        parent = self.Model.PrimaryPart,
        playbackSpeed = u55:NextNumber(0.9, 1.1),
    })
end

function v1.Initialize(a1) -- Line: 230
    -- upvalues: u40 (val), u61 (val), normalizeBeamVFXList (val), u56 (val), getAssetBeams (val), ContentProvider (val)
    -- upvalues: EmitterManager (val), UpgradesStore (val), HttpService (val), AreaIndicatorStore (val)
    -- upvalues: NPCReplicator (val), findRangedAttackByLevel (val), createAssetBeamVFX (val), TweenService (val)
    -- upvalues: createBeamVFX (val)
    local v1
    local Name = a1.Model.Name
    local Default = u40[Name]
    if not Default then
        Default = u40.Default
    end
    local v2 = u61[Name]
    if not v2 or not (#v2 > 0) then
        v1 = normalizeBeamVFXList(u56)
    else
        local v3 = normalizeBeamVFXList(v2)
        v1 = if not (#v3 > 0) then normalizeBeamVFXList(u56) else v3
    end
    a1._beamVFXEntries = v1
    task.spawn(function() -- Line: 235 -- upvalues: a1 (val), getAssetBeams (upval), ContentProvider (upval)
        local Decal
        local v1 = {}
        for i, j in a1._beamVFXEntries do
            Decal = Instance.new("Decal")
            Decal.Texture = ("rbxassetid://%*"):format(j.id)
            table.insert(v1, Decal)
        end
        local VFX = a1.Model:FindFirstChild("VFX")
        local v2 = if not VFX then nil else getAssetBeams(VFX)
        if v2 then
            for k, n in v2 do
                table.insert(v1, n)
            end
        end
        ContentProvider:PreloadAsync(v1)
    end)
    a1.OnUpgrade:Connect(function(a1_2) -- Line: 254 -- upvalues: a1 (val), EmitterManager (upval)
        if a1_2 ~= 5 then
            return
        end
        local VFX = a1.Model:FindFirstChild("VFX")
        if not VFX then
            return
        end
        local SwordTrail = VFX:FindFirstChild("SwordTrail")
        if SwordTrail and SwordTrail.Value then
            EmitterManager.toggle(SwordTrail.Value, true)
        end
    end)
    a1.Executables = {
        Face = function(a1_2) -- Line: 271 -- upvalues: a1 (val) -- types: a1_2: vector
            a1:_faceTarget(a1_2, 0.2)
        end,
        AreaIndicator = function(a1_2, a2, a3) -- Line: 274
            -- upvalues: UpgradesStore (upval), a1 (val), HttpService (upval), AreaIndicatorStore (upval)
            if UpgradesStore.getState().model ~= a1.Model then
                return
            end
            local v1 = HttpService:GenerateGUID(false)
            AreaIndicatorStore.create(v1, {
                type = "normal",
                initialAngle = 0,
                radius = a2,
                desiredAngle = a1_2,
                color3 = Color3.fromRGB(255, 255, 255),
                cframe = CFrame.new(-a1.Model.PrimaryPart.HeightOffset.Position),
                tweenInfo = TweenInfo.new(0.25),
                lifeTime = a3,
                basePart = a1.Model.PrimaryPart,
            })
            a1:Wait(a3 * 2)
            AreaIndicatorStore.remove(v1)
        end,
        SwitchMode = function() -- Line: 293 -- upvalues: a1 (val), EmitterManager (upval)
            a1._serverCombo = nil
            a1._playingCombo = nil
            a1._currentMode = "ranged"
            if not a1._adsTrack or not a1._adsTrack.IsPlaying then
                local v1 = a1:_playAnimation("ADSIdle")
                v1.Looped = true
                a1._adsTrack = v1
            end
            if a1._currentTrack and a1._currentTrack ~= a1._adsTrack and a1._currentTrack.IsPlaying then
                a1._currentTrack:Stop()
            end
            local SwitchToRanged = a1.Model:FindFirstChild("SwitchToRanged", true)
            if not SwitchToRanged then
                return
            end
            EmitterManager.manualEmit(SwitchToRanged)
        end,
        FireRanged = function() -- Line: 317
            -- upvalues: a1 (val), Default (val), NPCReplicator (upval), EmitterManager (upval)
            -- upvalues: findRangedAttackByLevel (upval), getAssetBeams (upval), createAssetBeamVFX (upval)
            -- upvalues: TweenService (upval), createBeamVFX (upval)
            local v1
            if not a1._adsTrack then
                if a1._currentMode == "ranged" then
                    v1 = a1:_playAnimation("ADSIdle")
                    v1.Looped = true
                    a1._adsTrack = v1
                end
            elseif not a1._adsTrack.IsPlaying and a1._currentMode == "ranged" then
                v1 = a1:_playAnimation("ADSIdle")
                v1.Looped = true
                a1._adsTrack = v1
            end
            local beamShoot = Default.beamShoot
            if a1.Upgrade == 5 then
                beamShoot = Default.maxBeamShoot
            end
            if a1.Target and a1.Target.Value then
                local v2 = NPCReplicator.GetNPCFromFolder(a1.Target.Value)
                if v2 then
                    local PrimaryPart = v2.Model.PrimaryPart
                    local VFX = a1.Model:FindFirstChild("VFX")
                    if not VFX then
                        return
                    end
                    local RangedHit = VFX:FindFirstChild("RangedHit")
                    if RangedHit then
                        local u45 = RangedHit:Clone()
                        u45.Parent = workspace:FindFirstChild("Trash")
                        u45.WorldCFrame = PrimaryPart.CFrame
                        EmitterManager.manualEmit(u45)
                        a1:Delay(2, function() -- Line: 349 -- upvalues: u45 (val)
                            u45:Destroy()
                        end)
                    end
                    local v3, v4 = findRangedAttackByLevel(VFX, a1.Upgrade or 0, a1._cachedRangedAttackLevel)
                    a1._cachedRangedAttackLevel = v4
                    if v3 and v3.Value then
                        local CustomBeamColors = VFX:FindFirstChild("CustomBeamColors")
                        local v5 = getAssetBeams(VFX)
                        EmitterManager.manualEmit(v3.Value)
                        if not v5 then
                            local u103, u104 = createBeamVFX(v3.Value, PrimaryPart, CustomBeamColors, a1._beamVFXEntries)
                            a1:Delay(0.06666666666666667, function() -- Line: 397 -- upvalues: u104 (val), u103 (val), a1 (upval), TweenService (upval)
                                local v1 = #u104
                                for i = 1, v1 do
                                    u103.Transparency = NumberSequence.new(1)
                                    a1:Wait(0.016666666666666666)
                                    u103.Transparency = NumberSequence.new({
                                        NumberSequenceKeypoint.new(0, 0),
                                        (NumberSequenceKeypoint.new(1, 0)),
                                    })
                                    u103.Texture = ("rbxassetid://%*"):format(u104[i].id)
                                    u103.Brightness = u104[i].brightness or 4
                                    a1:Wait(0.016666666666666666)
                                end
                                TweenService:Create(u103, TweenInfo.new(0.08333333333333333), {Width0 = 0.5, Width1 = 0.5}):Play()
                                a1:Wait(0.08333333333333333)
                                u103:Destroy()
                            end)
                        else
                            local u90 = createAssetBeamVFX(v3.Value, PrimaryPart, v5)
                            a1:Delay(0.06666666666666667, function() -- Line: 369 -- upvalues: u90 (val), a1 (upval), TweenService (upval)
                                local v1
                                local v2 = #u90
                                for i = 2, v2 do
                                    v1 = u90[i - 1]
                                    v1.Enabled = false
                                    a1:Wait(0.016666666666666666)
                                    v1 = u90[i]
                                    v1.Enabled = true
                                    a1:Wait(0.016666666666666666)
                                end
                                v2 = u90[#u90]
                                TweenService:Create(v2, TweenInfo.new(0.08333333333333333), {Width0 = 0.5, Width1 = 0.5}):Play()
                                a1:Wait(0.08333333333333333)
                                for j, k in u90 do
                                    k:Destroy()
                                end
                            end)
                        end
                    end
                end
            end
            a1:_playSound(beamShoot)
            ;(a1:_playAnimation("Fire")).Stopped:Once(function() -- Line: 429 -- upvalues: a1 (upval)
                if a1._currentMode == "ranged" and a1._adsTrack and not a1._adsTrack.IsPlaying then
                    a1._adsTrack:Play()
                end
            end)
        end,
        RangedOutro = function() -- Line: 439 -- upvalues: a1 (val)
            if a1._currentMode ~= "ranged" then
                return
            end
            a1._currentMode = "melee"
            if a1._adsTrack and a1._adsTrack.IsPlaying then
                a1._adsTrack:Stop()
            end
            ;(a1:_playAnimation("FireOutro")).Stopped:Once(function() -- Line: 449 -- upvalues: a1 (upval)
                if a1._currentMode ~= "ranged" then
                    a1._adsTrack = nil
                end
            end)
        end,
        SwingCombo = function(a1_2) -- Line: 455 -- upvalues: a1 (val), Default (val), EmitterManager (upval) -- types: a1_2: number
            if a1._currentMode == "ranged" then
                return
            end
            a1._serverCombo = a1_2
            ;(function(a1_2, a2) -- Line: 461 -- upvalues: a1 (upval), Default (upval) -- types: a1_2: number, a2: boolean
                a1._playingCombo = a1_2
                a1._pendingCombo = nil
                local v1 = Default.meleeComboSwings[a1_2] or Default.meleeComboSwings[1]
                if a1.Upgrade == 5 then
                    v1 = Default.maxMeleeComboSwings[a1_2] or Default.maxMeleeComboSwings[1]
                end
                a1:_playSound(v1)
                ;(a1:_playAnimation((("Swing%*"):format(a1_2)))).Stopped:Once(function() -- Line: 476 -- upvalues: a1 (upval)
                    if a1._playingCombo == 3 then
                        a1._playingCombo = nil
                        a1._currentTrack = nil
                    end
                end)
            end)(
                a1_2,
                false
            )
            if a1.Upgrade == 5 then
                a1:Delay(a1.Stats.MeleeWindup or a1.Stats.Attributes.MeleeWindup or 0, function() -- Line: 489 -- upvalues: a1 (upval), EmitterManager (upval), a1_2 (val)
                    if a1.Model and a1.Model.PrimaryPart then
                        EmitterManager.manualEmit(a1.Model.PrimaryPart:FindFirstChild((("Attack%*"):format(a1_2))))
                    end
                end)
            end
        end,
    }
end

function v1:_faceTarget(a2, a3) -- Line: 502
    -- upvalues: TweenService (val)
    local PrimaryPart = self.Model.PrimaryPart
    local v1 = CFrame.new(PrimaryPart.CFrame.Position, (Vector3.new(a2.X, PrimaryPart.Position.Y, a2.Z)))
    TweenService:Create(PrimaryPart, TweenInfo.new(a3), {CFrame = v1}):Play()
    return v1
end

return v1