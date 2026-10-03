-- Script path: ReplicatedStorage.Client.Modules.Moonlite.AnimationEvents
-- Decompile time: 5.05 ms

local v1 = {}

local function readPathSegments(a1) -- Line: 10 -- types: a1: string
    local v1, v2, v3
    local v4 = {}
    local u72 = 1
    local u73 = #a1

    local function skipWhitespace() -- Line: 15 -- upvalues: u72 (ref), u73 (val), a1 (val)
        while u72 <= u73 do
            if not (a1:sub(u72, u72)):match("%s") then
                break
            end
            u72 = u72 + 1
        end
    end

    local function readIdentifier() -- Line: 21 -- upvalues: u72 (ref), a1 (val), u73 (val)
        local v1 = u72
        if not (a1:sub(u72, u72)):match("[%a_]") then
            return nil
        end
        u72 = u72 + 1
        while u72 <= u73 do
            if not (a1:sub(u72, u72)):match("[%w_]") then
                break
            end
            u72 = u72 + 1
        end
        return a1:sub(v1, u72 - 1)
    end

    local function readStringLiteral() -- Line: 35 -- upvalues: a1 (val), u72 (ref), u73 (val)
        local v1, v2
        local v3 = a1:sub(u72, u72)
        if v3 ~= "\"" and v3 ~= "'" then
            return nil
        end
        u72 = u72 + 1
        local v4 = {}
        while u72 <= u73 do
            v1 = a1:sub(u72, u72)
            if v1 ~= "\\" then
                if v1 == v3 then
                    u72 = u72 + 1
                    return table.concat(v4)
                end
                table.insert(v4, v1)
                u72 = u72 + 1
            else
                v2 = a1:sub(u72 + 1, u72 + 1)
                if v2 == "" then
                    return nil
                end
                table.insert(v4, v2)
                u72 = u72 + 2
            end
        end
        return nil
    end

    skipWhitespace()
    local v5 = readIdentifier()
    if not v5 then
        return nil
    end
    table.insert(v4, v5)
    while u72 <= u73 do
        skipWhitespace()
        v2 = a1:sub(u72, u72)
        if v2 ~= "." then
            if v2 ~= "[" then
                break
            end
            u72 = u72 + 1
            skipWhitespace()
            v3 = readStringLiteral()
            if not v3 then
                return nil
            end
            skipWhitespace()
            v1 = u72
            if a1:sub(u72, v1) ~= "]" then
                return nil
            end
            u72 = u72 + 1
        else
            u72 = u72 + 1
            v3 = readIdentifier()
            if not v3 then
                return nil
            end
        end
        table.insert(v4, v3)
    end
    skipWhitespace()
    if u72 <= u73 then
        return nil
    end
    return v4
end

local function getRelativeCutscenePath(a1) -- Line: 117 -- upvalues: readPathSegments (val) -- types: a1: string
    local v1, v2, v3, v4
    local v5 = readPathSegments(a1)
    if not v5 then
        return nil
    end
    for i, j in v5 do
        if j == "CutScenes" then
            v2 = v5[i - 1]
            if v2 ~= "workspace" and v2 ~= "Workspace" then
                continue
            end
            v3 = {}
            v1 = i + 2
            v4 = #v5
            for k = v1, v4 do
                table.insert(v3, v5[k])
            end
            if #v3 == 0 then
                return nil
            end
            return table.concat(v3, "/")
        end
    end
    if v5[1] ~= "workspace" and v5[1] ~= "Workspace" and v5[1] ~= "game" then
        if #v5 <= 1 then
            return nil
        end
        return table.concat(v5, "/")
    end
    return nil
end

local function splitEmitArguments(a1) -- Line: 156 -- types: a1: string
    local v1
    local v2 = {}
    local v3 = 1
    local v4 = 0
    local v5 = nil
    local v6 = false
    local v7 = #a1
    for i = 1, v7 do
        v1 = a1:sub(i, i)
        if not v5 then
            if v1 ~= "\"" and v1 ~= "'" then
                if v1 == "[" then
                    v4 = v4 + 1
                elseif v1 == "]" then
                    v4 = math.max(v4 - 1, 0)
                elseif v1 == "," and v4 == 0 then
                    table.insert(v2, (a1:sub(v3, i - 1)))
                    v3 = i + 1
                end
            end
        elseif not v6 then
            if v1 ~= "\\" then
                if v1 == v5 then end
            end
        end
    end
    table.insert(v2, (a1:sub(v3)))
    return v2
end

local function readCodeBeginEvents(a1, a2, a3) -- Line: 190
    -- upvalues: splitEmitArguments (val), getRelativeCutscenePath (val)
    local codeBegin = a1:FindFirstChild("codeBegin")
    if codeBegin and codeBegin:IsA("StringValue") then
        local v1
        for i in codeBegin.Value:gmatch("shared%.vfx%.emit%s*%((.-)%)") do
            for j, k in splitEmitArguments(i) do
                v1 = getRelativeCutscenePath(k)
                if v1 then
                    table.insert(v2, {Name = "VFX", Parameter = v1})
                    v3.VFX = v1
                end
            end
        end
        return
    end
end

function v1.Read(a1) -- Line: 216 -- upvalues: readCodeBeginEvents (val) -- types: a1: userdata
    local Val
    local v1 = {}
    local v2 = {}
    local KFMarkers = a1:FindFirstChild("KFMarkers")
    if not KFMarkers then
        readCodeBeginEvents(a1, v1, v2)
        return v1, v2
    end
    local Children = KFMarkers:GetChildren()
    table.sort(Children, function(a1, a2) -- Line: 227
        return (tonumber(a1.Name) or (1 / 0)) < (tonumber(a2.Name) or (1 / 0))
    end)
    for i, j in Children do
        Val = j:FindFirstChild("Val")
        if tonumber(j.Name) and j:IsA("StringValue") and j.Value ~= "" and Val and Val:IsA("StringValue") then
            table.insert(v1, {Name = j.Value, Parameter = Val.Value})
            v2[j.Value] = Val.Value
        end
    end
    readCodeBeginEvents(a1, v1, v2)
    return v1, v2
end

return v1