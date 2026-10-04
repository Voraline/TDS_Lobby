-- Script path: ReplicatedStorage.Shared.Modules.Rotator
-- Decompile time: 1.36 ms

local band = bit32.band
local bxor = bit32.bxor
local rshift = bit32.rshift

local function u32(a1) -- Line: 9 -- upvalues: band (val) -- types: a1: number
    return (band(a1, 4294967295))
end

local function mul32(a1, a2) -- Line: 13 -- upvalues: band (val) -- types: a1: number, a2: number
    return (band(a1 * a2 % 4294967296, 4294967295))
end

local function mix(a1, a2) -- Line: 19
    -- upvalues: band (val), rshift (val), bxor (val)
    local v1 = band(a1 + 2654435769 + (band(a2 * 3144134277 % 4294967296, 4294967295)), 4294967295)
    v1 = band((bxor(v1, (rshift(v1, 16)))) * 2246822507 % 4294967296, 4294967295)
    v1 = band((bxor(v1, (rshift(v1, 13)))) * 3266489909 % 4294967296, 4294967295)
    return (bxor(v1, (rshift(v1, 16))))
end

return {
    makeRotator = function(a1, a2, a3) -- Line: 32 -- upvalues: mix (val) -- types: a1: table, a2: number, a3: number
        assert(#a1 >= 2, "Need at least two options.")
        local u12 = #a1
        local u18 = mix(a2, 0) % u12
        local u25 = (mix(a2, 1)) % (u12 - 1) + 1

        local function bucketAt(a1) -- Line: 40 -- upvalues: a3 (val) -- types: a1: number
            return (math.floor(a1 / a3))
        end

        local function indexAt(a1) -- Line: 44
            -- upvalues: a3 (val), u18 (val), u25 (val), u12 (val)
            return (u18 + u25 * ((math.floor(a1 / a3)) % 2147483647)) % u12
        end

        return function(a1_2) -- Line: 51 -- upvalues: a3 (val), u18 (val), u25 (val), u12 (val), a1 (val) -- types: a1_2: number?
            local v1 = a1_2 or os.time()
            local v2 = a1[(u18 + u25 * ((math.floor(v1 / a3)) % 2147483647)) % u12 + 1]
            local v3 = math.floor(v1 / a3)
            return v2, v3, (v3 + 1) * a3
        end
    end,
}