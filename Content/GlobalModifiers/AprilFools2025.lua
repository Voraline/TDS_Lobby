-- Script path: ReplicatedStorage.Content.GlobalModifiers.AprilFools2025
-- Decompile time: 1.81 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
local u16 = Random.new()
local u17 = {"12877745093", "104373329184787"}
return {
    displayName = "April fools 2025",
    description = "N/A",
    icon = 9153315715,
    onEnableClient = function(a1, a2, a3) -- Line: 12 -- upvalues: LegacyMiddleware (val), u16 (val), u17 (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1_2, a2) -- Line: 17 -- upvalues: a1 (val), u16 (upval), u17 (upval)
            local modifyInstance_2, v1, v2, v3
            local v4 = 0
            local v5 = {}
            local v6 = a2
            for i, j in a2.Model:GetDescendants() do
                if j:IsA("MeshPart") then
                    v4 = v4 + 1
                    table.insert(v5, j)
                end
                if j:IsA("Motor6D") then
                    modifyInstance_2 = a1.modifyInstance
                    v2 = {
                        C0 = j.C0 * CFrame.Angles(0, math.rad((math.random(-180, 180))), 0),
                    }
                    modifyInstance_2(j, v2)
                end
            end
            v6:ScaleBy((u16:NextNumber(0.8, 2)))
            for k = 1, (math.random(2, (math.max(v4 - 3, 0)))) do
                v3 = math.random(1, #v5)
                v1 = v5[v3]
                if v1 then
                    if v1:IsA("MeshPart") then
                        a1.modifyInstance(v1, {
                            TextureID = ("rbxassetid://%*"):format(u17[(math.random(1, #u17))]),
                        })
                    end
                    table.remove(v5, v3)
                end
            end
            return v6
        end))
    end,
}