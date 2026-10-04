-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Stories.towerskin.story
-- Decompile time: 2.78 ms

local Children = (require(game.ReplicatedStorage.Shared.UI.Fusion)).Children
Components = script.Parent.Parent.Components
SharedComponents = script.Parent.Parent.Parent.Components
TowerSkin = require(Components.TowerSkin)
Button = require(SharedComponents.Button)
return function(a1) -- Line: 10 -- upvalues: Children (val)
    local v1 = TowerSkin
    local v2 = {
        Size = UDim2.fromScale(0.25, 0.8),
        Position = UDim2.fromScale(0, 0),
        AnchorPoint = Vector2.new(0, 0),
        Tower = "SCOUT",
        Skin = "Black Ops",
        Rarity = "Common",
    }
    v2[Children] = {
        Button({
            Size = UDim2.fromScale(0.8, 0.12),
            Position = UDim2.fromScale(0.5, 1.02),
            AnchorPoint = Vector2.new(0.5, 0.5),
        }),
    }
    local u35 = v1(v2)
    u35.Parent = a1
    return function() -- Line: 30 -- upvalues: u35 (val)
        u35:destroy()
    end
end