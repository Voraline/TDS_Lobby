-- Script path: ReplicatedStorage.Client.Modules.Effects
-- Decompile time: 11.12 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
require(ReplicatedStorage.Shared.Modules.Utils.math)
require(ReplicatedStorage.Shared.Modules.Utils.table)

local function _createEmoteEvents(a1) -- Line: 100 -- upvalues: Maid (val), Asset (val)
    local u1 = nil
    a1.CharacterAdded:Connect(function(a1) -- Line: 103 -- upvalues: u1 (ref), Maid (upval), Asset (upval)
        if u1 then
            u1:Disconnect()
        end
        local Humanoid = a1:WaitForChild("Humanoid")
        local Parent = Humanoid.Parent
        local AnimationPlayed = Humanoid.AnimationPlayed
        local u13 = nil
        u1 = AnimationPlayed:Connect(function(a1) -- Line: 15 -- upvalues: Maid (upval), Parent (val), u13 (val), Asset (upval)
            local u3 = Maid.new()

            local function _wrapFunction(a1) -- Line: 20 -- upvalues: Parent (upval)
                return function(a1_2) -- Line: 21 -- upvalues: Parent (upval), a1 (val)
                    if not Parent then
                        return
                    end
                    local v1 = Parent:FindFirstChild(a1_2)
                    return v1 and a1(v1)
                end
            end

            local function _makeVisible(a1, a2) -- Line: 31
                for k, v in pairs(a1:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.Transparency = if not a2 then 1 else 0
                    end
                end
            end

            local MarkerReachedSignal = a1:GetMarkerReachedSignal("Appear")

            local function u10(a1) -- Line: 45
                for k, v in pairs(a1:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.Transparency = 0
                    end
                end
            end

            u3:Mark((MarkerReachedSignal:Connect(function(a1) -- Line: 21 -- upvalues: Parent (upval), u10 (val)
                if not Parent then
                    return
                end
                local v1 = Parent:FindFirstChild(a1)
                return v1 and u10(v1)
            end)))
            local MarkerReachedSignal_2 = a1:GetMarkerReachedSignal("Hide")

            local function u22(a1) -- Line: 54
                for k, v in pairs(a1:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.Transparency = 1
                    end
                end
            end

            u3:Mark((MarkerReachedSignal_2:Connect(function(a1) -- Line: 21 -- upvalues: Parent (upval), u22 (val)
                if not Parent then
                    return
                end
                local v1 = Parent:FindFirstChild(a1)
                return v1 and u22(v1)
            end)))
            if not u13 then
                local u31 = nil
                u3:Mark(((a1:GetMarkerReachedSignal("Index")):Connect(function(a1) -- Line: 65 -- upvalues: u31 (ref), Asset (upval)
                    u31 = Asset("NewEmotes", a1)
                end)))
                u3:Mark(((a1:GetMarkerReachedSignal("Event")):Connect(function(a1_2) -- Line: 73 -- upvalues: u31 (ref), u3 (val), Parent (upval), a1 (val)
                    if u31 then
                        local Effects = u31.Effects
                        if Effects then
                            local v1 = Effects[a1_2]
                            if v1 then
                                v1(u3, Parent, a1)
                            end
                        end
                    end
                end)))
            end
            a1.Stopped:Wait()
            u3:Sweep()
        end)
    end)
    local Humanoid_2, Humanoid = (a1.Character or a1.CharacterAdded:Wait()):WaitForChild("Humanoid")
    local Parent = Humanoid_2.Parent
    local v1 = Humanoid_2.AnimationPlayed:Connect(function(a1) -- Line: 15 -- upvalues: Maid (upval), Parent (val), Humanoid (val), Asset (upval)
        local u3 = Maid.new()

        local function _wrapFunction(a1) -- Line: 20 -- upvalues: Parent (upval)
            return function(a1_2) -- Line: 21 -- upvalues: Parent (upval), a1 (val)
                if not Parent then
                    return
                end
                local v1 = Parent:FindFirstChild(a1_2)
                return v1 and a1(v1)
            end
        end

        local function _makeVisible(a1, a2) -- Line: 31
            for k, v in pairs(a1:GetChildren()) do
                if v:IsA("BasePart") then
                    v.Transparency = if not a2 then 1 else 0
                end
            end
        end

        local MarkerReachedSignal = a1:GetMarkerReachedSignal("Appear")

        local function u10(a1) -- Line: 45
            for k, v in pairs(a1:GetChildren()) do
                if v:IsA("BasePart") then
                    v.Transparency = 0
                end
            end
        end

        u3:Mark((MarkerReachedSignal:Connect(function(a1) -- Line: 21 -- upvalues: Parent (upval), u10 (val)
            if not Parent then
                return
            end
            local v1 = Parent:FindFirstChild(a1)
            return v1 and u10(v1)
        end)))
        local MarkerReachedSignal_2 = a1:GetMarkerReachedSignal("Hide")

        local function u22(a1) -- Line: 54
            for k, v in pairs(a1:GetChildren()) do
                if v:IsA("BasePart") then
                    v.Transparency = 1
                end
            end
        end

        u3:Mark((MarkerReachedSignal_2:Connect(function(a1) -- Line: 21 -- upvalues: Parent (upval), u22 (val)
            if not Parent then
                return
            end
            local v1 = Parent:FindFirstChild(a1)
            return v1 and u22(v1)
        end)))
        if not Humanoid then
            local u31 = nil
            u3:Mark(((a1:GetMarkerReachedSignal("Index")):Connect(function(a1) -- Line: 65 -- upvalues: u31 (ref), Asset (upval)
                u31 = Asset("NewEmotes", a1)
            end)))
            u3:Mark(((a1:GetMarkerReachedSignal("Event")):Connect(function(a1_2) -- Line: 73 -- upvalues: u31 (ref), u3 (val), Parent (upval), a1 (val)
                if u31 then
                    local Effects = u31.Effects
                    if Effects then
                        local v1 = Effects[a1_2]
                        if v1 then
                            v1(u3, Parent, a1)
                        end
                    end
                end
            end)))
        end
        a1.Stopped:Wait()
        u3:Sweep()
    end)
end

for k, v in pairs(Players:GetPlayers()) do
    coroutine.wrap(_createEmoteEvents)(v)
end
Players.PlayerAdded:Connect(_createEmoteEvents)
return function(a1, a2) -- Line: 10 -- upvalues: Maid (val), Asset (val)
    local Parent = a1.Parent
    return a1.AnimationPlayed:Connect(function(a1) -- Line: 15 -- upvalues: Maid (upval), Parent (val), a2 (val), Asset (upval)
        local u3 = Maid.new()

        local function _wrapFunction(a1) -- Line: 20 -- upvalues: Parent (upval)
            return function(a1_2) -- Line: 21 -- upvalues: Parent (upval), a1 (val)
                if not Parent then
                    return
                end
                local v1 = Parent:FindFirstChild(a1_2)
                return v1 and a1(v1)
            end
        end

        local function _makeVisible(a1, a2) -- Line: 31
            for k, v in pairs(a1:GetChildren()) do
                if v:IsA("BasePart") then
                    v.Transparency = if not a2 then 1 else 0
                end
            end
        end

        local MarkerReachedSignal = a1:GetMarkerReachedSignal("Appear")

        local function u10(a1) -- Line: 45
            for k, v in pairs(a1:GetChildren()) do
                if v:IsA("BasePart") then
                    v.Transparency = 0
                end
            end
        end

        u3:Mark((MarkerReachedSignal:Connect(function(a1) -- Line: 21 -- upvalues: Parent (upval), u10 (val)
            if not Parent then
                return
            end
            local v1 = Parent:FindFirstChild(a1)
            return v1 and u10(v1)
        end)))
        local MarkerReachedSignal_2 = a1:GetMarkerReachedSignal("Hide")

        local function u22(a1) -- Line: 54
            for k, v in pairs(a1:GetChildren()) do
                if v:IsA("BasePart") then
                    v.Transparency = 1
                end
            end
        end

        u3:Mark((MarkerReachedSignal_2:Connect(function(a1) -- Line: 21 -- upvalues: Parent (upval), u22 (val)
            if not Parent then
                return
            end
            local v1 = Parent:FindFirstChild(a1)
            return v1 and u22(v1)
        end)))
        if not a2 then
            local u31 = nil
            u3:Mark(((a1:GetMarkerReachedSignal("Index")):Connect(function(a1) -- Line: 65 -- upvalues: u31 (ref), Asset (upval)
                u31 = Asset("NewEmotes", a1)
            end)))
            u3:Mark(((a1:GetMarkerReachedSignal("Event")):Connect(function(a1_2) -- Line: 73 -- upvalues: u31 (ref), u3 (val), Parent (upval), a1 (val)
                if u31 then
                    local Effects = u31.Effects
                    if Effects then
                        local v1 = Effects[a1_2]
                        if v1 then
                            v1(u3, Parent, a1)
                        end
                    end
                end
            end)))
        end
        a1.Stopped:Wait()
        u3:Sweep()
    end)
end