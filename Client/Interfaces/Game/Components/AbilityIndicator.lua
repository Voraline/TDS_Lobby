-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.AbilityIndicator
-- Decompile time: 3.88 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState
local useRef = React.useRef

local function useCharacterRoot() -- Line: 12 -- upvalues: useState (val), useEffect (val), Players (val)
    local v1, u3 = useState(nil)
    useEffect(function() -- Line: 15 -- upvalues: u3 (val), Players (upval)
        local function onCharacterAdded(a1) -- Line: 16 -- upvalues: u3 (upval) -- types: a1: userdata?
            if not a1 then
                u3(nil)
                return
            end
            u3(a1:FindFirstChild("HumanoidRootPart") or a1:WaitForChild("HumanoidRootPart", 5))
        end

        local u7 = Players.LocalPlayer.CharacterAdded:Connect(onCharacterAdded)
        task.spawn(onCharacterAdded, Players.LocalPlayer.Character)
        return function() -- Line: 31 -- upvalues: u7 (val)
            u7:Disconnect()
        end
    end, {})
    return v1
end

return function(a1) -- Line: 39 -- upvalues: useState (val), useEffect (val), Players (val), useRef (val), createElement (val)
    local Icon = a1.Icon
    local Target = a1.Target
    local v1, u6 = useState(nil)
    useEffect(function() -- Line: 15 -- upvalues: u6 (val), Players (upval)
        local function onCharacterAdded(a1) -- Line: 16 -- upvalues: u6 (upval) -- types: a1: userdata?
            if not a1 then
                u6(nil)
                return
            end
            u6(a1:FindFirstChild("HumanoidRootPart") or a1:WaitForChild("HumanoidRootPart", 5))
        end

        local u7 = Players.LocalPlayer.CharacterAdded:Connect(onCharacterAdded)
        task.spawn(onCharacterAdded, Players.LocalPlayer.Character)
        return function() -- Line: 31 -- upvalues: u7 (val)
            u7:Disconnect()
        end
    end, {})
    local u11 = v1
    local u16 = false
    if u11 ~= nil then
        u16 = false
        if Target ~= nil then
            u16 = a1.Visible ~= false
        end
    end
    local u18 = useRef()
    local v2 = useRef()
    local u22 = useRef()
    local u24 = useRef()
    local v3 = useRef()
    local u28 = useRef()
    if Target and Target:IsA("Model") then
        Target = Target.PrimaryPart
    end
    local v4 = {Target, u11, u16}
    useEffect(function() -- Line: 58 -- upvalues: u18 (val), u22 (val), u24 (val), u28 (val), u16 (val), Target (ref), u11 (val)
        local current = u18.current
        local current_2 = u22.current
        local current_3 = u24.current
        local current_4 = u28.current
        if current_3 and current and current_2 and current_4 then
            if not u16 then
                current_4.Part1 = nil
                current_2.Part1 = nil
            end
            current_4.Part1 = Target
            current_2.Part1 = u11
            return
        end
    end, v4)
    return (createElement("Folder", {Name = "AbilityIndicator"}, {
        from = createElement("Part", {
            CanCollide = false,
            CanQuery = false,
            CanTouch = false,
            Size = Vector3.new(1, 1, 1),
            Transparency = 1,
            BottomSurface = Enum.SurfaceType.Smooth,
            Anchored = u11 == nil,
            TopSurface = Enum.SurfaceType.Smooth,
            ref = u18,
        }, {
            attachment = createElement("Attachment", {CFrame = CFrame.new(), ref = v2}, {
                beam = createElement("Beam", {
                    FaceCamera = true,
                    LightEmission = 0.5,
                    Segments = 1,
                    Texture = "rbxassetid://142506854",
                    TextureLength = 2.25,
                    TextureSpeed = 2,
                    Width0 = 3,
                    Width1 = 3,
                    Enabled = u16,
                    TextureMode = Enum.TextureMode.Static,
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0),
                        (NumberSequenceKeypoint.new(1, 0)),
                    }),
                    Attachment0 = v2.current,
                    Attachment1 = v3.current,
                }),
            }),
            weldConstraint = createElement("Weld", {Part0 = u18, ref = u22}),
        }),
        to = createElement("Part", {
            CanCollide = false,
            CanQuery = false,
            CanTouch = false,
            Size = Vector3.new(1, 1, 1),
            Transparency = 1,
            BottomSurface = Enum.SurfaceType.Smooth,
            TopSurface = Enum.SurfaceType.Smooth,
            Anchored = Target == nil,
            ref = u24,
        }, {
            attachment1 = createElement("Attachment", {CFrame = CFrame.new(), ref = v3}, {
                billboardGui = createElement("BillboardGui", {
                    Active = true,
                    AlwaysOnTop = true,
                    Enabled = u16,
                    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
                    Size = UDim2.fromScale(2, 2),
                }, {
                    bounding = createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        Rotation = 45,
                        ZIndex = 5,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        Position = UDim2.fromScale(0.5, 0.5),
                        Size = UDim2.fromScale(1, 1),
                    }, {
                        uIStroke = createElement("UIStroke", {
                            Thickness = 6,
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                            Color = Color3.fromRGB(255, 255, 255),
                            LineJoinMode = Enum.LineJoinMode.Miter,
                        }),
                    }),
                    imageButton = createElement("ImageButton", {
                        BackgroundTransparency = 1,
                        Image = Icon,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        Position = UDim2.fromScale(0.5, 0.5),
                        Size = UDim2.fromScale(0.8, 0.8),
                    }),
                }),
            }),
            weldConstraint1 = createElement("Weld", {Part0 = u24, ref = u28}),
        }),
    }))
end