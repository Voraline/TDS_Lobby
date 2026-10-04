-- Script path: ReplicatedStorage.Client.Controllers.Lobby.XmasGiftController
-- Decompile time: 23.17 ms

local CollectionService = game:GetService("CollectionService")
game:GetService("ContentProvider")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
game:GetService("UserInputService")
local XmasGifts = (ReplicatedStorage:WaitForChild("Assets")):WaitForChild("XmasGifts")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local XmasGifts_2 = require(ReplicatedStorage.Shared.Data.XmasGifts)
local Cache = require(ReplicatedStorage.Client.Modules.Cache)
local InstanceButton = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Components.InstanceButton)
local DialogStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.DialogStore)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local Promise = require(ReplicatedStorage.Shared.Modules.Promise)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local SpringClass = require(ReplicatedStorage.Shared.Modules.Standalone.SpringClass)
local XmasGifts_3 = Network.Channel("XmasGifts")
local LightingController = require(ReplicatedStorage.Client.Controllers.Shared.LightingController)
local UnboxingController = require(ReplicatedStorage.Client.Controllers.Shared.UnboxingController)
local u135 = {
    Unclaimed = {},
    Claimed = {},
    Assets = {},
    Rendered = {},
    Gifts = {},
    ClickDetectors = {},
    DisplayScreenGui = nil,
}
local u143 = false

local function addGiftInteraction(a1, a2, a3) -- Line: 49
    -- upvalues: XmasGifts_2 (val), Create (val), u135 (val), LocalPlayer (val), RunService (val), u143 (ref)
    -- upvalues: XmasGifts_3 (val)
    local v1 = XmasGifts_2[a1]
    if v1 == nil then
        return
    end
    local v2 = {
        Name = "BillboardGui",
        Active = true,
        AlwaysOnTop = true,
        Enabled = false,
        LightInfluence = 1,
        Size = UDim2.fromOffset(128, 128),
        StudsOffsetWorldSpace = Vector3.new(0, 3, 0),
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    }
    v2[1] = (Create("ImageLabel", {
        Name = "Arrow",
        Image = "rbxassetid://15571970522",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.8, 0.8),
    }))
    v2[2] = (Create("TextLabel", {
        Name = "Description",
        FontFace = Font.new("rbxasset://fonts/families/JosefinSans.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = "Open Gift",
        TextColor3 = Color3.fromRGB(218, 234, 248),
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, 0, 0, 28),
        Size = UDim2.new(1, 0, 0, 18),
        Visible = a3 == true,
        (Create("UIStroke", {Name = "UIStroke", Thickness = 3})),
    }))
    local v3 = {
        Name = "Title",
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(2, 0, 0, 20),
    }
    local v4 = not (a3 ~= true) and UDim2.fromScale(0.5, 0) or UDim2.new(0.5, 0, 0, 28)
    v3.Position = v4
    v3[1] = (Create("TextLabel", {
        Name = "TextLabel",
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Text = ("Gift of %*"):format(v1.title),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.8, 1.5),
        Create("UIGradient", {
            Name = "UIGradient",
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 233, 189)),
                ColorSequenceKeypoint.new(0.491, Color3.fromRGB(255, 199, 58)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 64, 26))),
            }),
        }),
        (Create("UIStroke", {Name = "UIStroke", Thickness = 4, Color = Color3.fromRGB(91, 33, 4)})),
    }))
    v3[4] = (Create("UIGradient", {
        Name = "UIGradient",
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.2, 0.25),
            NumberSequenceKeypoint.new(0.5, 0),
            NumberSequenceKeypoint.new(0.8, 0.25),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }))
    v2[3] = (Create("Frame", v3))
    local u272 = Create("BillboardGui", v2)
    u272.Parent = a2
    local u276 = false
    local u285 = Create("Highlight", {
        FillTransparency = 1,
        OutlineTransparency = 0,
        Enabled = false,
        OutlineColor = Color3.new(1, 1, 1),
        Parent = a2,
    })
    local v5 = Create("ClickDetector", {
        Name = "Interact",
        MaxActivationDistance = (1 / 0),
        CursorIcon = "rbxasset://textures/Cursors/KeyboardMouse/ArrowCursor.png",
        Parent = a2,
    })
    u135.ClickDetectors[a2] = v5
    v5.MouseHoverEnter:Connect(function(a1) -- Line: 183 -- upvalues: LocalPlayer (upval), u285 (val), u272 (val), u276 (ref), RunService (upval)
        if a1 == LocalPlayer then
            u285.Enabled = true
            u272.Enabled = true
            u276 = true
            task.spawn(function() -- Line: 192 -- upvalues: u276 (upval), u272 (upval), RunService (upval)
                while u276 do
                    u272.Arrow.Position = UDim2.new(0.5, 0, 0.5, math.sin((tick()) * 4) * 5 + 10)
                    RunService.RenderStepped:Wait()
                end
            end)
        end
    end)
    v5.MouseHoverLeave:Connect(function(a1) -- Line: 201 -- upvalues: LocalPlayer (upval), u285 (val), u272 (val), u276 (ref)
        if a1 == LocalPlayer then
            u285.Enabled = false
            u272.Enabled = false
            u276 = false
        end
    end)
    v5.MouseClick:Connect(function(a1_2) -- Line: 209
        -- upvalues: u143 (upval), LocalPlayer (upval), a3 (val), XmasGifts_3 (upval), a1 (val), u135 (upval)
        if u143 then
            return
        end
        if a1_2 == LocalPlayer then
            if not a3 then
                XmasGifts_3:InvokeServer("Purchase", a1)
                return
            end
            for i, j in u135.ClickDetectors do
                j.MaxActivationDistance = 0
            end
            u135.OpenGift(a1):await()
            for k, n in u135.ClickDetectors do
                n.MaxActivationDistance = (1 / 0)
            end
        end
    end)
end

local function transition() -- Line: 233 -- upvalues: Create (val), LocalPlayer (val), TweenService (val), Sound (val)
    local CurrentCamera = workspace.CurrentCamera
    local u5 = Create("UIScale", {Scale = 0})
    local u44 = Create("ScreenGui", {
        Name = "Transition",
        ResetOnSpawn = false,
        Parent = LocalPlayer:WaitForChild("PlayerGui"),
        DisplayOrder = 9999999,
        (Create("Frame", {
            Size = UDim2.fromScale(2, 2),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            SizeConstraint = Enum.SizeConstraint.RelativeXX,
            BackgroundColor3 = Color3.new(),
            Create("UICorner", {CornerRadius = UDim.new(1, 0)}),
            u5,
        })),
    })
    TweenService:Create(CurrentCamera, TweenInfo.new(1, Enum.EasingStyle.Sine), {FieldOfView = 50}):Play()
    TweenService:Create(u5, TweenInfo.new(1, Enum.EasingStyle.Sine), {Scale = 1}):Play()
    Sound("XmasTransition"):Play()
    task.wait(1)
    return function() -- Line: 271 -- upvalues: TweenService (upval), u5 (val), CurrentCamera (val), u44 (val)
        TweenService:Create(u5, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {Scale = 0}):Play()
        TweenService:Create(CurrentCamera, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {FieldOfView = 70}):Play()
        task.wait(0.5)
        u44:Destroy()
    end
end

function u135.OpenGift(a1) -- Line: 285
    -- upvalues: u135 (val), XmasGifts_2 (val), Notification (val), Promise (val), XmasGifts_3 (val), Create (val)
    -- upvalues: ReplicatedStorage (val), u143 (ref), UnboxingController (val)
    assert(u135.Unclaimed[a1] == true, (("Gift \"%*\" is not unclaimed"):format(a1)))
    local u16 = XmasGifts_2[a1]
    local u19 = u135.Assets[a1]
    local v1 = u135.Rendered[a1]
    if not u16 then
        Notification.Create({
            Text = ("Gift \"%*\" does not contain any data"):format(a1),
            Color = Color3.fromRGB(255, 0, 0),
        })
        return Promise.resolve()
    end
    if u19 and v1 then
        local CFrame = v1.Center.CFrame
        local v2, v3 = XmasGifts_3:InvokeServer("Unbox", a1)
        if not v2 then
            Notification.Create({
                Text = v3 or "Error occured while trying to open gift!",
                Color = Color3.fromRGB(255, 0, 0),
            })
            return Promise.resolve()
        end
        local u76 = Create("Attachment", {
            Name = "Particles",
            Parent = workspace.Terrain,
            (ReplicatedStorage.Assets.Effects.Particles.Poof:Clone()),
        })
        u76.WorldCFrame = CFrame
        u76.Poof:Emit(20)
        task.delay(3, function() -- Line: 330 -- upvalues: u76 (val)
            u76:Destroy()
        end)
        return Promise.new(function(a1) -- Line: 334 -- upvalues: u143 (upval), u16 (val), UnboxingController (upval), u135 (upval), u19 (val)
            u143 = true
            local reward = u16.reward
            local v1, v2 = UnboxingController.GetMetadataForReward(reward.type, reward.tower or reward.name, reward.skin)
            if u16.reward.type == "Crate" and 1 < u16.reward.count then
                v2.name = ("x%* %*"):format(u16.reward.count, v2.name)
            end
            v2.crateScale = 0.25
            v2.cratePosition = CFrame.new(0, 0, -2)
            if u135.DisplayScreenGui then
                u135.DisplayScreenGui.Enabled = false
            end
            local finished = v2.finished

            function v2.finished() -- Line: 356 -- upvalues: u135 (upval), u143 (upval), a1 (val), finished (val)
                if u135.DisplayScreenGui then
                    u135.DisplayScreenGui.Enabled = true
                end
                u143 = false
                a1()
                if finished then
                    finished()
                end
            end

            UnboxingController.Unbox(u19, v1, v2)
        end)
    end
    Notification.Create({Text = ("Gift \"%*\" is not rendered"):format(a1), Color = Color3.fromRGB(255, 0, 0)})
    return Promise.resolve()
end

function u135.RenderGifts() -- Line: 373
    -- upvalues: Players (val), u135 (val), XmasGifts (val), addGiftInteraction (val), Create (val)
    local Children, v1, v2, v3, v4, v5
    local v6 = Random.new(Players.LocalPlayer.UserId)
    table.clear(u135.ClickDetectors)
    table.clear(u135.Rendered)
    local v7 = {"gift-1", "gift-2", "gift-3", "gift-4", "gift-5"}
    local v8 = nil
    local v9 = nil
    for i, j in v7, v8, v9 do
        v3 = u135.Gifts[j]
        v4 = u135.Claimed[j] == true
        v5 = u135.Unclaimed[j] == true
        Children = XmasGifts:WaitForChild(j):GetChildren()
        v1 = Children[v6:NextInteger(1, #Children)]
        u135.Assets[j] = v1
        if v3:FindFirstChild("GiftItem") then
            v3.GiftItem:Destroy()
        end
        v2 = v1:Clone()
        v2.Name = "GiftItem"
        v2.PrimaryPart = v2.Root
        v2:PivotTo((v3:GetPivot()))
        v2.Parent = v3
        u135.Rendered[j] = v2
        addGiftInteraction(j, v2, v5)
        if v4 then
            v2.Top.CFrame = v2.Center.CFrame * CFrame.new(0, 0.5, -(v2.Bottom.Size.Z / 2) - 0.5) * CFrame.Angles(859.4366926962348, 0, 0)
        elseif not v5 then
            for k, n in v2:GetDescendants() do
                if n:IsA("BasePart") then
                    n.Material = Enum.Material.Glass
                    n.Transparency = 0.5
                end
            end
            Create("Highlight", {
                FillTransparency = 0.1,
                OutlineTransparency = 0.3,
                DepthMode = Enum.HighlightDepthMode.Occluded,
                FillColor = Color3.fromRGB(0, 0, 0),
                Parent = v2,
            })
        end
    end
end

function u135.ViewGiftArea() -- Line: 426
    -- upvalues: SpringClass (val), transition (val), LightingController (val), ViewController (val), u143 (ref)
    -- upvalues: RunService (val), Mouse (val), Create (val), LocalPlayer (val), InstanceButton (val), u135 (val)
    local GiftArea = workspace:WaitForChild("GiftArea")
    local CameraLookPart = GiftArea:WaitForChild("CameraLookPart")
    local u14 = SpringClass.new(Vector3.new(0, 0, 0), 1, 20)
    local u15 = true
    local u16 = nil
    local v1 = transition()
    local v2 = LightingController.SerializeProfile(GiftArea:WaitForChild("Lighting"))
    LightingController.Apply("XmasGiftArea", v2)
    ViewController:setView("Crate")
    u143 = false
    RunService:BindToRenderStep("UPDATE_CAMERA_XMAS_AREA", Enum.RenderPriority.Camera.Value + 1, function(a1) -- Line: 446 -- upvalues: Mouse (upval), u14 (val), CameraLookPart (val) -- types: a1: number
        local CurrentCamera = workspace.CurrentCamera
        if not CurrentCamera then
            return
        end
        local v1 = (Vector3.new(Mouse.ViewSizeX, Mouse.ViewSizeY)) / 2 - Vector3.new(Mouse.X, Mouse.Y)
        local p = u14.p
        u14.t = v1
        CurrentCamera.CFrame = CameraLookPart.CFrame * CFrame.Angles(p.Y / 2000, p.X / 2000, 0)
    end)
    u16 = Create("ScreenGui", {
        Name = "GiftOpening",
        Parent = LocalPlayer:WaitForChild("PlayerGui"),
        (InstanceButton({
            Text = "BACK",
            AnchorPoint = Vector2.new(0, 0),
            Position = UDim2.new(0, 40, 1, -80),
            Size = UDim2.fromOffset(200, 45),
            Color = Color3.fromRGB(150, 150, 150),
            Clicked = function() -- Line: 475
                -- upvalues: u15 (ref), u143 (upval), u16 (ref), u135 (upval), transition (upval)
                -- upvalues: ViewController (upval), RunService (upval), LightingController (upval)
                if u15 and not u143 then
                    u15 = false
                    u16:Destroy()
                    u135.DisplayScreenGui = nil
                    local v1 = transition()
                    ViewController:setView("Hotbar")
                    RunService:UnbindFromRenderStep("UPDATE_CAMERA_XMAS_AREA")
                    LightingController.ApplyProfile("Default")
                    task.wait(1)
                    v1()
                    return
                end
            end,
        })),
    })
    u135.DisplayScreenGui = u16
    task.wait(1)
    v1()
end

function u135.TriggerDialog() -- Line: 503
    -- upvalues: LocalPlayer (val), ViewController (val), Promise (val), HttpService (val), DialogStore (val)
    local Character = LocalPlayer.Character and LocalPlayer.Character:FindFirstAncestorOfClass("Humanoid")
    LocalPlayer:SetAttribute("SprintEnabled", false)
    if Character then
        Character.WalkSpeed = 0
    end
    ViewController:setView("Crate")
    local u21 = false
    for i, j in {
        {
            Speaker = "Santa",
            Emotion = "Neutral",
            Text = "Ho ho ho! I'm too busy delivering, but you can complete some quests for me for extra presents!",
        },
    } do
        if not Promise.new(function(a1, a2) -- Line: 524 -- upvalues: HttpService (upval), DialogStore (upval), j (val), u21 (ref)
            local add, u6, v2, v3, v4, v5, v6, v7, v8
            u6 = HttpService:GenerateGUID(false)

            function v3() -- Line: 526 -- upvalues: DialogStore (upval), u6 (val)
                local v0
                DialogStore.remove(u6)
                task.wait(0.2)
                return
            end

            v4 = DialogStore
            add = v4.add
            v5 = {OverrideSetting = true}
            v5.id = u6
            v6 = {}
            v6.Text = j.Text
            v6.Speaker = j.Speaker
            v6.Emotion = j.Emotion
            v6.Hidden = j.Hidden
            v6.Flip = j.Flip
            v6.RichText = j.RichText
            v6.Voice = j.Voice
            v7 = {}
            v8 = {Text = "Sure Santa!"}
            v8.Color = Color3.fromRGB(109, 243, 72)

            function v8.Clicked() -- Line: 548 -- upvalues: DialogStore (upval), u6 (val), a1 (val)
                local v0
                DialogStore.remove(u6)
                task.wait(0.2)
                a1()
                return
            end

            v7.ok = v8
            v8 = {Text = "Nah.."}
            v8.Color = Color3.fromRGB(255, 79, 79)

            function v8.Clicked() -- Line: 557 -- upvalues: u21 (upval), DialogStore (upval), u6 (val), a2 (val)
                local v0
                u21 = true
                DialogStore.remove(u6)
                task.wait(0.2)
                a2()
                return
            end

            v7.nope = v8
            v6.Actions = v7
            v5.dialog = v6
            add(v5)
            return
        end):await() then
            break
        end
    end
    if u21 then
        ViewController:setView("Hotbar")
    else
        ViewController:setView("XmasQuests")
    end
    LocalPlayer:SetAttribute("SprintEnabled", true)
end

function u135.init() -- Line: 583 -- upvalues: LocalPlayer (val), u135 (val), CollectionService (val), Cache (val)
    local Interact_2 = ((workspace:WaitForChild("XmasPresentsInteract")):WaitForChild("XmasPresents")):WaitForChild("Interact")
    local Interact = (((workspace:WaitForChild("Npcs")):WaitForChild("SantaNPC")):WaitForChild("HumanoidRootPart")):WaitForChild("Interact")
    Interact_2.Triggered:Connect(function(a1) -- Line: 595 -- upvalues: LocalPlayer (upval), u135 (upval)
        if a1 == LocalPlayer then
            u135.ViewGiftArea()
        end
    end)
    Interact.Triggered:Connect(function(a1) -- Line: 601 -- upvalues: Interact (val), u135 (upval)
        if a1 == a1 then
            Interact.Enabled = false
            u135.TriggerDialog()
            Interact.Enabled = true
        end
    end)
    ;(CollectionService:GetInstanceAddedSignal("XMAS_GIFT")):Connect(function(a1) -- Line: 609 -- upvalues: u135 (upval)
        u135.Gifts[a1:GetAttribute("GiftId")] = a1
        a1.PrimaryPart.Transparency = 1
    end)
    for i, j in CollectionService:GetTagged("XMAS_GIFT") do
        u135.Gifts[j:GetAttribute("GiftId")] = j
        j.PrimaryPart.Transparency = 1
    end
    local XmasGifts = Cache("XmasGifts")
    XmasGifts.Updated:Connect(function(a1) -- Line: 620 -- upvalues: u135 (upval) -- types: a1: table
        for i, j in a1 or {} do
            if j ~= true then
                u135.Unclaimed[i] = true
            else
                u135.Claimed[i] = true
            end
        end
        u135.RenderGifts()
    end)
    XmasGifts:Get()
    u135.RenderGifts()
end

task.spawn(u135.init)
return u135