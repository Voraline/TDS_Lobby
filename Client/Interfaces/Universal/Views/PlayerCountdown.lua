-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.PlayerCountdown
-- Decompile time: 5.03 ms

local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local ProximityPromptService = game:GetService("ProximityPromptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local Components = ReplicatedStorage.Client.Interfaces.Universal.Components
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local React = require(ReplicatedStorage.Shared.UI.React)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local useAttribute = require(Hooks.useAttribute)
local PlayerCountdown = require(Components.PlayerCountdown)
local useEffect = React.useEffect
local useState = React.useState
local createElement = React.createElement
local u64 = RunService:IsRunning()
local u65 = {Enum.CoreGuiType.Chat}

local function now() -- Line: 34 -- upvalues: u64 (val)
    if u64 then
        return workspace:GetServerTimeNow()
    end
    return tick()
end

return function(a1) -- Line: 42
    -- upvalues: useState (val), useAttribute (val), useGameStateValue (val), useEffect (val), u64 (val), Lighting (val)
    -- upvalues: TweenService (val), u65 (val), StarterGui (val), Players (val), ProximityPromptService (val)
    -- upvalues: createElement (val), PlayerCountdown (val)
    local v1, u4 = useState(false)
    local u9 = useAttribute(workspace, "CountdownEnds", 0)
    local v2 = useGameStateValue("Banning", nil)
    local u17 = v1 and not v2
    local v3 = {u9}
    useEffect(function() -- Line: 51 -- upvalues: u9 (val), u64 (upval), u4 (val)
        if u9 then
            local ServerTimeNow = if not u64 then tick() else workspace:GetServerTimeNow()
            if not (u9 < ServerTimeNow) then
                u4(true)
                task.delay(u9 - (if not u64 then tick() else workspace:GetServerTimeNow()), function() -- Line: 58 -- upvalues: u4 (upval)
                    u4(false)
                end)
                return function() -- Line: 62 -- upvalues: u4 (upval)
                    u4(false)
                end
            end
        end
        u4(false)
    end, v3)
    v3 = {u17}
    useEffect(function() -- Line: 67
        -- upvalues: u17 (ref), Lighting (upval), TweenService (upval), u65 (upval), StarterGui (upval), Players (upval)
        -- upvalues: ProximityPromptService (upval)
        if not u17 then
            return
        end
        local u1 = {}
        local BlurEffect = Instance.new("BlurEffect")
        BlurEffect.Parent = Lighting
        TweenService:Create(BlurEffect, TweenInfo.new(1, Enum.EasingStyle.Exponential), {Size = 20}):Play()
        for i, j in u65 do
            StarterGui:SetCoreGuiEnabled(j, false)
        end
        for k, n in Players.LocalPlayer.PlayerGui:GetChildren() do
            if n:IsA("ScreenGui") and not n.Name:find("PlayerCountdown") and not n.Name:find("LoadingScreen") then
                u1[n] = n.Enabled
                n.Enabled = false
            end
        end
        ProximityPromptService.Enabled = false
        return function() -- Line: 101
            -- upvalues: u65 (upval), StarterGui (upval), u1 (val), TweenService (upval), BlurEffect (val)
            -- upvalues: ProximityPromptService (upval)
            for i, j in u65 do
                StarterGui:SetCoreGuiEnabled(j, true)
            end
            for k, n in u1 do
                k.Enabled = n
            end
            TweenService:Create(BlurEffect, TweenInfo.new(1, Enum.EasingStyle.Exponential), {Size = 0}):Play()
            task.delay(1, function() -- Line: 114 -- upvalues: ProximityPromptService (upval), BlurEffect (upval)
                ProximityPromptService.Enabled = true
                BlurEffect:Destroy()
            end)
        end
    end, v3)
    return (createElement(PlayerCountdown, {Visible = u17, endTime = u9}))
end