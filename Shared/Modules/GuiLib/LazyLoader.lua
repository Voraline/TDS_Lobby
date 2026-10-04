-- Script path: ReplicatedStorage.Shared.Modules.GuiLib.LazyLoader
-- Decompile time: 0.46 ms

local getLoaderOf
local u2 = {Folder = true, ModuleScript = true}

function getLoaderOf(a1) -- Line: 9 -- upvalues: u2 (val), getLoaderOf (val)
    local u1 = {}
    return (setmetatable({}, {
        __index = function(a1_2, a2) -- Line: 13 -- upvalues: u1 (val), a1 (val), u2 (upval), getLoaderOf (upval)
            if u1[a2] then
                return u1[a2]
            end
            local v1 = a1:FindFirstChild(a2)
            if v1 and v1 ~= script and u2[v1.ClassName] then
                local v2 = v1:IsA("ModuleScript") and require(v1) or getLoaderOf(v1)
                u1[a2] = v2
                return u1[a2]
            end
        end,
    }))
end

return (getLoaderOf(script.Parent))