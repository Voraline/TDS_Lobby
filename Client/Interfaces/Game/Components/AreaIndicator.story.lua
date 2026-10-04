-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.AreaIndicator.story
-- Decompile time: 6.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local createElement = React.createElement
local createPortal = ReactRoblox.createPortal
local useRef = React.useRef
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local useTween = require(ReplicatedStorage.Client.Interfaces.Hooks.useTween)
local CurrentCamera = workspace.CurrentCamera
local useBinding = React.useBinding
local u39 = {radius = 30, initialAngle = 0, desiredAngle = 45, lifeTime = 9999}
u39.tweenInfo = TweenInfo.new(1.75, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
u39.color3 = Color3.new(1, 1, 1)
u39.cframe = CFrame.new()

local function render(a1) -- Line: 26
    -- upvalues: useTween (val), u39 (val), useBinding (val), useRef (val), useReactBindings (val), React (val)
    -- upvalues: createElement (val), createPortal (val), CurrentCamera (val)
    local u9, v1 = useTween(u39.initialAngle, u39.tweenInfo, true, true, false)
    v1(u39.desiredAngle)

    local function v2() -- Line: 31 -- upvalues: u9 (val)
        return u9:getValue() % 360 ~= 0
    end

    local v3, u25 = useTween(0, TweenInfo.new(0.25), true, true, false)
    local v4, u38 = useTween(0, TweenInfo.new(u39.tweenInfo.Time / 2), true, true, false)
    local v5, u49 = useBinding(u9:getValue() % 360 ~= 0)
    local v6 = Vector3.new(u39.radius * 2, 0.001, u39.radius * 2)
    local v7 = useRef()
    local v8 = {u9}
    useReactBindings(function() -- Line: 44 -- upvalues: u49 (val), u9 (val)
        u49(u9:getValue() % 360 ~= 0)
    end, v8)
    React.useEffect(function() -- Line: 48 -- upvalues: u39 (upval), u38 (val), u25 (val)
        if not u39.lifeTime then
            return
        end
        local u4 = task.spawn(function() -- Line: 52 -- upvalues: u39 (upval), u38 (upval), u25 (upval)
            task.delay(u39.tweenInfo.Time / 2, function() -- Line: 53 -- upvalues: u39 (upval), u38 (upval)
                if u39.desiredAngle ~= 360 then
                    return
                end
                u38(1)
            end)
            task.delay(u39.lifeTime, function() -- Line: 59 -- upvalues: u25 (upval)
                u25(1)
            end)
        end)
        return function() -- Line: 63 -- upvalues: u4 (val)
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
        Adornee = v7,
    }, {
        portal = createPortal({
            part = createElement("Part", {
                Anchored = true,
                CanCollide = false,
                CanQuery = false,
                CanTouch = false,
                Transparency = 1,
                Size = v6,
                CFrame = u39.cframe,
                ref = v7,
            }, {
                mesh = createElement("SpecialMesh", {
                    MeshId = "rbxassetid://12597915770",
                    MeshType = Enum.MeshType.FileMesh,
                    Scale = v6,
                }),
            }),
        }, CurrentCamera),
        container = createElement("Frame", {BackgroundTransparency = 1, Rotation = -90, Size = UDim2.fromScale(1, 1)}, {
            edge1 = createElement("Frame", {
                BackgroundTransparency = 1,
                ZIndex = 2,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Rotation = u9:map(function(a1) -- Line: 105
                    return -a1 / 2
                end),
                Size = UDim2.fromScale(0.013, 1),
                Visible = v5,
            }, {
                imageLabel = createElement("Frame", {
                    BorderSizePixel = 0,
                    BackgroundColor3 = u39.color3,
                    BackgroundTransparency = React.joinBindings({v3, v4}):map(function(a1) -- Line: 115
                        return a1[1] + a1[2]
                    end),
                    Position = UDim2.fromScale(0.2, 0),
                    Size = UDim2.new(0, 15, 1, -3),
                }, {
                    uIGradient = createElement("UIGradient", {
                        Rotation = -90,
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 0),
                            NumberSequenceKeypoint.new(0.5, 0),
                            NumberSequenceKeypoint.new(0.501, 1),
                            (NumberSequenceKeypoint.new(1, 1)),
                        }),
                    }),
                }),
            }),
            edge2 = createElement("Frame", {
                BackgroundTransparency = 1,
                ZIndex = 2,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Rotation = u9:map(function(a1) -- Line: 138
                    return a1 / 2
                end),
                Size = UDim2.fromScale(0.013, 1),
                Visible = v5,
            }, {
                imageLabel = createElement("Frame", {
                    BorderSizePixel = 0,
                    BackgroundColor3 = u39.color3,
                    BackgroundTransparency = React.joinBindings({v3, v4}):map(function(a1) -- Line: 148
                        return a1[1] + a1[2]
                    end),
                    Position = UDim2.fromScale(0.2, 0),
                    Size = UDim2.new(0, 15, 1, 3),
                }, {
                    uIGradient = createElement("UIGradient", {
                        Rotation = -90,
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 0),
                            NumberSequenceKeypoint.new(0.5, 0),
                            NumberSequenceKeypoint.new(0.501, 1),
                            (NumberSequenceKeypoint.new(1, 1)),
                        }),
                    }),
                }),
            }),
            circle1 = createElement("CanvasGroup", {
                BackgroundTransparency = 1,
                Size = UDim2.new(0.5, 0, 1, 0),
                Position = UDim2.fromScale(0.5, 0),
                GroupTransparency = v3,
            }, {
                inner = createElement("Frame", {
                    BackgroundTransparency = 0.8,
                    BackgroundColor3 = u39.color3,
                    Position = UDim2.fromScale(-1, 0),
                    Size = UDim2.new(2, -12, 1, -12),
                }, {
                    uICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
                    uIGradient4 = createElement("UIGradient", {
                        Rotation = u9:map(function(a1) -- Line: 184
                            return -a1 / 2 + 180
                        end),
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 1),
                            NumberSequenceKeypoint.new(0.5, 1),
                            NumberSequenceKeypoint.new(0.501, 0),
                            (NumberSequenceKeypoint.new(1, 0)),
                        }),
                    }),
                }),
                outer = createElement("Frame", {
                    BackgroundTransparency = 1,
                    BackgroundColor3 = Color3.fromRGB(255, 0, 102),
                    Position = UDim2.new(-1, 0, 0, 0),
                    Size = UDim2.new(2, -12, 1, -12),
                }, {
                    uICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
                    uIstroke = createElement("UIStroke", {Thickness = 14, Color = u39.color3, Transparency = v3}, {
                        uIGradient5 = createElement("UIGradient", {
                            Rotation = u9:map(function(a1) -- Line: 212
                                return -a1 / 2 + 180
                            end),
                            Transparency = NumberSequence.new({
                                NumberSequenceKeypoint.new(0, 1),
                                NumberSequenceKeypoint.new(0.5, 1),
                                NumberSequenceKeypoint.new(0.501, 0),
                                (NumberSequenceKeypoint.new(1, 0)),
                            }),
                        }),
                    }),
                }),
            }),
            circle2 = createElement("CanvasGroup", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.5, 1),
                Position = UDim2.new(0, 0, 0, 0),
                GroupTransparency = v3,
            }, {
                inner = createElement("Frame", {
                    BackgroundTransparency = 0.8,
                    BackgroundColor3 = u39.color3,
                    Size = UDim2.fromScale(2, 1),
                    Position = UDim2.new(0, -5, 0, -5),
                }, {
                    uICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
                    uIGradient4 = createElement("UIGradient", {
                        Rotation = u9:map(function(a1) -- Line: 242
                            return a1 / 2
                        end),
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 1),
                            NumberSequenceKeypoint.new(0.5, 1),
                            NumberSequenceKeypoint.new(0.501, 0),
                            (NumberSequenceKeypoint.new(1, 0)),
                        }),
                    }),
                }),
                outer = createElement("Frame", {
                    BackgroundTransparency = 1,
                    BackgroundColor3 = u39.color3,
                    Size = UDim2.new(2, -12, 1, -12),
                }, {
                    uICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
                    uIstroke = createElement("UIStroke", {Thickness = 14, Color = u39.color3, Transparency = v3}, {
                        uIGradient5 = createElement("UIGradient", {
                            Rotation = u9:map(function(a1) -- Line: 269
                                return a1 / 2
                            end),
                            Transparency = NumberSequence.new({
                                NumberSequenceKeypoint.new(0, 1),
                                NumberSequenceKeypoint.new(0.5, 1),
                                NumberSequenceKeypoint.new(0.501, 0),
                                (NumberSequenceKeypoint.new(1, 0)),
                            }),
                        }),
                    }),
                }),
            }),
        }),
    })
end

return function(a1) -- Line: 286
    -- upvalues: Create (val), CurrentCamera (val), createElement (val), render (val), ReactRoblox (val)
    local u5 = Create("Folder", {Name = "AreaIndicators", Parent = CurrentCamera})
    local v1 = createElement(render, {root = u5})
    local u13 = ReactRoblox.createRoot(u5)
    u13:render(v1)
    return function() -- Line: 298 -- upvalues: u13 (val), u5 (val)
        u13:unmount()
        u5:Destroy()
    end
end