-- Script path: ReplicatedStorage.Shared.Modules.Nanoid
-- Decompile time: 0.78 ms

local u1 = Random.new()
local u3 = 21
local u4 = "useandom-26T198340PX75pxJACKVERYMINDBUSHWOLF_GQZbfghjklqvwyzrict"

local function u5(a1) -- Line: 7 -- upvalues: u3 (val), u1 (val), u4 (val) -- types: a1: number?
    local v1
    local v2 = ""
    local v3 = os.time()
    for i = 1, a1 or u3 or 21 do
        v1 = (bit32.bxor(u1:NextInteger(0, 4294967295), v3)) % #u4
        v2 = v2 .. string.sub(u4, v1, v1)
    end
    return v2
end

return (setmetatable({
    nanoid = u5,
    customAlphabet = function(a1, a2) -- Line: 6 -- upvalues: u1 (val) -- types: a1: string, a2: number?
        return function(a1_2) -- Line: 7 -- upvalues: a2 (val), u1 (upval), a1 (val) -- types: a1_2: number?
            local v1
            local v2 = ""
            local v3 = os.time()
            for i = 1, a1_2 or a2 or 21 do
                v1 = (bit32.bxor(u1:NextInteger(0, 4294967295), v3)) % #a1
                v2 = v2 .. string.sub(a1, v1, v1)
            end
            return v2
        end
    end,
}, {
    __call = function(a1, a2) -- Line: 29 -- upvalues: u5 (val) -- types: a2: number?
        return u5(a2)
    end,
}))