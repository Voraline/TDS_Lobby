-- Script path: ReplicatedStorage.Shared.Modules.Asset.Handlers.Emotes
-- Decompile time: 0.97 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
require(ReplicatedStorage.Shared.Modules.Utils.math)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local Assets = ReplicatedStorage:WaitForChild("Assets")
local Emotes = Assets:WaitForChild("Emotes")
local u30 = {}
return function(a1) -- Line: 11 -- upvalues: u30 (val), Emotes (val), SoundService (val), Assets (val), table (val)
    local v1 = u30[a1]
    if not v1 then
        local v2 = Emotes:WaitForChild(a1)
        local Emotes_2 = SoundService:WaitForChild("Emotes")
        for i, v in ipairs(v2:GetDescendants()) do
            if v:IsA("Sound") then
                v.SoundGroup = Emotes_2
            end
        end
        if a1 == "Firework" then
            for i2, i3 in ipairs(((Assets:WaitForChild("Effects")):WaitForChild("Client"):WaitForChild("Firework")):GetDescendants()) do
                if i3:IsA("Sound") then
                    i3.SoundGroup = Emotes_2
                end
            end
        end
        u30[a1] = (table.merge({
            Name = a1,
            Animation = v2,
            Effects = v2:FindFirstChild("Effects") and require(v2:WaitForChild("Effects")),
        }, v2:FindFirstChild("Data") and require(v2:WaitForChild("Data"))))
    end
    return v1
end