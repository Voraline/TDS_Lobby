-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Components.Ad
-- Decompile time: 3.31 ms

local Shared = game:GetService("ReplicatedStorage"):WaitForChild("Shared")
local Elements = require(script.Parent.Elements)
local Fusion = require(Shared.UI.Fusion)
local Value = Fusion.Value
local New = Fusion.New
local Hydrate = Fusion.Hydrate
local OnEvent = Fusion.OnEvent
local Spring = Fusion.Spring
local Computed = Fusion.Computed
local Children = Fusion.Children
local Ads = Elements.Ads
return function(a1) -- Line: 16
    -- upvalues: Value (val), Ads (val), New (val), Children (val), Hydrate (val), OnEvent (val), Spring (val)
    -- upvalues: Computed (val)
    local v1, v2
    local u3 = Value(false)
    local u6 = Value(false)
    local v3 = Ads[a1.AdType or "Ad1"]:Clone()
    local Description = v3:FindFirstChild("Description")
    local Frame = v3:FindFirstChild("Frame")
    local Title = v3.Title
    local ImageLabel = Title:FindFirstChild("ImageLabel")
    local Size = a1.IsLarge and UDim2.new(0.5, -8, 0, 180) or v3.Size
    local Frame_2 = New("Frame")
    local v4 = {
        BackgroundTransparency = 1,
        Background = a1.Background,
        Position = v3.Position,
        Size = Size,
    }
    local v5 = {}
    local v6 = Hydrate(v3)
    local v7 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }
    local MouseEnter = OnEvent("MouseEnter")

    v7[MouseEnter] = function() -- Line: 42 -- upvalues: u6 (val)
        u6:set(true)
    end

    local MouseLeave = OnEvent("MouseLeave")

    v7[MouseLeave] = function() -- Line: 45 -- upvalues: u6 (val)
        u6:set(false)
    end

    local v8 = {}
    local v9 = New("UIScale")({
        Scale = Spring(Computed(function() -- Line: 52 -- upvalues: u3 (val), u6 (val)
            if u3:get() then
                return 0.95
            end
            if u6:get() then
                return 1.1
            end
            return 1
        end), 50, 0.8),
    })
    local v10 = Description and Hydrate(Description)({Text = a1.Description}) or nil
    if not Frame then
        v1 = nil
    else
        v1 = Hydrate(Frame)
        v2 = {}
        v2[Children] = a1[Children]
        v1 = v1(v2) or nil
    end
    v2 = Hydrate(Title)
    local v11 = {}
    v11[Children] = {
        Hydrate(Title.TextLabel)({Text = a1.Title}),
        ImageLabel and Hydrate(Title.ImageLabel)({Image = a1.Icon}) or nil,
    }
    v2 = v2(v11)
    v11 = Hydrate(v3.Glow)({Visible = u6})
    local v12 = Hydrate(v3.DropShadow)({
        Visible = Computed(function() -- Line: 91 -- upvalues: u6 (val)
            return not u6:get()
        end),
    })
    local v13 = Hydrate(v3.ImageLabel)({Image = a1.Background})
    local v14 = Hydrate(v3.Detector)
    local v15 = {}
    local Activated = OnEvent("Activated")
    v15[Activated] = a1.Clicked
    local MouseButton1Down = OnEvent("MouseButton1Down")

    v15[MouseButton1Down] = function() -- Line: 102 -- upvalues: u3 (val)
        u3:set(true)
    end

    local MouseButton1Up = OnEvent("MouseButton1Up")

    v15[MouseButton1Up] = function() -- Line: 105 -- upvalues: u3 (val), a1 (val)
        u3:set(false)
        if a1.Clicked then
            a1.Clicked()
        end
    end

    v8[1] = v9
    v8[2] = v10
    v8[3] = v1
    v8[4] = v2
    v8[5] = v11
    v8[6] = v12
    v8[7] = v13
    v8[8] = v14(v15)
    v7[Children] = v8
    v5[1] = v6(v7)
    v4[Children] = v5
    return Frame_2(v4)
end