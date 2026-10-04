-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Components.ItemPreview
-- Decompile time: 41.04 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Shared = ReplicatedStorage.Shared
local UI = Shared.UI
local Components = UI.Components
local Parent = script.Parent
local Assets = ReplicatedStorage:WaitForChild("Assets")
local Emotes = Assets:WaitForChild("Emotes")
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local Promise = require(ReplicatedStorage.Shared.Modules.Promise)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local Fusion = require(Shared.UI.Fusion)
local Source = require(Parent.Parent:FindFirstChild("Source"))
local Hydrate = Fusion.Hydrate
local Children = Fusion.Children
local Computed = Fusion.Computed
local Cleanup = Fusion.Cleanup
local Value = Fusion.Value
local New = Fusion.New
local Streaming = Network.Channel("Streaming")
PlayerCharacter = require(script.Parent.PlayerCharacter)
RichText = require(script.Parent.RichText)
Animation = require(Components.AnimationInstance)
Binder = require(Components.Binder)
Viewport = require(Parent.Viewport)
Presentations = require(UI.ItemPresentations)
local ItemPreview = Source.ItemPreview
local u103 = {}
local u108 = Color3.fromRGB(30, 30, 30)

local function attachAccessory(a1, a2) -- Line: 45 -- types: a1: userdata, a2: userdata
    local Handle = a2:FindFirstChild("Handle")
    local Attachment = Handle and Handle:FindFirstChildOfClass("Attachment")
    if not Attachment then
        return
    end
    local v1 = a1.Parent:FindFirstChild(Attachment.Name, true)
    if v1 and v1:IsA("Attachment") then
        local Weld = Instance.new("Weld")
        Weld.Name = "AccessoryWeld"
        Weld.Part0 = Handle
        Weld.Part1 = v1.Parent
        Weld.C0 = Attachment.CFrame
        Weld.C1 = v1.CFrame
        Weld.Parent = Handle
        return
    end
end

local u110 = {}

function u110.Towers(a1, a2) -- Line: 71
    local Animations = a2 and a2:FindFirstChild("Animations")
    local Idle = Animations and Animations:FindFirstChild("Idle")
    if Idle then
        return Idle:FindFirstChild("0") or Idle:GetChildren()[1]
    end
end

function u110.Crates(a1, a2, a3) -- Line: 79
    if not a2 then
        return
    end
    local Key = a2:FindFirstChild("Key")
    if Key and Key:IsA("BasePart") then
        Key:Destroy()
    end
    local Animation = Instance.new("Animation")
    Animation.AnimationId = ("rbxassetid://%*"):format(a3.Animation)
    Animation:SetAttribute("Time", a3.Time or 0)
    return Animation
end

function u110.Emotes(a1, a2) -- Line: 96 -- upvalues: Emotes (val), attachAccessory (val)
    local v1 = Emotes:FindFirstChild(a1)
    if not v1 then
        return
    end
    local Accessories = v1:FindFirstChild("Accessories")
    if Accessories then
        local v2
        for i, v in ipairs(Accessories:GetChildren()) do
            v2 = v:Clone()
            v2.Parent = a2
            attachAccessory(a2.Humanoid, v2)
        end
    end
    return v1:Clone()
end

local u114 = {}

function u114.Towers(a1, a2, a3, a4, a5, a6) -- Line: 115
    local v1 = if not a6 then CFrame.new(0, 0, 4.5) else CFrame.new(0, 2, 25)
    a2.FieldOfView = if not a6 then 58 else 10
    a2.CFrame = a5 * v1 * CFrame.Angles(-0.08726646259971647, 0, 0)
end

function u114.Crates(a1, a2, a3, a4, a5, a6) -- Line: 121
    local CameraOffset = a4.CameraOffset or CFrame.new()
    local v1 = CameraOffset.Z or 1
    local CrateRotation = a4.CrateRotation or CFrame.new()
    local v2 = Vector3.new(if not a6 then -3 else 40, if not a6 then 3 else 20, (a1:GetFitDistance() + 1 - v1) * (if not a6 then 1 else 18))
    a2.FieldOfView = if not a6 then 58 else 10
    local v3 = CFrame.new(v2, (Vector3.new(0, 0, 0)))
    local new = CFrame.new
    a2.CFrame = v3 * new(0, if not a6 then 0 else 0.5, 0)
    a3:PivotTo((CFrame.Angles(0, 3.141592653589793, 0)) * CrateRotation)
end

function u114.Emotes(a1, a2, a3, a4, a5) -- Line: 137
    a2.FieldOfView = 58
    a2.CFrame = a5 * CFrame.new(0, -0.8, 0) * CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(Vector3.new(2, 0, 10), (Vector3.new(0, 0, 0)))
end

function u114.Charms(a1, a2, a3, a4, a5, a6) -- Line: 145 -- upvalues: u103 (val)
    local v1 = if not a6 then CFrame.new(0, 2, 8.5) else CFrame.new(0, 3, 25)
    a2.FieldOfView = if not a6 then 58 else 10
    a2.CFrame = a5 * v1 * CFrame.Angles(-0.08726646259971647, 0, 0)
    if a6 then
        a3:PivotTo((CFrame.Angles(0, -0.4363323129985824, 0)))
        return
    end
    a3:PivotTo((CFrame.new(0, 0.8, 3)))
    u103[a3] = true
    local u46 = nil
    local v2 = a3.AncestryChanged:Connect(function(a1, a2) -- Line: 155 -- upvalues: u46 (ref), u103 (upval), a3 (val)
        if a2 then
            return
        end
        u46:Disconnect()
        u103[a3] = nil
    end)
end

function u114.Tags(a1, a2, a3, a4, a5, a6) -- Line: 168
    a2.FieldOfView = if not a6 then 58 else 10
    local v1 = a5 * CFrame.Angles(0, 3.141592653589793, 0)
    local new = CFrame.new
    a2.CFrame = v1 * new(if not a6 then 0.6 else 0, if not a6 then -0.6 else -3, if not a6 then 10.5 else 70)
end

RunService:UnbindFromRenderStep("UPDATE_MODEL_ROTATION")
RunService:BindToRenderStep("UPDATE_MODEL_ROTATION", Enum.RenderPriority.First.Value, function(a1) -- Line: 180 -- upvalues: u103 (val) -- types: a1: number
    local v1
    for i in u103 do
        v1 = (i:GetPivot()) * (CFrame.Angles(0, a1 / 4, 0))
        i:PivotTo(v1)
    end
end)

local function ItemGetter(a1, a2, ...) -- Line: 187
    local v1 = a2 and a1[a2]
    if v1 then
        return v1(...)
    end
end

local function getSkin(a1, a2, a3) -- Line: 194
    -- upvalues: Assets (val), Streaming (val), Asset (val)
    local v1 = a3 or "Default"
    if not a2 then
        return nil
    end
    local Preview_2 = nil
    local Model = nil
    local v2 = Assets:FindFirstChild(if a1 ~= "Towers" then if a1 ~= "Charms" then a1 else "Totems" else "Troops")
    if a1 == "Towers" then
        Streaming:FireServer("SelectTower", a2, v1)
    end
    local v3 = v2 and v2:WaitForChild(a2, 30)
    if not v3 then
        if a1 == "Tags" then
            Model = PlayerCharacter.getCharacter()
        end
    else
        local v4
        if a1 == "Towers" then
            v4 = Asset("Troops", a2)
            local v5 = Asset("TroopsModel", a2, v1)
            local Preview = v4.Properties.Preview
            Preview_2 = {Offset = Preview.TowerOffset, Rotation = Preview.TowerRotation}
            Model = v5
        elseif a1 == "Crates" then
            v4 = Asset("NewCrates", a2)
            assert(v4, "Crate '" .. a2 .. "' does not exist")
            Model = v4.Model
            Preview_2 = v4.Preview
            Preview_2.Animation = v4.Animation
            Preview_2.IsAnimated = v4.Animated
        elseif a1 == "Emotes" then
            Model = PlayerCharacter.getCharacter()
            Preview_2 = Asset("NewEmotes", a2)
        elseif a1 == "Charms" then
            Model = v3
            Preview_2 = Asset("NewTotems", a2)
        end
    end
    if Model then
        Model = Model:Clone()
        Model:PivotTo((CFrame.new()))
    end
    return Model, Preview_2
end

local function getAnimation(a1, a2, a3, a4, a5, a6) -- Line: 253
    -- upvalues: ItemGetter (val), u110 (val)
    local v1
    if not a4 then
        return nil
    end
    local CurrentCamera = workspace.CurrentCamera
    local Parent = a4.Parent
    if not a4:IsDescendantOf(workspace) then
        a4.Parent = CurrentCamera
    end
    local v2 = nil
    local v3 = nil
    if a2 then
        local v4 = Presentations(a1, a2)
        if v4 and v4.Animation then
            v2 = v4.Animation(a4)
        end
    end
    if not v2 then
        v2 = ItemGetter(u110, a1, a2, a4, a3)
    end
    if not v2 then
        v1 = a5
    else
        local AnimationController = a4:FindFirstChild("AnimationController") or a4:FindFirstChildOfClass("Humanoid")
        if not AnimationController then
            v1 = a5
        else
            v1 = if a1 ~= "Crates" then a5 else true
            v3 = Animation({
                Track = v2,
                TimePosition = v2:GetAttribute("Time"),
                Paused = v1,
                Dynamic = a6,
                Target = AnimationController,
            })
        end
    end
    if v1 == true then
        for i, v in ipairs(a4:GetDescendants()) do
            if v:IsA("Motor6D") then
                v.MaxVelocity = 0
            end
        end
    end
    if a4.Parent == CurrentCamera then
        a4.Parent = Parent
    end
    return v3
end

return function(a1) -- Line: 320
    -- upvalues: ItemPreview (val), Value (val), u108 (val), Signal (val), Hydrate (val), Computed (val), Cleanup (val)
    -- upvalues: Children (val), u114 (val), table (val), Promise (val), getSkin (val), Players (val), Asset (val)
    -- upvalues: New (val), getAnimation (val), TweenService (val)
    local u1 = {}
    local u5 = ItemPreview:Clone()
    local u6 = nil
    local u8 = nil
    local u9 = nil
    local u10 = nil
    local u11 = nil
    local u12 = {}
    local Flat = if a1.Flat == nil then false else a1.Flat
    local Preview = a1.Preview
    if not Preview then
        Preview = Value({})
    end
    local Dynamic = a1.Dynamic
    local IsPreview = a1.IsPreview
    if not IsPreview then
        IsPreview = Value(false)
    end
    local u30 = a1.PauseAnimation == true
    local Visible = a1.Visible
    if not Visible then
        Visible = Value(true)
    end
    local CameraOffset = a1.CameraOffset
    if not CameraOffset then
        CameraOffset = Value(CFrame.new())
    end
    local PreviewColor = a1.PreviewColor
    if not PreviewColor then
        PreviewColor = Value(u108)
    end
    local u50 = Value(CFrame.new())
    local u54 = Value(CFrame.new())
    local u57 = Value(1)
    local u60 = Signal.new()
    local u65 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local u70 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local Position = if not a1.Position then Value(u5.Position) else if type(a1.Position) ~= "table" then Value(a1.Position) else if not a1.Position.get then Value(a1.Position) else a1.Position
    local Shadow = u5.Shadow
    if a1.IgnoreShadow then
        Shadow:Destroy()
        Shadow = nil
    end
    local v1 = Hydrate(u5)
    local v2 = {
        Size = a1.Size,
        AnchorPoint = a1.AnchorPoint,
        ImageTransparency = a1.ImageTransparency,
        ZIndex = a1.ZIndex,
        Visible = a1.Visible,
        Active = a1.Active,
        Position = Position,
    }
    v2.LightColor = Computed(function() -- Line: 376 -- upvalues: IsPreview (val), PreviewColor (val)
        if IsPreview:get() then
            return PreviewColor:get()
        end
        return Color3.fromRGB(140, 140, 140)
    end)
    v2.Ambient = Computed(function() -- Line: 384 -- upvalues: IsPreview (val), PreviewColor (val)
        if IsPreview:get() then
            return PreviewColor:get()
        end
        return Color3.fromRGB(200, 200, 200)
    end)
    v2[Cleanup] = {
        function() -- Line: 393 -- upvalues: u9 (ref), u8 (ref), u60 (val), u6 (ref), u1 (val)
            if u9 then
                u9:Destroy()
                u9 = nil
            end
            if u8 then
                u8:Destroy()
                u9 = nil
            end
            u60:Destroy()
            u6:Destroy()
            u6 = nil
            for i, v in ipairs(u1) do
                v()
            end
        end,
    }
    local v3 = Children
    local v4 = {}
    local v5 = Hydrate(u5.Preview)
    local v6 = {Active = a1.Active}
    v6.Visible = not a1.HidePreviewText and a1.IsPreview or false
    v6.Text = a1.PreviewText or "PREVIEW"
    local v7 = v5(v6) or nil
    v5 = Shadow
    if v5 then
        v5 = Hydrate(Shadow)
        v6 = {
            Size = Computed(function() -- Line: 422 -- upvalues: u57 (val)
                return Vector3.new(1, 0, 1) * (u57:get() * 2)
            end),
            CFrame = u54,
        }
        local v8 = Children
        v6[v8] = {
            Hydrate(Shadow.Decal)({
                Transparency = Computed(function() -- Line: 431 -- upvalues: a1 (val), Preview (val)
                    local Shadow = a1.Shadow
                    local v1 = Preview:get()
                    if v1 and v1.Type then
                        if v1.Type == "Charms" then
                            return 0.25
                        end
                        if typeof(Shadow) == "table" and Shadow:get() or Shadow then
                            return 1
                        end
                        return 0
                    end
                    return 1
                end),
            }),
        }
        v5 = v5(v6)
    end
    v4[1] = v7
    v4[2] = v5
    v4[3] = a1[Children]
    v2[v3] = v4
    local u263 = v1(v2)

    local function stepCamera(a1, a2, a3, a4, a5) -- Line: 455
        -- upvalues: u114 (upval), u6 (ref), u12 (ref), Flat (val)
        local v1 = u114[a2]
        if v1 and u6 then
            local v2 = a4 * a5
            v1(u6, u6:GetCamera(), a1, u12, v2, Flat)
            return
        end
    end

    u6 = Viewport.new(u263, u30)
    local u311 = tick()
    table.insert(u1, Binder(Preview, function(a1_2) -- Line: 470
        -- upvalues: u10 (ref), u8 (ref), u9 (ref), u11 (ref), u12 (ref), u311 (ref), Promise (upval), getSkin (upval)
        -- upvalues: Flat (val), Players (upval), a1 (val), Asset (upval), New (upval), Children (upval), u263 (val)
        -- upvalues: u50 (val), u57 (val), u54 (val), u6 (ref), Visible (val), CameraOffset (val), u114 (upval)
        -- upvalues: u30 (val), Dynamic (val), getAnimation (upval), u60 (val)
        if u10 and a1_2 and u10.Type == a1_2.Type and u10.Item == a1_2.Item and u10.Skin == a1_2.Skin then
            return
        end
        u10 = a1_2
        if u8 then
            u8:Destroy()
            u8 = nil
        end
        if u9 then
            u9:Destroy()
            u9 = nil
        end
        if u11 then
            u11:Destroy()
            u11 = nil
        end
        if not a1_2 then
            return
        end
        local Type = a1_2.Type
        local Item = a1_2.Item
        local Skin = a1_2.Skin
        local Preview = a1_2.Preview
        if not Preview then
            Preview = {}
        end
        if Type and Item then
            u12 = Preview
            local u42 = CFrame.new()
            local u44 = CFrame.new()
            u311 = tick()
            local u47 = u311
            ;((Promise.new(function(a1) -- Line: 519 -- upvalues: getSkin (upval), Type (val), Item (val), Skin (val)
                a1(getSkin(Type, Item, Skin))
            end)):andThen(function(a1_3, a2) -- Line: 524
                -- upvalues: u47 (val), u311 (upval), Type (val), Item (val), Promise (upval), Flat (upval)
                -- upvalues: Players (upval), a1_2 (val), a1 (upval), Asset (upval), u11 (upval), New (upval)
                -- upvalues: Children (upval), u263 (upval), u50 (upval), u57 (upval), u42 (ref), u44 (ref), u8 (upval)
                -- upvalues: u12 (upval), Preview (val), u54 (upval), u6 (upval), Visible (upval), CameraOffset (upval)
                -- upvalues: u114 (upval), u30 (upval), Dynamic (upval), u9 (upval), getAnimation (upval), u60 (upval)
                local v1, v2, v3, v4, v5, v6, v7
                if u47 ~= u311 then
                    if a1_3 then
                        a1_3:Destroy()
                    end
                    return
                end
                if a1_3 then
                    local u10 = Presentations(Type, Item)
                    if u10 and u10.Init then
                        v1, v2 = Promise.new(function(a1) -- Line: 535 -- upvalues: u10 (val), a1_3 (ref), a2 (val), Flat (upval)
                            a1(u10.Init(a1_3, a2, Flat))
                        end):timeout(
                            2,
                            "Timeout"
                        ):await()
                        if not v1 then
                            a1_3:Destroy()
                            a1_3 = nil
                            warn("Failed to init renderer for " .. Type .. " " .. Item, v2)
                        elseif v2 then
                            a1_3 = v2
                        end
                    end
                end
                if a1_3 and Type == "Tags" then
                    local DisplayName = Players.LocalPlayer.DisplayName
                    local Text = if not a1_2.Text then ("@%*"):format(DisplayName) else a1_2.Text
                    local Position = a1_2.Position or a1.Flat and UDim2.fromScale(0.5, 0) or UDim2.fromScale(0.5, 0.17)
                    if a1.Seasons then
                        Position = Position + UDim2.fromScale(0, 0.4)
                    end
                    if not a1_2.Flair then
                        v3 = if not a1.IsPreview or not a1.IsPreview:get() then string.format("<%s>%s</%s>", Item:lower(), Text, Item:lower()) else string.format("<default>%s</default>", Text)
                        v4 = RichText
                        v5 = {Animated = false, Position = Position}
                        local Size_2 = a1_2.Size or UDim2.fromScale(1, 0.05)
                        v5.Size = Size_2
                        v6 = a1.Flat and Vector2.new(0.5, 0) or Vector2.new(0.5, 0.5)
                        v5.AnchorPoint = v6
                        v5.Text = v3
                        u11 = v4(v5)
                    else
                        v3 = Asset("Flairs", a1_2.Preview.Name)
                        assert(v3, (("Flair \"%*\" not found"):format(a1_2.Preview.Name)))
                        local strokeColor = v3.strokeColor
                        local strokeColorRotation = v3.strokeColorRotation
                        local strokeTransparency = v3.strokeTransparency
                        v7 = v3.strokeWidth or 0
                        local TextLabel = New("TextLabel")
                        local v8 = {Position = Position}
                        local Size = a1_2.Size or UDim2.fromScale(1, 0.05)
                        v8.Size = Size
                        local v9 = a1.Flat and Vector2.new(0.5, 0) or Vector2.new(0.5, 0.5)
                        v8.AnchorPoint = v9
                        v8.Text = Text
                        v8.TextColor3 = Color3.new(1, 1, 1)
                        v8.TextScaled = true
                        v8.Font = Enum.Font.GothamBold
                        v8.BackgroundTransparency = 1
                        v9 = Children
                        local v10 = {}
                        local UIGradient = New("UIGradient")
                        local v11 = {Color = v3.color, Rotation = v3.colorRotation or 90}
                        local v12 = UIGradient(v11)
                        if not (v7 <= 0) then
                            local UIStroke_2 = New("UIStroke")
                            local v13 = {Color = Color3.new(1, 1, 1), Thickness = 3}
                            local v14 = Children
                            v13[v14] = (New("UIGradient")({
                                Transparency = strokeTransparency or NumberSequence.new(0),
                                Color = strokeColor or ColorSequence.new(Color3.new(0, 0, 0)),
                                Rotation = strokeColorRotation or 90,
                            }))
                            v11 = UIStroke_2(v13)
                        else
                            v11 = New("UIStroke")({Transparency = 0.5, Thickness = 3, Color = Color3.new()})
                        end
                        v10[1] = v12
                        v10[2] = v11
                        v8[v9] = v10
                        u11 = TextLabel(v8)
                    end
                    u11.Parent = u263
                end
                local CFrame_2 = CFrame.new()
                if a1_3 then
                    local HumanoidRootPart = a1_3:FindFirstChild("HumanoidRootPart")
                    if HumanoidRootPart then
                        CFrame_2 = HumanoidRootPart.CFrame
                    end
                end
                u50:set(CFrame_2)
                if a2 then
                    local ShadowRadius = 2
                    if Type == "Towers" then
                        ShadowRadius = 1
                    end
                    if a2.ShadowRadius then
                        ShadowRadius = a2.ShadowRadius
                    end
                    u57:set(ShadowRadius)
                    v3 = CFrame.new(a2.Offset or Vector3.new(0, 0, 0))
                    local Rotation = a2.Rotation or CFrame.new(0, 0, 0)
                    u42 = v3 * Rotation
                end
                if a1_3 then
                    local HeightOffset = a1_3:FindFirstChild("HeightOffset", true)
                    if HeightOffset then
                        u44 = HeightOffset.WorldCFrame
                    elseif a1_3:IsA("Model") then
                        local new_3
                        local PrimaryPart = a1_3.PrimaryPart
                        local Humanoid = a1_3:FindFirstChildOfClass("Humanoid")
                        if Type ~= "Crates" then
                            if Humanoid and PrimaryPart then
                                v4 = 0.5 * PrimaryPart.Size.Y + Humanoid.HipHeight
                                new_3 = CFrame.new
                                u44 = new_3(PrimaryPart and PrimaryPart.Position or Vector3.new(0, 0, 0)) * CFrame.new(0, -v4, 0)
                            end
                        elseif PrimaryPart then
                            u44 = CFrame.new(0, -PrimaryPart.Size.Y / 2, 0)
                        elseif Humanoid and PrimaryPart then
                            v4 = 0.5 * PrimaryPart.Size.Y + Humanoid.HipHeight
                            new_3 = CFrame.new
                            u44 = new_3(PrimaryPart and PrimaryPart.Position or Vector3.new(0, 0, 0)) * CFrame.new(0, -v4, 0)
                        end
                    end
                end
                u8 = a1_3
                u54:set(u44)
                if u6 then
                    if not a1_3 or not Visible:get() then
                        u6:SetOffset(u42)
                    else
                        u6:SetModel(a1_3, u42)
                    end
                end
                v1 = a1_3
                v2 = Type
                v5 = CameraOffset:get(false)
                v6 = u114[v2]
                if v6 and u6 then
                    v7 = CFrame_2 * v5
                    v6(u6, u6:GetCamera(), v1, Preview, v7, Flat)
                end
                if a2 then
                    if Item ~= "Pursuit" or not u30 or Dynamic then
                        u9 = getAnimation(Type, Item, a2, a1_3, u30, Dynamic)
                    end
                end
                if a1_3 then
                    u60:Fire()
                end
            end)):catch(warn)
            return
        end
    end))
    table.insert(u1, Binder(Visible, function(a1) -- Line: 729 -- upvalues: u8 (ref), u6 (ref)
        if not u8 then
            return
        end
        if a1 then
            u6:SetModel(u8)
            return
        end
        u6:SetModel()
    end))
    u60:Connect(function() -- Line: 744 -- upvalues: a1 (val), Position (ref), u5 (val), TweenService (upval), u70 (val), u65 (val)
        if isPlaying or a1.IgnoreAnimation then
            return
        end
        isPlaying = true
        local v1 = Position:get() or UDim2.fromScale(0, 0)
        u5.Position = (UDim2.new(v1.X.Scale, v1.X.Offset, v1.Y.Scale, v1.Y.Offset + 50))
        u5.ImageTransparency = 1
        TweenService:Create(u5, u70, {ImageTransparency = 0}):Play()
        TweenService:Create(u5, u65, {Position = v1}):Play()
        task.delay(0.3, function() -- Line: 773
            isPlaying = false
        end)
    end)
    return u263
end