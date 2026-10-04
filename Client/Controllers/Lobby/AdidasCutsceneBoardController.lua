-- Script path: ReplicatedStorage.Client.Controllers.Lobby.AdidasCutsceneBoardController
-- Decompile time: 15.01 ms

local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CutSceneController = require(ReplicatedStorage.Client.Controllers.Shared.CutSceneController)
local Nights = require(ReplicatedStorage.Shared.Data.Nights)
local Sift = require(ReplicatedStorage.Packages.Sift)
local LocalPlayer = Players.LocalPlayer
local Nights_2 = LocalPlayer:WaitForChild("Nights")
local u39 = Color3.new(0, 0, 0)
local u44 = Color3.new(1, 1, 1)
local u45 = {
    {name = "ADIDAS_C1", rawId = "AdidasCutscene1"},
    {name = "ADIDAS_C2", rawId = "AdidasCutscene2"},
    {name = "ADIDAS_C3", rawId = "AdidasCutscene3"},
}
local u49 = {}

local function getTaggedChild(a1, a2, a3) -- Line: 40 -- types: a1: userdata, a2: string, a3: string
    local v1 = a1:FindFirstChild(a2, true)
    if v1 and v1.ClassName == a3 then
        return v1
    end
    return nil
end

local function isNightUnlocked(a1, a2) -- Line: 49
    -- upvalues: Nights (val), Nights_2 (val)
    local v1 = Nights.Nights[a1]
    if not v1 then
        return false
    end
    local Attribute = Nights_2:GetAttribute(a1)
    local v2 = if type(Attribute) ~= "number" then 0 else Attribute
    local v3 = false
    if a2 < v2 then
        v3 = Nights.isNightIndexActive(v1, a2)
    end
    return v3
end

local function getStringAttribute(a1, a2) -- Line: 60 -- types: a1: userdata, a2: string
    local Attribute = a1:GetAttribute(a2)
    if type(Attribute) == "string" then
        return Attribute
    end
    return nil
end

local function getNumberAttribute(a1, a2) -- Line: 65 -- types: a1: userdata, a2: string
    local Attribute = a1:GetAttribute(a2)
    if type(Attribute) == "number" then
        return Attribute
    end
    return nil
end

local function getPromptText(a1, a2, a3) -- Line: 70 -- types: a1: userdata, a2: userdata, a3: number
    local Attribute = a2:GetAttribute("DisplayText")
    local v1 = if type(Attribute) ~= "string" then nil else Attribute
    if not v1 then
        local Attribute_2 = a1:GetAttribute((("DisplayText%*"):format(a3)))
        v1 = if type(Attribute_2) ~= "string" then nil else Attribute_2
        if not v1 then
            local Attribute_3 = a1:GetAttribute("DisplayText")
            v1 = (if type(Attribute_3) ~= "string" then nil else Attribute_3) or ("Watch Cutscene %*"):format(a3)
        end
    end
    return v1
end

local function getPromptRange(a1, a2) -- Line: 77 -- types: a1: userdata, a2: userdata
    local Attribute = a2:GetAttribute("Range")
    local v1 = if type(Attribute) ~= "number" then nil else Attribute
    if not v1 then
        local Attribute_2 = a1:GetAttribute("Range")
        v1 = (if type(Attribute_2) ~= "number" then nil else Attribute_2) or 10
    end
    return v1
end

local function getCutscene(a1, a2) -- Line: 81 -- upvalues: u45 (val) -- types: a1: userdata, a2: number
    local v1 = u45[a2]
    if not v1 then
        return nil
    end
    local v2 = {}
    local Attribute = a1:GetAttribute("CutsceneName")
    v2.name = (if type(Attribute) ~= "string" then nil else Attribute) or v1.name
    local Attribute_2 = a1:GetAttribute("CutsceneRawId")
    v2.rawId = (if type(Attribute_2) ~= "string" then nil else Attribute_2) or v1.rawId
    return v2
end

local function getArticlePrompt(a1) -- Line: 93 -- types: a1: userdata
    local Interaction = a1:FindFirstChild("Interaction")
    if Interaction and Interaction:IsA("ProximityPrompt") then
        return Interaction
    end
    return a1:FindFirstChildWhichIsA("ProximityPrompt", true)
end

local function connectPrompt(a1, a2, a3, a4) -- Line: 102
    -- upvalues: Sift (val), LocalPlayer (val), getCutscene (val), CutSceneController (val)
    if a4.prompts[a3] == a1 then
        return
    end
    a4.prompts = Sift.Dictionary.merge(a4.prompts, {[a3] = a1})
    a4.connections = Sift.Array.append(a4.connections, (a1.Triggered:Connect(function(a1_2) -- Line: 116
        -- upvalues: LocalPlayer (upval), a1 (val), a4 (val), getCutscene (upval), a2 (val), a3 (val)
        -- upvalues: CutSceneController (upval)
        if a1_2 == LocalPlayer and a1.Enabled and not a4.playing then
            local v1 = getCutscene(a2, a3)
            if not v1 then
                return
            end
            a4.playing = true
            ;((CutSceneController.PlayLocal(v1.name, v1.rawId)):catch(warn)):finally(function() -- Line: 127 -- upvalues: a4 (upval)
                a4.playing = false
            end)
            return
        end
    end)))
end

local function updateBoard(a1, a2) -- Line: 135
    -- upvalues: Nights (val), Nights_2 (val), u44 (val), u39 (val), connectPrompt (val)
    local Attribute, Attribute_2, Attribute_3, Attribute_4, Attribute_5, Attribute_6, Attribute_7, Decal, Interaction, v1, v2, v3, v4, v5
    local v6 = a1:GetAttribute("AdidasEvent") or "Adidas2026"
    local v7 = a1:GetAttribute("ArticleCount") or 3
    local v8 = false
    local v9 = a2
    for i = 1, v7 do
        v5 = Nights.Nights[v6]
        if v5 then
            Attribute = Nights_2:GetAttribute(v6)
            v1 = if type(Attribute) ~= "number" then 0 else Attribute
            v4 = false
            if i < v1 then
                v4 = Nights.isNightIndexActive(v5, i)
            end
        else
            v4 = false
        end
        v1 = a1:FindFirstChild(("Article%*"):format(i), true)
        v5 = if not v1 then nil else if v1.ClassName ~= "Part" then nil else v1
        Decal = v5 and v5:FindFirstChildOfClass("Decal")
        v3 = a1:FindFirstChild(("Beam%*"):format(i), true)
        v1 = if not v3 then nil else if v3.ClassName ~= "Beam" then nil else v3
        v2 = v5
        if v2 then
            Interaction = v5:FindFirstChild("Interaction")
            v2 = if not Interaction then v5:FindFirstChildWhichIsA("ProximityPrompt", true) else if not Interaction:IsA("ProximityPrompt") then v5:FindFirstChildWhichIsA("ProximityPrompt", true) else Interaction
        end
        if Decal then
            Decal.Color3 = if not v4 then u39 else u44
        end
        if v1 then
            Attribute_2 = v1:GetAttribute("DefaultBrightness")
            v1.Brightness = if not v4 then 0 else Attribute_2 or 5
            v1.Enabled = v4
        end
        if v2 then
            if v9 then
                connectPrompt(v2, v5, i, v9)
            end
            Attribute_3 = v5:GetAttribute("DisplayText")
            v3 = if type(Attribute_3) ~= "string" then nil else Attribute_3
            if not v3 then
                Attribute_4 = a1:GetAttribute((("DisplayText%*"):format(i)))
                v3 = if type(Attribute_4) ~= "string" then nil else Attribute_4
                if not v3 then
                    Attribute_5 = a1:GetAttribute("DisplayText")
                    v3 = (if type(Attribute_5) ~= "string" then nil else Attribute_5) or ("Watch Cutscene %*"):format(i)
                end
            end
            v2.ObjectText = v3
            v2:SetAttribute("BaseText", v2.ObjectText)
            Attribute_6 = v5:GetAttribute("Range")
            v3 = if type(Attribute_6) ~= "number" then nil else Attribute_6
            if not v3 then
                Attribute_7 = a1:GetAttribute("Range")
                v3 = (if type(Attribute_7) ~= "number" then nil else Attribute_7) or 10
            end
            v2.MaxActivationDistance = v3
            v2.Enabled = v4
        end
        v8 = v8 or v4
    end
    local SpotLight = a1:FindFirstChildWhichIsA("SpotLight", true)
    if SpotLight then
        local Attribute_8 = SpotLight:GetAttribute("DefaultBrightness")
        SpotLight.Brightness = if not v8 then 0 else Attribute_8 or 6
    end
end

local function addBoard(a1) -- Line: 178
    -- upvalues: u49 (val), Nights_2 (val), updateBoard (val)
    if a1:IsA("Model") and not u49[a1] then
        local u7 = {playing = false, connections = {}, prompts = {}}
        u49[a1] = u7
        table.insert(u7.connections, (Nights_2.AttributeChanged:Connect(function(a1_2) -- Line: 193 -- upvalues: a1 (val), updateBoard (upval), u7 (val)
            if a1_2 == (a1:GetAttribute("AdidasEvent") or "Adidas2026") then
                updateBoard(a1, u7)
            end
        end)))
        table.insert(u7.connections, (a1.AttributeChanged:Connect(function() -- Line: 203 -- upvalues: updateBoard (upval), a1 (val), u7 (val)
            updateBoard(a1, u7)
        end)))
        updateBoard(a1, u7)
        return
    end
end

;(CollectionService:GetInstanceAddedSignal("AdidasSign")):Connect(addBoard)
;(CollectionService:GetInstanceRemovedSignal("AdidasSign")):Connect(function(a1) -- Line: 211 -- upvalues: u49 (val) -- types: a1: userdata
    local v1 = u49[a1]
    if not v1 then
        return
    end
    for i, j in v1.connections do
        j:Disconnect()
    end
    u49[a1] = nil
end)
for i, j in CollectionService:GetTagged("AdidasSign") do
    task.spawn(addBoard, j)
end
return true