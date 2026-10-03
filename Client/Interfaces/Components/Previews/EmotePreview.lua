-- Script path: ReplicatedStorage.Client.Interfaces.Components.Previews.EmotePreview
-- Decompile time: 5.47 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CustomAccessories = require(ReplicatedStorage.Shared.Modules.CustomAccessories)
local NewEmotes = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.NewEmotes)
local EmoteReplicator = require(ReplicatedStorage.Client.Modules.Replicators.EmoteReplicator)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local Loader = require(ReplicatedStorage.Client.Interfaces.Components.Loader)
local Player = require(ReplicatedStorage.Client.Interfaces.Components.Player)
local React = require(ReplicatedStorage.Shared.UI.React)
local Fragment = React.Fragment
local createElement = React.createElement
local useState = React.useState
local useEffect = React.useEffect
local useRef = React.useRef
local memo = React.memo
local useBinding = React.useBinding
local LocalPlayer = Players.LocalPlayer
local u59 = {}

local function LiveEmotePreivew(a1) -- Line: 43
    -- upvalues: useRef (val), useBinding (val), useState (val), useEffect (val), u59 (val), NewEmotes (val)
    -- upvalues: LocalPlayer (val), CustomAccessories (val), EmoteReplicator (val), createElement (val), Fragment (val)
    -- upvalues: Player (val), Loader (val)
    local name = a1.name
    local cameraOffset = a1.cameraOffset
    local playing = if a1.playing == nil then true else a1.playing
    local shadow = if a1.shadow == nil then true else a1.shadow
    local v1 = useRef(nil)
    local v2, u20 = useBinding(CFrame.new(0, 0, 0))
    local u23, u24 = useState(nil)
    local u27, u28 = useState(nil)
    local v3, u32 = useState(true)
    local v4 = {u27, playing}
    useEffect(function() -- Line: 58 -- upvalues: u27 (val), playing (val)
        if u27 and playing then
            if u27._track then
                u27._track:AdjustSpeed(if not playing then 0 else 1)
            end
            if u27._tracks then
                for i, v in ipairs(u27._tracks) do
                    v:AdjustSpeed(if not playing then 0 else 1)
                end
            end
            return
        end
    end, v4)
    v4 = {name, u23, playing}
    useEffect(function() -- Line: 74
        -- upvalues: u59 (upval), name (val), u32 (val), NewEmotes (upval), a1 (val), u23 (val), playing (val)
        -- upvalues: LocalPlayer (upval), CustomAccessories (upval), EmoteReplicator (upval), u28 (val)
        local u0 = true
        local u1 = nil
        local u4 = task.spawn(function() -- Line: 78
            -- upvalues: u59 (upval), name (upval), u32 (upval), NewEmotes (upval), a1 (upval), u0 (ref), u23 (upval)
            -- upvalues: playing (upval), LocalPlayer (upval), CustomAccessories (upval), u1 (ref)
            -- upvalues: EmoteReplicator (upval), u28 (upval)
            if not u59[name] then
                u32(true)
                u59[name] = true
            end
            local v1 = NewEmotes(a1.name)
            if not u0 then
                return
            end
            if u23 and playing and v1 ~= nil then
                local u16 = {}
                local v2 = {
                    Humanoid = u23.Humanoid,
                    Animator = u23.Humanoid.Animator,
                    Root = u23.PrimaryPart,
                    Instance = u23,
                    Player = {
                        Character = u23,
                        UserId = LocalPlayer.UserId,
                        SetAttribute = function(a1, a2, a3) -- Line: 105 -- upvalues: u16 (val)
                            u16[a2] = a3
                        end,
                        GetAttribute = function(a1, a2) -- Line: 108 -- upvalues: u16 (val)
                            return u16[a2]
                        end,
                    },
                    StopEmoting = function() end,
                    AddAccessories = function(a1, a2) -- Line: 114 -- upvalues: CustomAccessories (upval), u23 (upval)
                        return CustomAccessories.AddAccessories(u23, a2)
                    end,
                }
                u1 = EmoteReplicator.new(v2, name)
                u1.Preview = true
                u1.Sound = nil
                u1.Fade = 0
                u1:Play(0)
                if not u0 then
                    u1:Destroy()
                    u1 = nil
                    return
                end
                u28(u1)
                u32(false)
                return
            end
            u32(false)
        end)
        return function() -- Line: 134 -- upvalues: u0 (ref), u4 (val), u1 (ref)
            u0 = false
            task.cancel(u4)
            if u1 then
                u1:Destroy()
            end
        end
    end, v4)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        Size = a1.Size,
        Position = a1.Position,
        AnchorPoint = a1.AnchorPoint,
        Visible = a1.Visible,
        ZIndex = a1.ZIndex or 1,
        LayoutOrder = a1.LayoutOrder,
    }, {
        camera = createElement("Camera", {FieldOfView = 1, CFrame = cameraOffset or CFrame.new(0, 0, 0), ref = v1}),
        viewport = createElement("ViewportFrame", {
            BackgroundTransparency = 1,
            Selectable = true,
            ImageTransparency = a1.ImageTransparency or 0,
            Ambient = Color3.fromRGB(240, 240, 240),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(48, 48, 48),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
            CurrentCamera = v1,
            Visible = not v3,
            ZIndex = a1.ZIndex or 1,
        }, {
            uIAspectRatioConstraint = createElement("UIAspectRatioConstraint"),
            children = createElement(Fragment, nil, a1.children),
            player = createElement(Player, {
                useWorldModel = true,
                origin = (CFrame.new(0, 0, -500)) * CFrame.Angles(0, 3.141592653589793, 0),
                onPlayerCharacter = function(a1) -- Line: 181 -- upvalues: u23 (val), u20 (val), u24 (val)
                    if a1 == u23 then
                        return
                    end
                    local PrimaryPart = a1.PrimaryPart
                    local Humanoid = a1:FindFirstChildOfClass("Humanoid")
                    local v1 = if not PrimaryPart or not Humanoid then Vector3.new(0, a1:GetExtentsSize().Y / 2, 0) else Vector3.new(0, 0.5 * PrimaryPart.Size.Y + Humanoid.HipHeight, 0)
                    u20((CFrame.new(0, 0, -500) - v1) * CFrame.Angles(0.3490658503988659, 0, 0))
                    u24(a1)
                end,
            }),
            shadow = shadow and u23 and u27 and createElement("Part", {
                Anchored = true,
                CanCollide = false,
                CanQuery = false,
                CanTouch = false,
                EnableFluidForces = false,
                Size = Vector3.new(5.5, 0.0010000000474974513, 5.5),
                Transparency = 1,
                BottomSurface = Enum.SurfaceType.Smooth,
                CFrame = v2,
                TopSurface = Enum.SurfaceType.Smooth,
            }, {
                decal = createElement("Decal", {
                    Texture = "rbxassetid://10382196373",
                    Transparency = 0.4,
                    Face = Enum.NormalId.Top,
                }),
            }),
        }),
        loader = v3 and createElement(Loader, {
            BackgroundTransparency = 1,
            Visible = v3,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(100, 100),
            AnchorPoint = Vector2.new(0.5, 0.5),
        }),
    })
end

local function IconEmotePreview(a1) -- Line: 233
    -- upvalues: useState (val), useEffect (val), u59 (val), NewEmotes (val), createElement (val), ImageLabel (val)
    -- upvalues: Fragment (val)
    local name = a1.name
    local playing = if a1.playing == nil then true else a1.playing
    local v1, u8 = useState(nil)
    local v2, u12 = useState(true)
    local v3 = v1 and tonumber(v1.Icon)
    local v4 = {name, playing}
    useEffect(function() -- Line: 242
        -- upvalues: u8 (val), u59 (upval), name (val), u12 (val), NewEmotes (upval), a1 (val), playing (val)
        local u2 = task.spawn(function() -- Line: 245
            -- upvalues: u8 (upval), u59 (upval), name (upval), u12 (upval), NewEmotes (upval), a1 (upval)
            -- upvalues: playing (upval)
            u8(nil)
            if not u59[name] then
                u12(true)
                u59[name] = true
            end
            local v1 = NewEmotes(a1.name)
            if playing and v1 ~= nil then
                u8(v1)
                u12(false)
                return
            end
            u8(v1)
            u12(false)
        end)
        return function() -- Line: 270 -- upvalues: u2 (val)
            task.cancel(u2)
        end
    end, v4)
    v4 = {
        BackgroundTransparency = 1,
        Size = a1.Size,
        Position = a1.Position,
        AnchorPoint = a1.AnchorPoint,
        Visible = a1.Visible,
        ZIndex = a1.ZIndex or 1,
        LayoutOrder = a1.LayoutOrder,
    }
    local v5 = {}
    local v6 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.8, 0.8),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    v6.Image = v3 and ("rbxassetid://%*"):format(v3) or ""
    v6.ImageTransparency = a1.ImageTransparency
    v6.imageLoading = v2
    v6.ScaleType = Enum.ScaleType.Fit
    v6.ZIndex = a1.ZIndex or 1
    v5.content = createElement(ImageLabel, v6, {children = createElement(Fragment, nil, a1.children)})
    return createElement("Frame", v4, v5)
end

return memo(function(a1) -- Line: 300
    -- upvalues: createElement (val), LiveEmotePreivew (val), IconEmotePreview (val)
    return createElement((if a1.playing == nil then true else a1.playing) and LiveEmotePreivew or IconEmotePreview, a1, a1.children)
end)