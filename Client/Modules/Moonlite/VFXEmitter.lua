-- Script path: ReplicatedStorage.Client.Modules.Moonlite.VFXEmitter
-- Decompile time: 18.79 ms

local CollectionService = game:GetService("CollectionService")
local Debris = game:GetService("Debris")
local TweenService = game:GetService("TweenService")
local v1 = {}
local u17 = Random.new()
local u18 = {Beam = true, ParticleEmitter = true, Sound = true, Trail = true}

local function getNumberAttribute(a1, a2, a3) -- Line: 18 -- types: a1: userdata, a2: string, a3: number
    local Attribute = a1:GetAttribute(a2)
    if typeof(Attribute) == "number" then
        return Attribute
    end
    return a3
end

local function getBooleanAttribute(a1, a2, a3) -- Line: 23 -- types: a1: userdata, a2: string, a3: boolean
    local Attribute = a1:GetAttribute(a2)
    if typeof(Attribute) == "boolean" then
        return Attribute
    end
    return a3
end

local function getStringAttribute(a1, a2, a3) -- Line: 28 -- types: a1: userdata, a2: string, a3: string
    local Attribute = a1:GetAttribute(a2)
    if typeof(Attribute) == "string" then
        return Attribute
    end
    return a3
end

local function getNumberRangeAttribute(a1, a2, a3) -- Line: 33 -- types: a1: userdata, a2: string, a3: userdata
    local Attribute = a1:GetAttribute(a2)
    if typeof(Attribute) == "NumberRange" then
        return Attribute
    end
    return a3
end

local function randomFromRange(a1) -- Line: 42 -- upvalues: u17 (val) -- types: a1: userdata
    if a1.Min == a1.Max then
        return a1.Min
    end
    return u17:NextNumber(a1.Min, a1.Max)
end

local function getSoundEmitDelay(a1) -- Line: 50 -- types: a1: userdata
    local Attribute = a1:GetAttribute("EmitDelay")
    if typeof(Attribute) == "number" then
        return Attribute
    end
    local Attribute_2 = a1:GetAttribute("Delay")
    if typeof(Attribute_2) == "number" then
        return Attribute_2
    end
    return 0
end

local function selectSoundFromPool(a1) -- Line: 59
    -- upvalues: CollectionService (val), u17 (val)
    local Attribute_2, v1, v2
    local Attribute = a1:GetAttribute("SoundPoolTag")
    if (if typeof(Attribute) ~= "string" then "" else Attribute) == "" then
        return a1
    end
    local v3 = {}
    local v4 = {}
    local v5 = 0
    local v6 = (CollectionService:GetTagged(v1))
    local v7 = nil
    local v8 = nil
    for i, j in v6, v7, v8 do
        if j:IsA("Sound") then
            Attribute_2 = j:GetAttribute("SoundPoolWeight")
            v2 = math.max(if typeof(Attribute_2) ~= "number" then 1 else Attribute_2, 0)
            table.insert(v3, j)
            table.insert(v4, v2)
            v5 = v5 + v2
        end
    end
    if #v3 == 0 then
        return a1
    end
    if v5 > 0 then
        v6 = u17:NextNumber() * v5
        v7 = 0
        for k, n in v4 do
            v7 = v7 + n
            if v6 <= v7 then
                return v3[k]
            end
        end
    end
    return v3[u17:NextInteger(1, #v3)]
end

local function getSoundParent(a1) -- Line: 100 -- types: a1: userdata
    return a1:FindFirstAncestorWhichIsA("BasePart") or workspace.Terrain
end

local function tweenSoundNumber(a1, a2, a3, a4) -- Line: 105
    -- upvalues: TweenService (val)
    local v1 = a1[a2]
    if not (a4 <= 0) and v1 ~= a3 then
        TweenService:Create(a1, TweenInfo.new(a4), {[a2] = a3}):Play()
        return
    end
end

local function cleanupSound(a1) -- Line: 117 -- types: a1: userdata
    if a1.Parent then
        a1:Destroy()
    end
end

local function playSingleSound(a1, a2, a3, a4) -- Line: 123
    -- upvalues: tweenSoundNumber (val), Debris (val)
    if a2.SoundId == "" then
        return
    end
    local u7 = a2:Clone()
    for i, j in u7:GetTags() do
        u7:RemoveTag(j)
    end
    local Volume = u7.Volume
    local Attribute = a3:GetAttribute("Volume_Start")
    u7.Volume = if typeof(Attribute) ~= "number" then Volume else Attribute
    local PlaybackSpeed = u7.PlaybackSpeed
    local Attribute_2 = a3:GetAttribute("Speed_Start")
    u7.PlaybackSpeed = if typeof(Attribute_2) ~= "number" then PlaybackSpeed else Attribute_2
    local RollOffMinDistance = u7.RollOffMinDistance
    local Attribute_3 = a3:GetAttribute("RollOff_Start")
    u7.RollOffMinDistance = if typeof(Attribute_3) ~= "number" then RollOffMinDistance else Attribute_3
    u7.Parent = a1:FindFirstAncestorWhichIsA("BasePart") or workspace.Terrain
    local Volume_2 = u7.Volume
    local Attribute_4 = a3:GetAttribute("Volume_End")
    local TimeLength = u7.TimeLength
    local Attribute_5 = a3:GetAttribute("Volume_Duration")
    local v1 = if typeof(Attribute_5) ~= "number" then TimeLength else Attribute_5
    tweenSoundNumber(u7, "Volume", if typeof(Attribute_4) ~= "number" then Volume_2 else Attribute_4, v1)
    local PlaybackSpeed_2 = u7.PlaybackSpeed
    local Attribute_6 = a3:GetAttribute("Speed_End")
    local TimeLength_2 = u7.TimeLength
    local Attribute_7 = a3:GetAttribute("Speed_Duration")
    v1 = if typeof(Attribute_7) ~= "number" then TimeLength_2 else Attribute_7
    tweenSoundNumber(u7, "PlaybackSpeed", if typeof(Attribute_6) ~= "number" then PlaybackSpeed_2 else Attribute_6, v1)
    local RollOffMinDistance_2 = u7.RollOffMinDistance
    local Attribute_8 = a3:GetAttribute("RollOff_End")
    local TimeLength_3 = u7.TimeLength
    local Attribute_9 = a3:GetAttribute("RollOff_Duration")
    v1 = if typeof(Attribute_9) ~= "number" then TimeLength_3 else Attribute_9
    tweenSoundNumber(u7, "RollOffMinDistance", if typeof(Attribute_8) ~= "number" then RollOffMinDistance_2 else Attribute_8, v1)
    if u7.PlayOnRemove then
        u7:Destroy()
        return
    end
    u7:Play()
    if a4 > 0 then
        task.delay(a4, function() -- Line: 171 -- upvalues: u7 (val)
            if u7.Parent then
                u7:Stop()
                local v1 = u7
                if v1.Parent then
                    v1:Destroy()
                end
            end
        end)
        return
    end
    u7.Ended:Once(function() -- Line: 178 -- upvalues: u7 (val)
        local v1 = u7
        if v1.Parent then
            v1:Destroy()
        end
    end)
    Debris:AddItem(u7, (math.max(u7.TimeLength / (math.max(u7.PlaybackSpeed, 0.001)), 0.1)) + 1)
end

local function emitSound(a1) -- Line: 187
    -- upvalues: selectSoundFromPool (val), playSingleSound (val), randomFromRange (val)
    local v1
    if a1.Playing then
        a1:Stop()
    end
    local Attribute = a1:GetAttribute("SoundPoolIsSource")
    local u14 = if typeof(Attribute) ~= "boolean" then false else Attribute
    local Attribute_2 = a1:GetAttribute("SoundPoolInheritAttributes")
    local u24 = if typeof(Attribute_2) ~= "boolean" then false else Attribute_2
    local u33 = a1
    if u24 and not u14 then
        v1 = selectSoundFromPool(a1)
        if v1 then
            u33 = v1
        end
    end
    local v2 = u33
    local Attribute_3 = v2:GetAttribute("EmitDelay")
    if typeof(Attribute_3) ~= "number" then
        local Attribute_4 = v2:GetAttribute("Delay")
        v1 = if typeof(Attribute_4) ~= "number" then 0 else Attribute_4
    else
        v1 = Attribute_3
    end
    local Attribute_5 = u33:GetAttribute("EmitDuration")
    local u63 = if typeof(Attribute_5) ~= "number" then 0 else Attribute_5
    local Attribute_6 = u33:GetAttribute("EmitCount")
    local u77 = math.floor(if typeof(Attribute_6) ~= "number" then 1 else Attribute_6)
    local v3 = u33
    local v4 = NumberRange.new(0, 0)
    local Attribute_7 = v3:GetAttribute("EmitInterval")
    local u92 = if typeof(Attribute_7) ~= "NumberRange" then v4 else Attribute_7
    local Attribute_8 = u33:GetAttribute("RepeatCount")
    local u106 = math.floor(if typeof(Attribute_8) ~= "number" then 1 else Attribute_8)
    local v5 = u33
    local v6 = NumberRange.new(0, 0)
    local Attribute_9 = v5:GetAttribute("RepeatInterval")
    local u121 = if typeof(Attribute_9) ~= "NumberRange" then v6 else Attribute_9
    if not (u77 <= 0) and not (u106 <= 0) then
        local function runSoundSchedule() -- Line: 215
            -- upvalues: u77 (val), u33 (ref), u24 (val), u14 (val), selectSoundFromPool (upval), a1 (val), u106 (val)
            -- upvalues: playSingleSound (upval), u63 (val), u121 (val), randomFromRange (upval), u92 (val)
            local v1, v2
            for i = 1, u77 do
                v1 = u33
                if not u24 and not u14 then
                    v1 = selectSoundFromPool(a1) or a1
                end
                v2 = if not u24 then a1 else v1
                for j = 1, u106 do
                    task.spawn(playSingleSound, a1, v1, v2, u63)
                    if j < u106 and 0 < u121.Max then
                        task.wait(randomFromRange(u121))
                    end
                end
                if i < u77 and 0 < u92.Max then
                    task.wait(randomFromRange(u92))
                end
            end
        end

        if not (v1 > 0) then
            task.spawn(runSoundSchedule)
        else
            task.delay(v1, runSoundSchedule)
        end
        return
    end
end

local function emitParticle(a1) -- Line: 245 -- types: a1: userdata
    local Attribute_3, runParticle, v1
    local Attribute = a1:GetAttribute("EmitCount")
    local u9 = if typeof(Attribute) ~= "number" then nil else Attribute
    local Attribute_2 = a1:GetAttribute("EmitDuration")
    local u19 = if typeof(Attribute_2) ~= "number" then 0 else Attribute_2
    if u9 and not (u9 <= 0) then
        function runParticle() -- Line: 254 -- upvalues: a1 (val), u19 (val), u9 (val)
            if a1.Enabled then
                a1.Enabled = false
            end
            if u19 > 0 then
                a1.Enabled = true
            end
            if u9 and u9 > 0 then
                a1:Emit((math.round(u9)))
            end
            if u19 > 0 then
                task.delay(u19, function() -- Line: 268 -- upvalues: a1 (upval)
                    if a1.Parent then
                        a1.Enabled = false
                    end
                end)
            end
        end

        Attribute_3 = a1:GetAttribute("EmitDelay")
        v1 = if typeof(Attribute_3) ~= "number" then 0 else Attribute_3
        if v1 > 0 then
            task.delay(v1, runParticle)
            return
        end
        runParticle()
        return
    end
    if u19 <= 0 then
        return
    end

    function runParticle() -- Line: 254 -- upvalues: a1 (val), u19 (val), u9 (val)
        if a1.Enabled then
            a1.Enabled = false
        end
        if u19 > 0 then
            a1.Enabled = true
        end
        if u9 and u9 > 0 then
            a1:Emit((math.round(u9)))
        end
        if u19 > 0 then
            task.delay(u19, function() -- Line: 268 -- upvalues: a1 (upval)
                if a1.Parent then
                    a1.Enabled = false
                end
            end)
        end
    end

    Attribute_3 = a1:GetAttribute("EmitDelay")
    v1 = if typeof(Attribute_3) ~= "number" then 0 else Attribute_3
    if v1 > 0 then
        task.delay(v1, runParticle)
        return
    end
    runParticle()
end

local function emitBeamOrTrail(a1) -- Line: 284 -- types: a1: userdata
    local Attribute = a1:GetAttribute("EmitDelay")
    local v1 = if typeof(Attribute) ~= "number" then 0 else Attribute
    local Attribute_2 = a1:GetAttribute("EmitDuration")
    local u35 = if typeof(Attribute_2) ~= "number" then 0 else Attribute_2
    if u35 <= 0 and a1:IsA("Beam") then
        local Attribute_3 = a1:GetAttribute("Duration")
        u35 = if typeof(Attribute_3) ~= "number" then 1 else Attribute_3
    end
    if not (v1 > 0) then
        a1.Enabled = true
        if u35 > 0 then
            task.delay(u35, function() -- Line: 295 -- upvalues: a1 (val)
                if a1.Parent then
                    a1.Enabled = false
                end
            end)
        end
    else
        task.delay(v1, function() -- Line: 291 -- upvalues: a1 (val), u35 (ref)
            a1.Enabled = true
            if u35 > 0 then
                task.delay(u35, function() -- Line: 295 -- upvalues: a1 (upval)
                    if a1.Parent then
                        a1.Enabled = false
                    end
                end)
            end
        end)
    end
end

function v1:Emit() -- Line: 310
    -- upvalues: u18 (val), emitParticle (val), emitSound (val), emitBeamOrTrail (val)
    local v1 = {self}
    for i, j in self:GetDescendants() do
        if u18[j.ClassName] then
            table.insert(v1, j)
        end
    end
    local v2 = nil
    local v3 = nil
    for k, n in v1, v2, v3 do
        if n:IsA("ParticleEmitter") then
            emitParticle(n)
        elseif n:IsA("Sound") then
            emitSound(n)
        elseif n:IsA("Beam") or n:IsA("Trail") then
            emitBeamOrTrail(n)
        end
    end
end

return v1