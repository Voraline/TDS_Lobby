-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_instance-of@1.2.7.instance-of.instanceof
-- Decompile time: 0.78 ms

local __DEV__ = _G.__DEV__
return function(a1, a2) -- Line: 5 -- upvalues: __DEV__ (val)
    local v1
    if __DEV__ then
        assert(typeof(a2) == "table", "Received a non-table as the second argument for instanceof")
    end
    local v2 = a1
    if typeof(v2) ~= "table" then
        return false
    end
    local success, result = pcall(function() -- Line: 14 -- upvalues: a2 (val), a1 (ref)
        local v1 = false
        if a2.new ~= nil then
            v1 = a1.new == a2.new
        end
        return v1
    end)
    if success and result then
        return true
    end
    local v3 = {[a1] = true}
    while a1 do
        v1 = a1
        if typeof(v1) ~= "table" then
            break
        end
        v1 = a1
        a1 = getmetatable(v1)
        v1 = a1
        if typeof(v1) == "table" then
            a1 = a1.__index
            if a1 == a2 then
                return true
            end
        end
        v1 = a1
        if typeof(v1) == "table" then
            if v3[a1] then
                return false
            end
            v3[a1] = true
        end
    end
    return false
end