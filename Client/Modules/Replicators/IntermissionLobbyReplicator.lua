-- Script path: ReplicatedStorage.Client.Modules.Replicators.IntermissionLobbyReplicator
-- Decompile time: 16.80 ms

local CollectionService = game:GetService("CollectionService")
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Client = ReplicatedStorage:WaitForChild("Client")
local ViewController = require(Client.Interfaces.LegacyInterface.Controllers.ViewController)
local Charm = require(ReplicatedStorage.Packages.Charm)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local IntermissionStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.IntermissionStore)
local LobbyBoard = require(ReplicatedStorage.Client.Modules.LobbyBoard)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local PVPIntermissionStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.PVPIntermissionStore)
local PointerArrow = require(ReplicatedStorage.Client.Modules.PointerArrow)
local SpringClass = require(ReplicatedStorage.Shared.Modules.Standalone.SpringClass)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local u103 = false
local u104 = false
local u105 = false
local LobbyVoting = Network.Channel("LobbyVoting")
local VoteIcon = ReplicatedStorage.Assets.UI.VoteIcon
local Totems = ReplicatedStorage.Assets.Totems
local Crown = ReplicatedStorage.Assets.Models.Crown
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local u123 = Maid.new()
local u125 = Maid.new()
local u126 = false
task.spawn(function() -- Line: 47 -- upvalues: ReplicatedStorage (val), u126 (ref), MarketplaceService (val), Players (val)
    local v1 = (require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator)).GetLocalPlayer()
    u126 = MarketplaceService:UserOwnsGamePassAsync(Players.LocalPlayer.UserId, 10518590)
    if not u126 then
        local v2 = v1:expect()
        if v2 then
            u126 = v2.Replicator:WaitForState("VIPPlus")
        end
    end
end)
MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(a1, a2, a3) -- Line: 61 -- upvalues: Players (val), u126 (ref)
    if a1 == Players.LocalPlayer and a2 == 10518590 then
        u126 = a3
    end
end)
MarketplaceService.PromptSubscriptionPurchaseFinished:Connect(function(a1, a2, a3) -- Line: 68 -- upvalues: Players (val), u126 (ref)
    if a1 == Players.LocalPlayer and a2 == "EXP-5914385580085215338" and a3 then
        u126 = true
    end
end)
u123:Mark(u125)
local u145 = Random.new()
local u146 = {}
local u147 = {}
local u148 = {}
Players.PlayerAdded:Connect(function(a1) -- Line: 83 -- upvalues: u146 (val), Maid (val)
    u146[a1] = (Maid.new())
end)
for i, j in Players:GetPlayers() do
    u146[j] = (Maid.new())
end
Players.PlayerRemoving:Connect(function(a1) -- Line: 91 -- upvalues: u146 (val)
    if u146[a1] then
        u146[a1]:Sweep()
        u146[a1] = nil
    end
end)
local u173 = {}
local v1 = Color3.new(0.9921568627450981, 0.1607843137254902, 0.2627450980392157)
local v2 = Color3.new(0.00392156862745098, 0.6352941176470588, 1)
local v3 = Color3.new(0.00784313725490196, 0.7215686274509804, 0.3411764705882353)
local Color = (BrickColor.new("Bright violet")).Color
local Color_2 = (BrickColor.new("Bright orange")).Color
local Color_3 = BrickColor.new("Bright yellow").Color
local Color_4 = BrickColor.new("Light reddish violet").Color
u173[1] = v1
u173[2] = v2
u173[3] = v3
u173[4] = Color
u173[5] = Color_2
u173[6] = Color_3
u173[7] = Color_4
u173[8] = BrickColor.new("Brick yellow").Color

local function loadInventory() -- Line: 117 -- upvalues: ViewController (val)
    ViewController:setView("Inventory")
end

local function removeInventory() -- Line: 121 -- upvalues: ViewController (val)
    ViewController:setView("")
end

local function getNameValue(a1) -- Line: 125 -- types: a1: string
    local v1, v2
    local v3 = 0
    local v4 = #a1
    local v5 = a1
    for i = 1, v4 do
        v1 = string.byte((string.sub(v5, i, i)))
        v2 = #v5 - i + 1
        if #v5 % 2 == 1 then
            v2 = v2 - 1
        end
        if 2 <= v2 % 4 then
            v1 = -v1
        end
        v3 = v3 + v1
    end
    return v3
end

local function getNameColor(a1) -- Line: 148
    -- upvalues: Players (val), u173 (val), getNameValue (val)
    local PlayerByUserId = Players:GetPlayerByUserId(a1)
    if PlayerByUserId and PlayerByUserId.Team ~= nil then
        return PlayerByUserId.TeamColor.Color
    end
    return u173[(getNameValue(PlayerByUserId.Name) + 0) % #u173 + 1]
end

local function setMapSelectEnabled(a1) -- Line: 160 -- upvalues: IntermissionStore (val) -- types: a1: boolean
    IntermissionStore.setMapOverrideVisible(a1)
end

UserInputService.InputBegan:Connect(function(a1) -- Line: 164 -- upvalues: IntermissionStore (val)
    if a1.KeyCode == Enum.KeyCode.Escape then
        IntermissionStore.setMapOverrideVisible(false)
    end
end)
IntermissionStore.setMapOverrideVisible(false)
local u225 = {}
local u226 = nil

local function refreshVotes() -- Line: 175
    -- upvalues: u147 (val), u225 (ref), u148 (val), u125 (val), u226 (ref), Crown (val), spr (val), RunService (val)
    local map, v1
    local v2 = {}
    for i, j in u147 do
        v2[j.name] = 0
    end
    local v3 = nil
    for k, n in u225, nil, v3 do
        map = n.map
        v2[map] = v2[map] + 1
    end
    local v4 = 0
    local v5 = nil
    for k2, v in pairs(v2) do
        v1 = u148[k2]
        if v1 then
            v1._countUI.Value.Text = v
        end
        if v4 < v then
            v5 = k2
        end
    end
    if not v5 then
        u125:Sweep()
        return
    end
    if v5 and u226 ~= v5 then
        u125:Sweep()
        v3 = u148[v5]
        u226 = v5
        if v3 then
            local u51 = Crown:Clone()
            u51:PivotTo(v3.model.Hitboxes.Top.CFrame)
            local u59 = {progress = 0}
            local u60 = 0
            local Size = u51.Size
            u51.Size = Vector3.new(0, 0, 0)
            u51.Parent = workspace.Trash
            spr.target(u51, 0.6, 1, {Size = Size * 2})
            spr.target(u59, 0.5, 1, {progress = 1})
            local CFrame_2 = u51.CFrame
            local u92 = (v3.model.Hitboxes.Top.CFrame + Vector3.new(0, 8, 0)) * CFrame.Angles(0, 9.42477796076938, 0)
            u125:Mark((RunService.Heartbeat:Connect(function(a1) -- Line: 233 -- upvalues: u60 (ref), u51 (val), CFrame_2 (val), u92 (val), u59 (val)
                u60 = u60 + a1
                u51.CFrame = (CFrame_2:Lerp(u92, u59.progress)) * CFrame.Angles(0, u60 * 2, 0)
            end)))
            u125:Mark(function() -- Line: 238 -- upvalues: spr (upval), u51 (val)
                local v1 = {Transparency = 1, Size = Vector3.new(0, 0, 0)}
                spr.target(u51, 1, 4, v1)
                task.delay(2, function() -- Line: 240 -- upvalues: u51 (upval)
                    u51:Destroy()
                end)
            end)
        end
    end
end

local Time = ReplicatedStorage.State.Timer.Time
IntermissionStore.setVoteTimeLeft(Time.Value)
Time.Changed:Connect(function() -- Line: 250 -- upvalues: IntermissionStore (val), Time (val)
    IntermissionStore.setVoteTimeLeft(Time.Value)
end)
local u247 = {Prompt = true, Hotbar = false, Menu = true}

local function onIntermissionLobby(a1) -- Line: 263
    -- upvalues: u104 (ref), GameState (val), u105 (ref), u103 (ref), LobbyBoard (val), PointerArrow (val), u147 (val)
    -- upvalues: u148 (val), u146 (val), LobbyVoting (val), PlayerGui (val), u247 (val), IntermissionStore (val)
    -- upvalues: u123 (val), Notification (val), ViewController (val), Charm (val), PVPIntermissionStore (val)
    -- upvalues: loadInventory (val), u225 (ref), refreshVotes (val), Players (val), Totems (val), spr (val)
    -- upvalues: SpringClass (val), u145 (val), VoteIcon (val), u173 (val), getNameValue (val), RunService (val)
    -- upvalues: u126 (ref), MarketplaceService (val)
    u104 = GameState.Replicator:Get("GameMode") == "PVP"
    u105 = GameState.Replicator:Get("Ranked") == true
    u103 = false
    for i, v in ipairs((a1:WaitForChild("Boards"):GetChildren())) do
        local u279 = tonumber((string.match(v.Name, "%d+")))
        local u284 = LobbyBoard.new(v, u279)
        if u279 == 2 then
            task.delay(10, function() -- Line: 274 -- upvalues: u103 (upval), PointerArrow (upval)
                if not u103 and workspace:FindFirstChild("IntermissionLobby") then
                    PointerArrow.new(workspace.IntermissionLobby.VoteTarget.Position)
                end
            end)
        end
        u147[u279] = u284
        u148[u284.name] = u284
        u284:BindToDestroy(function() -- Line: 284 -- upvalues: u147 (upval), u279 (val), u148 (upval), u284 (val)
            u147[u279] = nil
            u148[u284.name] = nil
        end)
        u284:BindSetMapChange(function(a1, a2) -- Line: 289 -- upvalues: u148 (upval), u284 (val)
            u148[a2] = nil
            u148[a1] = u284
        end)
        u284:BindClearVotes(function(a1) -- Line: 294 -- upvalues: u146 (upval)
            if u146[a1] then
                u146[a1]:Sweep()
            end
        end)
        u284:BindPromptTrigger(function(a1, a2) -- Line: 300 -- upvalues: LobbyVoting (upval)
            if not a2.Character then
                return
            end
            local Position = (a2.Character:GetPivot()).Position
            LobbyVoting:FireServer("Vote", a1, Position)
        end)
    end
    local u41 = {}
    local u42 = {}
    for i2, i3 in ipairs(PlayerGui.GameGui:GetChildren()) do
        if i3:IsA("GuiObject") and i3.Visible == true and i3.Name ~= "Hotbar" then
            if u247[i3.Name] then
                table.insert(u42, i3)
            else
                i3.Visible = false
                table.insert(u41, i3)
            end
        end
    end
    IntermissionStore.setIntermissionVisible(true)
    u123:Mark(function() -- Line: 334 -- upvalues: a1 (val)
        pcall(function() -- Line: 336 -- upvalues: a1 (upval)
            a1:Destroy()
        end)
    end)
    u123:Mark(function() -- Line: 341 -- upvalues: u41 (val), u42 (val), IntermissionStore (upval)
        for i, v in ipairs(u41) do
            v.Visible = true
        end
        for i2, i3 in ipairs(u42) do
            i3.Visible = true
        end
        IntermissionStore.setIntermissionVisible(false)
    end)
    u123:Mark(function() -- Line: 353 -- upvalues: PointerArrow (upval)
        PointerArrow.clear()
    end)
    u123:Mark((IntermissionStore.OverrideMap:Connect(function(a1) -- Line: 357 -- upvalues: LobbyVoting (upval), Notification (upval), IntermissionStore (upval)
        local v1, v2 = LobbyVoting:InvokeServer("Override", a1)
        local v3 = Color3.fromRGB(0, 236, 0)
        local v4 = "Map changed to " .. a1
        if not v1 then
            v3 = Color3.fromRGB(236, 0, 0)
            v4 = v2
        end
        Notification.Create({Text = v4, Color = v3})
        IntermissionStore.setMapOverrideVisible(false)
    end)))
    u123:Mark((LobbyVoting:On("Ready", function(a1, a2) -- Line: 376 -- upvalues: IntermissionStore (upval) -- types: a1: number, a2: number
        IntermissionStore.setTotalPlayers(a2)
        IntermissionStore.setReadyPlayers(a1)
    end)))
    u123:Mark((LobbyVoting:On("Veto", function(a1, a2) -- Line: 383 -- upvalues: IntermissionStore (upval) -- types: a1: number, a2: number
        IntermissionStore.setTotalVetoPlayers(a2)
        IntermissionStore.setVetoPlayers(a1)
        IntermissionStore.setIsReady(false)
    end)))
    local v1, v2, v3, v4 = LobbyVoting:InvokeServer("GetVoteStats")
    IntermissionStore.setTotalVetoPlayers(v4)
    IntermissionStore.setVetoPlayers(v3)
    IntermissionStore.setTotalPlayers(v2)
    IntermissionStore.setReadyPlayers(v1)
    IntermissionStore.setIsReady(false)

    local function onViewChange(a1) -- Line: 398 -- upvalues: IntermissionStore (upval), u42 (val)
        local v1 = a1 ~= "Inventory"
        IntermissionStore.setIntermissionVisible(v1)
        for i, v in ipairs(u42) do
            if v.Name ~= "Prompt" then
                v.Visible = v1
            end
        end
    end

    u123:Mark((ViewController:onViewChange(onViewChange)))
    u123:Mark((Charm.listen(function() -- Line: 413 -- upvalues: PVPIntermissionStore (upval)
        return PVPIntermissionStore.getState().Enabled
    end, function(a1) -- Line: 415 -- upvalues: onViewChange (val)
        onViewChange(if not a1 then "N/A" else "Inventory")
    end)))
    u123:Mark((IntermissionStore.LoadInventory:Connect(loadInventory)))
    u123:Mark(function() -- Line: 421 -- upvalues: ViewController (upval), IntermissionStore (upval)
        ViewController:setView("")
        IntermissionStore.setIntermissionVisible(false)
    end)
    u123:Mark((IntermissionStore.Ready:Connect(function() -- Line: 426 -- upvalues: LobbyVoting (upval)
        LobbyVoting:FireServer("Ready")
    end)))
    u123:Mark((IntermissionStore.Veto:Connect(function() -- Line: 430 -- upvalues: LobbyVoting (upval)
        LobbyVoting:FireServer("Veto")
    end)))
    u123:Mark((LobbyVoting:On("Override", function(a1, a2, a3) -- Line: 435 -- upvalues: u147 (upval) -- types: a1: userdata, a2: number, a3: string
        local v1 = u147[a2]
        assert(v1, "No board with id " .. a2)
        v1:SetMap(a3, a1)
    end)))
    u123:Mark((LobbyVoting:On("Vote", function(a1, a2, a3) -- Line: 444
        -- upvalues: u147 (upval), u225 (upval), refreshVotes (upval), u146 (upval), Players (upval), u103 (upval)
        -- upvalues: PointerArrow (upval), Totems (upval), spr (upval), SpringClass (upval), u145 (upval)
        -- upvalues: VoteIcon (upval), u173 (upval), getNameValue (upval), RunService (upval)
        if not a1 then
            for k2, v in pairs(u147) do
                v:ClearVotes()
            end
            for i6, i7 in u147 do
                i7.Prompt.Enabled = true
            end
            u225 = {}
            refreshVotes()
            return
        end
        if not a2 then
            for k, n in u147 do
                n:RemoveVote(a1)
                u225[a1] = nil
            end
            u146[a1]:Sweep()
            refreshVotes()
            if a1 == Players.LocalPlayer then
                for m, i5 in u147 do
                    i5.Prompt.Enabled = true
                end
            end
            refreshVotes()
            return
        end
        if a1 == Players.LocalPlayer then
            u103 = true
            PointerArrow.clear()
        end
        local v1 = u147[a2]
        assert(v1, "No board with id " .. a2)
        u225[a1] = a3
        local v2 = nil
        local v3 = nil
        local v4 = a1
        for i, j in u147, v2, v3 do
            if v4 == Players.LocalPlayer then
                j.Prompt.Enabled = not (v1 == j)
            end
            j:RemoveVote(v4)
        end
        local v5 = u146[v4]
        v5:Sweep()
        if a3 == nil then
            refreshVotes()
            return
        end
        local u117 = Totems:FindFirstChild(a3.skin):Clone()
        local PrimaryPart = u117.PrimaryPart
        local NumberValue = Instance.new("NumberValue")
        NumberValue.Parent = u117
        NumberValue.Value = 0
        NumberValue.Changed:Connect(function(a1) -- Line: 512 -- upvalues: u117 (val)
            u117:ScaleTo((math.max(0.001, a1)))
            if u117:FindFirstChild("Beam") then
                u117.Beam:ScaleTo((math.max(0.001, a1 * 0.25)))
            end
        end)
        u117:PivotTo((CFrame.new(a3.position)))
        spr.target(NumberValue, 1, 4, {Value = 1})
        local u151 = SpringClass.new(0, u145:NextNumber(0.2, 0.5), 12)
        local u162 = SpringClass.new(0, 1, u145:NextNumber(10, 14))
        local u183 = SpringClass.new(u145:NextNumber(-1.5707963267948966, 1.5707963267948966), u145:NextNumber(0.2, 0.5), u145:NextNumber(5, 8))
        local u187 = VoteIcon:Clone()
        u187.Container.TextLabel.Visible = v4 == Players.LocalPlayer
        u187.Container.Icon.Image = "rbxthumb://type=AvatarHeadShot&id=" .. v4.UserId .. "&w=420&h=420"
        local UIStroke = u187.Container.Icon.UIStroke
        local UserId = v4.UserId
        local PlayerByUserId = Players:GetPlayerByUserId(UserId)
        local Color = if not PlayerByUserId or PlayerByUserId.Team == nil then u173[(getNameValue(PlayerByUserId.Name) + 0) % #u173 + 1] else PlayerByUserId.TeamColor.Color
        UIStroke.Color = Color
        u187.Parent = PrimaryPart
        u187.Container.Size = UDim2.new(0, 0, 0, 0)
        spr.target(u187.Container, 1, 6, {Size = UDim2.new(1, 0, 0.9, 0)})
        u151.t = 0
        u162.t = u145:NextNumber(-12.566370614359172, 12.566370614359172)
        u183.t = 0
        u151.v = 40
        v5:Mark((RunService.Heartbeat:Connect(function() -- Line: 551 -- upvalues: u117 (val), a3 (val), u151 (val), u183 (val), u162 (val)
            u117:PivotTo((CFrame.new(a3.position + Vector3.new(0, math.abs(u151.p), 0))) * (CFrame.Angles(u183.p, u162.p, 0)))
        end)))
        v5:Mark((task.delay(0.25, function() -- Line: 557 -- upvalues: PrimaryPart (val), u145 (upval)
            local Attribute, Attribute_2, Attribute_3, v1
            for i, j in PrimaryPart:GetDescendants() do
                if j:IsA("ParticleEmitter") then
                    Attribute = j:GetAttribute("EmitCountRNG")
                    Attribute_2 = j:GetAttribute("EmitCount")
                    if Attribute then
                        v1 = u145:NextNumber(Attribute.Min, Attribute.Max)
                        j:Emit(v1)
                    elseif Attribute_2 then
                        j:Emit(Attribute_2)
                    end
                elseif j:IsA("Sound") then
                    Attribute_3 = j:GetAttribute("PlaybackSpeedRNG")
                    if Attribute_3 then
                        j.PlaybackSpeed = u145:NextNumber(Attribute_3.Min, Attribute_3.Max)
                    end
                    j:Play()
                end
            end
        end)))
        local UserId_2 = v4.UserId
        local PlayerByUserId_2 = Players:GetPlayerByUserId(UserId_2)
        local Color_2 = if not PlayerByUserId_2 or PlayerByUserId_2.Team == nil then u173[(getNameValue(PlayerByUserId_2.Name) + 0) % #u173 + 1] else PlayerByUserId_2.TeamColor.Color
        PrimaryPart.Color = Color_2
        v5:Mark(function() -- Line: 581 -- upvalues: spr (upval), NumberValue (val), u187 (val), u117 (val)
            spr.target(NumberValue, 1, 4, {Value = 0})
            spr.target(u187.Container.Icon, 1, 4, {ImageTransparency = 1, BackgroundTransparency = 1})
            spr.target(u187.Container.Icon.UIStroke, 1, 4, {Transparency = 1})
            spr.target(u187.Container.TextLabel, 1, 4, {TextTransparency = 1})
            spr.target(u187.Container.TextLabel.UIStroke, 1, 4, {Transparency = 1})
            spr.target(u187.Container, 1, 4, {Size = UDim2.new(0, 0, 0, 0)})
            task.delay(2, function() -- Line: 602 -- upvalues: u117 (upval)
                u117:Destroy()
            end)
        end)
        v1:AddVote(v4)
        u117.Parent = workspace.Trash
        refreshVotes()
    end)))
    if not u104 or not u105 then
        local ProximityPrompt = Instance.new("ProximityPrompt")
        ProximityPrompt.MaxActivationDistance = 10
        ProximityPrompt.RequiresLineOfSight = false
        ProximityPrompt.HoldDuration = 0.1
        ProximityPrompt.ObjectText = "Override Map"
        ProximityPrompt.Style = Enum.ProximityPromptStyle.Custom
        ProximityPrompt.Parent = a1:WaitForChild("MapVote")
        ProximityPrompt.Triggered:Connect(function(a1) -- Line: 623
            -- upvalues: Players (upval), u126 (upval), GameState (upval), Notification (upval)
            -- upvalues: MarketplaceService (upval), IntermissionStore (upval)
            if a1 ~= Players.LocalPlayer then
                return
            end
            if not u126 and not GameState.IsPrivateServer then
                Notification.Create({
                    Text = "you need to be a VIP user to override maps!",
                    Color = Color3.fromRGB(236, 0, 0),
                })
                MarketplaceService:PromptGamePassPurchase(Players.LocalPlayer, 10518590)
                return
            end
            IntermissionStore.setMapOverrideVisible(true)
        end)
        local ProximityPrompt_2 = Instance.new("ProximityPrompt")
        ProximityPrompt_2.MaxActivationDistance = 10
        ProximityPrompt_2.RequiresLineOfSight = false
        ProximityPrompt_2.HoldDuration = 0.1
        ProximityPrompt_2.ObjectText = "Open Inventory"
        ProximityPrompt_2.Style = Enum.ProximityPromptStyle.Custom
        ProximityPrompt_2.Parent = a1:WaitForChild("Inventory")
        ProximityPrompt_2.Triggered:Connect(function(a1) -- Line: 648 -- upvalues: Players (upval), ViewController (upval) -- types: a1: userdata
            if a1 ~= Players.LocalPlayer then
                return
            end
            ViewController:setView("Inventory")
        end)
    end
    u123:Mark(function() -- Line: 658 -- upvalues: IntermissionStore (upval)
        IntermissionStore.setMapOverrideVisible(false)
    end)
end

;(CollectionService:GetInstanceAddedSignal("IntermissionLobby")):Connect(onIntermissionLobby)
;(CollectionService:GetInstanceRemovedSignal("IntermissionLobby")):Connect(function() -- Line: 664 -- upvalues: u123 (val), u147 (val), u146 (val)
    u123:Sweep()
    for i, j in u147 do
        j:Destroy()
    end
    for k, v in pairs(u146) do
        v:Sweep()
    end
    table.clear(u147)
end)
for i2, v in ipairs(CollectionService:GetTagged("IntermissionLobby")) do
    task.defer(onIntermissionLobby, v)
end
return {}