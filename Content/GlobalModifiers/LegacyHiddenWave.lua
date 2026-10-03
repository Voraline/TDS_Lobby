-- Script path: ReplicatedStorage.Content.GlobalModifiers.LegacyHiddenWave
-- Decompile time: 1.73 ms

local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local u30 = {ReactGameSandboxPanel = true, ReactGameTooltip = true}
return {
    onEnableClient = function(a1, a2, a3) -- Line: 17 -- upvalues: u30 (val), Lighting (val), spr (val), Players (val), RunService (val)
        local u4 = Random.new()
        local u5 = {}
        local u6 = {}

        local function hookUIRoot(a1) -- Line: 22 -- upvalues: u30 (upval), u5 (val), u6 (val) -- types: a1: userdata
            local v1, v2
            if u30[a1.Name] then
                return
            end
            for i, j in a1:GetChildren() do
                if j:IsA("Frame") then
                    v1 = u5
                    v2 = {Position = j.Position}
                    v1[j] = v2
                end
            end
            if a1.Name == "ReactGameTopGameDisplay" then
                local Frame = a1.Frame
                u6[Frame.wave.title] = {TextColor3 = Frame.wave.title.TextColor3}
                u6[Frame.wave.container.value] = {TextColor3 = Frame.wave.container.value.TextColor3}
                u6[Frame.waveTimer.container.value] = {TextColor3 = Frame.waveTimer.container.value.TextColor3}
                u6[Frame.waveTimer.bin.title] = {TextColor3 = Frame.waveTimer.bin.title.TextColor3}
            end
        end

        spr.target(a1.makeInstance("ColorCorrectionEffect", {Parent = Lighting}), 1, 3, {TintColor = Color3.fromRGB(255, 187, 187)})
        for i, j in Players.LocalPlayer:WaitForChild("PlayerGui"):GetChildren() do
            if j:IsA("ScreenGui") then
                hookUIRoot(j)
            end
        end
        a1.connect(RunService.Heartbeat, function(a1) -- Line: 72 -- upvalues: u5 (val), u4 (val), u6 (val) -- types: a1: number
            local Position, fromHSV, fromOffset, v1, v2
            for i, j in u5 do
                Position = j.Position
                fromOffset = UDim2.fromOffset
                v2 = u4:NextInteger(-1, 1)
                i.Position = Position + fromOffset(v2, u4:NextInteger(-1, 1))
            end
            for k, n in u6 do
                fromHSV = Color3.fromHSV
                v1 = tick() % 1
                k.TextColor3 = fromHSV(v1, 1, 1)
            end
        end)
        a2:Mark(function() -- Line: 86 -- upvalues: u5 (val), u6 (val)
            for i, j in u5 do
                i.Position = j.Position
            end
            for k, n in u6 do
                k.TextColor3 = n.TextColor3
            end
        end)
    end,
}