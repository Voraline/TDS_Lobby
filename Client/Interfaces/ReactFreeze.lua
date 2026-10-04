-- Script path: ReplicatedStorage.Client.Interfaces.ReactFreeze
-- Decompile time: 1.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local u11 = {}

function u11.andThen() end

local function Suspender(a1) -- Line: 12 -- upvalues: u11 (val), createElement (val), React (val) -- types: a1: table
    if not a1.freeze then
        return createElement(React.Fragment, nil, a1.children)
    end
    error(u11)
end

return table.freeze({
    Freeze = function(a1) -- Line: 29 -- upvalues: createElement (val), React (val), Suspender (val) -- types: a1: table
        local Suspense = React.Suspense
        local v1 = {}
        local placeholder = a1.placeholder or createElement(React.Fragment)
        v1.fallback = placeholder
        return createElement(Suspense, v1, {Suspender = createElement(Suspender, {freeze = a1.freeze}, a1.children)})
    end,
})