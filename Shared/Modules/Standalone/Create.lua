-- Script path: ReplicatedStorage.Shared.Modules.Standalone.Create
-- Decompile time: 0.75 ms

local parentChild
local u0 = {}

function parentChild(a1, a2) -- Line: 3 -- upvalues: parentChild (val) -- types: a1: userdata
    if a2 == nil then
        return
    end
    if typeof(a2) == "Instance" then
        a2.Parent = a1
        return
    end
    if type(a2) == "table" then
        for k, v in pairs(a2) do
            parentChild(a1, v)
        end
    end
end

local v1 = {Children = u0}

local function create(a1, a2) -- Line: 21 -- upvalues: u0 (val), parentChild (val)
    local v1 = Instance.new(a1)
    if a2 then
        for k, v in pairs(a2) do
            if k == u0 or type(k) ~= "string" then
                parentChild(v1, v)
            else
                v1[k] = v
            end
        end
    end
    return v1
end

local v2 = {
    __call = function(a1, a2, a3) -- Line: 40 -- upvalues: create (val)
        return (create(a2, a3))
    end,
}
setmetatable(v1, v2)
return v1