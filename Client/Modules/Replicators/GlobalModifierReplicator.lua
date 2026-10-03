-- Script path: ReplicatedStorage.Client.Modules.Replicators.GlobalModifierReplicator
-- Decompile time: 1.17 ms

local u0 = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local GlobalModifier = require(ReplicatedStorage.Shared.Modules.GlobalModifier)
local GlobalModifierTypes = require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local GlobalModifiers = Content("GlobalModifiers")
local u29 = {}

function u0.getOrMakeModifier(a1, a2) -- Line: 14
    -- upvalues: u29 (val), GlobalModifiers (val), GlobalModifierTypes (val), GlobalModifier (val), GameState (val)
    local v1 = u29[a1]
    local v2 = false
    if not v1 then
        v2 = true
        local v3 = GlobalModifiers:FindFirstChild(a1)
        local v4 = ("Global modifier %* not found"):format(a1)
        assert(v3 and v3:IsA("ModuleScript"), v4)
        local v5 = require(v3)
        assert((GlobalModifierTypes.check(v5)))
        v1 = GlobalModifier.new(v5, a2 or false)
        u29[a1] = v1
        GameState.GlobalModifiers[a1] = v1
    end
    return v1, v2
end

function u0.setModifierEnabled(a1, a2) -- Line: 39 -- upvalues: u0 (val) -- types: a1: string, a2: boolean?
    if a2 == nil then
        a2 = true
    end
    local v1 = u0.getOrMakeModifier(a1)
    v1:setEnabled(a2)
    return v1
end

local function onStateChanged() -- Line: 48 -- upvalues: GameState (val), u0 (val)
    for i, j in GameState.Replicator:Get("GlobalModifiersEnabled") or {} do
        u0.setModifierEnabled(i, j)
    end
end

onStateChanged()
;(GameState.Replicator:GetStateChangedSignal("GlobalModifiersEnabled")):Connect(onStateChanged)
return u0