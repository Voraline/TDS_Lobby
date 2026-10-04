-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Views.Shop.story
-- Decompile time: 1.04 ms

local Fusion = require(game.ReplicatedStorage.Shared.UI.Fusion)
local Children = Fusion.Children
local New = Fusion.New
local Shop = require(script.Parent.Shop)
ViewController = require(script.Parent.Parent.Parent.Controllers.ViewController)
return function(a1) -- Line: 9 -- upvalues: New (val), Children (val), Shop (val)
    ViewController:init()
    ViewController:setView("Shop")
    local Frame = New("Frame")
    local v1 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}
    v1[Children] = {(Shop({}))}
    local u24 = Frame(v1)
    u24.Parent = a1
    return function() -- Line: 23 -- upvalues: u24 (val)
        u24:destroy()
    end
end