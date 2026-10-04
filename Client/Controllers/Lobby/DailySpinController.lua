-- Script path: ReplicatedStorage.Client.Controllers.Lobby.DailySpinController
-- Decompile time: 45.66 ms

local Model, v1, v2, v3
local Chat = game:GetService("Chat")
local Debris = game:GetService("Debris")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local Icons = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local PlayerCharacterReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerCharacterReplicator)
local PlayerController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.PlayerController)
local Promise = require(ReplicatedStorage.Shared.Modules.Promise)
local SharedDailyRewards = require(ReplicatedStorage.Shared.Modules.SharedDailyRewards)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local SpringClass = require(ReplicatedStorage.Shared.Modules.Standalone.SpringClass)
local UnboxingController = require(ReplicatedStorage.Client.Controllers.Shared.UnboxingController)
local UserPolicies = require(ReplicatedStorage.Shared.Modules.UserPolicies)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local math = require(ReplicatedStorage.Shared.Modules.Utils.math)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u143 = math.rad(35)
local u146 = math.rad(45)
local u151 = u146 / 2 - math.rad(1)
local u152 = {IDLE = 0, ACTIVE = 1}
local u154 = Random.new()
local LocalPlayer = Players.LocalPlayer
local u156 = nil
local u157 = {}
local u158 = 70
local u159 = {}
local u164 = SpringClass.new(0, 0.7, 5)
local u169 = SpringClass.new(0, 0.7, 10)
local DailySpin = NewNetwork.Channel("DailySpin")
local u173 = 0
local DailySpinWheel = (workspace:WaitForChild("Lobby")):WaitForChild("DailySpinWheel")
local Parent = DailySpinWheel.Parent
local Root = DailySpinWheel.Wheel.Model.Root
local ArrowPointingDown = DailySpinWheel.Wheel.ArrowPointingDown
local Interact = DailySpinWheel.Interaction.Prompt.Interact
local Highlight = DailySpinWheel.Highlight
local Spin = DailySpinWheel.Wheel.Body.EmitPoint_SpinEffect.Spin
local Frame = DailySpinWheel.Wheel.Frame
local SurfaceGui = DailySpinWheel.SurfaceGui
local u200 = {}
local u201 = {}
local v4 = Create("Folder", {Name = "Display", Parent = DailySpinWheel})
local u206 = 0
local u207 = 0
local u208 = 0
local u209 = true

local function setPaidRandomItemPolicyState(a1) -- Line: 122
    -- upvalues: u209 (ref), DailySpinWheel (val), Parent (val), Interact (val), u173 (ref), Spin (val), u159 (val)
    u209 = a1
    DailySpinWheel.Parent = Parent
    Interact.Enabled = u173 == 0
    Spin.Enabled = true
    for i, j in u159 do
        j.Container.Frame.Chance.Visible = true
    end
end

u209 = true
DailySpinWheel.Parent = Parent
Interact.Enabled = u173 == u152.IDLE
Spin.Enabled = true
for i, j in u159 do
    j.Container.Frame.Chance.Visible = true
end
;((UserPolicies(LocalPlayer)):andThen(function(a1) -- Line: 134
    -- upvalues: u209 (ref), DailySpinWheel (val), Parent (val), Interact (val), u173 (ref), u152 (val), Spin (val)
    -- upvalues: u159 (val)
    u209 = a1.ArePaidRandomItemsRestricted ~= false
    DailySpinWheel.Parent = Parent
    Interact.Enabled = u173 == u152.IDLE
    Spin.Enabled = true
    for i, j in u159 do
        j.Container.Frame.Chance.Visible = true
    end
end)):catch(function() -- Line: 136
    -- upvalues: u209 (ref), DailySpinWheel (val), Parent (val), Interact (val), u173 (ref), u152 (val), Spin (val)
    -- upvalues: u159 (val)
    u209 = true
    DailySpinWheel.Parent = Parent
    Interact.Enabled = u173 == u152.IDLE
    Spin.Enabled = true
    for i, j in u159 do
        j.Container.Frame.Chance.Visible = true
    end
end)

local function animateNeon(a1) -- Line: 140 -- upvalues: TweenService (val), Debris (val) -- types: a1: userdata
    local v1 = a1:Clone()
    v1:ClearAllChildren()
    v1.CFrame = a1.CFrame
    local WeldConstraint = Instance.new("WeldConstraint")
    WeldConstraint.Part0 = v1
    WeldConstraint.Part1 = a1
    WeldConstraint.Parent = v1
    v1.Material = Enum.Material.Neon
    v1.Parent = a1
    TweenService:Create(v1, TweenInfo.new(0.4, Enum.EasingStyle.Sine), {Transparency = 1, Size = v1.Size * 1.2}):Play()
    Debris:AddItem(v1, 0.4)
end

local function getRewardKey(a1) -- Line: 161 -- upvalues: table (val)
    local v1 = {}
    for i, j in a1.value do
        v1[i] = (tostring(j))
    end
    return (("%*:%*"):format(a1.type, (table.concat(v1, ":"))))
end

local function updateShownRewardKeys(a1) -- Line: 170
    -- upvalues: getRewardKey (val), LocalPlayer (val), HttpService (val)
    local v1 = {}
    local v2 = false
    for i, j in a1 do
        v2 = true
        v1[(getRewardKey(j.value))] = true
    end
    LocalPlayer:SetAttribute("DailySpinShownRewardKeys", if not v2 then nil else HttpService:JSONEncode(v1))
end

local function getDisplayChances(a1, a2) -- Line: 185
    -- upvalues: SharedDailyRewards (val), math (val), table (val)
    local index, v1, v2, v3
    local v4 = {}
    local v5 = {}
    local v6 = 0
    if a2 <= 0 then
        return v4
    end
    local v7, v8 = a1, a2
    for i = 1, 8 do
        v2 = v7[i]
        if v2 then
            v3 = SharedDailyRewards.SpinRewardWeights[v2.rarity] / v8 * 10000
            v1 = math.floor(v3)
            v4[i] = v1
            v6 = v6 + v1
            table.insert(v5, {index = i, remainder = v3 - v1})
        end
    end
    table.sort(v5, function(a1, a2) -- Line: 213
        if a1.remainder == a2.remainder then
            return a1.index < a2.index
        end
        return a2.remainder < a1.remainder
    end)
    local v9 = 10000 - v6
    for j = 1, v9 do
        v2 = v5[j]
        if not v2 then
            break
        end
        index = v2.index
        v4[index] = v4[index] + 1
    end
    return v4
end

local function updateSpinWheel(a1) -- Line: 233
    -- upvalues: u173 (ref), u156 (ref), updateShownRewardKeys (val), SharedDailyRewards (val), getDisplayChances (val)
    -- upvalues: u159 (val), u157 (val), Icons (val), Asset (val)
    local Icon, SkinData, v1, v2, v3, v4, v5, v6, value_2
    if u173 == 1 then
        u156 = a1
        return
    end
    updateShownRewardKeys(a1)
    local v7 = 0
    for i = 1, 8 do
        v3 = a1[i]
        if v3 then
            v7 = v7 + SharedDailyRewards.SpinRewardWeights[v3.rarity]
        end
    end
    local v8 = getDisplayChances(a1, v7)
    for j = 1, 8 do
        v4 = a1[j]
        v5 = u159[j]
        u157[j] = v4 and v4.value
        if v4 then
            if not v5.Enabled then
                v5.Enabled = true
            end
            v6 = nil
            value_2 = v4.value
            Icon = nil
            if value_2.type == "Currency" then
                Icon = Icons[value_2.value[1]]
            elseif value_2.type == "Consumable" then
                Icon = Asset("Consumables", value_2.value[1]).Icon
            elseif value_2.type == "Crate" then
                Icon = Asset("NewCrates", value_2.value[1]).Icon
            elseif value_2.type == "Skin" then
                v1 = Asset("Troops", value_2.value[1])
                SkinData = v1.Properties.SkinData and v1.Properties.SkinData[value_2.value[2]]
                Icon = SkinData and SkinData.Icon or v1.Properties.Preview.Icon
            elseif value_2.type == "Tower" then
                Icon = Asset("Troops", value_2.value[1]).Properties.Preview.Icon
            end
            if value_2.value then
                for k = #value_2.value, 1, -1 do
                    v2 = value_2.value[k]
                    if typeof(v2) == "number" then
                        v6 = v2
                        break
                    end
                end
            end
            v5.Container.Frame.Icon.Image = not (typeof(Icon) ~= "number") and ("rbxassetid://%*"):format(Icon) or Icon or ""
            v5.Container.Frame.Chance.Text = string.format("%.2f%%", (v8[j] or 0) / 100)
            v5.Container.Frame.Chance.Visible = true
            v5.Container.Frame.Value.Text = v6 and ("x%*"):format(v6) or ""
        else
            v5.Enabled = false
        end
    end
end

local function resetWheelState() -- Line: 312 -- upvalues: u173 (ref), u156 (ref), updateSpinWheel (val)
    if u173 ~= 1 then
        return
    end
    u173 = 0
    if u156 then
        updateSpinWheel(u156)
        u156 = nil
    end
end

local function presentReward(a1, a2, a3) -- Line: 325
    -- upvalues: UnboxingController (val), Enum (val), SharedDailyRewards (val), Promise (val)
    local v1 = a3[1]
    local v2 = {unpack(a3, 2)}
    local u16, u17 = UnboxingController.GetMetadataForReward(a1, v1, unpack(v2))
    u17.rewardSound = ""
    if a1 == "Crate" then
        u17.rewardScale = 0.25
        if v2[1] and 1 < v2[1] then
            u17.name = ("x%* %* Crates"):format(v2[1], u17.name)
        end
    end
    u17.exclusivity = Enum.CrateItemRarity.ToString(a2)
    local v3 = SharedDailyRewards.CrateItemRarityColors[a2] or Color3.new(1, 1, 1)
    u17.exclusivityColor = v3
    return Promise.new(function(a1) -- Line: 344 -- upvalues: u17 (val), UnboxingController (upval), u16 (val)
        local finished = u17.finished

        function u17.finished() -- Line: 346 -- upvalues: finished (val), a1 (val)
            if finished then
                finished()
            end
            a1()
        end

        UnboxingController.Present(u16, u17)
    end)
end

local function normalizeAngle(a1) -- Line: 358 -- upvalues: math (val)
    return a1 % (2 * math.pi)
end

local function getWheelTick(a1) -- Line: 362 -- upvalues: math (val), u151 (val), u146 (val) -- types: a1: number
    return math.floor((a1 % (2 * math.pi) - u151) / u146) % 8
end

local function getWheelTickDelta(a1, a2) -- Line: 367 -- upvalues: math (val) -- types: a1: number, a2: number
    local v1 = math.abs(a1 - a2)
    return math.min(v1, 8 - v1)
end

local function getWheelSegment(a1) -- Line: 372 -- upvalues: math (val), u151 (val), u146 (val) -- types: a1: userdata
    local v1
    _, _, v1 = (a1 * CFrame.Angles(0, 0, -math.pi)):ToEulerAnglesXYZ()
    return (math.abs(math.floor((v1 - u151) / u146) - 4) - 1) % 8 + 1
end

local function setHighlightedSegment(a1) -- Line: 378 -- upvalues: Highlight (val) -- types: a1: userdata?
    if not a1 then
        return
    end
    Highlight.Adornee = a1
    Highlight.OutlineColor = a1.Color:lerp(Color3.new(1, 1, 1), 0.8)
end

local function spinWheelToTarget(a1) -- Line: 387
    -- upvalues: u173 (ref), EmitterManager (val), DailySpinWheel (val), Root (val), u154 (val), u206 (ref)
    -- upvalues: ViewController (val), TweenService (val), math (val), u158 (ref), u208 (ref), u207 (ref)
    -- upvalues: RunService (val)
    local v1
    if u173 == 1 then
        return
    end
    u173 = 1
    EmitterManager.manualEmit(DailySpinWheel.Wheel.Body)
    local Rotation = Root.CFrame.Rotation
    local v2 = a1 - Root.Orientation.Z % 360
    local v3 = (15 + u154:NextInteger(10, 15)) * 360
    local v4 = u154:NextNumber(12, 18)
    u206 = 0
    DailySpinWheel.Wheel.Body.SpinIntro:Play()
    ViewController:setView("Crate")
    workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
    TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        FieldOfView = 70,
        CFrame = DailySpinWheel.Wheel.Body.CameraAttachment.WorldCFrame * CFrame.new(0, 0, -20) * CFrame.Angles(0, -math.pi, 0),
    }):Play()
    u158 = 70
    u208 = math.rad(v3 + v2)
    local v5 = tick()
    while true do
        v1 = v5 + v4
        if not (tick() < v1) then
            break
        end
        v1 = 1 - math.pow(1 - (tick() - v5) / v4, 10)
        u207 = u208 * v1
        u158 = math.lerp(70, 55, v1)
        Root.CFrame = CFrame.new(Root.Position) * Rotation * CFrame.Angles(0, 0, u207)
        if v1 > 0.99995 then
            break
        end
        RunService.Heartbeat:Wait()
    end
    u207 = u208
    u158 = 55
    Root.CFrame = CFrame.new(Root.Position) * Rotation * CFrame.Angles(0, 0, u207)
end

local function shortestAngleDifference(a1, a2) -- Line: 448 -- upvalues: math (val)
    return math.atan2(math.sin(a1 - a2), math.cos(a1 - a2))
end

for k = 1, 8 do
    v1 = SurfaceGui:Clone()
    v2 = Create("Part", {
        Anchored = true,
        CanCollide = false,
        CanTouch = false,
        CanQuery = false,
        CastShadow = false,
        Parent = v4,
        Size = Vector3.new(5, 5, 0),
        Transparency = 1,
        Name = tostring(k),
        v1,
    })
    v1.Container.Frame.Size = UDim2.fromScale(0.6, 0.6)
    v1.Container.Frame.Position = UDim2.fromScale(0.5, 0.5)
    Model = DailySpinWheel.Wheel.Model
    v3 = tostring(k)
    u201[k] = (Model:WaitForChild(v3))
    u159[k] = v1
    u200[k] = v2
end
local Pivot = Root:GetPivot()
local Pivot_2 = Root:GetPivot()
RunService.Heartbeat:Connect(function(a1) -- Line: 478
    -- upvalues: u173 (ref), Pivot_2 (ref), Pivot (ref), math (val), Root (val), u158 (ref), u164 (val)
    -- upvalues: getWheelSegment (val), u201 (val), u151 (val), u146 (val), shortestAngleDifference (val), Spin (val)
    -- upvalues: Highlight (val), u169 (val), DailySpinWheel (val), u154 (val), ArrowPointingDown (val), u208 (ref)
    -- upvalues: u207 (ref), u206 (ref), animateNeon (val), EmitterManager (val), u200 (val), Frame (val)
    local UIAttachment, v1, v2, v3, v4
    local v5 = true
    local CFrame_2 = workspace.CurrentCamera.CFrame
    local v6 = u173 == 0
    local v7 = u173 == 1
    if v6 then
        v5 = 0 <= (CFrame_2.LookVector:Dot((Pivot_2.Position - CFrame_2.Position).Unit))
        Pivot_2 = Pivot * CFrame.Angles(0, 0, -math.rad(5) * a1)
        if v5 then
            Root:PivotTo(Pivot_2)
        end
    end
    if not v5 then
        Pivot = Pivot_2
        return
    end
    if v7 then
        workspace.CurrentCamera.FieldOfView = u158 + u164.p
    end
    _, _, v4 = Pivot_2:ToEulerAnglesXYZ()
    _, _, v1 = Pivot:ToEulerAnglesXYZ()
    local v8 = u201[(getWheelSegment(Pivot_2))]
    v4 = v4 % (2 * math.pi)
    v1 = v1 % (2 * math.pi)
    local v9 = math.floor((v4 % (2 * math.pi) - u151) / u146) % 8
    local v10 = math.floor((v1 % (2 * math.pi) - u151) / u146) % 8
    local v11 = math.deg(math.abs(shortestAngleDifference(v4, v1)) / a1)
    local v12 = math.abs(v9 - v10)
    local v13 = math.min(v12, 8 - v12)
    v12 = math.clamp((v11 - 100) / 200, 0, 1)
    local v14 = Spin
    local new = NumberSequence.new
    local v15 = {
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.4, math.lerp(0.8, 1, 1 - v12), math.lerp(0, 0.05, v12)),
        (NumberSequenceKeypoint.new(1, 1)),
    }
    v14.Transparency = new(v15)
    if v8 then
        Highlight.Adornee = v8
        Highlight.OutlineColor = v8.Color:lerp(Color3.new(1, 1, 1), 0.8)
    end
    if v13 > 0 and v7 then
        v2 = u169.v + math.min(40, v11 / 10)
        v15 = DailySpinWheel.Wheel.Body.SpinTick:Clone()
        v15.Volume = u154:NextNumber(v15.Volume * 0.8, v15.Volume * 1.2)
        v15.PlaybackSpeed = u154:NextNumber(v15.PlaybackSpeed * 0.8, v15.PlaybackSpeed * 1.2)
        v15.PlayOnRemove = true
        v15.Parent = ArrowPointingDown
        v15:Destroy()
        local v16 = u208 - u207
        if v16 <= u146 * 3 then
            u206 = math.min(u206 + 1, 3)
            v16 = u164
            v16.v = v16.v + 50
            if v8 then
                animateNeon(v8)
            end
            DailySpinWheel.Wheel.Body[("Bump%*"):format(u206)]:Play()
            if v8 then
                v8.EmitPoint_WheelSection.Tick_Wheel:Emit(1)
            end
        end
        u169.v = v2
    end
    if v7 and v13 > 0 then
        EmitterManager.manualEmit(DailySpinWheel.Wheel.ArrowPointingDown)
    end
    local Motor6D = ArrowPointingDown.Motor6D
    local Angles = CFrame.Angles
    local v17 = v7 and (math.sin(tick() * 50)) * math.rad(3) * math.min(v11 / 2000, 1) or 0
    Motor6D.Transform = Angles(-math.clamp(u169.p, -math.rad(15), math.rad(15)) + v17, 0, 0)
    Pivot = Pivot_2
    Pivot_2 = Root:GetPivot()
    v14 = {}
    v2 = {}
    for i = 1, 8 do
        v3 = u200[i]
        UIAttachment = u201[i].UIAttachment
        v14[#v14 + 1] = v3
        v2[#v2 + 1] = (CFrame.new(UIAttachment.WorldPosition)) * Frame:GetPivot().Rotation * CFrame.Angles(0, -math.pi / 2, 0) * CFrame.new(0, 0, -0.16)
    end
    workspace:BulkMoveTo(v14, v2, Enum.BulkMoveMode.FireCFrameChanged)
end)
Interact.PromptShown:Connect(function() -- Line: 600 -- upvalues: DailySpin (val), LocalPlayer (val)
    DailySpin:fireUnreliableServer("WheelPromptShow")
    LocalPlayer:SetAttribute("DailySpinShown", true)
end)
Interact.PromptHidden:Connect(function() -- Line: 605 -- upvalues: LocalPlayer (val)
    LocalPlayer:SetAttribute("DailySpinShown", nil)
end)
Interact.Triggered:Connect(function(a1) -- Line: 609
    -- upvalues: LocalPlayer (val), u173 (ref), PlayerController (val), u209 (ref), Notification (val)
    -- upvalues: ViewController (val), Interact (val), DailySpin (val), u157 (val), table (val), u146 (val), u143 (val)
    -- upvalues: u154 (val), PlayerCharacterReplicator (val), Chat (val), spinWheelToTarget (val), math (val)
    -- upvalues: u201 (val), getWheelSegment (val), Root (val), Highlight (val), EmitterManager (val)
    -- upvalues: DailySpinWheel (val), Sound (val), u158 (ref), presentReward (val), updateSpinWheel (val), u152 (val)
    -- upvalues: u156 (ref)
    local v1
    if a1 ~= LocalPlayer or u173 == 1 then
        return
    end
    if (PlayerController:getSpinTickets()) < 1 then
        if u209 then
            Notification.Error("Spin tickets cannot be purchased for your account.")
            return
        end
        ;(ViewController:getEmitter("Shop")):Emit("Select", "Tickets")
        ViewController:setView("Shop")
        return
    end
    Interact.Enabled = false
    ViewController:setView("Loading")
    local v2 = tick()
    local v3, v4 = DailySpin:invokeServer("RedeemSpin")
    local v5 = tick() - v2
    if v5 < 0.5 then
        task.wait(0.5 - v5)
    end
    ViewController:setView("Hotbar")
    if not v3 then
        Notification.Error(v4 or "An error occured while spinning the wheel, please try again!")
        Interact.Enabled = true
        return
    end
    local reward = v4.reward
    local v6 = -1
    local v7 = nil
    local v8 = nil
    for i, j in u157, v7, v8 do
        if table.deepCompare(j, reward) then
            v6 = i
            break
        end
    end
    local v9 = nil
    if v6 > 0 then
        v7 = u146 - u143
        v8 = u154:NextNumber(-v7, v7) / 2
        v1 = (v6 - 1) * u146 + v8
        PlayerCharacterReplicator.HideCharacters(true)
        Chat.BubbleChatEnabled = false
        spinWheelToTarget(math.deg(v1))
        v9 = u201[getWheelSegment(Root:GetPivot())]
        if v9 then
            Highlight.Adornee = v9
            Highlight.OutlineColor = v9.Color:lerp(Color3.new(1, 1, 1), 0.8)
        end
    end
    EmitterManager.manualEmit(v9 or DailySpinWheel.Wheel.Model)
    DailySpinWheel.Wheel.Body.Confetti:Play()
    if reward.type == "Currency" then
        task.wait(2)
        v7 = ""
        if reward.value[1] == "Timescale" or reward.value[1] == "Spin" then
            v7 = " Tickets"
        end
        local Create = Notification.Create
        v1 = {}
        local v10 = if not reward.value[2] then ("You have received %* %*%*!"):format(reward.value[1], reward.type, v7) else ("You have received %* %*%*!"):format(reward.value[2], reward.value[1], v7)
        v1.Text = v10
        Create(v1)
    else
        task.wait(1.9)
        Sound("SpinReward"):Play(true)
        task.wait(0.1)
        u158 = 70
        presentReward(reward.type, v4.rarity, reward.value):await()
    end
    updateSpinWheel(v4.newItems)
    if u173 == u152.ACTIVE then
        u173 = u152.IDLE
        if u156 then
            updateSpinWheel(u156)
            u156 = nil
        end
    end
    PlayerCharacterReplicator.HideCharacters(false)
    workspace.CurrentCamera.FieldOfView = 70
    workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    Chat.BubbleChatEnabled = true
    ViewController:setView("Hotbar")
    Interact.Enabled = true
end)
updateSpinWheel({})
DailySpin:onEvent("OnDailyRewardItems", updateSpinWheel)
return {}