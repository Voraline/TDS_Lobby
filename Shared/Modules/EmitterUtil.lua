-- Script path: ReplicatedStorage.Shared.Modules.EmitterUtil
-- Decompile time: 6.47 ms

local v1 = {}

local function getEmitters(a1) -- Line: 3
    if typeof(a1) == "table" then
        return a1
    end
    local v1 = {}
    if a1:IsA("ParticleEmitter") or a1:IsA("Beam") or a1:IsA("Trail") then
        table.insert(v1, a1)
    end
    local Descendants = a1:GetDescendants()
    if #Descendants > 0 then
        for k, v in pairs(Descendants) do
            if v:IsA("ParticleEmitter") then
                table.insert(v1, v)
            end
        end
    end
    return v1
end

local u2 = {}

function v1.scaleEmitter(a1, a2, a3, a4) -- Line: 28
    -- upvalues: getEmitters (val), u2 (val)
    local v1, v2, v3
    local v4 = getEmitters(a2)
    local v5 = {
        ParticleEmitter = {Size = "Size", Speed = "Speed", Acceleration = "Acceleration"},
        Beam = {Width0 = "Width0", Width1 = "Width1", CurveSize0 = "CurveSize0", CurveSize1 = "CurveSize1"},
        Trail = {},
    }
    local v6 = {
        NumberSequence = function(a1, a2) -- Line: 54 -- types: a1: userdata, a2: number
            local Time, new, v1
            local v2 = {}
            for i, j in a1.Keypoints do
                new = NumberSequenceKeypoint.new
                Time = j.Time
                v1 = j.Value * a2
                v2[i] = (new(Time, v1, j.Envelope * a2))
            end
            return NumberSequence.new(v2)
        end,
        NumberRange = function(a1, a2) -- Line: 67 -- types: a1: Color3, a2: number
            return NumberRange.new(a1.Min * a2, a1.Max * a2)
        end,
        number = function(a1, a2) -- Line: 71 -- types: a1: number, a2: number
            return a1 * a2
        end,
        Vector3 = function(a1, a2) -- Line: 75 -- types: a1: vector, a2: number
            return (Vector3.new(a1.X * a2, a1.Y * a2, a1.Z * a2))
        end,
    }
    local v7, v8 = a4, a3
    for k, v in pairs(v4) do
        v1 = v5[v.ClassName]
        if v7 and not u2[v] then
            u2[v] = {}
            for k2, i in pairs(v1) do
                v2 = u2[v]
                v2[k2] = v[k2]
            end
        end
        for k3, j in pairs(v1) do
            v2 = v[k3]
            v3 = v6[typeof(v2)](if not v7 then v2 else u2[v][k3], v8)
            if v3 then
                v[k3] = v3
            end
        end
    end
end

function v1.retimeEmitter(a1, a2, a3) -- Line: 103 -- upvalues: getEmitters (val)
    local Attribute, v1, v2, v3
    local v4 = getEmitters(a2)
    local v5 = {
        ParticleEmitter = {
            Lifetime = "Lifetime",
            Speed = "Speed",
            Drag = "Drag",
            Acceleration = "Acceleration",
            Rate = "Rate",
            FlipbookFramerate = "FlipbookFramerate",
            RotSpeed = "RotSpeed",
        },
        Beam = {Lifetime = "TextureSpeed"},
        Trail = {Lifetime = "Lifetime"},
    }
    local u10 = {"Lifetime", "Rate", "Acceleration"}
    local v6 = {
        NumberRange = function(a1, a2, a3) -- Line: 129 -- upvalues: u10 (val) -- types: a1: Color3, a2: number, a3: string
            if table.find(u10, a3) then
                a2 = 1 / a2
            end
            return NumberRange.new(a1.Min * a2, a1.Max * a2)
        end,
        number = function(a1, a2) -- Line: 137 -- types: a1: number, a2: number
            return a1 * a2
        end,
        Vector3 = function(a1, a2) -- Line: 141 -- types: a1: vector, a2: number
            return (Vector3.new(a1.X * a2, a1.Y * a2, a1.Z * a2))
        end,
    }
    local v7 = a3
    for k, v in pairs(v4) do
        for k2, i in pairs(v5[v.ClassName]) do
            v2 = v[i]
            if not v6[typeof(v2)] then
                warn(typeof(v2), "missing in re-time, please report this to the Developers.")
            end
            v3 = v6[typeof(v2)](v2, v7, i)
            if not v[i] then
                warn(i, "missing in re-time, please report this to the Devlopers.")
            else
                v[i] = v3
            end
        end
        Attribute = v:GetAttribute("EmitDelay")
        if Attribute then
            v1 = Attribute * (1 / v7)
            v:SetAttribute("EmitDelay", v1)
        end
    end
end

function v1.toggleEmitter(a1, a2) -- Line: 168 -- upvalues: getEmitters (val) -- types: a2: boolean
    for k, v in pairs((getEmitters(a1))) do
        v.Enabled = a2
    end
end

local function sampleNumberSequence(a1, a2) -- Line: 176 -- types: a1: userdata, a2: number
    local v1, v2, v3
    local Keypoints = a1.Keypoints
    local v4 = #Keypoints - 1
    local v5 = a2
    for i = 1, v4 do
        v1 = Keypoints[i]
        v2 = Keypoints[i + 1]
        if v1.Time <= v5 and v5 <= v2.Time then
            v3 = (v5 - v1.Time) / (v2.Time - v1.Time)
            return v1.Value + (v2.Value - v1.Value) * v3
        end
    end
    return Keypoints[#Keypoints].Value
end

local function sampleColorSequence(a1, a2) -- Line: 190 -- types: a1: userdata, a2: number
    local v1, v2
    local Keypoints = a1.Keypoints
    local v3 = #Keypoints - 1
    local v4 = a2
    for i = 1, v3 do
        v1 = Keypoints[i]
        v2 = Keypoints[i + 1]
        if v1.Time <= v4 and v4 <= v2.Time then
            return v1.Value:Lerp(v2.Value, (v4 - v1.Time) / (v2.Time - v1.Time))
        end
    end
    return Keypoints[#Keypoints].Value
end

function v1.averageNumberSequence(a1, a2, a3) -- Line: 208
    -- upvalues: sampleNumberSequence (val)
    local new, v1, v2, v3, v4
    local v5 = {}
    local v6 = {}
    for i, j in a1.Keypoints do
        if not v6[j.Time] then
            v6[j.Time] = true
            table.insert(v5, j.Time)
        end
    end
    for k, n in a2.Keypoints do
        if not v6[n.Time] then
            v6[n.Time] = true
            table.insert(v5, n.Time)
        end
    end
    table.sort(v5)
    if #v5 > 20 then
        v5 = {
            0,
            0.05263157894736842,
            0.10526315789473684,
            0.15789473684210525,
            0.21052631578947367,
            0.2631578947368421,
            0.3157894736842105,
            0.3684210526315789,
            0.42105263157894735,
            0.47368421052631576,
            0.5263157894736842,
            0.5789473684210527,
            0.631578947368421,
            0.6842105263157895,
            0.7368421052631579,
            0.7894736842105263,
            0.8421052631578947,
            0.8947368421052632,
            0.9473684210526315,
            1,
        }
    end
    if v5[1] ~= 0 then
        table.insert(v5, 1, 0)
    end
    if v5[#v5] ~= 1 then
        table.insert(v5, 1)
    end
    if #v5 > 20 then
        while #v5 > 20 do
            table.remove(v5, (math.ceil(#v5 / 2)))
        end
    end
    local v7 = {}
    for m, i5 in v5 do
        v1 = sampleNumberSequence(a1, i5)
        v2 = sampleNumberSequence(a2, i5)
        v3 = #v7 + 1
        new = NumberSequenceKeypoint.new
        v4 = v1 + (v2 - v1) * a3
        v7[v3] = (new(i5, v4, 0))
    end
    return NumberSequence.new(v7)
end

function v1.averageColorSequence(a1, a2, a3) -- Line: 262
    -- upvalues: sampleColorSequence (val)
    local v1, v2
    local v3 = {}
    local v4 = {}
    for i, j in a1.Keypoints do
        if not v4[j.Time] then
            v4[j.Time] = true
            table.insert(v3, j.Time)
        end
    end
    for k, n in a2.Keypoints do
        if not v4[n.Time] then
            v4[n.Time] = true
            table.insert(v3, n.Time)
        end
    end
    table.sort(v3)
    if #v3 > 20 then
        v3 = {
            0,
            0.05263157894736842,
            0.10526315789473684,
            0.15789473684210525,
            0.21052631578947367,
            0.2631578947368421,
            0.3157894736842105,
            0.3684210526315789,
            0.42105263157894735,
            0.47368421052631576,
            0.5263157894736842,
            0.5789473684210527,
            0.631578947368421,
            0.6842105263157895,
            0.7368421052631579,
            0.7894736842105263,
            0.8421052631578947,
            0.8947368421052632,
            0.9473684210526315,
            1,
        }
    end
    if v3[1] ~= 0 then
        table.insert(v3, 1, 0)
    end
    if v3[#v3] ~= 1 then
        table.insert(v3, 1)
    end
    if #v3 > 20 then
        while #v3 > 20 do
            table.remove(v3, (math.ceil(#v3 / 2)))
        end
    end
    local v5 = {}
    for m, i5 in v3 do
        v1 = sampleColorSequence(a1, i5)
        v2 = sampleColorSequence(a2, i5)
        v5[#v5 + 1] = (ColorSequenceKeypoint.new(i5, v1:Lerp(v2, a3)))
    end
    return ColorSequence.new(v5)
end

return v1