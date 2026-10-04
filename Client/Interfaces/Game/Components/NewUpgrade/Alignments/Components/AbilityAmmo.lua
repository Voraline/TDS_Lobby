-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.Components.AbilityAmmo
-- Decompile time: 2.65 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local Interfaces = ReplicatedStorage.Client.Interfaces
local BaseComponents = script.Parent.Parent.BaseComponents
local Components = Interfaces.Game.Components
local Container = require(BaseComponents.Container)
local Ability = require(Components.Ability)
local createElement = React.createElement
return function(a1) -- Line: 37 -- upvalues: createElement (val), Container (val), Ability (val) -- types: a1: table
    return createElement(Container, {
        BackgroundTransparency = 1,
        CornerRadius = 8,
        Scale = 1,
        Visible = true,
        Size = UDim2.fromOffset(64, 92),
        BackgroundColor3 = Color3.fromRGB(39, 39, 39),
        LayoutOrder = a1.LayoutOrder or 1,
    }, {
        abilityButton = createElement(Ability, {
            Size = UDim2.fromOffset(66, 66),
            Position = a1.bounceSpring:map(function(a1) -- Line: 49
                return (UDim2.new(0.5, 0, 0, 32)) + UDim2.fromScale(0, a1)
            end),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Name = a1.Name,
            DisplayName = a1.DisplayName,
            Description = a1.Description,
            TowerName = a1.TowerName,
            TowerDisplayName = a1.TowerDisplayName,
            Model = a1.Model,
            Icon = a1.Icon,
            Price = a1.Price,
            Callback = a1.OnActivated,
            TransparencyModifier = a1.Transparency,
            percentageProgress = a1.ProgressPercent,
            bounceSpring = a1.bounceSpring,
            durationBounceSpring = a1.durationBounceSpring,
            Ammo = a1.Ammo,
            MaxAmmo = a1.MaxAmmo,
            TimeLeft = a1.TimeLeft,
        }),
    })
end