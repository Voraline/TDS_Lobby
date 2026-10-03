-- Script path: ReplicatedStorage.Shared.Modules.AttributeSerializer
-- Decompile time: 3.81 ms

local CollectionService = game:GetService("CollectionService")
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local LinearValue = require(ReplicatedStorage.Client.Interfaces.Hooks.Utility.LinearValue)
local v1 = {}
local u28 = {}
local u29 = {_guids = {}}
u28._identifiers = {
    "UDim2",
    "UDim",
    "Vector2",
    "Vector3",
    "Color3",
    "ColorSequenceKeypoint",
    "NumberSequenceKeypoint",
    "NumberRange",
    "PhysicalProperties",
    "BrickColor",
    "CFrame",
}
u28._types = {
    UDim2 = UDim2.new,
    UDim = UDim.new,
    Vector2 = Vector2.new,
    Vector3 = Vector3.new,
    Color3 = Color3.new,
    ColorSequenceKeypoint = ColorSequenceKeypoint.new,
    NumberSequenceKeypoint = NumberSequenceKeypoint.new,
    NumberRange = NumberRange.new,
    PhysicalProperties = PhysicalProperties.new,
    BrickColor = BrickColor.new,
    CFrame = CFrame.new,
}

function u29.CreateRef(a1) -- Line: 41
    -- upvalues: u29 (val), RunService (val), HttpService (val)
    if u29._guids[a1] then
        return u29._guids[a1]
    end
    if RunService:IsClient() then
        return nil
    end
    local v1 = ("%*"):format((HttpService:GenerateGUID(false)))
    u29._guids[a1] = v1
    a1:AddTag(v1)
    a1.Destroying:Connect(function() -- Line: 54 -- upvalues: u29 (upval), a1 (val)
        u29._guids[a1] = nil
    end)
    return v1
end

function u29.ResolveRef(a1, a2) -- Line: 61
    -- upvalues: CollectionService (val), u29 (val)
    local u22 = CollectionService:GetTagged(a1)[1]
    if not u22 and a2 ~= false then
        local u8 = nil
        u8 = task.delay(10, function() -- Line: 66 -- upvalues: a1 (val), u8 (ref)
            warn((("Potential infinite yield on ResolveRef: %*"):format(a1)))
            u8 = nil
        end)
        u22 = CollectionService:GetInstanceAddedSignal(a1):Wait()
        if u8 then
            task.cancel(u8)
        end
    end
    if u22 then
        u29._guids[u22] = a1
        u22.Destroying:Connect(function() -- Line: 81 -- upvalues: u29 (upval), u22 (ref)
            u29._guids[u22] = nil
        end)
    end
    return u22
end

function u28.Serialize(a1) -- Line: 89 -- upvalues: u29 (val), u28 (val), LinearValue (val) -- types: a1: table
    local v1, v2, v3, v4
    local v5 = {}
    local v6 = nil
    local v7 = nil
    for i, j in a1, v6, v7 do
        v2 = typeof(j)
        if v2 == "Instance" then
            v5[i] = "\002" .. u29.CreateRef(j)
        elseif u28._types[v2] then
            v3 = {}
            v4 = table.find(u28._identifiers, v2)
            for k, n in LinearValue.fromValue(j)._value do
                table.insert(v3, (tostring(n)))
            end
            v1 = string.char(v4)
            v5[i] = "\003" .. v1 .. table.concat(v3, ",")
        elseif v2 ~= "table" then
            v5[i] = j
        else
            v5[i] = (u28.Serialize(j))
        end
    end
    return v5
end

function u28.Deserialize(a1) -- Line: 116 -- upvalues: u28 (val), u29 (val) -- types: a1: table
    local v1, v2, v3, v4, v5
    local v6 = nil
    local v7 = nil
    local v8 = a1
    for i, j in a1, v6, v7 do
        v3 = typeof(j)
        if v3 == "table" then
            u28.Deserialize(j)
        elseif v3 == "string" then
            v4 = string.byte(j, 1)
            v5 = string.sub(j, 2)
            if v4 == 2 then
                v8[i] = (u29.ResolveRef(v5, false))
            elseif v4 == 3 then
                v5 = string.sub(j, 3)
                v1 = u28._types[u28._identifiers[string.byte(j, 2)]]
                v2 = {}
                for k, n in string.split(v5, ",") do
                    table.insert(v2, (tonumber(n)))
                end
                v8[i] = (v1(unpack(v2)))
            end
        end
    end
    return v8
end

function v1.Sanetize(a1) -- Line: 147 -- types: a1: string
    return (a1:gsub("[^%w_%.%-]", "_"))
end

function v1.Serialize(a1) -- Line: 152 -- upvalues: u28 (val), HttpService (val), u29 (val)
    local v1 = typeof(a1)
    if v1 == "table" then
        return "\001" .. HttpService:JSONEncode((u28.Serialize(a1)))
    end
    if v1 ~= "Instance" then
        return a1
    end
    local v2 = u29.CreateRef(a1)
    if not v2 then
        return
    end
    return "\002" .. v2
end

function v1.Deserialize(a1) -- Line: 169 -- upvalues: HttpService (val), u28 (val), u29 (val)
    if typeof(a1) ~= "string" then
        return a1
    end
    local v1 = a1:sub(1, 1)
    local v2 = a1:sub(2)
    if v1 == "\001" then
        v2 = HttpService:JSONDecode(v2)
        return (u28.Deserialize(v2))
    end
    if v1 == "\002" then
        return u29.ResolveRef(v2, false)
    end
    return a1
end

return v1