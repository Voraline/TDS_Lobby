-- Script path: ReplicatedStorage.Packages._Index.paradoxum_quill@0.1.1.quill.Dependencies
-- Decompile time: 1.53 ms

local u0 = {}
local u1 = {}
local v1 = {}

local function getPackageDependencies() -- Line: 10
    return script.Parent.Parent
end

local function getBundledDependency(a1) -- Line: 16 -- types: a1: string
    local Libraries = script.Parent:FindFirstChild("Libraries")
    if Libraries then
        return (Libraries:FindFirstChild(a1))
    end
    return nil
end

local function requireDependency(a1, a2) -- Line: 21 -- types: a1: string
    if typeof(a2) ~= "Instance" then
        return a2
    end
    assert(
        a2:IsA("ModuleScript"),
        (("[Quill] Dependency \"%*\" must point to a ModuleScript, got %* (%*)"):format(a1, a2:GetFullName(), a2.ClassName))
    )
    return require(a2)
end

function v1.init(a1) -- Line: 34 -- upvalues: u1 (val), u0 (val) -- types: a1: table?
    if not a1 then
        return
    end
    local v1 = nil
    local v2 = nil
    for i, j in a1, v1, v2 do
        assert(
            u1[i] == nil,
            (("[Quill] Cannot override dependency \"%*\" after it has already been loaded. Call Quill.init() before accessing Quill modules that use it."):format(i))
        )
        u0[i] = j
    end
end

function v1.get(a1) -- Line: 49 -- upvalues: u1 (val), u0 (val) -- types: a1: string
    local v1
    local v2 = u1[a1]
    if v2 ~= nil then
        return v2
    end
    local v3 = u0[a1]
    if v3 ~= nil then
        local v4
        if typeof(v3) ~= "Instance" then
            v4 = v3
        else
            assert(
                v3:IsA("ModuleScript"),
                (("[Quill] Dependency \"%*\" must point to a ModuleScript, got %* (%*)"):format(a1, v3:GetFullName(), v3.ClassName))
            )
            v4 = require(v3)
        end
        u1[a1] = v4
        return v4
    end
    local Parent = script.Parent.Parent
    local v5 = if not Parent then nil else Parent:FindFirstChild(a1)
    if not v5 then
        local Libraries = script.Parent:FindFirstChild("Libraries")
        v5 = if not Libraries then nil else Libraries:FindFirstChild(a1)
    end
    assert(v5, (("[Quill] Missing dependency \"%*\". Install it through Wally or alongside Quill in the same Packages tree."):format(a1)))
    if typeof(v5) ~= "Instance" then
        v1 = v5
    else
        assert(
            v5:IsA("ModuleScript"),
            (("[Quill] Dependency \"%*\" must point to a ModuleScript, got %* (%*)"):format(a1, v5:GetFullName(), v5.ClassName))
        )
        v1 = require(v5)
    end
    u1[a1] = v1
    return v1
end

return v1