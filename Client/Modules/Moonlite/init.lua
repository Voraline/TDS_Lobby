-- Script path: ReplicatedStorage.Client.Modules.Moonlite
-- Decompile time: 31.25 ms

local v1 = {}
local AnimationEvents = require(script.AnimationEvents)
local EaseFuncs = require(script.EaseFuncs)
local Specials = require(script.Specials)
require(script.Types)
local VFXEmitter = require(script.VFXEmitter)
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
if RunService:IsServer() then
    warn("Moonlite should NOT be used on the server! Rig transforms will not be replicated.")
end
local u37 = {}
u37.__index = u37
local u38 = {Instance = true, boolean = true, string = true, ["nil"] = true}
local u43 = {}
local u44 = {}
local u48 = setmetatable({}, {__mode = "k"})

local function now() -- Line: 110 -- upvalues: RunService (val)
    if RunService:IsClient() then
        return workspace:GetServerTimeNow()
    end
    return tick()
end

local function lerp(a1, a2, a3) -- Line: 118 -- types: a3: number
    if type(a1) ~= "number" then
        return a1:Lerp(a2, a3)
    end
    assert(type(a2) == "number")
    return a1 + (a2 - a1) * a3
end

local function recordDiagnostic(a1, a2, a3, a4, a5, a6, a7) -- Line: 127
    -- upvalues: 
    table.insert(a1._diagnostics, {
        Frame = a6,
        Instance = a2,
        Kind = a7 or "Error",
        Message = a5,
        Property = a3,
        ValueType = if a4 ~= nil then typeof(a4) else "nil",
    })
end

local function shouldTraceAction(a1, a2, a3) -- Line: 146 -- types: a1: userdata?, a2: string
    if a1 ~= nil and a1:IsA("ParticleEmitter") then
        if a2 ~= "Emit" then
            if a2 == "Clear" then
                return a3 == true
            end
            return false
        end
        local v1 = true
        if a3 ~= true then
            v1 = false
            if type(a3) == "number" then
                v1 = a3 > 0
            end
        end
        return v1
    end
    return false
end

local function getPathToRoot(a1, a2) -- Line: 160 -- types: a1: userdata, a2: userdata
    local v1 = {}
    local Parent = a1
    while Parent do
        if Parent == a2 then
            break
        end
        table.insert(v1, 1, Parent.Name)
        Parent = Parent.Parent
    end
    return table.concat(v1, ".")
end

local function toPath(a1) -- Line: 171
    return table.concat(a1.InstanceNames, ".")
end

local function resolveAnimPath(a1, a2) -- Line: 175 -- types: a2: userdata?
    if not a1 then
        return nil
    end
    local u4 = #a1.InstanceNames
    local u6 = a2
    if not u6 then
        u6 = game
    end
    if pcall(function() -- Line: 183 -- upvalues: u4 (val), a1 (val), u6 (ref)
        local v0, v3, v4, v5, v6, v7
        v0 = u4
        for i = 2, v0 do
            v3 = a1.InstanceNames[i]
            v4 = a1.InstanceTypes[i]
            v5 = u6[v3]
            if typeof(v5) == "Instance" then
                v7 = true
            else
                v7 = false
            end
            assert(v7)
            if v5.ClassName == v4 then
                v7 = true
            else
                v7 = false
            end
            assert(v7)
            u6 = v5
        end
        return
    end) then
        return u6
    end
    warn("[Moonlite] path resolve failed, path=", table.concat(a1.InstanceNames, "."))
    return nil
end

local function resolveJointTree(a1) -- Line: 204 -- upvalues: getPathToRoot (val) -- types: a1: userdata
    local addJoints
    local u38 = {}
    local u46 = {}
    local PrimaryPart = a1.PrimaryPart
    assert(PrimaryPart, "No primary part found in target!")
    for i, j in a1:GetDescendants() do
        if not j:IsA("Motor6D") then
            if j:IsA("Bone") then
                table.insert(u38, j)
            end
        elseif j.Active or j:IsA("Bone") then
            table.insert(u38, j)
        end
    end

    function addJoints(a1, a2) -- Line: 217
        -- upvalues: u38 (val), addJoints (val), u46 (val), getPathToRoot (upval), PrimaryPart (val)
        local Part0, Part1, v1, v2
        local v3 = {}
        local v4 = nil
        local v5 = nil
        local v6, v7 = a1, a2
        for i, j in u38, v4, v5 do
            if not j:IsA("Bone") then
                if j:IsA("Motor6D") then
                    Part0 = j.Part0
                    Part1 = j.Part1
                    if Part0 and Part1 then
                        if j.Part0 == v6 or j.Part1 == v6 then
                            v1 = not (Part0 ~= v6) and Part1 or Part0
                            if v7 ~= v1 then
                                v3[v1.Name] = {
                                    Name = v1.Name,
                                    Joint = j,
                                    Children = addJoints(v1, v6),
                                }
                            end
                        end
                    end
                end
            elseif j.Parent == v6 then
                v2 = {Name = j.Name, Joint = j, Children = addJoints(j, v6)}
                v3[j.Name] = v2
                u46[getPathToRoot(j, PrimaryPart)] = v2
            end
        end
        return v3
    end

    return (addJoints(PrimaryPart)), u46
end

local function parseEase(a1) -- Line: 266 -- types: a1: userdata
    local Type = a1:FindFirstChild("Type")
    local Params = a1:FindFirstChild("Params")
    local v1 = {
        Type = assert(if not Type then nil else if not Type:IsA("StringValue") then nil else Type.Value),
    }
    v1.Params = {}
    if Params then
        local Value_2
        for i, j in Params:GetChildren() do
            if j:IsA("ValueBase") then
                Value_2 = j.Value
                v1.Params[j.Name] = Value_2
            end
        end
    end
    return v1
end

local function parseEaseOld(a1) -- Line: 291 -- types: a1: userdata
    local Style = a1:FindFirstChild("Style")
    assert(Style and Style:IsA("StringValue"), "No style in legacy ease!")
    local Direction = a1:FindFirstChild("Direction")
    assert(Direction and Direction:IsA("StringValue"), "No direction in legacy ease!")
    return {Type = Style.Value, Params = {Direction = Direction.Value}}
end

local function readValue(a1) -- Line: 307 -- types: a1: userdata
    if not a1:IsA("ValueBase") then
        return a1:GetAttribute("Value")
    end
    local v1 = if not tonumber(a1.Name) then a1 else assert(a1.Parent)
    local Value = a1.Value
    local EnumType = v1:FindFirstChild("EnumType")
    if EnumType and EnumType:IsA("StringValue") then
        return Enum[EnumType.Value][Value]
    end
    if v1:FindFirstChild("Vector2") then
        return (Vector2.new(Value.X, Value.Y))
    end
    if v1:FindFirstChild("ColorSequence") then
        return (ColorSequence.new(Value))
    end
    if v1:FindFirstChild("NumberSequence") then
        return (NumberSequence.new(Value))
    end
    if v1:FindFirstChild("NumberRange") then
        Value = NumberRange.new(Value)
    end
    return Value
end

local function getPropValue(a1, a2, a3) -- Line: 335 -- upvalues: Specials (val) -- types: a2: userdata?, a3: string
    if a2 then
        local v1 = Specials.Get(a1._scratch, a2, a3)
        if v1 then
            local Get = v1.Get
            if not Get then
                return true, v1.Default
            end
            local success, result = pcall(Get, a2)
            if not success then
                table.insert(a1._diagnostics, {
                    Kind = "Error",
                    ValueType = "nil",
                    Instance = a2,
                    Message = tostring(result),
                    Property = a3,
                })
            end
            return success, result
        end
    end
    local success_2, result_2 = pcall(function() -- Line: 354 -- upvalues: a2 (val), a3 (val)
        return a2[a3]
    end)
    if not success_2 then
        table.insert(a1._diagnostics, {
            Kind = "Error",
            ValueType = "nil",
            Instance = a2,
            Message = tostring(result_2),
            Property = a3,
        })
    end
    return success_2, result_2
end

local function convertPropValue(a1) -- Line: 365
    if typeof(a1) == "string" and a1:sub(1, 1) == "\001" then
        local v1 = game
        for i, j in string.split(a1:sub(2), ".") do
            v1 = v1:FindFirstChild(j)
            if not v1 then
                break
            end
        end
        return v1
    end
    return a1
end

local function setPropValue(a1, a2, a3, a4, a5, a6) -- Line: 380
    -- upvalues: Specials (val), convertPropValue (val)
    if a2 then
        local v1 = Specials.Get(a1._scratch, a2, a3)
        if v1 then
            local v2
            if v1.Get == nil and a5 and a4 == true then
                a4 = false
            end
            local v3 = convertPropValue(a4)
            local success, result = pcall(v1.Set, v3)
            if success then
                if a2 == nil or not a2:IsA("ParticleEmitter") then
                    v2 = false
                elseif a3 ~= "Emit" then
                    v2 = if a3 ~= "Clear" then false else v3 == true
                else
                    v2 = true
                    if v3 ~= true then
                        v2 = false
                        if type(v3) == "number" then
                            v2 = v3 > 0
                        end
                    end
                end
                if v2 then
                    table.insert(a1._diagnostics, {
                        Kind = "Action",
                        Frame = a6,
                        Instance = a2,
                        Message = ("Applied %*.%*"):format(a2.ClassName, a3),
                        Property = a3,
                        ValueType = if v3 ~= nil then typeof(v3) else "nil",
                    })
                end
            else
                v2 = a4
                table.insert(a1._diagnostics, {
                    Kind = "Error",
                    Frame = a6,
                    Instance = a2,
                    Message = tostring(result),
                    Property = a3,
                    ValueType = if v2 ~= nil then typeof(v2) else "nil",
                })
            end
            return success
        end
    end
    local success_2, result_2 = pcall(function() -- Line: 420 -- upvalues: a2 (val), a3 (val), convertPropValue (upval), a4 (ref)
        a2[a3] = (convertPropValue(a4))
    end)
    if not success_2 then
        local v4 = a4
        table.insert(a1._diagnostics, {
            Kind = "Error",
            Frame = a6,
            Instance = a2,
            Message = tostring(result_2),
            Property = a3,
            ValueType = if v4 ~= nil then typeof(v4) else "nil",
        })
    end
    return success_2
end

local function parseKeyframePack(a1) -- Line: 431
    -- upvalues: readValue (val), parseEase (val), parseEaseOld (val)
    local result, success, v1
    local v2 = tonumber(a1.Name)
    assert(v2, "Bad frame number")
    if a1:IsA("ModuleScript") then
        local v3 = require(a1)
        local Values = v3.Values or {}
        local Eases = v3.Eases or {}
        return {FrameIndex = v2, FrameCount = v3.Count, Values = Values, Eases = Eases}
    end
    local Values_2 = a1:FindFirstChild("Values")
    assert(Values_2, "No value folder!")
    assert(Values_2:FindFirstChild("0"), "No starting value!")
    local v4 = {}
    local v5 = 0
    for i, j in Values_2:GetChildren() do
        v1 = tonumber(j.Name)
        if v1 then
            success, result = pcall(readValue, j)
            if success then
                v4[v1] = result
                v5 = math.max(v1, v5)
            end
        end
    end
    local Eases_2 = a1:FindFirstChild("Eases")
    local Ease = a1:FindFirstChild("Ease")
    local v6 = {}
    if Eases_2 then
        local v7
        for k, n in Eases_2:GetChildren() do
            v7 = tonumber(n.Name)
            assert(v7, (("Bad index on ease @%*"):format((n:GetFullName()))))
            v6[v7] = (parseEase(n))
        end
    elseif Ease then
        v6[v5] = (parseEaseOld(Ease))
    end
    return {FrameIndex = v2, FrameCount = v5, Values = v4, Eases = v6}
end

local function unpackKeyframes(a1, a2) -- Line: 498
    -- upvalues: parseKeyframePack (val)
    local FrameCount, FrameIndex, v1, v2, v3, v4, v5
    local v6 = {}
    local v7 = {}
    local v8 = {}
    for i, j in a1:GetChildren() do
        v1 = tonumber(j.Name)
        if v1 then
            v6[v1] = (parseKeyframePack(j))
            table.insert(v7, v1)
        end
    end
    table.sort(v7)
    local v9 = #v7
    for k = 2, v9 do
        v4 = v6[v7[k - 1]]
        v5 = v6[v7[k]]
        v4.Next = v5
        v5.Prev = v4
    end
    local Next = v6[v7[1]]
    local v10 = a2
    while Next do
        FrameIndex = Next.FrameIndex
        v4 = nil
        FrameCount = Next.FrameCount
        for n = 0, FrameCount do
            v2 = Next.Eases[n] or v4
            v3 = Next.Values[n]
            if v3 ~= nil then
                if v10 then
                    v3 = v10(v3)
                end
                table.insert(v8, {Time = FrameIndex + n, Value = v3, Ease = v2})
                if v2 then end
            end
        end
        Next = Next.Next
    end
    return v8
end

local function readValueBase(a1, a2) -- Line: 556 -- types: a1: userdata, a2: string
    local v1 = a1:FindFirstChild(a2)
    assert(v1 and v1:IsA("ValueBase"))
    return v1.Value
end

local function transformWorldValue(a1, a2, a3, a4) -- Line: 562 -- types: a2: userdata, a3: string
    local _worldTransform = a1._worldTransform
    if not _worldTransform then
        return a4
    end
    local v1 = a2:IsA("BasePart") or a2:IsA("Model") or a2:IsA("Camera")
    if not v1 then
        return a4
    end
    if a3 ~= "CFrame" and a3 ~= "Focus" then
        if a3 == "Position" and typeof(a4) == "Vector3" then
            return _worldTransform:PointToWorldSpace(a4)
        end
        return a4
    end
    if typeof(a4) == "CFrame" then
        return _worldTransform * a4
    end
    if a3 == "Position" and typeof(a4) == "Vector3" then
        return _worldTransform:PointToWorldSpace(a4)
    end
    return a4
end

local function compileItem(a1, a2, a3, a4) -- Line: 582
    -- upvalues: resolveAnimPath (val), resolveJointTree (val), readValue (val), unpackKeyframes (val)
    -- upvalues: transformWorldValue (val), Specials (val), AnimationEvents (val)
    local v1 = table.find(a1._data.Items, a2)
    if not v1 then
        return
    end
    local Path = a2.Path
    local ItemType = Path.ItemType
    local Override = a2.Override
    if not Override then
        Override = resolveAnimPath(Path, a1._root)
    end
    local v2 = a1._save:FindFirstChild((tostring(v1)))
    if Override and v2 then
        local default_2, v3, v4, v5, v6, v7, v8, v9
        assert(Override)
        assert(v2)
        local Rig = v2:FindFirstChild("Rig")
        local MarkerTrack = v2:FindFirstChild("MarkerTrack")
        if not Rig or ItemType ~= "Rig" then
            v6 = a3
        else
            local Children_4, _hier, _keyframes, v10, v11
            v3 = a4[Override]
            v4 = nil
            if not v3 then
                local v12, v13 = resolveJointTree(Override)
                v4 = v13
                a4[Override] = v12
            end
            for i, j in Rig:GetChildren() do
                if j.Name == "_joint" then
                    _hier = j:FindFirstChild("_hier")
                    local default = j:FindFirstChild("default")
                    _keyframes = j:FindFirstChild("_keyframes")
                    if default then
                        default = readValue(default)
                    end
                    if _hier and _keyframes then
                        v7 = readValue(_hier)
                        v10 = v7:gmatch("[^%.]+")
                        v9 = v3[v10()]
                        v11 = v4 and v4[v7]
                        while v9 do
                            if v11 then
                                break
                            end
                            Children_4 = v9.Children
                            v8 = v10()
                            if v8 == nil then
                                break
                            end
                            if not Children_4[v8] then
                                print("[Moonlite] data", v9)
                                warn((("[Moonlite] failed to resolve joint '%*' (could not find child '%*' in %*!)"):format(v7, v8, v9.Name)))
                                v9 = nil
                            else
                                v9 = Children_4[v8]
                            end
                        end
                        if v11 then
                            v9 = v11
                        end
                        if v9 then
                            local Joint = v9.Joint
                            a3[Joint] = {
                                Props = {
                                    Transform = {
                                        Static = false,
                                        Default = CFrame.identity,
                                        Sequence = unpackKeyframes(_keyframes, function(a1) -- Line: 664 -- upvalues: Joint (val), default (ref) -- types: a1: userdata
                                            if Joint:IsA("Motor6D") then
                                                return (a1:Inverse()) * default
                                            end
                                            return a1
                                        end),
                                    },
                                },
                                Target = Joint,
                            }
                        end
                    end
                end
            end
        end
        v3 = {}
        for k, n in v2:GetChildren() do
            if n:IsA("Folder") and n ~= MarkerTrack and n.Name ~= "Rig" then
                default_2 = n:FindFirstChild("default")
                local Name_2 = n.Name
                if default_2 then
                    v5 = readValue(default_2)
                    default_2 = transformWorldValue(a1, Override, Name_2, v5)
                end
                v3[Name_2] = {
                    Default = default_2,
                    Static = Specials.Static(Override, Name_2),
                    Sequence = unpackKeyframes(n, function(a1_2) -- Line: 697 -- upvalues: transformWorldValue (upval), a1 (val), Override (val), Name_2 (val)
                        return transformWorldValue(a1, Override, Name_2, a1_2)
                    end),
                }
            end
        end
        v4 = {Props = v3, Target = Override}
        v6[Override] = v4
        if MarkerTrack then
            local Value, Value_2, name, v14, v15, v16, v17, width
            v4 = {}
            a1._markers[Override] = v4
            for m, i5 in MarkerTrack:GetChildren() do
                v14 = tonumber(i5.Name)
                if v14 and not (v14 < 0) and not (a1.Frames < v14) then
                    v15, v16 = AnimationEvents.Read(i5)
                    if #v15 > 0 then
                        v7 = a1._animationEvents[v14]
                        if not v7 then
                            a1._animationEvents[v14] = {}
                        end
                        for i6, i7 in v15 do
                            table.insert(v7, {
                                Name = i7.Name,
                                Parameter = i7.Parameter,
                                Target = Override,
                            })
                        end
                    end
                    if i5:FindFirstChild("name") then
                        width = i5:FindFirstChild("width")
                        v9 = width and width:IsA("ValueBase")
                        assert(v9)
                        Value = width.Value
                        name = i5:FindFirstChild("name")
                        v17 = name and name:IsA("ValueBase")
                        assert(v17)
                        Value_2 = name.Value
                        v8 = v4[v14]
                        if not v8 then
                            v4[v14] = {StartMarkers = {}, EndMarkers = {}}
                        end
                        if Value > 0 then
                            v9 = math.min(v14 + Value, a1.Frames)
                            v17 = v4[v9]
                            if not v17 then
                                v4[v9] = {StartMarkers = {}, EndMarkers = {}}
                            end
                            v17.EndMarkers[Value_2] = v16
                        end
                        v8.StartMarkers[Value_2] = v16
                    end
                end
            end
        end
        return
    end
end

local function getInterpolator(a1) -- Line: 773 -- upvalues: u38 (val), lerp (val)
    if typeof(a1) == "ColorSequence" then
        return function(a1, a2, a3) -- Line: 775 -- types: a1: userdata, a2: userdata, a3: number
            local v1
            local Value = a1.Keypoints[1].Value
            local Value_2 = a2.Keypoints[1].Value
            if type(Value) ~= "number" then
                v1 = Value:Lerp(Value_2, a3)
            else
                assert(type(Value_2) == "number")
                v1 = Value + (Value_2 - Value) * a3
            end
            return ColorSequence.new(v1)
        end
    end
    if typeof(a1) == "NumberSequence" then
        return function(a1, a2, a3) -- Line: 780 -- types: a1: userdata, a2: userdata, a3: number
            local v1
            local Value = a1.Keypoints[1].Value
            local Value_2 = a2.Keypoints[1].Value
            if type(Value) ~= "number" then
                v1 = Value:Lerp(Value_2, a3)
            else
                assert(type(Value_2) == "number")
                v1 = Value + (Value_2 - Value) * a3
            end
            return NumberSequence.new(v1)
        end
    end
    if typeof(a1) == "NumberRange" then
        return function(a1, a2, a3) -- Line: 785 -- types: a1: CFrame, a2: CFrame, a3: number
            local v1
            local Min = a1.Min
            local Min_2 = a2.Min
            if type(Min) ~= "number" then
                v1 = Min:Lerp(Min_2, a3)
            else
                assert(type(Min_2) == "number")
                v1 = Min + (Min_2 - Min) * a3
            end
            return NumberRange.new(v1)
        end
    end
    if u38[typeof(a1)] then
        return function(a1, a2, a3) -- Line: 790 -- types: a3: number
            if a3 >= 1 then
                return a2
            end
            return a1
        end
    end
    return lerp
end

local function compileFrames(a1, a2) -- Line: 802 -- upvalues: getInterpolator (val), EaseFuncs (val)
    local Default, Ease, FrameRate, Time, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11
    debug.profilebegin("compileFrames")
    local _buffer = a1._buffer
    local v12 = nil
    local v13 = nil
    local v14 = a1
    for i, j in a2, v12, v13 do
        v11 = {}
        _buffer[i] = v11
        v1 = nil
        v2 = nil
        for k, n in j.Props, v1, v2 do
            if n.Sequence[1] then
                Ease = nil
                Time = 0
                Default = n.Default
                v3 = getInterpolator(n.Sequence[1].Value)
                v5 = nil
                v6 = nil
                for m, i5 in n.Sequence, v5, v6 do
                    if not v11[i5.Time] then
                        v11[i5.Time] = {}
                    end
                    v7 = i5.Time - Time
                    v8 = v11[i5.Time]
                    v8[k] = i5.Value
                    if not (v7 <= 1) then
                        if not n.Static then
                            v8 = EaseFuncs.Get(Ease)
                            for i6 = 0, v7 do
                                v9 = v8(i6 / v7)
                                v10 = Time + i6
                                if not v11[v10] then
                                    v11[v10] = {}
                                end
                                v11[v10][k] = (v3(Default, i5.Value, v9))
                            end
                        end
                        Ease = i5.Ease
                        Default = i5.Value
                    else
                        Default = i5.Value
                        Ease = i5.Ease
                    end
                    Time = i5.Time
                end
                if not n.Static and Time < v14.Frames then
                    v4 = v11[Time][k]
                    FrameRate = v14.FrameRate
                    for i7 = Time, FrameRate do
                        if not v11[i7] then
                            v11[i7] = {}
                        end
                        v11[i7][k] = v4
                    end
                end
            end
        end
        if not next(v11) then
            _buffer[i] = nil
        end
    end
    debug.profileend()
end

local function compileRouting(a1) -- Line: 875 -- upvalues: compileItem (val), compileFrames (val)
    debug.profilebegin("compileRouting")
    table.clear(a1._buffer)
    table.clear(a1._elements)
    table.clear(a1._markers)
    table.clear(a1._animationEvents)
    local v1 = {}
    for i, j in a1._data.Items do
        compileItem(a1, j, v1, {})
    end
    compileFrames(a1, v1)
    a1._targets = v1
    a1._compiled = true
    debug.profileend()
end

local function restoreTrack(a1) -- Line: 896 -- upvalues: u44 (val), setPropValue (val)
    local v1 = u44[a1]
    if not v1 then
        return
    end
    if a1.RestoreDefaults then
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            for k, n in j do
                setPropValue(a1, i, k, n)
            end
            if i:IsA("Camera") then
                setPropValue(a1, i, "AttachToPart", nil)
            end
        end
    end
    u44[a1] = nil
end

local function seekTrackProperties(a1, a2) -- Line: 918 -- upvalues: setPropValue (val) -- types: a2: number
    local Default, v1, v2, v3, v4, v5, v6, v7
    local _targets = a1._targets
    local v8 = nil
    local v9 = nil
    local v10, v11 = a1, a2
    for i, j in _targets, v8, v9 do
        v5 = v10._buffer[i]
        v6 = {}
        v7 = {}
        v1 = nil
        v2 = nil
        for k, n in j.Props, v1, v2 do
            v3 = i:IsA("Camera")
            if v3 then
                v3 = true
                if k ~= "AttachToPart" then
                    v3 = k == "LookAtPart"
                end
            end
            if not n.Static or v3 then
                v6[k] = -1
            end
        end
        if v5 then
            v1 = nil
            v2 = nil
            for m, i5 in v5, v1, v2 do
                if not (v11 < m) then
                    for i6, i7 in i5 do
                        v4 = v6[i6]
                        if v4 ~= nil and v4 <= m then
                            v6[i6] = m
                            v7[i6] = i7
                        end
                    end
                end
            end
        end
        v1 = nil
        v2 = nil
        for i8, i9 in v6, v1, v2 do
            Default = if i9 ~= -1 then v7[i8] else j.Props[i8].Default
            setPropValue(v10, i, i8, Default, false, v11)
        end
    end
end

local function dispatchAnimationEvents(a1, a2) -- Line: 955 -- types: a2: number
    local v1
    local v2 = math.min(a2, a1.Frames)
    if v2 <= a1._lastAnimationEventFrame then
        return
    end
    for i = a1._lastAnimationEventFrame + 1, v2 do
        for j, k in a1._animationEvents[i] or {} do
            v1 = a1._animationEventSignals[k.Name]
            if v1 then
                v1:Fire(k.Parameter, k.Target)
            end
        end
    end
    a1._lastAnimationEventFrame = v2
end

local function stepTrackProperties(a1, a2) -- Line: 973
    -- upvalues: setPropValue (val), dispatchAnimationEvents (val)
    local v1
    local _buffer = a1._buffer
    local v2 = nil
    local v3 = nil
    local v4, v5 = a1, a2
    for i, j in _buffer, v2, v3 do
        if v4._locks[i] == nil then
            v1 = j[v5]
            if v1 then
                for k, n in v1 do
                    setPropValue(v4, i, k, n, nil, v5)
                end
            end
        end
    end
    v2 = nil
    v3 = nil
    for m, i5 in v4._markers, v2, v3 do
        v1 = i5[v5]
        if v1 then
            for i6, i7 in v1.StartMarkers do
                if v4._markerSignals[i6] then
                    v4._markerSignals[i6]:Fire(m, i7)
                end
            end
            for i8, i9 in v1.EndMarkers do
                if v4._endMarkerSignals[i8] then
                    v4._endMarkerSignals[i8]:Fire(m, i9)
                end
            end
        end
    end
    dispatchAnimationEvents(v4, v5)
end

local function stepTrack(a1) -- Line: 1012 -- upvalues: RunService (val), stepTrackProperties (val), u43 (val)
    local v1 = math.max((if not RunService:IsClient() then tick() else workspace:GetServerTimeNow()) - a1._startTime, 0)
    local v2 = math.floor(v1 * a1.FrameRate)
    if a1.Frames < v2 then
        local v3 = math.max(a1._lastFrame + 1, 0)
        local Frames = a1.Frames
        for i = v3, Frames do
            stepTrackProperties(a1, i)
        end
        if not a1.Looped then
            a1._completed:Fire(Enum.PlaybackState.Completed)
            return true
        else
            v2 = 0
            local ServerTimeNow_2 = if not RunService:IsClient() then tick() else workspace:GetServerTimeNow()
            a1._startTime = ServerTimeNow_2
            a1._lastFrame = -1
            a1._lastAnimationEventFrame = -1
            a1.TimePosition = 0
        end
    end
    local v4 = v2 - a1._lastFrame
    if v4 > 1 then
        v4 = math.max(a1._lastFrame + 1, 0)
        a1._lastFrame = v2
        task.spawn(print, (("[Moonlite] Cutscene missed frames (start=%*, end=%*)"):format(v4, v2)))
        for j = v4, v2 do
            stepTrackProperties(a1, j)
        end
    elseif a1._lastFrame < v2 then
        a1._lastFrame = v2
        stepTrackProperties(a1, v2)
    end
    a1.TimePosition = v1
    v4 = u43[a1]
    if v4 then
        if not v4.IsPlaying then
            v4:Play()
        end
        local _DriftStats = a1._scratch._DriftStats
        if not _DriftStats then
            a1._scratch._DriftStats = {
                Frames = 0,
                DriftMin = (1 / 0),
                DriftMax = (-1 / 0),
                DriftSum = 0,
                SoftCorrections = 0,
                HardSeeks = 0,
                CooldownCorrections = 0,
            }
        end
        local v5 = v1 - v4.TimePosition
        local v6 = math.abs(v5)
        a1._scratch._LastHardSeek = a1._scratch._LastHardSeek or -1
        local _LastHardSeek = a1._scratch._LastHardSeek
        _DriftStats.Frames = _DriftStats.Frames + 1
        _DriftStats.DriftMin = if not (v6 < _DriftStats.DriftMin) then _DriftStats.DriftMin else v6
        _DriftStats.DriftMax = if not (_DriftStats.DriftMax < v6) then _DriftStats.DriftMax else v6
        _DriftStats.DriftSum = _DriftStats.DriftSum + v6
        if v1 <= v4.TimeLength then
            local v7 = v1
            local v8 = v7 - _LastHardSeek
            if not (v6 < 0.02) then
                if v6 < 0.25 then
                    v4.PlaybackSpeed = math.clamp(v5 * 0.2, -0.05, 0.05) + 1
                    _DriftStats.SoftCorrections = _DriftStats.SoftCorrections + 1
                elseif not (v6 >= 0.3) or not (v8 > 0.75) then
                    v4.PlaybackSpeed = math.clamp(v5 * 0.2, -0.05, 0.05) + 1
                    _DriftStats.CooldownCorrections = _DriftStats.CooldownCorrections + 1
                else
                    v4.TimePosition = v1
                    v4.PlaybackSpeed = 1
                    a1._scratch._LastHardSeek = v7
                    print(string.format("[Moonlite] Hard audio resync drift=%.3fs", v5))
                    _DriftStats.HardSeeks = _DriftStats.HardSeeks + 1
                end
            elseif v4.PlaybackSpeed ~= 1 then
                v4.PlaybackSpeed = 1
            end
        end
    end
    return false
end

function v1.CreatePlayer(a1, a2, a3) -- Line: 1126
    -- upvalues: HttpService (val), u37 (val), compileRouting (val), u48 (val)
    local v1 = HttpService:JSONDecode(a1.Value)
    local BindableEvent = Instance.new("BindableEvent")
    local v2 = {
        RestoreDefaults = true,
        _paused = false,
        _startTime = 0,
        TimePosition = 0,
        _lastFrame = -1,
        _lastAnimationEventFrame = -1,
        _compiled = false,
        Completed = BindableEvent.Event,
        Looped = v1.Information.Looped,
        Frames = v1.Information.Length,
        FrameRate = v1.Information.FPS or 60,
        _save = a1,
        _data = v1,
        _completed = BindableEvent,
        _markers = {},
        _markerSignals = {},
        _endMarkerSignals = {},
        _animationEventSignals = {},
        _animationEvents = {},
        _locks = {},
        _diagnostics = {},
        _elements = {},
        _buffer = {},
        _targets = {},
        _scratch = {},
        _root = a2,
        _worldTransform = a3,
    }
    local v3 = setmetatable(v2, u37)
    compileRouting(v3)
    u48[v3] = true
    return v3
end

function u37:Destroy() -- Line: 1175 -- upvalues: u48 (val)
    u48[self] = nil
    for i, j in self._markerSignals do
        j:Destroy()
    end
    for k, n in self._endMarkerSignals do
        n:Destroy()
    end
    for m, i5 in self._animationEventSignals do
        i5:Destroy()
    end
    self._completed:Destroy()
    table.clear(self._markerSignals)
    table.clear(self._endMarkerSignals)
    table.clear(self._animationEventSignals)
    table.clear(self._animationEvents)
end

function u37.IsPlaying(a1) -- Line: 1197 -- upvalues: u44 (val)
    return u44[a1] ~= nil
end

function u37.IsPaused(a1) -- Line: 1201
    return a1._paused
end

function u37.GetDiagnostics(a1) -- Line: 1205
    return table.clone(a1._diagnostics)
end

function u37.ClearDiagnostics(a1) -- Line: 1209
    table.clear(a1._diagnostics)
end

function v1.GetTracks() -- Line: 1213 -- upvalues: u48 (val)
    local v1 = {}
    for i in u48 do
        table.insert(v1, i)
    end
    return v1
end

function u37:GetTimeLength() -- Line: 1223
    return self.Frames / self.FrameRate
end

function u37.GetMarkerReachedSignal(a1, a2) -- Line: 1227 -- types: a2: string
    if not a1._markerSignals[a2] then
        a1._markerSignals[a2] = (Instance.new("BindableEvent"))
    end
    return a1._markerSignals[a2].Event
end

function u37.GetMarkerEndedSignal(a1, a2) -- Line: 1235 -- types: a2: string
    if not a1._endMarkerSignals[a2] then
        a1._endMarkerSignals[a2] = (Instance.new("BindableEvent"))
    end
    return a1._endMarkerSignals[a2].Event
end

function u37.GetAnimationEventSignal(a1, a2) -- Line: 1245 -- types: a2: string
    if not a1._animationEventSignals[a2] then
        a1._animationEventSignals[a2] = (Instance.new("BindableEvent"))
    end
    return a1._animationEventSignals[a2].Event
end

function u37.GetSetting(a1, a2) -- Line: 1253 -- types: a2: string
    return a1._scratch[a2]
end

function u37.SetSetting(a1, a2, a3) -- Line: 1257 -- types: a2: string
    a1._scratch[a2] = a3
end

function u37.GetElements(a1) -- Line: 1261
    return table.clone(a1._elements)
end

function u37.LockElement(a1, a2, a3) -- Line: 1265 -- types: a2: userdata
    if not a1._locks[a2] then
        a1._locks[a2] = {}
    end
    if a3 then
        local v1 = a1._locks[a2]
        v1[a3 or "Default"] = true
    end
    return true
end

function u37.UnlockElement(a1, a2, a3) -- Line: 1277 -- types: a2: userdata
    local v1 = a1._locks[a2]
    if v1 then
        v1[a3 or "Default"] = nil
        if not next(v1) then
            a1._locks[a2] = nil
        end
    end
    return true
end

function u37.IsElementLocked(a1, a2) -- Line: 1291 -- types: a2: userdata
    return a1._locks[a2] ~= nil
end

function u37.ReplaceElementByPath(a1, a2, a3) -- Line: 1295
    -- upvalues: compileRouting (val)
    local Path, v1
    for i, j in a1._data.Items do
        Path = j.Path
        v1 = table.concat(Path.InstanceNames, ".")
        if (a2:lower()) == v1:lower() then
            if Path.ItemType ~= "Rig" and not a3:IsA(Path.ItemType) then
                continue
            end
            j.Override = a3
            compileRouting(a1)
            return true
        end
    end
    return false
end

function u37.FindElement(a1, a2) -- Line: 1315 -- types: a2: string
    for i, j in a1._elements do
        if j and j.Name == a2 then
            return j
        end
    end
    return nil
end

function u37.FindElementOfType(a1, a2) -- Line: 1325 -- types: a2: string
    for i, j in a1._elements do
        if j and j:IsA(a2) then
            return j
        end
    end
    return nil
end

function u37.Stop(a1) -- Line: 1335 -- upvalues: RunService (val), restoreTrack (val)
    a1._paused = false
    a1._lastFrame = -1
    a1._lastAnimationEventFrame = -1
    local ServerTimeNow = if not RunService:IsClient() then tick() else workspace:GetServerTimeNow()
    a1._startTime = ServerTimeNow
    a1.TimePosition = 0
    task.spawn(restoreTrack, a1)
    a1._completed:Fire(Enum.PlaybackState.Cancelled)
end

function u37:Pause() -- Line: 1346 -- upvalues: u44 (val), RunService (val), u43 (val)
    if u44[self] and not self._paused then
        self.TimePosition = math.clamp(
            (if not RunService:IsClient() then tick() else workspace:GetServerTimeNow()) - self._startTime,
            0,
            (self:GetTimeLength())
        )
        self._paused = true
        local v1 = u43[self]
        if v1 then
            v1:Pause()
        end
        return true
    end
    return false
end

function u37:Resume() -- Line: 1362 -- upvalues: u44 (val), RunService (val), u43 (val)
    if u44[self] and self._paused then
        local ServerTimeNow = if not RunService:IsClient() then tick() else workspace:GetServerTimeNow()
        self._startTime = ServerTimeNow - self.TimePosition
        self._paused = false
        local v1 = u43[self]
        if v1 then
            v1.PlaybackSpeed = 1
            v1:Resume()
        end
        return true
    end
    return false
end

function u37.Seek(a1, a2) -- Line: 1379
    -- upvalues: u44 (val), seekTrackProperties (val), RunService (val), u43 (val)
    if not u44[a1] then
        return nil
    end
    local u11 = math.clamp(a2, 0, (a1:GetTimeLength()))
    local v1 = math.min(math.floor(u11 * a1.FrameRate), a1.Frames)
    seekTrackProperties(a1, v1)
    a1.TimePosition = u11
    local ServerTimeNow = if not RunService:IsClient() then tick() else workspace:GetServerTimeNow()
    a1._startTime = ServerTimeNow - u11
    a1._lastFrame = v1
    a1._lastAnimationEventFrame = v1
    local u39 = u43[a1]
    if u39 then
        pcall(function() -- Line: 1396 -- upvalues: u39 (val), u11 (val)
            local TimeLength = u39.TimeLength
            u39.TimePosition = if not (TimeLength > 0) then u11 else math.min(u11, TimeLength)
        end)
    end
    return u11
end

function u37.Reset(a1) -- Line: 1407 -- upvalues: RunService (val), stepTrack (val)
    a1._lastFrame = -1
    a1._lastAnimationEventFrame = 0
    local ServerTimeNow = if not RunService:IsClient() then tick() else workspace:GetServerTimeNow()
    a1._startTime = ServerTimeNow
    a1.TimePosition = 0
    stepTrack(a1)
    return true
end

function u37:Play(a2) -- Line: 1418
    -- upvalues: u44 (val), getPropValue (val), setPropValue (val), RunService (val), u43 (val)
    local v1, v2, v3, v4, v5
    if u44[self] then
        return
    end
    local TimePosition = self.TimePosition
    if self:GetTimeLength() <= TimePosition then
        self.TimePosition = 0
        self._lastFrame = -1
    end
    local v6 = {}
    local v7 = nil
    local v8 = nil
    local v9 = self
    for i, j in self._targets, v7, v8 do
        v5 = {}
        v6[i] = v5
        v1 = nil
        v2 = nil
        for k, n in j.Props, v1, v2 do
            v3, v4 = getPropValue(v9, i, k)
            if v3 then
                v5[k] = v4
            end
            if v9.RestoreDefaults then
                setPropValue(v9, i, k, n.Default)
            end
        end
    end
    v9._lastAnimationEventFrame = if not (0 < v9.TimePosition) then -1 else math.min(math.floor(v9.TimePosition * v9.FrameRate), v9.Frames)
    local ServerTimeNow = if not RunService:IsClient() then tick() else workspace:GetServerTimeNow()
    v9._startTime = ServerTimeNow - v9.TimePosition
    v9._paused = false
    u44[v9] = v6
    u43[v9] = a2
    task.spawn(function() -- Line: 1457 -- upvalues: a2 (val)
        if a2 and not a2.IsPlaying then
            a2:Play()
        end
    end)
    v9._completed:Fire(Enum.PlaybackState.Playing)
end

function u37.GetDriftStats(a1) -- Line: 1466
    local _DriftStats = a1._scratch._DriftStats
    if not _DriftStats then
        return nil
    end
    local v1 = if not (0 < _DriftStats.Frames) then 0 else _DriftStats.DriftSum / _DriftStats.Frames
    local v2 = {Frames = _DriftStats.Frames}
    v2.Min = not (_DriftStats.DriftMin == (1 / 0)) and _DriftStats.DriftMin or 0
    v2.Max = not (_DriftStats.DriftMax == (-1 / 0)) and _DriftStats.DriftMax or 0
    v2.Average = v1
    v2.SoftCorrections = _DriftStats.SoftCorrections
    v2.CooldownCorrections = _DriftStats.CooldownCorrections
    v2.HardSeeks = _DriftStats.HardSeeks
    return v2
end

function v1.EmitVFX(a1) -- Line: 1484 -- upvalues: VFXEmitter (val) -- types: a1: userdata
    VFXEmitter.Emit(a1)
end

RunService:BindToRenderStep("__UPDATE_MOONLITE_TRACKS", Enum.RenderPriority.Camera.Value + 1, function(a1) -- Line: 1491 -- upvalues: u44 (val), stepTrack (val), restoreTrack (val) -- types: a1: number
    for i in u44 do
        if not i._paused and stepTrack(i) then
            restoreTrack(i)
        end
    end
end)
return v1