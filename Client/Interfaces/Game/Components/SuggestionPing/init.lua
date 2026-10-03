-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.SuggestionPing
-- Decompile time: 6.00 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CommunicationConfig = require(ReplicatedStorage.Shared.Data.CommunicationConfig)
local React = require(ReplicatedStorage.Packages.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local createBinding = React.createBinding
local createElement = React.createElement
local memo = React.memo
local useEffect = React.useEffect
local useRef = React.useRef
local useSpring = ReactFlow.useSpring
local Ping = CommunicationConfig.Ping
local FallbackImage = Ping.FallbackImage
local FallbackRadius = Ping.FallbackRadius
local FallbackColor = Ping.FallbackColor
local Height = Ping.Height

local function getImage(a1) -- Line: 30 -- upvalues: FallbackImage (val)
    local v1 = a1 or FallbackImage
    if typeof(v1) == "number" then
        return (("rbxassetid://%*"):format(v1))
    end
    if string.find(v1, "^rbx") then
        return v1
    end
    return (("rbxassetid://%*"):format(v1))
end

return memo(function(a1) -- Line: 43
    -- upvalues: useRef (val), FallbackColor (val), FallbackRadius (val), createBinding (val), useSpring (val)
    -- upvalues: useEffect (val), createElement (val), Height (val), FallbackImage (val)
    local v1 = useRef(nil)
    local v2 = useRef(nil)
    local color = a1.color or FallbackColor
    local radius = a1.radius or FallbackRadius
    local u16 = math.max(radius, 0) * 2
    local u25, u26 = createBinding(a1.endTimestamp - workspace:GetServerTimeNow())
    local v3, u30 = useSpring({start = 0, target = 0, speed = 20, damper = 0.35})
    local v4, u34 = useSpring({start = 3, target = 0, speed = 20, damper = 0.35})
    local v5, u38 = useSpring({start = 0.01, target = 0, speed = 20, damper = 0.35})
    useEffect(function() -- Line: 73 -- upvalues: u30 (val), u34 (val), u38 (val)
        u30({target = 1})
        u34({force = -100})
        u38({target = 1})
    end, {})
    local v6 = useEffect
    local v7 = {a1.endTimestamp}
    v6(function() -- Line: 85 -- upvalues: u25 (val), a1 (val), u26 (val)
        local u2 = task.spawn(function() -- Line: 86 -- upvalues: u25 (upval), a1 (upval), u26 (upval)
            local v1
            while true do
                if not (0 < (u25:getValue())) then
                    break
                end
                task.wait(0.1)
                v1 = math.max(a1.endTimestamp - workspace:GetServerTimeNow(), 0)
                v1 = if not (v1 > 1) then math.round(v1 * 10) / 10 else math.round(v1)
                u26(v1)
            end
        end)
        return function() -- Line: 102 -- upvalues: u2 (val)
            task.cancel(u2)
        end
    end, v7)
    v7 = {
        Anchored = true,
        AudioCanCollide = false,
        CanCollide = false,
        CanQuery = false,
        CanTouch = false,
        CastShadow = false,
        Transparency = 1,
        Size = v5:map(function(a1) -- Line: 108 -- upvalues: u16 (val) -- types: a1: number
            return (Vector3.new(u16 * a1, 0.1, u16 * a1))
        end),
        Position = a1.position,
    }
    local v8 = {
        SurfaceGui = createElement("SurfaceGui", {Brightness = 5, Face = Enum.NormalId.Top}, {
            Image = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = "rbxassetid://92386711394241",
                ImageTransparency = 0.5,
                AnchorPoint = Vector2.new(0.5, 0.5),
                ImageColor3 = color,
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
            }),
        }),
    }
    local v9 = {}
    local v10 = {
        Position = v4:map(function(a1) -- Line: 139 -- upvalues: Height (upval) -- types: a1: number
            return (Vector3.new(0, Height + a1, 0))
        end),
        ref = v2,
    }
    local v11 = {}
    local v12 = {
        Active = true,
        AlwaysOnTop = true,
        Size = v5:map(function(a1) -- Line: 147 -- types: a1: number
            return UDim2.fromScale(a1 * 6, a1 * 6)
        end),
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    }
    local v13 = {
        SubHeader = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            ZIndex = 2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0.5, 0.525),
            Size = UDim2.fromScale(0.7, 0.1),
            Text = u25:map(function(a1_2) -- Line: 162 -- upvalues: a1 (val)
                return a1.requesterName .. " - " .. (tostring(a1_2)) .. "s"
            end),
            TextColor3 = color,
        }, {
            UIStroke = createElement("UIStroke", {
                Thickness = 0.1,
                Color = Color3.fromRGB(43, 43, 43),
                StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
            }),
        }),
        Header = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            ZIndex = 2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0.5, 0.375),
            Size = UDim2.fromScale(0.8, 0.2),
            Text = a1.header,
            TextColor3 = Color3.new(1, 1, 1),
        }, {
            UIStroke = createElement("UIStroke", {
                Thickness = 0.1,
                Color = Color3.fromRGB(43, 43, 43),
                StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
            }),
        }),
    }
    local v14 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 0.5)}
    local v15 = a1.imageId or FallbackImage
    v14.Image = if typeof(v15) ~= "number" then if not string.find(v15, "^rbx") then ("rbxassetid://%*"):format(v15) else v15 else ("rbxassetid://%*"):format(v15)
    v14.Position = UDim2.fromScale(0.5, 0.25)
    v14.Size = UDim2.fromScale(0.5, 0.5)
    v13.ImageLabel = createElement("ImageLabel", v14, {UIAspectRatioConstraint = createElement("UIAspectRatioConstraint")})
    v11.BillboardGui = createElement("BillboardGui", v12, v13)
    v9.TopNode = createElement("Attachment", v10, v11)
    v9.Beam = createElement("Beam", {
        FaceCamera = true,
        LightEmission = 1,
        Segments = 1,
        Texture = "rbxassetid://82101317617559",
        Attachment0 = v1,
        Attachment1 = v2,
        Color = ColorSequence.new(color),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.25),
            NumberSequenceKeypoint.new(0.7, 0.25),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
        Width0 = v3:map(function(a1) -- Line: 223 -- types: a1: number
            return a1 * 0.05
        end),
        Width1 = v3:map(function(a1) -- Line: 226 -- types: a1: number
            return a1 * 2
        end),
    })
    v8.RootAtt = createElement("Attachment", {ref = v1}, v9)
    return createElement("Part", v7, v8)
end)