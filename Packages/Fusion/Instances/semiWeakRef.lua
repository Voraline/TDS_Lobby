-- Script path: ReplicatedStorage.Packages.Fusion.Instances.semiWeakRef
-- Decompile time: 0.55 ms

local Parent = script.Parent.Parent
require(Parent.PubTypes)
local isAccessible = require(Parent.Instances.isAccessible)
local u10 = {__mode = "v"}
local u11 = {__mode = ""}
local u12 = {}
setmetatable(u12, {__mode = "k"})
return function(a1) -- Line: 27 -- upvalues: u12 (val), isAccessible (val), u11 (val), u10 (val) -- types: a1: userdata?
    if a1 == nil then
        return {type = "SemiWeakRef"}
    end
    if u12[a1] then
        return u12[a1]
    end
    local u6 = {type = "SemiWeakRef", instance = a1}
    u12[a1] = u6

    local function updateStrength() -- Line: 44 -- upvalues: u6 (val), isAccessible (upval), u11 (upval), u10 (upval)
        if u6.instance ~= nil then
            local v1 = if not isAccessible(u6.instance) then u10 else u11
            setmetatable(u6, v1)
        end
    end

    u6.instance.AncestryChanged:Connect(updateStrength)
    task.defer(updateStrength)
    return u6
end