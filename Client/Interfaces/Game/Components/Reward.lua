-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Reward
-- Decompile time: 18.74 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local Icons = require(ReplicatedStorage.Client.Interfaces.Icons)
local ItemController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ItemController)
local ItemPreview = require(ReplicatedStorage.Client.Interfaces.Components.ItemPreview)
local useOneShot = require(ReplicatedStorage.Client.Interfaces.Hooks.useOneShot)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local createElement = React.createElement
local useEffect = React.useEffect
local u47 = {Elo = 132096928338544}
u47.Coins = {Icons.CoinsTiny, Icons.CoinsSmall, Icons.CoinsChest, Icons.CoinsChestBig}
u47.Gems = {Icons.GemsTiny, Icons.GemsSmall, Icons.GemsChest, Icons.GemsChestBig}
u47.Experience = Icons.Experience
u47.Timescale = Icons.Timescale
u47.Spin = Icons.Spin
u47.Revive = Icons.Revive

local function mapRewardType(a1, a2) -- Line: 39 -- upvalues: u47 (val) -- types: a1: string, a2: number
    local v1 = u47[a1]
    if not v1 then
        return
    end
    if v1 and typeof(v1) == "table" then
        local v2 = v1[1]
        if typeof(a2) == "number" then
            if a2 >= 1000 then
                return v1[4]
            end
            if a2 >= 100 then
                return v1[3]
            end
            if a2 >= 10 then
                v2 = v1[2]
            end
        end
        return v2
    end
    return v1
end

return function(a1) -- Line: 64
    -- upvalues: ItemController (val), createElement (val), ItemPreview (val), HttpService (val), u47 (val)
    -- upvalues: useSpring (val), useOneShot (val), useEffect (val)
    local u342, u344, v1, v2, v3
    local u2 = a1.Index or 1
    local u5 = a1.Visible ~= false
    local Type = a1.Type
    local Value = a1.Value
    local v4 = nil
    if Type == "Tower" then
        Value = a1.Tower or "Scout"
        v1 = a1.Skin or "Default"
        v4 = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = (ItemController:skin(Value, v1)).info.Icon,
            ScaleType = Enum.ScaleType.Fit,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.9, 0.9),
        })
        if v1 ~= "Default" then
            Value = v1
        end
    elseif Type == "TowerExp" then
        v1 = a1.Tower or "Scout"
        v2 = ItemController:skin(v1, a1.Skin or "Default")
        Value = a1.Value
        v4 = createElement("Frame", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.9, 0.9),
        }, {
            towerNameLabel = createElement("TextLabel", {
                TextSize = 11,
                TextWrapped = true,
                BackgroundTransparency = 1,
                ZIndex = 2,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                Text = v1,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                AnchorPoint = Vector2.new(0.5, 0),
                Position = UDim2.fromScale(0.5, 0),
                Size = UDim2.new(1, 0, 0, 14),
            }, {
                uIStroke = createElement("UIStroke", {
                    Thickness = 0.2,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                    StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
                }),
            }),
            icon = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = v2.info.Icon,
                ScaleType = Enum.ScaleType.Fit,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.55),
                Size = UDim2.fromScale(0.8, 0.8),
            }),
        })
    elseif Type == "Consumable" then
        v4 = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = ("rbxassetid://%*"):format((ItemController:consumable(a1.Label)).info.Icon),
            ScaleType = Enum.ScaleType.Fit,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.9, 0.9),
        })
    elseif Type == "Tag" then
        Value = a1.Label
        v4 = createElement("ImageLabel", {
            Image = "rbxassetid://6053790285",
            BackgroundTransparency = 1,
            ScaleType = Enum.ScaleType.Fit,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.9, 0.9),
        })
    elseif Type == "Crate" then
        Value = a1.Label
        v4 = createElement(ItemPreview, {
            Flat = true,
            PauseAnimation = true,
            IgnoreAnimation = true,
            IgnoreShadow = true,
            HidePreviewText = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(3.5, 3.5),
            CameraOffset = CFrame.new(0, 3.6, 40),
            Preview = {Type = "Crates", Item = Value},
        })
    elseif Type == "Emote" then
        Value = a1.Label
        v4 = createElement(ItemPreview, {
            Flat = true,
            IgnoreShadow = true,
            HidePreviewText = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(3.5, 3.5),
            CameraOffset = CFrame.new(-3, 0, -15),
            Preview = {Type = "Emotes", Item = Value},
        })
    elseif Type or a1.Icon then
        local v5
        local success, result = pcall(function() -- Line: 200 -- upvalues: HttpService (upval), Value (ref)
            return HttpService:JSONDecode(Value)
        end)
        local Icon_2 = nil
        if success and typeof(result) == "table" then
            Value = result.Value
            Icon_2 = result.Icon
        end
        local Icon_3 = a1.Icon
        if not Icon_3 then
            v5 = Value
            local v6 = u47[Type]
            if not v6 then
                Icon_3 = nil
            elseif not v6 or typeof(v6) ~= "table" then
                Icon_3 = v6
            else
                local v7 = v6[1]
                if typeof(v5) == "number" then
                    if v5 >= 1000 then
                        v7 = v6[4]
                    elseif v5 >= 100 then
                        v7 = v6[3]
                    elseif v5 >= 10 then
                        v7 = v6[2]
                    end
                end
                Icon_3 = v7
            end
            if not Icon_3 then
                Icon_3 = 0
            end
        end
        v5 = if typeof(Icon_3) ~= "number" then Icon_3 else ("rbxassetid://%*"):format(Icon_3)
        v4 = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = Icon_2 or v5,
            ScaleType = Enum.ScaleType.Fit,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.9, 0.9),
        })
    end
    v2 = Value
    local u328 = typeof(v2) == "number"
    local v8, u335 = useSpring(0, 1, 10, true)
    v3, u342, _, u344 = useSpring(0, 0.6, 15, true)
    local v9, u355 = useOneShot(0, 1, TweenInfo.new(0.2, Enum.EasingStyle.Sine), nil, true)
    local v10 = {u5}
    useEffect(function() -- Line: 230
        -- upvalues: u5 (val), u335 (val), u342 (val), u2 (val), u344 (val), u355 (val), u328 (val), Value (ref)
        if not u5 then
            u335(0)
            u342(0)
            return
        end
        local u7 = true
        task.delay(0.5 + 0.5 * (u2 - 1), function() -- Line: 240
            -- upvalues: u7 (ref), u342 (upval), u344 (upval), u355 (upval), u328 (upval), u335 (upval), Value (upval)
            if not u7 then
                return
            end
            u342(1)
            u344(20)
            task.delay(0.1, function() -- Line: 248 -- upvalues: u7 (upval), u355 (upval)
                if not u7 then
                    return
                end
                u355()
            end)
            if u328 then
                u335(Value)
            end
        end)
        return function() -- Line: 261 -- upvalues: u7 (ref)
            u7 = false
        end
    end, v10)
    v10 = {BackgroundTransparency = 1}
    local Size = a1.Size or UDim2.fromOffset(112, 112)
    v10.Size = Size
    v10.LayoutOrder = a1.LayoutOrder
    local v11 = {
        particle = createElement("ImageLabel", {
            Image = "rbxassetid://1057939773",
            BackgroundTransparency = 1,
            ImageColor3 = Color3.new(1, 1, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            ImageTransparency = v9,
            Size = v9:map(function(a1) -- Line: 279
                return UDim2.fromScale(a1 * 2, a1 * 2)
            end),
        }),
    }
    local v12 = {
        BackgroundTransparency = 0.9,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local v13 = {uiScale = createElement("UIScale", {Scale = v3})}
    v13.uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)})
    local v14 = createElement
    local v15 = {Color = Color3.fromRGB(62, 62, 62)}
    v13.uIStroke = v14("UIStroke", v15)
    if not Value then
        v14 = nil
    else
        v15 = {
            TextWrapped = true,
            TextSize = 18,
            BackgroundTransparency = 1,
            ZIndex = 2,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            TextYAlignment = Enum.TextYAlignment.Bottom,
        }
        local v16 = if not u328 then Value else v8:map(function(a1) -- Line: 312
            return (math.round(a1))
        end)
        v15.Text = v16
        v15.TextColor3 = Color3.fromRGB(255, 255, 255)
        v15.AnchorPoint = Vector2.new(0.5, 1)
        v15.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v15.Position = UDim2.new(0.5, 0, 1, -4)
        v15.Size = UDim2.new(0, 110, 1, -4)
        v14 = createElement("TextLabel", v15, {uIStroke1 = createElement("UIStroke", {Thickness = 4})}) or nil
    end
    v13.textLabel = v14
    v13.icon = v4
    v11.content = createElement("Frame", v12, v13)
    return (createElement("Frame", v10, v11, a1.children))
end