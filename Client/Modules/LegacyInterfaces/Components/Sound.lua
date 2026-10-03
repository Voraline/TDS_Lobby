-- Script path: ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound
-- Decompile time: 3.58 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ContentProvider = game:GetService("ContentProvider")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u44 = RunService:IsRunning()
local LocalPlayer = Players.LocalPlayer

local function resolveSoundId(a1) -- Line: 19
    if typeof(a1) == "string" then
        return a1
    end
    if a1 then
        return (("rbxassetid://%*"):format(a1))
    end
end

local v1 = {}
local u53 = {}
local u60 = Create("ScreenGui", {
    Name = "SoundGui",
    ResetOnSpawn = false,
    Parent = u44 and LocalPlayer:WaitForChild("PlayerGui") or nil,
})
local u61 = {}
u61.__index = u61

function u61.new(a1) -- Line: 40
    -- upvalues: table (val), Maid (val), u61 (val), Create (val), u60 (val), ContentProvider (val), SoundService (val)
    local v1 = table.merge({Modifiers = Maid.new()}, a1)
    local u11 = setmetatable(v1, u61)
    local merge_2 = table.merge
    local Properties = u11.Properties
    local v2 = {Name = u11.Name}
    local SoundId = u11.Properties.SoundId
    v2.SoundId = if typeof(SoundId) ~= "string" then if not SoundId then nil else ("rbxassetid://%*"):format(SoundId) else SoundId
    v2.Parent = u60
    u11.Sound = Create("Sound", merge_2(Properties, v2))
    u11.Finished = u11.Sound.Ended
    task.spawn(function() -- Line: 62 -- upvalues: ContentProvider (upval), u11 (val)
        ContentProvider:PreloadAsync({u11.Sound})
    end)
    task.defer(function() -- Line: 68 -- upvalues: u11 (val), SoundService (upval)
        if not u11.Sound.SoundGroup then
            u11.Sound.SoundGroup = SoundService.Master
        end
    end)
    return u11
end

function u61:Play(a2, a3) -- Line: 77 -- upvalues: u60 (val)
    if not a2 then
        self.Sound:Play()
        return self
    end
    local u6 = self.Sound:Clone()
    if a3 then
        if typeof(a3) == "number" then
            u6.PlaybackSpeed = a3
        else
            u6.PlaybackSpeed = (Random.new()):NextNumber(a3[1], a3[2])
        end
    end
    u6.Parent = u60
    local u19 = nil
    local v1 = u6.Ended:Connect(function() -- Line: 96 -- upvalues: u19 (ref), u6 (val)
        u19:Disconnect()
        u6:Destroy()
    end)
    u6:Play()
    return self
end

function u61:Stop() -- Line: 114
    self.Sound:Stop()
    return self
end

function u61.Group(a1, a2) -- Line: 120 -- upvalues: SoundService (val)
    a1.Sound.SoundGroup = SoundService:FindFirstChild(a2)
end

function v1.Register(a1, a2, a3) -- Line: 126 -- upvalues: u53 (val)
    u53[a2] = a3
end

function v1.Template(a1, a2, a3) -- Line: 130 -- upvalues: u53 (val), table (val), u61 (val)
    local v1 = u53[a2]
    if v1 then
        local v2 = table.merge({SoundId = a3}, v1.Properties or {})
        if v2 then
            return (u61.new({Name = a3, Properties = v2}))
        end
    end
end

local u80 = setmetatable({}, {
    __index = function(a1, a2) -- Line: 150
        local function v1() end

        rawset(a1, a2, v1)
        return v1
    end,
})
local v2 = {
    __call = function(a1, ...) -- Line: 158 -- upvalues: u44 (val), u80 (val), u61 (val), table (val)
        if not u44 then
            return u80
        end
        local v1 = {...}
        if v1 then
            local v2 = v1[1]
            if v2 then
                local v3 = a1[v2]
                local v4 = v1[2]
                if not v3 then
                    if not v4 then
                        return v3
                    end
                    v3 = u61.new(table.merge({Name = v2}, v4))
                    if v4 and v4.Tag then
                        v3.Sound:AddTag(v4.Tag)
                    end
                    a1[v2] = v3
                    return v3
                end
                if v3 and v4 then
                    local Properties = v4.Properties
                    if Properties then
                        local Sound_2 = v3.Sound
                        if Sound_2 then
                            local v5
                            for k, v in pairs(Properties) do
                                v5 = if k ~= "SoundId" then v else if typeof(v) ~= "string" then if not v then nil else ("rbxassetid://%*"):format(v) else v
                                Sound_2[k] = v5
                            end
                        end
                    end
                end
                return v3
            end
        end
    end,
}
setmetatable(v1, v2)
return v1