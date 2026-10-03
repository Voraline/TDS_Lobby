-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.TowerInformation.TowerInformation.story
-- Decompile time: 1.49 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local UI = ReplicatedStorage.Shared.UI
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Icons = require(ReplicatedStorage.Shared.Data.Icons)
local Parent = require(script.Parent)
local React = require(UI.React)
local ReactRoblox = require(UI.ReactRoblox)
local createElement = React.createElement
local useEffect = React.useEffect
local useBinding = React.useBinding

local function getMilitaryBaseTowerContent() -- Line: 28 -- upvalues: ServerStorage (val)
    local Hacker = ((ServerStorage:WaitForChild("Content")):WaitForChild("Tower")):WaitForChild("Hacker")
    return (require(Hacker:WaitForChild("Stats"))), (require(Hacker:WaitForChild("TowerInformation"))), {}
end

local function render(a1) -- Line: 38
    -- upvalues: useBinding (val), getMilitaryBaseTowerContent (val), useEffect (val), createElement (val), Parent (val)
    -- upvalues: Icons (val), Enum (val)
    local v1 = math.max(0, (math.floor(a1.controls.level)))
    local v2, u12 = useBinding(a1.controls.enabled)
    local v3, v4, v5 = getMilitaryBaseTowerContent()
    local Properties = v3.Properties
    local v6 = useEffect
    local v7 = {a1.controls.enabled}
    v6(function() -- Line: 44 -- upvalues: u12 (val), a1 (val)
        u12(a1.controls.enabled)
    end, v7)
    v7 = {}
    local v8 = v4[v1] or v4[4] or v4[0]
    v7.plotData = v8
    v7.upgradeOptions = v5
    v7.towerAsset = v3
    v7.towerIcon = Icons.Towers.Hacker.Default
    v7.towerName = Properties.DisplayName or "Hacker"
    v7.towerRole = if not Properties.Role then nil else Enum.TowerRole.ToString(Properties.Role)
    v7.towerStats = v3.Stats.Default.Defaults
    v7.towerInformationEnabled = v2
    v7.level = v1
    return createElement(Parent, v7)
end

return {
    react = React,
    reactRoblox = ReactRoblox,
    controls = {enabled = true, level = 4},
    story = function(a1) -- Line: 61 -- upvalues: createElement (val), render (val)
        return createElement(render, a1)
    end,
}