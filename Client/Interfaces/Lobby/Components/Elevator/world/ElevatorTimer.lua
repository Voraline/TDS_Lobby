-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Elevator.world.ElevatorTimer
-- Decompile time: 6.76 ms

game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local React = require(ReplicatedStorage.Shared.UI.React)
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Components = ReplicatedStorage.Client.Interfaces.Lobby.Components
require(ReplicatedStorage.Shared.Modules.Utils.table)
require(Hooks.usePropertyValue)
local useBinding = React.useBinding
local useEffect = React.useEffect
local createElement = React.createElement
local joinBindings = React.joinBindings
return React.memo(function(a1) -- Line: 38
    -- upvalues: useBinding (val), useEffect (val), RunService (val), createElement (val)
    local timeLeft = a1.timeLeft
    local u3 = a1.intermission or 20
    local u6, u7 = useBinding(timeLeft or 0)
    local capacity = a1.capacity
    local players = a1.players
    local barColor = a1.barColor or Color3.fromRGB(85, 255, 127)
    local v1 = {timeLeft}
    useEffect(function() -- Line: 48 -- upvalues: timeLeft (val), u7 (val), RunService (upval), u6 (val)
        if not timeLeft then
            u7(0)
            return
        end
        u7(timeLeft)
        local u16 = nil
        if timeLeft > 0 then
            u16 = RunService.Heartbeat:Connect(function(a1) -- Line: 59 -- upvalues: u6 (upval), u16 (ref), u7 (upval)
                local v1 = math.max(0, (u6:getValue()) - a1)
                if v1 <= 0 and u16 then
                    u16:Disconnect()
                end
                u7(v1)
            end)
        end
        return function() -- Line: 69 -- upvalues: u16 (ref)
            if u16 then
                u16:Disconnect()
            end
        end
    end, v1)
    v1 = {BackgroundTransparency = 0.2, ZIndex = 4, Visible = a1.Visible}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 1)
    v1.AnchorPoint = AnchorPoint
    local Position = a1.Position or UDim2.new(0.5, 0, 1, -8)
    v1.Position = Position
    local Size = a1.Size or UDim2.new(1, -16, 0, 24)
    v1.Size = Size
    v1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v1.BorderColor3 = Color3.fromRGB(27, 42, 53)
    return createElement("Frame", v1, {
        uICorner = createElement("UICorner"),
        bar = createElement("ImageLabel", {
            BorderSizePixel = 0,
            Image = "rbxassetid://76856872302406",
            ZIndex = 2,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            ImageColor3 = barColor,
            Size = UDim2.fromScale(1, 1),
        }, {
            uICorner1 = createElement("UICorner"),
            uIGradient = createElement("UIGradient", {
                Offset = u6:map(function(a1) -- Line: 100 -- upvalues: players (val), u3 (val)
                    if a1 ~= 0 and players ~= 0 then
                        return Vector2.new((math.clamp(a1 / u3, 0, 1)) - 0.5, 0)
                    end
                    return Vector2.new(0.5, 0)
                end),
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0),
                    NumberSequenceKeypoint.new(0.5, 0),
                    NumberSequenceKeypoint.new(0.501, 1),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
            }),
        }),
        uIStroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(39, 39, 39)}),
        dropShadow = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://9239716855",
            ImageTransparency = 0.2,
            ZIndex = -1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            Position = UDim2.fromScale(0.5, 0.5),
            ScaleType = Enum.ScaleType.Slice,
            Size = UDim2.new(1, 16, 1, 16),
            SliceCenter = Rect.new(14, 14, 64, 24),
        }),
        icon = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://5577896365",
            ImageTransparency = 0.5,
            ZIndex = 4,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            ImageColor3 = Color3.fromRGB(141, 141, 141),
            Position = UDim2.new(0, 16, 0.5, 0),
            Size = UDim2.fromOffset(20, 20),
        }),
        players = not a1.dontShowPlayers or createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextSize = 20,
            TextStrokeTransparency = 0.5,
            TextWrapped = true,
            ZIndex = 4,
            AnchorPoint = Vector2.new(1, 0.5),
            BackgroundColor3 = Color3.fromRGB(139, 139, 139),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = UDim2.new(1, -15, 0.5, 0),
            Size = UDim2.fromScale(0.2, 0.8),
            Text = ("%*/%*"):format(players, capacity),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Right,
        }),
        state = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextScaled = true,
            TextSize = 20,
            TextStrokeTransparency = 0.5,
            TextWrapped = true,
            ZIndex = 3,
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Color3.fromRGB(139, 139, 139),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
            Position = UDim2.new(0, 32, 0.5, 0),
            Size = UDim2.new(1, -32, 0.8, 0),
            Text = u6:map(function(a1) -- Line: 185 -- upvalues: players (val)
                local v1 = math.ceil(a1)
                if players ~= 0 and v1 ~= -1 then
                    if v1 == 0 then
                        return "Teleporting..."
                    end
                    return (("%* Seconds Left"):format(v1))
                end
                return "Waiting for Players..."
            end),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Left,
        }, {
            uITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 18}),
            uIStroke1 = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(53, 53, 53)}),
        }),
    })
end)