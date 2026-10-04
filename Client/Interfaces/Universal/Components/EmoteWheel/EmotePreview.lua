-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.EmoteWheel.EmotePreview
-- Decompile time: 7.05 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CustomAccessories = require(ReplicatedStorage.Shared.Modules.CustomAccessories)
local NewEmotes = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.NewEmotes)
local EmoteReplicator = require(ReplicatedStorage.Client.Modules.Replicators.EmoteReplicator)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local Player = require(ReplicatedStorage.Client.Interfaces.Components.Player)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useState = React.useState
local useEffect = React.useEffect
local useRef = React.useRef
local memo = React.memo
local LocalPlayer = Players.LocalPlayer
return memo(function(a1) -- Line: 19
    -- upvalues: useRef (val), useState (val), ReplicatedStorage (val), NewEmotes (val), useEffect (val)
    -- upvalues: LocalPlayer (val), CustomAccessories (val), EmoteReplicator (val), createElement (val), React (val)
    -- upvalues: ImageLabel (val), Player (val)
    local name = a1.name
    local transparency = a1.transparency
    local u5 = a1.active == true
    local v1 = useRef(nil)
    local u11, u12 = useState(nil)
    local u24 = if not ReplicatedStorage.Assets.Emotes:FindFirstChild(name) then nil else NewEmotes(name)
    local v2 = {name, u5, u11}
    useEffect(function() -- Line: 31
        -- upvalues: u11 (val), u24 (val), u5 (val), LocalPlayer (upval), CustomAccessories (upval)
        -- upvalues: EmoteReplicator (upval), name (val)
        if u11 and u24 ~= nil and u5 then
            if not u11:FindFirstChild("Humanoid") then
                return
            end
            local u8 = {}
            local v1 = {
                Humanoid = u11.Humanoid,
                Animator = u11.Humanoid.Animator,
                Root = u11.PrimaryPart,
                Instance = u11,
                Player = {
                    Character = u11,
                    UserId = LocalPlayer.UserId,
                    SetAttribute = function(a1, a2, a3) -- Line: 52 -- upvalues: u8 (val)
                        u8[a2] = a3
                    end,
                    GetAttribute = function(a1, a2) -- Line: 55 -- upvalues: u8 (val)
                        return u8[a2]
                    end,
                },
                StopEmoting = function() end,
                AddAccessories = function(a1, a2) -- Line: 61 -- upvalues: CustomAccessories (upval), u11 (upval)
                    return CustomAccessories.AddAccessories(u11, a2)
                end,
            }
            local u30 = EmoteReplicator.new(v1, name)
            u30.Preview = true
            u30.Sound = nil
            u30:Play(0)
            return function() -- Line: 71 -- upvalues: u30 (val)
                if u30 then
                    u30:Destroy()
                end
            end
        end
    end, v2)
    local Fragment = React.Fragment
    local v3 = {
        camera = createElement("Camera", {FieldOfView = 1, CFrame = CFrame.new(), ref = v1}),
    }
    v3.image = if u5 then nil else createElement(ImageLabel, {
        BackgroundTransparency = 1,
        Selectable = true,
        Image = ("rbxassetid://%*"):format(u24 and u24.Icon or 0),
        ImageTransparency = transparency:map(function(a1) -- Line: 88
            return 1 - a1
        end),
        Ambient = Color3.fromRGB(240, 240, 240),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(48, 48, 48),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.85, 0.85),
    })
    v3.viewport = if not u5 then nil else createElement("ViewportFrame", {
        BackgroundTransparency = 1,
        Selectable = true,
        ZIndex = 2,
        ImageTransparency = transparency:map(function(a1) -- Line: 104
            return 1 - a1
        end),
        Ambient = Color3.fromRGB(240, 240, 240),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(48, 48, 48),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        CurrentCamera = v1,
    }, {
        uIAspectRatioConstraint1 = createElement("UIAspectRatioConstraint"),
        player = createElement(Player, {
            useWorldModel = true,
            onPlayerCharacter = function(a1) -- Line: 121 -- upvalues: u11 (val), u12 (val)
                if u11 ~= a1 then
                    u12(a1)
                    a1.DescendantAdded:Connect(function(a1) -- Line: 125
                        if a1:IsA("Sound") then
                            a1.Volume = 0
                        end
                    end)
                end
            end,
            origin = (CFrame.new(0, 0, -400)) * CFrame.Angles(0, 3.141592653589793, 0),
        }),
    })
    return createElement(Fragment, {}, v3)
end)