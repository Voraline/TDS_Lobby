-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.SuggestedTower.story
-- Decompile time: 0.96 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local SuggestedTower = require(script.Parent.SuggestedTower)
local UILabs = require(ReplicatedStorage.Packages.UILabs)
local createElement = React.createElement
local v1 = {}
for i, j in Content("Tower"):GetChildren() do
    table.insert(v1, j.Name)
end
local v2 = {actionText = "Purchase", disabled = false, tower = UILabs.Choose(v1)}

local function render(a1) -- Line: 22 -- upvalues: createElement (val), SuggestedTower (val)
    local v1 = {}
    local v2 = if not a1.controls.disabled then Color3.fromRGB(80, 255, 86) else Color3.fromRGB(108, 108, 108)
    v1.actionColor = v2
    v1.actionDisabled = a1.controls.disabled
    v1.actionText = a1.controls.actionText
    v1.tower = a1.controls.tower

    function v1.onView(a1) -- Line: 30
        print((("View %*"):format(a1)))
    end

    return createElement(SuggestedTower, v1)
end

return {
    react = React,
    reactRoblox = ReactRoblox,
    controls = v2,
    story = function(a1) -- Line: 40 -- upvalues: createElement (val), render (val)
        return createElement(render, a1)
    end,
}