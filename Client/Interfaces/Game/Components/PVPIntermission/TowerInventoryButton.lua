-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PVPIntermission.TowerInventoryButton
-- Decompile time: 9.57 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local React = require(ReplicatedStorage.Shared.UI.React)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local createElement = React.createElement
local Event = React.Event
return function(a1) -- Line: 19
    -- upvalues: React (val), Asset (val), useSpring (val), useSound (val), createElement (val), Event (val)
    local useMemo = React.useMemo
    local v1 = {a1.Name}
    local v2 = useMemo(function() -- Line: 20 -- upvalues: Asset (upval), a1 (val)
        local v1 = Asset("Troops", a1.Name)
        local SkinData = v1.Properties.SkinData or {}
        local Default = SkinData.Default
        if Default then
            return Default.Icon
        end
        return v1.Preview.Icon
    end, v1)
    local v3, u17 = useSpring(if not a1.Locked then 0 else 1, 1, 40, true)
    local v4, u29 = useSpring(if not a1.Equipped then 0 else 1, 1, 40, true)
    local v5, u36 = useSpring(0, 1, 40, true)
    local Equip = useSound("Equip")
    local Unequip = useSound("Unequip")
    local HoverHotbar = useSound("HoverHotbar")
    local useEffect = React.useEffect
    local v6 = {a1.Locked, a1.Equipped}
    useEffect(function() -- Line: 37 -- upvalues: u17 (val), a1 (val), u29 (val)
        u17(if not a1.Locked then 0 else 1)
        u29(if not a1.Equipped then 0 else 1)
    end, v6)
    local v7 = createElement
    v6 = {
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 3,
        Selectable = false,
        Size = UDim2.fromOffset(100, 100),
    }

    v6[Event.MouseEnter] = function() -- Line: 50 -- upvalues: a1 (val), HoverHotbar (val), u36 (val)
        if a1.Locked then
            return
        end
        HoverHotbar()
        u36(1)
    end

    v6[Event.MouseLeave] = function() -- Line: 58 -- upvalues: u36 (val)
        u36(0)
    end

    v6[Event.MouseButton1Click] = function() -- Line: 61 -- upvalues: a1 (val), Unequip (val), Equip (val)
        if a1.Locked then
            return
        end
        if not a1.Equipped then
            Equip()
        else
            Unequip()
        end
        a1.OnClick()
    end

    return v7("ImageButton", v6, {
        interior = createElement("Frame", {
            BackgroundTransparency = 1,
            Size = v5:map(function(a1) -- Line: 77
                return (UDim2.fromScale(1, 1)):Lerp(UDim2.fromScale(1.1, 1.1), a1)
            end),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
        }, {
            uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
            icon = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = v2,
                ImageColor3 = v3:map(function(a1) -- Line: 89
                    return (Color3.fromRGB(255, 255, 255)):Lerp(Color3.fromRGB(58, 58, 58), a1)
                end),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromOffset(136, 136),
            }),
            background = createElement("ImageLabel", {
                Image = "http://www.roblox.com/asset/?id=8418173081",
                BackgroundTransparency = 1,
                ZIndex = 0,
                ImageColor3 = Color3.fromRGB(67, 67, 67),
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(10, 10, 90, 90),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.new(1, -10, 1, -10),
            }),
            states = createElement("Frame", {
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(1, 0),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.fromScale(1, 0),
                Size = UDim2.fromOffset(20, 20),
            }, {
                equipped = createElement("ImageLabel", {
                    Image = "http://www.roblox.com/asset/?id=8418292821",
                    BackgroundTransparency = 1,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    Size = v4:map(function(a1) -- Line: 123
                        return (UDim2.fromScale(0.5, 0.5)):Lerp(UDim2.fromScale(1, 1), a1)
                    end),
                    ImageTransparency = v4:map(function(a1) -- Line: 126
                        return 1 - a1
                    end),
                }),
                locked = createElement("ImageLabel", {
                    Image = "http://www.roblox.com/asset/?id=8418293221",
                    BackgroundTransparency = 1,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    ImageTransparency = v3:map(function(a1) -- Line: 135
                        return 1 - a1
                    end),
                    Size = UDim2.fromScale(1, 1),
                }),
            }),
            textLabel = createElement("TextLabel", {
                TextSize = 22,
                BackgroundTransparency = 1,
                ZIndex = 2,
                FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                Text = a1.Name,
                TextColor3 = v3:map(function(a1) -- Line: 149
                    return (Color3.fromRGB(255, 255, 255)):Lerp(Color3.fromRGB(154, 127, 127), a1)
                end),
                AnchorPoint = Vector2.new(0, 1),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.fromScale(0, 1),
                Size = UDim2.new(1, 0, 0, 20),
            }, {uIStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.5})}),
        }),
    })
end