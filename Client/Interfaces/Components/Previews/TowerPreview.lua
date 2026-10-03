-- Script path: ReplicatedStorage.Client.Interfaces.Components.Previews.TowerPreview
-- Decompile time: 16.10 ms

game:GetService("AssetService")
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
game:GetService("ServerStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Components = ReplicatedStorage.Client.Interfaces.Components
local UI = ReplicatedStorage.Shared.UI
local Modules = ReplicatedStorage.Shared.Modules
local u37 = RunService:IsRunning()
RunService:IsStudio()
local Towers = require(ReplicatedStorage.Shared.Data.Icons).Towers
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Network = require(Modules.Network)
local React = require(UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local Troops = require(Modules.Asset.Handlers.Troops)
local TroopsModel = require(Modules.Asset.Handlers.TroopsModel)
local ItemPresentations = require(UI.ItemPresentations)
local Upgrades = require(Modules.Upgrades)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
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
local ImageLabel = require(Components.ImageLabel)
local Loader = require(Components.Loader)
local u101 = {}
local u106 = Color3.fromRGB(30, 30, 30)

local function useTowerModel(a1) -- Line: 93
    -- upvalues: useRef (val), useState (val), useEffect (val), RunService (val), Network (val), u101 (val)
    -- upvalues: Troops (val), TroopsModel (val), ItemPresentations (val), Upgrades (val)
    local flat = a1.flat
    local tower = a1.tower
    local skin = a1.skin
    local level = a1.level
    local path = a1.path
    local ref = a1.ref
    local u8 = useRef()
    local u10 = useRef()
    local u14 = useRef(CFrame.new())
    local v1, u17 = useState()
    local v2, u21 = useState(true)
    local v3 = {tower, skin}
    useEffect(function() -- Line: 108 -- upvalues: RunService (upval), Network (upval), tower (val), skin (val)
        if RunService:IsRunning() then
            (Network.Channel("Streaming")):FireServer("SelectTower", tower, skin)
        end
    end, v3)
    v3 = {tower, skin, level, path, ref}
    useEffect(function() -- Line: 114
        -- upvalues: u21 (val), ref (val), u8 (val), u14 (val), u101 (upval), tower (val), skin (val), Troops (upval)
        -- upvalues: TroopsModel (upval), ItemPresentations (upval), a1 (val), level (val), path (val), Upgrades (upval)
        -- upvalues: flat (val), u10 (val), u17 (val)
        u21(true)
        if not ref.current then
            return
        end
        local u6 = tick()
        local u8_2 = nil
        u8.current = u6
        u14.current = CFrame.new()
        local u16 = task.spawn(function() -- Line: 127
            -- upvalues: u101 (upval), tower (upval), skin (upval), Troops (upval), TroopsModel (upval), u6 (val)
            -- upvalues: u8 (upval), u21 (upval), ItemPresentations (upval), u8_2 (ref), a1 (upval), ref (upval)
            -- upvalues: level (upval), path (upval), Upgrades (upval), flat (upval), u14 (upval), u10 (upval)
            -- upvalues: u17 (upval)
            if not u101[tower] then
                u101[tower] = {}
            end
            local v1 = u101[tower][skin] ~= nil
            local v2 = u101[tower]
            v2[skin] = true
            v2 = Troops(tower)
            local v3 = TroopsModel(tower, skin)
            local v4 = tick() - u6
            if not v1 and v4 < 0.5 then
                task.wait(0.5 - v4)
            end
            if u8.current ~= u6 then
                return
            end
            if v2 and v3 then
                local u148 = ItemPresentations("Towers", tower)
                local u156 = {}
                u156.Offset = v2.Properties.Preview.TowerOffset or Vector3.new(0, 0, 0)
                local TowerRotation = v2.Properties.Preview.TowerRotation or CFrame.new()
                u156.Rotation = TowerRotation
                u8_2 = v3:Clone()
                u8_2:SetAttribute("Preview", true)
                if a1.inventory then
                    u8_2:SetAttribute("Preview", nil)
                end
                u8_2:SetAttribute("Level", 0)
                u8_2.Parent = ref.current
                if level then
                    local v5
                    local v6 = {Name = tower, Path = path or 1, Model = u8_2}
                    v6._jointData = {}
                    v6.FireAnim = {
                        IsPlaying = true,
                        Play = function() end,
                        Stop = function() end,
                    }

                    function v6.CreateProjectile() end

                    function v6.CreateVisualizer() end

                    local v7 = level
                    for i = 1, v7 do
                        if u8_2:FindFirstChild("UpgradesModule") then
                            Upgrades.upgrade(v6, i, "tower")
                        elseif v2.Upgrades then
                            v5 = v2.Upgrades[i]
                            if v5 then
                                v5(u8_2, u8_2.Upgrades:FindFirstChild(i), v6)
                            end
                        end
                    end
                    u8_2:SetAttribute("Level", level)
                end
                if u148 and u148.Init then
                    local success, result = pcall(function() -- Line: 198 -- upvalues: u148 (val), u8_2 (upval), u156 (val), flat (upval), ref (upval)
                        local v1 = u148.Init(u8_2, u156, flat)
                        if v1 then
                            v1.Parent = ref.current
                            u8_2 = v1
                        end
                    end)
                    if not success then
                        local v8 = skin
                        warn((("Error Applying init Presentation for \"%*\" \"%*\":\n\n%*"):format(tower, v8, result)))
                    end
                end
                u8_2:SetAttribute("BaseOffset", (CFrame.new(u156.Offset)) * u156.Rotation)
                u8_2:PivotTo((u8_2:GetAttribute("BaseOffset")))
                u14.current = (CFrame.new(u156.Offset)) * u156.Rotation
                local WorldCFrame = nil
                local HeightOffset = u8_2:FindFirstChild("HeightOffset", true)
                if HeightOffset then
                    WorldCFrame = HeightOffset.WorldCFrame
                elseif u8_2:IsA("Model") then
                    local PrimaryPart = u8_2.PrimaryPart
                    local Humanoid = u8_2:FindFirstChildOfClass("Humanoid")
                    if Humanoid and PrimaryPart then
                        WorldCFrame = (CFrame.new(PrimaryPart and PrimaryPart.Position or Vector3.new(0, 0, 0))) * CFrame.new(0, -(0.5 * PrimaryPart.Size.Y) + Humanoid.HipHeight, 0)
                    end
                end
                u10.current = WorldCFrame
                u17(u8_2)
                u21(false)
                return
            end
            u21(false)
        end)
        return function() -- Line: 237 -- upvalues: u8 (upval), u10 (upval), u16 (ref), u8_2 (ref), u17 (upval)
            u8.current = nil
            u10.current = nil
            if u16 then
                task.cancel(u16)
                u16 = nil
            end
            if u8_2 then
                u8_2:Destroy()
                u8_2 = nil
            end
            u17(nil)
        end
    end, v3)
    return v2, v1, u10, u14
end

local u110 = memo(function(a1) -- Line: 258
    -- upvalues: useBinding (val), useRef (val), useMemo (val), React (val), spr (val), ReactFlow (val)
    -- upvalues: useTowerModel (val), useEffect (val), ItemPresentations (val), u37 (val), HttpService (val)
    -- upvalues: RunService (val), useReactBindings (val), useState (val), Maid (val), createElement (val), u106 (val)
    -- upvalues: Fragment (val), Loader (val)
    local tower = a1.tower
    local u3 = a1.skin or "Default"
    local u5 = a1.level or 0
    local path = a1.path
    local u9 = a1.pause == true
    local v1 = a1.preview == true
    local v2 = a1.shadow ~= false
    local v3 = a1.shadowRadius or 1
    local u23 = a1.worldModel ~= false
    local u27 = a1.animate ~= false
    local u30 = a1.animationName or "Idle"
    local u33 = a1.flat == true
    local cameraOffset = a1.cameraOffset
    if not cameraOffset then
        cameraOffset = CFrame.new()
    end
    local modelTransformBinding = a1.modelTransformBinding or useBinding(CFrame.new())
    local u45 = useRef()
    local u49 = useMemo(function() -- Line: 278
        return Instance.new("CFrameValue")
    end, {})
    local u54 = React.useCallback(function(a1) -- Line: 282 -- upvalues: spr (upval), u49 (val) -- types: a1: table
        spr.target(u49, 0.6, 5, {Value = CFrame.Angles(0, a1.target, 0)})
    end, {})
    local v4, u59 = ReactFlow.useSpring({target = 1, start = 1, speed = 35, damper = 0.6})
    local u61 = useRef()
    local u63 = useRef()
    local u67 = useMemo(function() -- Line: 298
        return tick()
    end, {})
    local v5 = {
        flat = u33,
        tower = tower,
        skin = u3,
        level = u5,
        path = path,
        shadow = v2,
    }
    v5.ref = u23 and u63 or u61
    v5.inventory = a1.inventory or false
    local v6, u130, v7, u132 = useTowerModel(v5)
    useEffect(function() -- Line: 313 -- upvalues: u49 (val)
        return function() -- Line: 314 -- upvalues: u49 (upval)
            u49:Destroy()
        end
    end, {})
    local v8 = {u45, u132}
    useEffect(function() -- Line: 319 -- upvalues: u45 (val), u132 (val), cameraOffset (val), u33 (val), u49 (val)
        local function update(a1) -- Line: 320 -- upvalues: u45 (upval), u132 (upval), cameraOffset (upval), u33 (upval)
            if u45.current and u132.current then
                local current = u45.current
                local v1 = a1.Rotation * cameraOffset
                local v2 = u33 and CFrame.new(0, 2, 25) or CFrame.new(0, 0, 4.5)
                current.CFrame = v1 * v2 * CFrame.Angles(-0.08726646259971647, 0, 0)
                return
            end
        end

        local u6 = u49.Changed:Connect(update)
        update(u49.Value)
        return function() -- Line: 334 -- upvalues: u6 (val)
            u6:Disconnect()
        end
    end, v8)
    v8 = {u61, u63, u23, u130, u5, u27, u9}
    useEffect(function() -- Line: 339
        -- upvalues: u23 (val), u63 (val), u61 (val), u130 (val), u27 (val), u30 (val), ItemPresentations (upval)
        -- upvalues: tower (val), u3 (val), a1 (val), u5 (val), u67 (val), u9 (val), u37 (upval), HttpService (upval)
        -- upvalues: RunService (upval)
        if not (u23 and u63 or u61).current then
            return
        end
        if u130 and u23 and u27 then
            local u132 = nil
            local Animations = u130:FindFirstChild("Animations")
            local v1 = Animations and Animations:FindFirstChild(u30)
            local AnimationController = u130:FindFirstChild("AnimationController") or u130:FindFirstChildOfClass("Humanoid")
            local success, result = pcall(function() -- Line: 356 -- upvalues: ItemPresentations (upval), tower (upval), u132 (ref), u130 (upval)
                local v1 = ItemPresentations("Towers", tower)
                if v1 and v1.Animation then
                    u132 = v1.Animation(u130)
                end
            end)
            if not success then
                warn((("Error Applying animation Presentation for \"%*\" \"%*\":\n\n%*"):format(tower, u3, result)))
            end
            local v2 = if not a1.path or not (0 < a1.path) then nil else string.char(96 + a1.path)
            if not u132 and v1 and AnimationController then
                if not v1:IsA("Animation") then
                    local v3
                    for i = 0, u5 do
                        v3 = if not v2 then tostring(i) else ("%*%*"):format(i, v2)
                        if v1:FindFirstChild(v3) then
                            u132 = v1:FindFirstChild(v3)
                        end
                    end
                    if not u132 then
                        u132 = v1:GetChildren()[1]
                    end
                    if u132 and not u132:IsA("Animation") then
                        u132 = u132:GetChildren()[1]
                    end
                else
                    u132 = v1
                end
            end
            if AnimationController and u132 then
                local Animator = AnimationController:FindFirstChildOfClass("Animator")
                if not Animator then
                    Animator = Instance.new("Animator")
                    Animator.Name = "Animator"
                    Animator.Parent = AnimationController
                end
                for j, k in Animator:GetPlayingAnimationTracks() do
                    k:Stop()
                end
                pcall(function() -- Line: 401 -- upvalues: Animator (ref), u132 (ref), u67 (upval), u9 (upval)
                    local v1 = Animator:LoadAnimation(u132)
                    v1.Looped = true
                    v1:Play(0)
                    v1.TimePosition = (tick() - u67) % v1.Length
                    if u9 then
                        v1:AdjustSpeed(0)
                    end
                end)
                if not u37 and u130:IsDescendantOf(game) then
                    local u176 = HttpService:GenerateGUID()
                    RunService:BindToRenderStep(u176, 1, function(a1) -- Line: 415 -- upvalues: Animator (ref)
                        Animator:StepAnimations(a1)
                    end)
                    return function() -- Line: 419 -- upvalues: RunService (upval), u176 (val)
                        RunService:UnbindFromRenderStep(u176)
                    end
                end
            end
            return
        end
    end, v8)
    v8 = {modelTransformBinding}
    local v9 = {u130}
    useReactBindings(function(a1) -- Line: 428 -- upvalues: u130 (val)
        if u130 and u130:GetAttribute("BaseOffset") then
            u130:PivotTo((u130:GetAttribute("BaseOffset")) * a1)
        end
    end, v8, v9)
    local u210, u211 = useState(false)
    local u214 = useRef(Vector2.zero)
    local v10 = {u210}
    useEffect(function() -- Line: 437 -- upvalues: Maid (upval), u210 (val), u59 (val), RunService (upval), u214 (val), u54 (val)
        local u2 = Maid.new()
        if not u210 then
            u59({target = 1})
            u2:Mark((task.delay(1, function() -- Line: 469 -- upvalues: u54 (upval)
                u54({target = 0})
            end)))
        else
            u59({target = 0.9})
            local u7 = true
            u2:Mark((RunService.Heartbeat:Connect(function() -- Line: 446 -- upvalues: u214 (upval), u7 (ref), u54 (upval)
                local v1 = (game:GetService("UserInputService"):GetMouseLocation() - u214.current).X / 300 * 3.141592653589793
                if u7 then
                    u7 = false
                    u54({start = v1, target = v1})
                end
                u54({target = v1})
            end)))
        end
        return function() -- Line: 476 -- upvalues: u2 (val)
            u2:Sweep()
        end
    end, v10)
    v10 = {BackgroundTransparency = 1}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v10.AnchorPoint = AnchorPoint
    local Position = a1.Position or UDim2.new(0.5, 0, 0.5, 0)
    v10.Position = Position
    local Size = a1.Size or UDim2.fromScale(1, 1)
    v10.Size = Size
    v10.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
    v10.Visible = a1.Visible
    local Ambient = a1.Ambient or Color3.fromRGB(200, 200, 200)
    v10.Ambient = Ambient
    local LightColor = a1.LightColor or v1 and u106 or Color3.fromRGB(140, 140, 140)
    v10.LightColor = LightColor
    local ImageColor3 = a1.ImageColor3 or v1 and u106 or Color3.fromRGB(255, 255, 255)
    v10.ImageColor3 = ImageColor3
    v10.ImageTransparency = a1.ImageTransparency or 0
    v10.CurrentCamera = u45
    v10.ZIndex = a1.ZIndex or 1
    v10.ClipsDescendants = a1.ClipsDescendants
    v10.ref = u61
    local v11 = {}
    local v12 = createElement
    local v13 = {
        Scale = v4:map(function(a1) -- Line: 501
            return a1
        end),
    }
    v11.UIScale = v12("UIScale", v13)
    local controllable = a1.controllable
    if controllable then
        v12 = createElement
        v13 = {
            Active = true,
            Size = UDim2.fromScale(1, 0.8),
            BackgroundTransparency = 1,
            ZIndex = -1,
        }

        v13[React.Event.InputBegan] = function(a1_2, a2) -- Line: 511 -- upvalues: a1 (val), u214 (val), u211 (val)
            if not a1.controllable then
                return
            end
            if a2.UserInputType == Enum.UserInputType.MouseButton1 then
                u214.current = game:GetService("UserInputService"):GetMouseLocation()
                u211(true)
            end
        end

        v13[React.Event.InputEnded] = function(a1_2, a2) -- Line: 521 -- upvalues: a1 (val), u211 (val)
            if not a1.controllable then
                return
            end
            if a2.UserInputType == Enum.UserInputType.MouseButton1 then
                u211(false)
            end
        end

        controllable = v12("ImageButton", v13)
    end
    v11.movementFrame = controllable
    v11.camera = createElement("Camera", {FieldOfView = if not u33 then 58 else 10, ref = u45})
    v11.children = createElement(Fragment, nil, a1.children)
    v11.loader = v6 and createElement(Loader, {
        BackgroundTransparency = 1,
        Visible = true,
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromOffset(100, 100),
    })
    v11.preview = v1 and createElement("TextLabel", {
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
    })
    v11.shadow = v2 and u130 and createElement("Part", {
        Anchored = true,
        CanCollide = false,
        CanQuery = false,
        CanTouch = false,
        EnableFluidForces = false,
        Transparency = 1,
        BottomSurface = Enum.SurfaceType.Smooth,
        CFrame = v7,
        Size = Vector3.new(4 * v3, 0.001, 4 * v3),
        TopSurface = Enum.SurfaceType.Smooth,
    }, {
        decal = createElement("Decal", {Texture = "rbxassetid://10382196373", Transparency = 0.4, Face = Enum.NormalId.Top}),
    })
    v12 = u23 and createElement("WorldModel", {ref = u63})
    v11.worldModel = v12
    return createElement("ViewportFrame", v10, v11)
end)
local u114 = memo(function(a1) -- Line: 611
    -- upvalues: useMemo (val), Troops (val), Towers (val), createElement (val), ImageLabel (val), Fragment (val)
    local tower = a1.tower
    local v1 = a1.skin or "Default"
    local v2 = {tower}
    local v3 = useMemo(function() -- Line: 615 -- upvalues: tower (val), Troops (upval)
        if not tower then
            return
        end
        return Troops(tower)
    end, v2)
    local v4 = Towers[tower] and Towers[tower][v1]
    if not v4 and v3 and not v4 then
        local SkinData = v3.Properties.SkinData and v3.Properties.SkinData[v1]
        v4 = SkinData and SkinData.Icon or v3.Properties.Preview.Icon
    end
    local v5 = {BackgroundTransparency = 1}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v5.AnchorPoint = AnchorPoint
    local Position = a1.Position or UDim2.new(0.5, 0, 0.5, 0)
    v5.Position = Position
    local Size = a1.Size or UDim2.fromScale(1, 1)
    v5.Size = Size
    v5.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
    v5.Visible = a1.Visible
    v5.Image = v4 or ""
    local ImageColor3 = a1.ImageColor3 or Color3.fromRGB(255, 255, 255)
    v5.ImageColor3 = ImageColor3
    v5.ImageTransparency = a1.ImageTransparency or 0
    local ScaleType = a1.ScaleType or Enum.ScaleType.Fit
    v5.ScaleType = ScaleType
    v5.ClipsDescendants = a1.ClipsDescendants
    v5.ZIndex = a1.ZIndex or 1
    v5.imageLoading = v4 == nil
    return createElement(ImageLabel, v5, {children = createElement(Fragment, nil, a1.children or {})})
end, function(a1, a2) -- Line: 650
    local v1 = false
    if a1.tower == a2.tower then
        v1 = false
        if a1.skin == a2.skin then
            v1 = false
            if a1.Size == a2.Size then
                v1 = false
                if a1.Visible == a2.Visible then
                    v1 = false
                    if a1.ImageColor3 == a2.ImageColor3 then
                        v1 = false
                        if a1.ImageTransparency == a2.ImageTransparency then
                            v1 = false
                            if a1.ScaleType == a2.ScaleType then
                                v1 = false
                                if a1.BackgroundTransparency == a2.BackgroundTransparency then
                                    v1 = false
                                    if a1.ClipsDescendants == a2.ClipsDescendants then
                                        v1 = false
                                        if a1.ZIndex == a2.ZIndex then
                                            v1 = a1.imageLoading == a2.imageLoading
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return v1
end)
return memo(function(a1) -- Line: 664 -- upvalues: createElement (val), u114 (val), u110 (val) -- types: a1: table
    return createElement(a1.icon ~= false and u114 or u110, a1, a1.children or {})
end)