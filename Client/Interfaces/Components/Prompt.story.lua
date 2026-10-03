-- Script path: ReplicatedStorage.Client.Interfaces.Components.Prompt.story
-- Decompile time: 0.73 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Button = require(script.Parent.Button)
local Prompt = require(script.Parent.Prompt)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
return function(a1) -- Line: 10 -- upvalues: createElement (val), Prompt (val), Button (val), ReactRoblox (val)
    local v1 = createElement(Prompt, {
        Title = "Match Type",
        Description = "Choose the number of players you want to play with",
        Icon = 10777737541,
    }, {
        action1 = createElement(Button, {
            Text = "1v1",
            Clicked = function() -- Line: 18
                print("1v1")
            end,
        }),
        action2 = createElement(Button, {
            Text = "2v2",
            Clicked = function() -- Line: 25
                print("2v2")
            end,
        }),
        action3 = createElement(Button, {
            Text = "4v4",
            Clicked = function() -- Line: 32
                print("4v4")
            end,
        }),
    })
    local u24 = ReactRoblox.createRoot(a1)
    u24:render(v1)
    return function() -- Line: 41 -- upvalues: u24 (val)
        u24:unmount()
    end
end