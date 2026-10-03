-- Script path: ReplicatedStorage.Client.Interfaces.Components.Previews.CharmPreview
-- Decompile time: 6.00 ms

game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local UI = ReplicatedStorage.Shared.UI
local Modules = ReplicatedStorage.Shared.Modules
local React = require(UI.React)
local NewTotems = require(Modules.Asset.Handlers.NewTotems)
require(UI.ItemPresentations)
require(Modules.Upgrades)
local useReactBindings = require(Hooks.useReactBindings)
local createElement = React.createElement
local useBinding = React.useBinding
local useState = React.useState
local useEffect = React.useEffect
local joinBindings = React.joinBindings
local useRef = React.useRef
local useMemo = React.useMemo
local memo = React.memo
local Fragment = React.Fragment
local Loader = require(ReplicatedStorage.Client.Interfaces.Components.Loader)
local u54 = {}
local u59 = Color3.fromRGB(30, 30, 30)

local function useCharmModel(a1) -- Line: 63
    -- upvalues: useRef (val), useState (val), useEffect (val), u54 (val), NewTotems (val)
    local name = a1.name
    local ref = a1.ref
    local u4 = useRef()
    local u6 = useRef()
    local u10 = useRef(CFrame.new())
    local v1, u13 = useState()
    local v2, u17 = useState(true)
    local v3 = {name, ref}
    useEffect(function() -- Line: 74
        -- upvalues: u17 (val), ref (val), u4 (val), u10 (val), u54 (upval), name (val), NewTotems (upval), u6 (val)
        -- upvalues: u13 (val)
        u17(true)
        if not ref.current then
            return
        end
        local u6_2 = tick()
        local u8 = nil
        u4.current = u6_2
        u10.current = CFrame.new()
        local u16 = task.spawn(function() -- Line: 87
            -- upvalues: u54 (upval), name (upval), NewTotems (upval), u6_2 (val), u4 (upval), u17 (upval), u8 (ref)
            -- upvalues: ref (upval), u6 (upval), u13 (upval)
            local v1 = u54[name] ~= nil
            if not u54[name] then
                u54[name] = true
            end
            local v2 = NewTotems(name)
            local Model = v2 and v2.Model
            local v3 = tick() - u6_2
            if not v1 and v3 < 0.5 then
                task.wait(0.5 - v3)
            end
            if u4.current ~= u6_2 then
                return
            end
            if not Model then
                u17(false)
                return
            end
            local BoundingBox = Model:GetBoundingBox()
            local PivotOffset = Model.PrimaryPart and Model.PrimaryPart.PivotOffset or Model.WorldPivot:ToObjectSpace(BoundingBox)
            u8 = Model:Clone()
            if not u8.PrimaryPart then
                u8.WorldPivot = BoundingBox
            else
                u8.PrimaryPart.PivotOffset = u8.PrimaryPart.CFrame:ToObjectSpace(BoundingBox)
            end
            u8.Parent = ref.current
            u8:PivotTo((CFrame.new()))
            u8:SetAttribute("BaseOffset", (u8:GetPivot()))
            u6.current = PivotOffset
            u13(u8)
            u17(false)
        end)
        return function() -- Line: 134 -- upvalues: u4 (upval), u6 (upval), u16 (ref), u8 (ref), u13 (upval)
            u4.current = nil
            u6.current = nil
            if u16 then
                task.cancel(u16)
                u16 = nil
            end
            if u8 then
                u8:Destroy()
                u8 = nil
            end
            u13(nil)
        end
    end, v3)
    return v2, v1, u6, u10
end

return memo(function(a1) -- Line: 155
    -- upvalues: useBinding (val), useRef (val), useCharmModel (val), useEffect (val), RunService (val)
    -- upvalues: useReactBindings (val), createElement (val), u59 (val), Fragment (val), joinBindings (val)
    -- upvalues: Loader (val)
    local name = a1.name
    local preview = a1.preview
    local v1 = a1.shadow ~= false
    local u9 = a1.flat ~= false
    local u13 = a1.playing ~= false
    local cameraOffset = a1.cameraOffset
    if not cameraOffset then
        cameraOffset = CFrame.new()
    end
    local modelTransformBinding = a1.modelTransformBinding
    if not modelTransformBinding then
        modelTransformBinding = useBinding(CFrame.new())
    end
    local u25 = useRef()
    local v2 = useRef()
    local v3, u36, v4, u38 = useCharmModel({name = name, ref = u25})
    local v5 = {u25, u36, u13}
    useEffect(function() -- Line: 174 -- upvalues: u25 (val), u36 (val), u13 (val), RunService (upval), modelTransformBinding (val)
        if not u25.current or not u36 then
            return
        end
        local u4 = tick()
        local Attribute = u36:GetAttribute("BaseOffset")
        if not Attribute then
            Attribute = u36:GetPivot()
        end
        if not u13 then
            u36:PivotTo(Attribute)
            return
        end
        local u27 = RunService.Heartbeat:Connect(function() -- Line: 191 -- upvalues: modelTransformBinding (upval), u4 (val), u36 (upval), Attribute (val)
            local v1 = modelTransformBinding:getValue()
            local v2 = tick() - u4
            u36:PivotTo(Attribute * (CFrame.Angles(0, 0.2617993877991494 * v2, 0)) * v1)
        end)
        return function() -- Line: 198 -- upvalues: u27 (val)
            u27:Disconnect()
        end
    end, v5)
    v5 = {modelTransformBinding}
    local v6 = {u36}
    useReactBindings(function(a1) -- Line: 203 -- upvalues: u36 (val)
        if u36 and u36:GetAttribute("BaseOffset") then
            u36:PivotTo((u36:GetAttribute("BaseOffset")) * a1)
        end
    end, v5, v6)
    v5 = {BackgroundTransparency = 1}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v5.AnchorPoint = AnchorPoint
    local Position = a1.Position or UDim2.new(0.5, 0, 0.5, 0)
    v5.Position = Position
    local Size = a1.Size or UDim2.fromScale(1, 1)
    v5.Size = Size
    v5.ZIndex = a1.ZIndex or 1
    v5.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
    v5.Visible = a1.Visible
    local Ambient = a1.Ambient or Color3.fromRGB(200, 200, 200)
    v5.Ambient = Ambient
    local LightColor = a1.LightColor or preview and u59 or Color3.fromRGB(140, 140, 140)
    v5.LightColor = LightColor
    local ImageColor3 = a1.ImageColor3 or preview and u59 or Color3.fromRGB(255, 255, 255)
    v5.ImageColor3 = ImageColor3
    v5.ImageTransparency = a1.ImageTransparency or 0
    v5.CurrentCamera = v2
    v5.ClipsDescendants = a1.ClipsDescendants
    v5.ref = u25
    return createElement("ViewportFrame", v5, {
        children = createElement(Fragment, nil, a1.children),
        camera = createElement("Camera", {
            FieldOfView = if not u9 then 58 else 10,
            CFrame = (joinBindings({})):map(function(a1) -- Line: 233 -- upvalues: u38 (val), cameraOffset (val), u9 (val)
                local v1 = u38.current * cameraOffset
                local v2 = u9 and CFrame.new(0, 2, 25) or CFrame.new(0, 0, 4.5)
                return v1 * v2 * CFrame.Angles(-0.08726646259971647, 0, 0)
            end),
            ref = v2,
        }),
        loader = v3 and createElement(Loader, {
            BackgroundTransparency = 1,
            Visible = true,
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromOffset(100, 100),
        }),
        preview = preview and createElement("TextLabel", {
            BackgroundTransparency = 1,
            Text = "PREVIEW",
            TextScaled = true,
            TextSize = 14,
            TextStrokeTransparency = 0,
            TextWrapped = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0.5, 0.4),
            Size = UDim2.fromScale(0.6, 0.08),
            TextColor3 = Color3.fromRGB(255, 255, 255),
        }, {
            uIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 4}),
            uIStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.4, LineJoinMode = Enum.LineJoinMode.Miter}),
        }),
        shadow = v1 and u36 and createElement("Part", {
            Anchored = true,
            CanCollide = false,
            CanQuery = false,
            CanTouch = false,
            EnableFluidForces = false,
            Size = Vector3.new(4, 0.0010000000474974513, 4),
            Transparency = 1,
            BottomSurface = Enum.SurfaceType.Smooth,
            CFrame = v4,
            TopSurface = Enum.SurfaceType.Smooth,
        }, {
            decal = createElement("Decal", {
                Texture = "rbxassetid://10382196373",
                Transparency = 0.4,
                Face = Enum.NormalId.Top,
            }),
        }),
    })
end)