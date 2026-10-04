-- Script path: ReplicatedStorage.Client.Controllers.Game.EnemySelectionCursorController
-- Decompile time: 7.18 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local u35 = nil
local Mouse = Players.LocalPlayer:GetMouse()
local u40 = nil

local function getModelRootFromInstance(a1) -- Line: 19 -- types: a1: userdata
    local Parent = a1
    while true do
        if Parent:IsA("Model") then
            if Parent:FindFirstChild("RootPointer") then
                return Parent
            end
        end
        Parent = Parent.Parent
        if not Parent then
            return nil
        end
    end
end

local function castEnemyRay(a1, a2) -- Line: 30
    -- upvalues: Mouse (val), getModelRootFromInstance (val)
    local Instance, v1, v2, v3, v4
    local v5 = RaycastParams.new()
    v5.FilterType = Enum.RaycastFilterType.Exclude
    v5.FilterDescendantsInstances = {}
    local UnitRay = a2 or Mouse.UnitRay
    while true do
        v1 = workspace:Raycast(UnitRay.Origin, UnitRay.Direction * 500, v5)
        if v1 then
            Instance = v1.Instance
            v2 = Instance.Name == "Hitbox"
            v3 = Instance:IsA("BasePart") and Instance.Transparency == 1
            if not v3 and not v2 then
                if Instance:IsDescendantOf(a1) then
                    v4 = getModelRootFromInstance(Instance)
                    if v4 then
                        return v4
                    end
                end
                v5:AddToFilter(Instance)
                if v1 then
                    continue
                end
                return nil
            end
            v5:AddToFilter(Instance)
        end
        if not v1 then
            return nil
        end
    end
end

local function getTapRay(a1) -- Line: 66 -- types: a1: userdata
    local CurrentCamera = workspace.CurrentCamera
    if not CurrentCamera then
        return nil
    end
    return CurrentCamera:ViewportPointToRay(a1.X, a1.Y)
end

return {
    isActive = function() -- Line: 178 -- upvalues: u35 (ref)
        return u35 ~= nil
    end,
    getCurrentSelection = function() -- Line: 181 -- upvalues: u40 (ref)
        return u40
    end,
    start = function(a1) -- Line: 84
        -- upvalues: u35 (ref), u40 (ref), TypedPromise (val), Maid (val), UserInputService (val), castEnemyRay (val)
        -- upvalues: getTapRay (val), Scheduler (val), RunService (val)
        if u35 then
            u35:cancel()
        end
        u40 = nil
        u35 = nil
        local NPCs = workspace:FindFirstChild("NPCs")
        if not NPCs then
            return TypedPromise.reject("No NPCs folder found")
        end
        local v1 = TypedPromise.new(function(a1_2, a2, a3) -- Line: 92
            -- upvalues: Maid (upval), u40 (upval), a1 (val), u35 (upval), UserInputService (upval)
            -- upvalues: castEnemyRay (upval), NPCs (val), getTapRay (upval), Scheduler (upval), RunService (upval)
            local u5 = Maid.new()
            local u6 = false
            local u7 = 0

            local function confirmSelection() -- Line: 97 -- upvalues: u40 (upval), a1 (upval), u5 (val), a1_2 (val)
                if not u40 then
                    return
                end
                local RootPointer = u40:FindFirstChild("RootPointer")
                if RootPointer and RootPointer.Value then
                    local Value = RootPointer.Value
                    if a1 and not a1(u40, Value) then
                        return
                    end
                    u5:Sweep()
                    a1_2(Value)
                    return
                end
            end

            u5:Mark(function() -- Line: 117 -- upvalues: u40 (upval), u35 (upval)
                u40 = nil
                u35 = nil
            end)
            a3(function() -- Line: 122 -- upvalues: u5 (val)
                u5:Sweep()
            end)
            u5:Mark((UserInputService.InputBegan:Connect(function(a1, a2_2) -- Line: 126 -- upvalues: confirmSelection (val), u5 (val), a2 (val)
                if a2_2 then
                    return
                end
                if a1.UserInputType == Enum.UserInputType.MouseButton1 then
                    confirmSelection()
                    return
                end
                if a1.KeyCode == Enum.KeyCode.Escape then
                    u5:Sweep()
                    a2("Selection cancelled")
                end
            end)))
            u5:Mark((UserInputService.TouchTapInWorld:Connect(function(a1, a2) -- Line: 139
                -- upvalues: castEnemyRay (upval), NPCs (upval), getTapRay (upval), u40 (upval), u6 (ref), u7 (ref)
                -- upvalues: confirmSelection (val)
                if a2 then
                    return
                end
                local v1 = castEnemyRay(NPCs, getTapRay(a1))
                u40 = v1
                u6 = true
                if not v1 then
                    u7 = 0
                    return
                end
                local v2 = tick()
                local v3 = v2 - u7 < 0.4
                u7 = v2
                if v3 then
                    confirmSelection()
                end
            end)))
            u5:Mark((Scheduler.add("EnemySelectionCursor", RunService.Heartbeat, function() -- Line: 162 -- upvalues: castEnemyRay (upval), NPCs (upval), u40 (upval), u6 (ref)
                local v1 = castEnemyRay(NPCs)
                if v1 then
                    u40 = v1
                    u6 = false
                    return
                end
                if not u6 then
                    u40 = nil
                end
            end)))
        end)
        u35 = v1
        return v1
    end,
    stop = function() -- Line: 75 -- upvalues: u35 (ref), u40 (ref)
        if u35 then
            u35:cancel()
        end
        u40 = nil
        u35 = nil
    end,
}