-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Prompt.story
-- Decompile time: 1.16 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Client.Interfaces.Icons)
local Prompt = require(script.Parent.Prompt)
local React = require(ReplicatedStorage.Shared.UI.React)
return {
    react = React,
    reactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox),
    controls = {},
    story = function(a1) -- Line: 14 -- upvalues: React (val), Prompt (val)
        return React.createElement(Prompt, {
            icon = "rbxthumb://type=AvatarHeadShot&id=49601674&w=420&h=420",
            title = "Catch a Mew?",
            description = "Would you like to catch <b><font color=\"rgb(255,236,0)\">Mew</font></b> for 500 PokéCoins?",
            items = {{icon = 6794340240, value = "500"}},
            actions = {
                {
                    text = "Yes",
                    icon = 12270724272,
                    holdTime = 1,
                    layoutOrder = 1,
                    color = Color3.fromRGB(0, 170, 0),
                    onClick = function() -- Line: 33
                        print("Caught Mew!")
                    end,
                },
                {text = "No", layoutOrder = 2, color = Color3.fromRGB(170, 0, 0)},
            },
        })
    end,
}