-- Script path: ReplicatedStorage.Client.Interfaces.NPCViews.Views.Void Reaver
-- Decompile time: 2.80 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ChromaticAberration = require(ReplicatedStorage.Client.Interfaces.NPCViews.Components.ChromaticAberration)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local NPCReplicator = require(ReplicatedStorage.Client.Modules.Replicators.NPCReplicator)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local TVStatic = require(ReplicatedStorage.Client.Interfaces.NPCViews.Components.TVStatic)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local useNPCReplicators = require(ReplicatedStorage.Client.Interfaces.NPCViews.Hooks.useNPCReplicators)
local createElement = React.createElement
local useEffect = React.useEffect

local function render() -- Line: 16
    -- upvalues: useNPCReplicators (val), React (val), ReactFlow (val), useEffect (val), Maid (val), NPCReplicator (val)
    -- upvalues: TimescaleUtilities (val), createElement (val), TVStatic (val), ChromaticAberration (val)
    local u2 = useNPCReplicators("Void Reaver")
    local u6, u7 = React.useState(false)
    local v1, u12 = React.useState("")
    local v2, u17 = React.useState({})
    local u21 = React.useRef(nil)
    local u25 = React.useRef({})
    local v3, u30 = React.useState(false)
    local v4, u38 = ReactFlow.useTween({start = 0, target = 0, info = TweenInfo.new(1)})
    local v5 = {u2}
    useEffect(function() -- Line: 32
        -- upvalues: Maid (upval), u2 (val), u7 (val), u12 (val), u30 (val), u25 (val), NPCReplicator (upval), u21 (val)
        -- upvalues: u17 (val)
        local u2_2 = Maid.new()
        u2_2:Mark((task.spawn(function() -- Line: 35
            -- upvalues: u2 (upval), u2_2 (val), u7 (upval), u12 (upval), u30 (upval), u25 (upval)
            -- upvalues: NPCReplicator (upval), u21 (upval), u17 (upval)
            local v1
            local v2 = nil
            local v3 = nil
            for i, j in u2, v2, v3 do
                u2_2:Mark(((j:GetStateChangedSignal("ChargeEffect")):Connect(function(a1) -- Line: 37 -- upvalues: u7 (upval), u12 (upval), u30 (upval), u25 (upval)
                    u7(a1.enabled)
                    u12(a1.animationLookFor)
                    if not a1.tvStatic then
                        u30(false)
                    else
                        u30(true)
                    end
                    u25.current = a1.info
                end)))
                local u30_2 = nil
                v1 = 0
                while not u30_2 do
                    u30_2 = NPCReplicator.GetNPCFromFolder(j.Folder)
                    task.wait(1)
                    v1 = v1 + 1
                    if v1 >= 10 then
                        warn("Failed to find NPC for Void Reaver replicator after 10 seconds.")
                        return
                    end
                end
                if u30_2 then
                    u21.current = u30_2
                    u17(function(a1) -- Line: 65 -- upvalues: u30_2 (ref)
                        local v1 = table.clone(a1)
                        v1[u30_2.Model] = u30_2.Model
                        return v1
                    end)
                end
            end
        end)))
        return function() -- Line: 73 -- upvalues: u2_2 (val)
            u2_2:Sweep()
        end
    end, v5)
    v5 = {u6}
    React.useEffect(function() -- Line: 78 -- upvalues: Maid (upval), u6 (val), u25 (val), u38 (val), TimescaleUtilities (upval)
        local u2 = Maid.new()
        u2:Mark((task.spawn(function() -- Line: 81 -- upvalues: u6 (upval), u25 (upval), u38 (upval), TimescaleUtilities (upval)
            if not u6 or not u25.current then
                return
            end
            u38({start = 0, target = 1, info = u25.current.infoIn})
            TimescaleUtilities.Wait(u25.current.waitTime)
            if not u25.current then
                return
            end
            u38({target = 0, info = u25.current.infoOut})
        end)))
        return function() -- Line: 107 -- upvalues: u2 (val)
            u2:Sweep()
        end
    end, v5)
    local v6 = u6
    if v6 then
        v5 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}
        local v7 = {}
        local createElement_2 = React.createElement
        local v8 = {enabled = v3}
        v8.duration = u25.current and u25.current.waitTime or 1
        v7.tvStatic = createElement_2(TVStatic, v8)
        local createElement_3 = React.createElement
        v8 = {
            amplitude = 6,
            frequency = 2,
            mult = 0.02,
            objects = v2,
            enabled = u6,
        }
        v8.windUpTime = u25.current and u25.current.waitTime or 1
        v8.percent = v4
        v8.animationPlaying = v1
        v7.chromatic = createElement_3(ChromaticAberration, v8)
        v6 = createElement("Frame", v5, v7)
    end
    return v6
end

return function(a1) -- Line: 135 -- upvalues: createElement (val), render (val) -- types: a1: table
    a1.screenGUI.IgnoreGuiInset = true
    return createElement(render, {})
end