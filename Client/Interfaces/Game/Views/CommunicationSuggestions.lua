-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.CommunicationSuggestions
-- Decompile time: 9.15 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ChatColorUtil = require(ReplicatedStorage.Shared.Modules.ChatColorUtil)
local Communication = require(ReplicatedStorage.Shared.Data.Communication)
local CommunicationConfig = require(ReplicatedStorage.Shared.Data.CommunicationConfig)
local CommunicationController = require(ReplicatedStorage.Client.Controllers.Game.CommunicationController)
local CommunicationStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.CommunicationStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local SharedGameConstants = require(ReplicatedStorage.Shared.Modules.SharedGameConstants)
local SuggestionPing = require(ReplicatedStorage.Client.Interfaces.Game.Components.SuggestionPing)
local Troops = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Troops)
local TowerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.TowerReplicator)
local createElement = React.createElement
local useEffect = React.useEffect
local LocalPlayer = Players.LocalPlayer
local PlaceTower = CommunicationConfig.CompletionRadius.PlaceTower

local function getSuggestionChatColor(a1) -- Line: 27 -- upvalues: Players (val), ChatColorUtil (val)
    local PlayerByUserId = Players:GetPlayerByUserId(a1.sourceUserId)
    return ChatColorUtil.getNameColor(PlayerByUserId and PlayerByUserId.Name or a1.sourceName)
end

local function getSuggestionRequesterName(a1) -- Line: 34 -- upvalues: LocalPlayer (val)
    if a1.sourceUserId == LocalPlayer.UserId then
        return "YOU"
    end
    return a1.sourceName
end

local function getSuggestionTowerName(a1) -- Line: 38
    local data = a1.data or {}
    if typeof(data.towerName) == "string" and data.towerName ~= "" then
        return data.towerName
    end
    return nil
end

local function getReplicatedField(a1, a2) -- Line: 45 -- types: a2: string
    local Replicator = a1 and a1.Replicator
    if Replicator then
        return (Replicator:Get(a2))
    end
    return nil
end

local function getTowerOwnerUserId(a1) -- Line: 50
    local OwnerId = a1
    if OwnerId then
        OwnerId = a1.OwnerId
        if not OwnerId then
            local Replicator = a1 and a1.Replicator
            OwnerId = if not Replicator then nil else Replicator:Get("OwnerId")
        end
    end
    if typeof(OwnerId) == "number" then
        return OwnerId
    end
    return nil
end

local function getTowerName(a1) -- Line: 55
    local Name = a1
    if Name then
        Name = a1.Name
        if not Name then
            Name = a1.TowerName
            if not Name then
                local Replicator = a1 and a1.Replicator
                Name = if not Replicator then nil else Replicator:Get("Name")
            end
        end
    end
    if typeof(Name) == "string" then
        return Name
    end
    return nil
end

local function getAttachmentPosition(a1) -- Line: 60 -- types: a1: userdata
    local Height = a1:FindFirstChild("Height") or a1:FindFirstChild("HeightOffset")
    if Height and Height:IsA("Attachment") then
        return Height.WorldPosition
    end
    return nil
end

local function getModelPosition(a1) -- Line: 69 -- types: a1: userdata
    local HumanoidRootPart = a1:FindFirstChild("HumanoidRootPart") or a1.PrimaryPart
    if not HumanoidRootPart then
        return a1:GetPivot().Position
    end
    local Height = HumanoidRootPart:FindFirstChild("Height") or HumanoidRootPart:FindFirstChild("HeightOffset")
    return (if not Height then nil else if not Height:IsA("Attachment") then nil else Height.WorldPosition) or HumanoidRootPart.Position
end

local function getTowerPosition(a1) -- Line: 79
    local WorldPosition
    if typeof(a1.Position) == "Vector3" then
        return a1.Position
    end
    if typeof(a1.BottomPosition) == "Vector3" then
        return a1.BottomPosition
    end
    if not a1.Model then
        return nil
    end
    local Model = a1.Model
    local HumanoidRootPart = Model:FindFirstChild("HumanoidRootPart") or Model.PrimaryPart
    if not HumanoidRootPart then
        return Model:GetPivot().Position
    end
    local Height = HumanoidRootPart:FindFirstChild("Height") or HumanoidRootPart:FindFirstChild("HeightOffset")
    if not (if not Height then nil else if not Height:IsA("Attachment") then nil else Height.WorldPosition) then
        return HumanoidRootPart.Position
    end
    return WorldPosition
end

local function getTowerCreatedAt(a1) -- Line: 95
    local CreatedAt = a1
    if CreatedAt then
        CreatedAt = a1.CreatedAt
        if not CreatedAt then
            local Replicator = a1 and a1.Replicator
            CreatedAt = if not Replicator then nil else Replicator:Get("CreatedAt")
        end
    end
    if typeof(CreatedAt) == "number" then
        return CreatedAt
    end
    return nil
end

local function isTowerPlacedAfterSuggestion(a1, a2) -- Line: 100
    if typeof(a2.gameCreatedAt) ~= "number" then
        return false
    end
    local CreatedAt = a1
    if CreatedAt then
        CreatedAt = a1.CreatedAt
        if not CreatedAt then
            local Replicator = a1 and a1.Replicator
            CreatedAt = if not Replicator then nil else Replicator:Get("CreatedAt")
        end
    end
    local v1 = if typeof(CreatedAt) ~= "number" then nil else CreatedAt
    local v2 = false
    if v1 ~= nil then
        v2 = a2.gameCreatedAt <= v1
    end
    return v2
end

local function isCompletedPlacementSuggestion(a1) -- Line: 109
    -- upvalues: Communication (val), TowerReplicator (val), PlaceTower (val)
    if a1.type ~= Communication.Type.PlaceTower then
        return false
    end
    local data = a1.data or {}
    if typeof(data.position) == "Vector3" and typeof(data.towerName) == "string" then
        local CreatedAt, Height, HumanoidRootPart, Model, Name, OwnerId, Position_2, Replicator, Replicator_2, Replicator_3, v1, v2
        local v3 = a1
        for i, j in TowerReplicator.getTowers() do
            OwnerId = j
            if OwnerId then
                OwnerId = j.OwnerId
                if not OwnerId then
                    Replicator = j and j.Replicator
                    OwnerId = if not Replicator then nil else Replicator:Get("OwnerId")
                end
            end
            v1 = if typeof(OwnerId) ~= "number" then nil else OwnerId
            if v1 == v3.targetUserId then
                Name = j
                if Name then
                    Name = j.Name
                    if not Name then
                        Name = j.TowerName
                        if not Name then
                            Replicator_2 = j and j.Replicator
                            Name = if not Replicator_2 then nil else Replicator_2:Get("Name")
                        end
                    end
                end
                v1 = if typeof(Name) ~= "string" then nil else Name
                if v1 == data.towerName then
                    if typeof(v3.gameCreatedAt) == "number" then
                        CreatedAt = j
                        if CreatedAt then
                            CreatedAt = j.CreatedAt
                            if not CreatedAt then
                                Replicator_3 = j and j.Replicator
                                CreatedAt = if not Replicator_3 then nil else Replicator_3:Get("CreatedAt")
                            end
                        end
                        v2 = if typeof(CreatedAt) ~= "number" then nil else CreatedAt
                        v1 = false
                        if v2 ~= nil then
                            v1 = v3.gameCreatedAt <= v2
                        end
                    else
                        v1 = false
                    end
                    if v1 then
                        if typeof(j.Position) == "Vector3" then
                            Position_2 = j.Position
                        elseif typeof(j.BottomPosition) == "Vector3" then
                            Position_2 = j.BottomPosition
                        elseif not j.Model then
                            Position_2 = nil
                        else
                            Model = j.Model
                            HumanoidRootPart = Model:FindFirstChild("HumanoidRootPart") or Model.PrimaryPart
                            if not HumanoidRootPart then
                                Position_2 = Model:GetPivot().Position
                            else
                                Height = HumanoidRootPart:FindFirstChild("Height") or HumanoidRootPart:FindFirstChild("HeightOffset")
                                Position_2 = (if not Height then nil else if not Height:IsA("Attachment") then nil else Height.WorldPosition) or HumanoidRootPart.Position
                            end
                        end
                        if Position_2 and (data.position - Position_2).Magnitude <= PlaceTower then
                            return true
                        end
                    end
                end
            end
        end
        return false
    end
    return false
end

local function shouldRemoveSuggestion(a1, a2) -- Line: 144
    -- upvalues: isCompletedPlacementSuggestion (val)
    local v1 = true
    if not (a1.expiresAt <= a2) then
        v1 = isCompletedPlacementSuggestion(a1)
    end
    return v1
end

local function getTowerPresentation(a1) -- Line: 148
    -- upvalues: Troops (val), SharedGameConstants (val)
    if not a1 then
        return nil, nil, nil
    end
    local v1 = Troops(a1)
    local Properties = v1 and v1.Properties
    local DisplayName = Properties and Properties.DisplayName
    local SkinData = Properties and Properties.SkinData and Properties.SkinData.Default
    local Preview = Properties and Properties.Preview
    local Icon = SkinData and SkinData.Icon or Preview and Preview.Icon
    local BoundarySize = if not v1 then nil else Properties and Properties.BoundarySize or SharedGameConstants.DEFAULT_BOUNDARY_SIZE
    return if typeof(DisplayName) ~= "string" then a1 else if DisplayName == "" then a1 else DisplayName, Icon, BoundarySize
end

local function getSuggestionHeader(a1, a2) -- Line: 169 -- upvalues: Communication (val) -- types: a2: string?
    local v1 = nil
    if a1.type == Communication.Type.PlaceTower then
        v1 = "PLACE"
    elseif a1.type == Communication.Type.SellTower then
        v1 = "SELL"
    elseif a1.type == Communication.Type.UpgradeTower then
        v1 = "UPGRADE"
    end
    if v1 then
        return (("%* %*"):format(v1, a2 or "TOWER"))
    end
    return Communication.getTypeLabel(a1.type):upper()
end

local function getSuggestionRadius(a1, a2) -- Line: 186 -- types: a2: number?
    local data = a1.data or {}
    local v1 = data.radius or a2
    if v1 then
        return (math.max(v1 * 1.5, 0))
    end
    return nil
end

return function() -- Line: 193
    -- upvalues: ReactCharm (val), CommunicationStore (val), useEffect (val), isCompletedPlacementSuggestion (val)
    -- upvalues: Communication (val), CommunicationController (val), getTowerPresentation (val), createElement (val)
    -- upvalues: SuggestionPing (val), getSuggestionHeader (val), LocalPlayer (val), Players (val), ChatColorUtil (val)
    -- upvalues: ReactRoblox (val)
    local PlayerByUserId, data, data_2, v1, v2, v3, v4, v5, v6
    local v7 = ReactCharm.useSignalState(CommunicationStore.getState)
    useEffect(function() -- Line: 196 -- upvalues: CommunicationStore (upval), isCompletedPlacementSuggestion (upval)
        local u2 = task.spawn(function() -- Line: 197 -- upvalues: CommunicationStore (upval), isCompletedPlacementSuggestion (upval)
            while true do
                CommunicationStore.removeSuggestions(function(a1) -- Line: 199 -- upvalues: isCompletedPlacementSuggestion (upval)
                    local v1 = true
                    if not (a1.expiresAt <= (workspace:GetServerTimeNow())) then
                        v1 = isCompletedPlacementSuggestion(a1)
                    end
                    return v1
                end)
                task.wait(0.1)
            end
        end)
        return function() -- Line: 207 -- upvalues: u2 (val)
            task.cancel(u2)
        end
    end, {})
    local v8 = {}
    local v9 = nil
    local v10 = nil
    for i, j in v7.suggestions, v9, v10 do
        if not v7.dismissed[i] and Communication.isMarkerType(j.type) then
            v4 = CommunicationController.getSuggestionPosition(j)
            if v4 then
                data = j.data or {}
                v5, v6, v1 = getTowerPresentation(if typeof(data.towerName) ~= "string" then nil else if data.towerName == "" then nil else data.towerName)
                v2 = {position = v4, header = getSuggestionHeader(j, v5)}
                v2.requesterName = if j.sourceUserId ~= LocalPlayer.UserId then j.sourceName else "YOU"
                v2.endTimestamp = j.expiresAt
                v2.imageId = v6 or Communication.getTypeIcon(j.type)
                data_2 = j.data or {}
                v3 = data_2.radius or v1
                v2.radius = if not v3 then nil else math.max(v3 * 1.5, 0)
                PlayerByUserId = Players:GetPlayerByUserId(j.sourceUserId)
                v2.color = ChatColorUtil.getNameColor(PlayerByUserId and PlayerByUserId.Name or j.sourceName)
                v8[i] = (createElement(SuggestionPing, v2))
            end
        end
    end
    return ReactRoblox.createPortal(v8, workspace.CurrentCamera, "communicationSuggestions")
end