-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-util@3.10.0.jest-util.formatTime
-- Decompile time: 2.30 ms

local v1 = {}

local function mathTrunc(a1) -- Line: 13 -- types: a1: number
    if a1 > 0 then
        return (math.floor(a1))
    end
    return (math.ceil(a1))
end

local function stringPadStart(a1, a2, a3) -- Line: 18 -- types: a1: string, a2: number, a3: string?
    local v1 = math.max(#a1, a2)
    return (((a3 or " "):rep(v1)) .. a1):sub(-v1)
end

function v1.default(a1, a2, a3) -- Line: 26 -- types: a1: number, a2: number?, a3: number?
    local v1 = {"n", "μ", "m", ""}
    local v2 = (a2 or -3) / 3
    local v3 = math.max(0, (math.min((if not (v2 > 0) then math.ceil(v2) else math.floor(v2)) + #v1 - 1, #v1 - 1))) + 1
    local v4 = tostring(a1)
    local v5 = math.max(#v4, a3 or 0)
    return ("%s %ss"):format((((" "):rep(v5)) .. v4):sub(-v5), v1[v3])
end

return v1