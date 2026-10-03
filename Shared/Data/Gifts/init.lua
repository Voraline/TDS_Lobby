-- Script path: ReplicatedStorage.Shared.Data.Gifts
-- Decompile time: 0.77 ms

local v1
local Descendants = script.Templates:GetDescendants()
require(script.Types)
local u9 = {}
local v2 = {}
for k, v in pairs(Descendants) do
    if v:IsA("ModuleScript") then
        v1 = require(v)
        u9[v1.id] = v1
    end
end
for k2, i in pairs(u9) do
    if not i.disabled then
        v2[k2] = i
    end
end
return {
    Gifts = u9,
    ActiveGifts = v2,
    getGiftsWithTower = function(a1) -- Line: 25 -- upvalues: u9 (val) -- types: a1: string
        local v1
        local v2 = {}
        local v3 = nil
        local v4 = nil
        for i, j in u9, v3, v4 do
            v1 = false
            for k, n in j.rewards do
                if n.type == "tower" and n.tower == v5 then
                    v1 = true
                    break
                end
            end
            if v1 and not table.find(v2, i) then
                table.insert(v2, i)
            end
        end
        return v2
    end,
}