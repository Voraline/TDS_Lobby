-- Script path: ReplicatedStorage.Content.Maps.Bathroom Approach.Animator
-- Decompile time: 2.85 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local Map = NewNetwork.Channel("Map")

local function arrowBunny() -- Line: 10
    -- upvalues: ReplicatedStorage (val), Players (val), RunService (val), GameState (val), TimescaleUtilities (val)
    -- upvalues: TweenService (val)
    for i, j in workspace.Map.Sentrys:GetChildren() do
        local u30 = ((ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Models")):WaitForChild("PointerArrow"):Clone()
        u30.Parent = workspace.Trash
        local Highlight = Instance.new("Highlight")
        Highlight.Parent = j
        Highlight.FillTransparency = 1
        Highlight.OutlineTransparency = 1
        Highlight.FillColor = Color3.fromRGB(0, 255, 55)
        Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        local u54 = j:GetPivot().Position + Vector3.new(0, 3, 0)
        local Position = (Players.LocalPlayer.Character:GetPivot()).Position
        local u62 = 0
        local u69 = RunService.Heartbeat:Connect(function(a1) -- Line: 31
            -- upvalues: u62 (ref), u54 (val), GameState (upval), Position (ref), Highlight (val), u30 (val)
            u62 = u62 + a1
            local v1 = u54
            local v2 = u62 * GameState.TimeScale * 2
            local v3 = v1 + Vector3.new(0, 1, 0) * (math.sin(v2) + 4)
            v1 = workspace.CurrentCamera.CFrame.Position - v3
            local v4 = Vector3.new(v1.X, 0, v1.Z)
            Position = Position:Lerp(u54, a1 * 2)
            local v5 = Position + Vector3.new(0, math.sin(u62 * GameState.TimeScale * 2) + 4, 0)
            local v6 = (CFrame.lookAt(v5, v5 + v4)) * CFrame.Angles(-1.5707963267948966, 0, 0)
            Highlight.FillTransparency = 1 - math.sin(u62 * GameState.TimeScale * 4)
            Highlight.OutlineTransparency = 1 - math.sin(u62 * GameState.TimeScale * 4)
            u30.CFrame = v6
        end)
        TimescaleUtilities.Delay(10, function() -- Line: 51
            -- upvalues: u69 (ref), TweenService (upval), Highlight (val), u30 (val), TimescaleUtilities (upval)
            if u69 then
                u69:Disconnect()
                TweenService:Create(Highlight, TweenInfo.new(1), {FillTransparency = 1, OutlineTransparency = 1}):Play()
                TweenService:Create(u30, TweenInfo.new(1), {Transparency = 1}):Play()
                TimescaleUtilities.Delay(1, function() -- Line: 64 -- upvalues: u30 (upval), Highlight (upval)
                    if u30 then
                        u30:Destroy()
                    end
                    if Highlight then
                        Highlight:Destroy()
                    end
                end)
            end
        end)
    end
end

return function(a1, a2) -- Line: 77 -- upvalues: Map (val), arrowBunny (val)
    a2:Mark((Map:onEvent("Arrow", arrowBunny)))
end