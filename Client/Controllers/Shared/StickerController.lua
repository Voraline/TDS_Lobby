-- Script path: ReplicatedStorage.Client.Controllers.Shared.StickerController
-- Decompile time: 5.31 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local Promise = require(ReplicatedStorage.Packages.Promise)
local Stickers = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Stickers)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local u53 = Random.new()
local Sticker = NewNetwork.Channel("Sticker")
local u57 = {}

local function request(a1) -- Line: 28 -- upvalues: Promise (val)
    return Promise.new(function(a1_2, a2) -- Line: 29 -- upvalues: a1 (val)
        local v1, v2 = a1()
        if v1 then
            a1_2(v2)
            return
        end
        a2(v2)
    end)
end

local function await(a1) -- Line: 39
    if a1 then
        a1:await()
    end
end

local function getOrCreateStickerContainer(a1) -- Line: 45 -- upvalues: Create (val) -- types: a1: userdata
    local StickerContainer = a1:FindFirstChild("StickerContainer")
    if StickerContainer then
        return StickerContainer
    end
    return Create("BillboardGui", {
        Name = "StickerContainer",
        ClipsDescendants = true,
        StudsOffsetWorldSpace = Vector3.new(0, 3.799999952316284, 0),
        Size = UDim2.fromScale(3, 5),
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Parent = a1,
    })
end

local function createStickerIcon(a1) -- Line: 61 -- upvalues: Create (val)
    return Create("ImageLabel", {
        Image = not (typeof(a1) ~= "number") and ("rbxassetid://%*"):format(a1) or a1,
        ImageTransparency = 1,
        ScaleType = Enum.ScaleType.Fit,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        (Create("UIAspectRatioConstraint")),
    })
end

local function animateSticker(a1, a2, a3) -- Line: 78
    -- upvalues: TweenService (val), Promise (val), u53 (val), RunService (val), spr (val)
    if not a2 then
        a1:SetAttribute("Idle", nil)
        TweenService:Create(a1, TweenInfo.new(0.4, Enum.EasingStyle.Sine), {
            ImageTransparency = 1,
            Size = UDim2.fromScale(0.2, 0.2),
            Position = UDim2.fromScale(0.5, 0.9),
        }):Play()
        return Promise.delay(0.4)
    end
    a1.Position = UDim2.fromScale(0.5, 0.9)
    a1.Size = UDim2.fromScale(0.2, 0.2)
    a1.ImageTransparency = 1
    if a3 ~= false and a1:GetAttribute("Idle") ~= true then
        a1:SetAttribute("Idle", true)
        local u60 = tick() + u53:NextInteger(1, 10) * 60
        local u61 = nil
        local v1 = RunService.Heartbeat:Connect(function(a1_2) -- Line: 101 -- upvalues: a1 (val), u61 (ref), u60 (ref)
            if a1:IsDescendantOf(workspace) and a1:GetAttribute("Idle") then
                u60 = u60 + a1_2
                a1.Rotation = math.sin(u60 * 5) * 8
                a1.Position = UDim2.new(0.5, 0, 0.23, math.cos(u60 * 3) * 10 + -30)
                return
            end
            u61:Disconnect()
        end)
    end
    spr.target(a1, 0.3, 1, {Size = UDim2.fromScale(0.8, 0.8)})
    TweenService:Create(a1, TweenInfo.new(0.4, Enum.EasingStyle.Sine), {ImageTransparency = 0, Position = UDim2.new(0.5, 0, 0.23, -30)}):Play()
    return Promise.delay(0.4)
end

local function getPlayerZIndex(a1) -- Line: 126 -- upvalues: u57 (val) -- types: a1: userdata
    if not u57[a1] then
        u57[a1] = 0
        return 0
    end
    local v1 = u57[a1] + 1
    u57[a1] = v1
    return v1
end

local function createLocalSticker(a1, a2) -- Line: 137
    -- upvalues: Stickers (val), Promise (val), u53 (val), getOrCreateStickerContainer (val), createStickerIcon (val)
    -- upvalues: u57 (val), Create (val), SoundService (val), animateSticker (val), TweenService (val)
    local u4 = Stickers(a1)
    if not u4 then
        return Promise.reject((("Sticker \"%*\" does not exist"):format(a1)))
    end
    local Character = a2.Character
    local PrimaryPart = Character
    if PrimaryPart then
        PrimaryPart = Character.PrimaryPart
    end
    local Head = Character and Character:FindFirstChild("Head")
    if PrimaryPart and Head then
        local Animator = u4.Animator
        return Promise.new(function(a1, a2_2, a3) -- Line: 153
            -- upvalues: u4 (val), u53 (upval), getOrCreateStickerContainer (upval), PrimaryPart (val)
            -- upvalues: createStickerIcon (upval), a2 (val), u57 (upval), Animator (val), Character (val)
            -- upvalues: Create (upval), SoundService (upval), animateSticker (upval), Promise (upval)
            -- upvalues: TweenService (upval)
            local v1, v2
            local Sound = u4.Sound
            if typeof(Sound) == "table" then
                Sound = Sound[u53:NextInteger(1, #Sound)]
            end
            local v3 = getOrCreateStickerContainer(PrimaryPart)
            local u21 = createStickerIcon(u4.Icon)
            local v4 = a2
            if u57[v4] then
                v2 = u57[v4] + 1
                u57[v4] = v2
                v1 = v2
            else
                u57[v4] = 0
                v1 = 0
            end
            u21.ZIndex = v1
            u21.Parent = v3
            a3(function() -- Line: 164 -- upvalues: u21 (val), PrimaryPart (upval), u57 (upval), a2 (upval)
                if u21.Parent then
                    u21:Destroy()
                end
                if not PrimaryPart:FindFirstChild("StickerAttachment") then
                    u57[a2] = nil
                end
            end)
            local OnAnimate = Animator and Animator.OnAnimate
            v4 = {player = a2, character = Character, sticker = u21}
            if u4.Sound then
                local u80 = Create("Sound", {
                    Name = "StickerSound",
                    SoundId = not (typeof(Sound) ~= "number") and ("rbxassetid://%*"):format(Sound) or Sound,
                    SoundGroup = SoundService:WaitForChild("Stickers", 5),
                    Parent = PrimaryPart,
                })
                u80.Looped = u4.SoundLooped or false
                u80:Play()
                u21.Destroying:Once(function() -- Line: 192 -- upvalues: u80 (val)
                    if u80.Parent then
                        u80:Destroy()
                    end
                end)
                v4.sound = u80
            end
            if Animator and Animator.OnCreate then
                v2 = Animator.OnCreate(v4)
                if v2 then
                    v2:await()
                end
            end
            v2 = if not OnAnimate then animateSticker(u21, true) else Animator.OnAnimate(v4)
            if v2 then
                v2:await()
            end
            Promise.delay(u4.Duration or 3):await()
            if not OnAnimate then
                u21:SetAttribute("Idle", nil)
                TweenService:Create(u21, TweenInfo.new(0.4, Enum.EasingStyle.Sine), {
                    ImageTransparency = 1,
                    Size = UDim2.fromScale(0.2, 0.2),
                    Position = UDim2.fromScale(0.5, 0.9),
                }):Play()
                v2 = Promise.delay(0.4)
                if v2 then
                    v2:await()
                end
            end
            if Animator and Animator.OnDestroy then
                v2 = Animator.OnDestroy(v4)
                if v2 then
                    v2:await()
                end
            end
            u21:Destroy()
            if not PrimaryPart:FindFirstChild("StickerAttachment") then
                u57[a2] = nil
            end
        end)
    end
    return Promise.reject("Player does not have a valid character")
end

Sticker:onUnreliableEvent("Show", function(a1, a2, a3) -- Line: 246
    -- upvalues: Players (val), createLocalSticker (val)
    if a2 ~= Players.LocalPlayer or a3 ~= true then
        createLocalSticker(a1, a2)
    end
end)
Players.PlayerRemoving:Connect(function(a1) -- Line: 252 -- upvalues: u57 (val)
    u57[a1] = nil
end)
return {
    createLocalSticker = createLocalSticker,
    createSticker = function(a1) -- Line: 229 -- upvalues: createLocalSticker (val), Players (val), Sticker (val) -- types: a1: string
        createLocalSticker(a1, Players.LocalPlayer)
        Sticker:fireUnreliableServer("Show", a1)
    end,
    equipSticker = function(a1, a2) -- Line: 234 -- upvalues: request (val), Sticker (val) -- types: a1: string, a2: number?
        return request(function(a1_2) -- Line: 235 -- upvalues: Sticker (upval), a1 (val), a2 (val)
            return Sticker:invokeServer("Equip", a1, a2)
        end)
    end,
    unequipSticker = function(a1) -- Line: 240 -- upvalues: request (val), Sticker (val) -- types: a1: string
        return request(function(a1_2) -- Line: 241 -- upvalues: Sticker (upval), a1 (val)
            return Sticker:invokeServer("Unequip", a1)
        end)
    end,
}