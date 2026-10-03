-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.AreaIndicatorFull.story
-- Decompile time: 3.04 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
local createPortal = ReactRoblox.createPortal
local useRef = React.useRef
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local useTween = require(ReplicatedStorage.Client.Interfaces.Hooks.useTween)
local CurrentCamera = workspace.CurrentCamera
local u32 = {radius = 10, lifeTime = 1.85, position = Vector3.new(0, 0, 0), fadeInTime = 0.5}
u32.tweenInfo = TweenInfo.new(1.75, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
u32.color3 = Color3.new(1, 0, 0.4)

local function render(a1) -- Line: 21
    -- upvalues: useTween (val), u32 (val), useRef (val), React (val), createElement (val), createPortal (val)
    local v1, v2 = useTween(0, TweenInfo.new(u32.fadeInTime or 0), true, true, false)
    v2(1)
    local v3, v4 = useTween(0, u32.tweenInfo, true, true, false)
    v4(1)
    local v5, u37 = useTween(0, TweenInfo.new(0.25), true, true, false)
    local u46 = Vector3.new(u32.radius * 2, 0.001, u32.radius * 2)
    local v6 = useRef()
    React.useEffect(function() -- Line: 34 -- upvalues: u32 (upval), u37 (val)
        if not u32.lifeTime then
            return
        end
        local u4 = task.spawn(function() -- Line: 38 -- upvalues: u32 (upval), u37 (upval)
            task.delay(u32.lifeTime, function() -- Line: 39 -- upvalues: u37 (upval)
                u37(1)
            end)
        end)
        return function() -- Line: 43 -- upvalues: u4 (val)
            task.cancel(u4)
        end
    end, {})
    return createElement("SurfaceGui", {
        AlwaysOnTop = true,
        Brightness = 2,
        ClipsDescendants = true,
        SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud,
        Face = Enum.NormalId.Top,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Adornee = v6,
    }, {
        portal = createPortal({
            part = createElement("Part", {
                Anchored = true,
                CanCollide = false,
                CanQuery = false,
                CanTouch = false,
                Transparency = 1,
                Size = v1:map(function(a1) -- Line: 63 -- upvalues: u46 (val)
                    return u46 * a1
                end),
                Position = u32.position,
                ref = v6,
            }, {
                mesh = createElement("SpecialMesh", {
                    MeshId = "rbxassetid://12597915770",
                    MeshType = Enum.MeshType.FileMesh,
                    Scale = u46,
                }),
            }),
        }, a1.root),
        container = createElement("Frame", {BackgroundTransparency = 1, Rotation = -90, Size = UDim2.fromScale(1, 1)}, {
            background = createElement("Frame", {
                ZIndex = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = u32.color3,
                BackgroundTransparency = v5:map(function(a1) -- Line: 86
                    return 0.8 + 0.2 * a1
                end),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
            }, {uiCorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)})}),
            fill = createElement("Frame", {
                ZIndex = 2,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = u32.color3,
                BackgroundTransparency = v5:map(function(a1) -- Line: 100
                    return 0.5 + 0.5 * a1
                end),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = v3:map(function(a1) -- Line: 104
                    return UDim2.fromScale(a1, a1)
                end),
            }, {uiCorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)})}),
            stroke = createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}, {
                uiCorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
                uiStroke = createElement("UIStroke", {
                    Thickness = 12,
                    Color = u32.color3:Lerp(Color3.new(0, 0, 0), 0.3),
                    Transparency = v5:map(function(a1) -- Line: 123
                        return (math.clamp(1 * a1 + 0.25, 0, 1))
                    end),
                }),
            }),
        }),
    })
end

return function(a1) -- Line: 143
    -- upvalues: Create (val), CurrentCamera (val), createElement (val), render (val), ReactRoblox (val)
    local u5 = Create("Folder", {Name = "AreaIndicators", Parent = CurrentCamera})
    local v1 = createElement(render, {root = u5})
    local u13 = ReactRoblox.createRoot(u5)
    u13:render(v1)
    return function() -- Line: 155 -- upvalues: u13 (val), u5 (val)
        u13:unmount()
        u5:Destroy()
    end
end