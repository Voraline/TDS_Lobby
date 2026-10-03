-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.Type.roblox
-- Decompile time: 0.38 ms

local u7 = require(script.Parent:WaitForChild("Symbol.roblox"))
local u10 = newproxy(true)
local u11 = {}

local function addType(a1) -- Line: 32 -- upvalues: u11 (val), u7 (val)
    u11[a1] = (u7.named("Roact" .. a1))
end

u11.HostChangeEvent = u7.named("RoactHostChangeEvent")
u11.HostEvent = u7.named("RoactHostEvent")

function u11.of(a1) -- Line: 39 -- upvalues: u10 (val)
    if typeof(a1) ~= "table" then
        return nil
    end
    return a1[u10]
end

getmetatable(u10).__index = u11
local v1 = getmetatable(u10)

function v1.__tostring() -- Line: 49
    return "RoactType"
end

return u10