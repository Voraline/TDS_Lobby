-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Ability.story
-- Decompile time: 0.72 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Ability = require(script.Parent.Ability)
local AbilitiesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AbilitiesStore)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
return function(a1) -- Line: 11 -- upvalues: createElement (val), Ability (val), AbilitiesStore (val), ReactRoblox (val)
    local Model = Instance.new("Model")
    local v1 = createElement(Ability, {
        Icon = 4594880289,
        Binding = 1,
        Name = "Ability",
        Model = Model,
        Callback = function() -- Line: 21 -- upvalues: AbilitiesStore (upval), Model (val)
            AbilitiesStore.updateAbility(Model, "Ability", 5, 5)
            return true
        end,
    })
    local u12 = ReactRoblox.createRoot(a1)
    u12:render(v1)
    return function() -- Line: 31 -- upvalues: Model (val), u12 (val)
        Model:Destroy()
        u12:unmount()
    end
end