-- Script path: ReplicatedStorage.Client.Modules.LegacyInterfaces.Elements.Prompts.Containers
-- Decompile time: 0.42 ms

local u0 = {}
for k, v in pairs((script:WaitForChild("Handlers")):GetChildren()) do
    u0[v.Name] = (require(v))
end
local u20 = {}
u20.__index = u20

function u20.new(a1) -- Line: 15 -- upvalues: u0 (val), u20 (val)
    local Name = a1.Name
    local v1 = u0[Name]
    local v2 = {Name = Name, Container = a1}
    local v3 = setmetatable(v1, u20)
    return setmetatable(v2, v3):Initialize()
end

return u20