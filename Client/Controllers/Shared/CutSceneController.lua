-- Script path: ReplicatedStorage.Client.Controllers.Shared.CutSceneController
-- Decompile time: 34.47 ms

local transformSceneAsset
local ContentProvider = game:GetService("ContentProvider")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local CutsceneConfig = require(ReplicatedStorage.Shared.Data.CutsceneConfig)
local CutscenePlayerAppearanceUtil = require(ReplicatedStorage.Client.Modules.CutscenePlayerAppearanceUtil)
local Moonlite = require(ReplicatedStorage.Client.Modules.Moonlite)
local MusicController = require(ReplicatedStorage.Client.Controllers.Shared.MusicController)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local Promise = require(ReplicatedStorage.Shared.Modules.Promise)
local TagReplicator = require(ReplicatedStorage.Client.Modules.TagReplicator)
local u85 = MusicController.CreateController("CutScene", 1)
local CutsceneStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.CutsceneStore)
local DialogController = require(ReplicatedStorage.Client.Controllers.Shared.DialogController)
local FFlagController = require(ReplicatedStorage.Client.Controllers.Shared.FFlagController)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local LightingController = require(ReplicatedStorage.Client.Controllers.Shared.LightingController)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local SubtitleStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.SubtitleStore)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local ViewStateStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.ViewStateStore)
local CutScenes = (ReplicatedStorage:WaitForChild("Assets")):WaitForChild("CutScenes")
local Cutscenes = Content("Cutscenes")
local u160 = table.clone(GameState.Replicator:Get("CutScenePlayed") or {})
local CutScenes_2 = NewNetwork.Channel("CutScenes")
local u165 = {}
local u166 = {PlayingCutScenes = {}, PlaybackPlayers = {}}
u166.CutSceneFinished = Signal.new()
local Folder = Instance.new("Folder")
Folder.Name = "CutScenes"
Folder.Parent = workspace
local u181 = FFlagController.get("game.hide-story", false)

local function isCachedCutSceneCurrent(a1) -- Line: 78 -- upvalues: CutScenes (val) -- types: a1: table
    if a1.Root.Parent ~= CutScenes or a1.Scene.Parent == nil then
        return false
    end
    if a1.Asset and a1.Asset.Parent == nil then
        return false
    end
    return true
end

local function now() -- Line: 94
    return workspace:GetServerTimeNow()
end

local function parsePlayerStandInIndex(a1) -- Line: 105 -- types: a1: string
    local v1 = tonumber((string.match(string.lower(a1), "^player(%d+)$")))
    if v1 and v1 >= 1 and v1 <= 8 then
        return v1
    end
    return nil
end

local function getPlayerStandInTagIndex(a1) -- Line: 110 -- types: a1: userdata
    local v1, v2
    local v3 = nil
    for i, j in a1:GetTags() do
        v2 = tonumber((string.match(string.lower(j), "^player(%d+)$")))
        v1 = if not v2 then nil else if not (v2 >= 1) then nil else if not (v2 <= 8) then nil else v2
        if v1 then
            if not v3 or v1 < v3 then
                v3 = v1
            end
        end
    end
    return v3
end

local function getPlayerStandIns(a1) -- Line: 122 -- upvalues: getPlayerStandInTagIndex (val) -- types: a1: userdata
    local v1, v2, v3, v4
    local u85 = {}

    local function addTaggedStandIn(a1) -- Line: 126
        -- upvalues: getPlayerStandInTagIndex (upval), u85 (val)
        local v1 = getPlayerStandInTagIndex(a1)
        if not v1 or u85[v1] then
            return
        end
        u85[v1] = {Index = v1, Model = a1}
    end

    if a1:IsA("Model") then
        v2 = getPlayerStandInTagIndex(a1)
        if v2 and not u85[v2] then
            u85[v2] = {Index = v2, Model = a1}
        end
    end
    for i, j in a1:GetDescendants() do
        if j:IsA("Model") then
            v4 = getPlayerStandInTagIndex(j)
            if v4 and not u85[v4] then
                u85[v4] = {Index = v4, Model = j}
            end
        end
    end
    for k, n in a1:GetChildren() do
        if n:IsA("Model") and not getPlayerStandInTagIndex(n) then
            v1 = tonumber((string.match(string.lower(n.Name), "^player(%d+)$")))
            v4 = if not v1 then nil else if not (v1 >= 1) then nil else if not (v1 <= 8) then nil else v1
            if v4 and not u85[v4] then
                u85[v4] = {Index = v4, Model = n}
            end
        end
    end
    v2 = {}
    for m = 1, 8 do
        v3 = u85[m]
        if v3 then
            table.insert(v2, v3)
        end
    end
    return v2
end

local function applyPlayerAppearances(a1) -- Line: 180
    -- upvalues: getPlayerStandIns (val), Players (val), CutscenePlayerAppearanceUtil (val)
    local Model, v1, v2, v3, v4
    local v5 = getPlayerStandIns(a1)
    if #v5 == 0 then
        return
    end
    local v6 = {}
    local LocalPlayer = Players.LocalPlayer
    table.insert(v6, LocalPlayer)
    for i, j in Players:GetPlayers() do
        if j ~= LocalPlayer then
            table.insert(v6, j)
        end
    end
    for k, n in v5 do
        Model = n.Model
        if Model.Parent then
            v1 = v6[n.Index]
            if v1 then
                v2, v3 = CutscenePlayerAppearanceUtil.ClonePlayer(v1)
                if v2 then
                    _, _, v4 = CutscenePlayerAppearanceUtil.BindToRig(Model, v2)
                    if v4 then
                        v2:Destroy()
                        warn((("[CutSceneController] Could not bind player appearance for %*: %*; retained authored visuals"):format(
                            Model.Name,
                            v4
                        )))
                    end
                else
                    warn((("[CutSceneController] Could not clone player appearance for %*: %*; retained authored visuals"):format(Model.Name, v3)))
                end
            else
                Model:Destroy()
            end
        end
    end
end

local u191 = {}

local function readCutSceneContentData(a1) -- Line: 231 -- upvalues: u191 (val) -- types: a1: userdata
    if not a1:IsA("ModuleScript") then
        return nil
    end
    local success, result = pcall(require, a1)
    if success and type(result) == "table" then
        u191[a1.Name] = result
        if type(result.Name) == "string" then
            u191[result.Name] = result
        end
        return result
    end
    return nil
end

local function getCutSceneContentData(a1) -- Line: 249
    -- upvalues: u191 (val), Cutscenes (val), readCutSceneContentData (val)
    local v1
    local v2 = u191[a1]
    if v2 ~= nil then
        return v2
    end
    local v3 = Cutscenes:FindFirstChild(a1)
    if v3 then
        return (readCutSceneContentData(v3))
    end
    for i, j in Cutscenes:GetChildren() do
        v1 = readCutSceneContentData(j)
        if v1 and type(v1.Name) == "string" and v1.Name == a1 then
            return v1
        end
    end
    u191[a1] = false
    return nil
end

local function normalizeSoundId(a1) -- Line: 271
    if type(a1) == "number" then
        return (("rbxassetid://%*"):format(a1))
    end
    if type(a1) == "string" and a1 ~= "" then
        if a1:match("^%d+$") then
            return (("rbxassetid://%*"):format(a1))
        end
        return a1
    end
    return nil
end

local function getConfigMusicId(a1) -- Line: 285
    if type(a1) ~= "table" then
        return nil
    end
    local MusicId = a1.MusicId or a1.MusicID or a1.musicId or a1.musicID
    if type(MusicId) == "number" then
        return (("rbxassetid://%*"):format(MusicId))
    end
    if type(MusicId) == "string" and MusicId ~= "" then
        if MusicId:match("^%d+$") then
            return (("rbxassetid://%*"):format(MusicId))
        end
        return MusicId
    end
    return nil
end

local function getConfigSubtitles(a1) -- Line: 295
    if type(a1) == "table" and type(a1.Subtitles) == "table" then
        return a1.Subtitles
    end
    return nil
end

local function getConfigWorldOffset(a1) -- Line: 303
    if type(a1) == "table" and typeof(a1.WorldOffset) == "Vector3" then
        return a1.WorldOffset
    end
    return nil
end

local function getMusicTrackSoundId(a1) -- Line: 311 -- upvalues: MusicController (val) -- types: a1: userdata?
    if a1 and a1.Value ~= "" then
        local v1 = MusicController.Tracks[a1.Value]
        if not v1 then
            warn((("[CutSceneController] Missing music track \"%*\""):format(a1.Value)))
            return nil
        end
        local Music = v1.Music
        if type(Music) == "number" then
            return (("rbxassetid://%*"):format(Music))
        end
        if type(Music) == "string" and Music ~= "" then
            if Music:match("^%d+$") then
                return (("rbxassetid://%*"):format(Music))
            end
            return Music
        end
        return nil
    end
    return nil
end

local function getCutsceneSoundId(a1) -- Line: 325 -- upvalues: MusicController (val) -- types: a1: table
    local MusicId = a1.MusicId
    if MusicId then
        return MusicId
    end
    local Music = a1.Music
    if Music and Music.Value ~= "" then
        local v1 = MusicController.Tracks[Music.Value]
        if not v1 then
            warn((("[CutSceneController] Missing music track \"%*\""):format(Music.Value)))
            return nil
        end
        local Music_2 = v1.Music
        if type(Music_2) == "number" then
            return (("rbxassetid://%*"):format(Music_2))
        end
        if type(Music_2) == "string" and Music_2 ~= "" then
            if Music_2:match("^%d+$") then
                return (("rbxassetid://%*"):format(Music_2))
            end
            return Music_2
        end
        return nil
    end
    return nil
end

local u202 = {Image = true, Texture = true, TextureID = true, TextureId = true}

local function addPreloadItem(a1, a2, a3) -- Line: 337 -- types: a1: table, a2: table
    if typeof(a3) == "Instance" then
        if a2[a3] then
            return
        end
        a2[a3] = true
        table.insert(a1, a3)
        return
    end
    local v1 = if type(a3) ~= "number" then if type(a3) ~= "string" then nil else if a3 ~= "" then if not a3:match("^%d+$") then a3 else ("rbxassetid://%*"):format(a3) else nil else ("rbxassetid://%*"):format(a3)
    if v1 and not a2[v1] then
        a2[v1] = true
        table.insert(a1, v1)
        return
    end
end

local function getHumanoidModels(a1) -- Line: 357 -- types: a1: userdata
    local Parent
    local v1 = {}
    local v2 = {}
    for i, j in a1:QueryDescendants("Humanoid") do
        Parent = j.Parent
        if Parent and Parent:IsA("Model") and not v2[Parent] then
            v2[Parent] = true
            table.insert(v1, Parent)
        end
    end
    return v1
end

local function isInHumanoidModel(a1, a2) -- Line: 372 -- types: a1: userdata, a2: table
    for i, j in a2 do
        if a1 ~= j and not a1:IsDescendantOf(j) then
            continue
        end
        return true
    end
    return false
end

local function resolveSceneItemTarget(a1, a2) -- Line: 382 -- types: a1: userdata
    local Path = not (type(a2) ~= "table") and a2.Path or nil
    local InstanceNames = not (type(Path) ~= "table") and Path.InstanceNames or nil
    if type(InstanceNames) ~= "table" then
        return nil
    end
    if InstanceNames[1] == "game" and InstanceNames[2] == "Workspace" and InstanceNames[3] == "CutScenes" then
        local v1 = a1
        local v2 = #InstanceNames
        for i = 5, v2 do
            if not v1 or not v1:FindFirstChild(InstanceNames[i]) then
                return nil
            end
        end
        return v1
    end
    return nil
end

local function readPackedKeyframeValues(a1) -- Line: 404 -- types: a1: userdata
    local success, result = pcall(require, a1)
    if success and type(result) == "table" then
        local Values_2 = if type(result.Values) ~= "table" then {} else result.Values
        if type(result.Count) == "number" then
            return Values_2, result.Count
        end
        return Values_2, 0
    end
    return {}, 0
end

local function readLegacyKeyframeValues(a1) -- Line: 416 -- types: a1: userdata
    local Value, v1
    local v2 = {}
    local v3 = 0
    local Values = a1:FindFirstChild("Values")
    if not Values then
        return v2, v3
    end
    for i, j in Values:GetChildren() do
        v1 = tonumber(j.Name)
        if v1 then
            Value = if not j:IsA("ValueBase") then j:GetAttribute("Value") else j.Value
            if Value ~= nil then
                v2[v1] = Value
                v3 = math.max(v3, v1)
            end
        end
    end
    return v2, v3
end

local function collectKeyframedFaceContentIds(a1, a2, a3, a4, a5) -- Line: 445
    -- upvalues: HttpService (val), resolveSceneItemTarget (val), u202 (val), readPackedKeyframeValues (val)
    -- upvalues: readLegacyKeyframeValues (val)
    local success, result = pcall(function() -- Line: 452 -- upvalues: HttpService (upval), a3 (val)
        return HttpService:JSONDecode(a3.Value)
    end)
    if success and type(result) == "table" and type(result.Items) == "table" then
        local v1, v2, v3, v4, v5, v6
        local Items_2 = result.Items
        local v7 = nil
        local v8 = nil
        local v9, v10, v11, v12 = a4, a5, a1, a2
        for i, j in Items_2, v7, v8 do
            v1 = resolveSceneItemTarget(v9, j)
            if v1 then
                for k, n in v10 do
                    if v1 == n then
                        v2 = true
                    elseif not v1:IsDescendantOf(n) then
                        continue
                    else
                        v2 = true
                    end
                    if v2 then
                        v2 = a3:FindFirstChild((tostring(i)))
                        if v2 then
                            for m, i5 in v2:GetChildren() do
                                if i5:IsA("Folder") and u202[i5.Name] then
                                    for i6, i7 in i5:GetChildren() do
                                        if tonumber(i7.Name) then
                                            if not i7:IsA("ModuleScript") then
                                                v3, v4 = readLegacyKeyframeValues(i7)
                                            else
                                                v3, v4 = readPackedKeyframeValues(i7)
                                            end
                                            for i8 = 0, v4 do
                                                v5 = v3[i8]
                                                if typeof(v5) ~= "Instance" then
                                                    v6 = if type(v5) ~= "number" then if type(v5) ~= "string" then nil else if v5 ~= "" then if not v5:match("^%d+$") then v5 else ("rbxassetid://%*"):format(v5) else nil else ("rbxassetid://%*"):format(v5)
                                                    if v6 and not v12[v6] then
                                                        v12[v6] = true
                                                        table.insert(v11, v6)
                                                    end
                                                elseif not v12[v5] then
                                                    v12[v5] = true
                                                    table.insert(v11, v5)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    break
                end
                v2 = false
                if v2 then
                    v2 = a3:FindFirstChild((tostring(i)))
                    if v2 then
                        for i9, i10 in v2:GetChildren() do
                            if i10:IsA("Folder") and u202[i10.Name] then
                                for i11, i12 in i10:GetChildren() do
                                    if tonumber(i12.Name) then
                                        if not i12:IsA("ModuleScript") then
                                            v3, v4 = readLegacyKeyframeValues(i12)
                                        else
                                            v3, v4 = readPackedKeyframeValues(i12)
                                        end
                                        for i13 = 0, v4 do
                                            v5 = v3[i13]
                                            if typeof(v5) ~= "Instance" then
                                                v6 = if type(v5) ~= "number" then if type(v5) ~= "string" then nil else if v5 ~= "" then if not v5:match("^%d+$") then v5 else ("rbxassetid://%*"):format(v5) else nil else ("rbxassetid://%*"):format(v5)
                                                if v6 and not v12[v6] then
                                                    v12[v6] = true
                                                    table.insert(v11, v6)
                                                end
                                            elseif not v12[v5] then
                                                v12[v5] = true
                                                table.insert(v11, v5)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        return
    end
end

local function preloadHumanoidFaceAssets(a1, a2) -- Line: 496
    -- upvalues: getHumanoidModels (val), collectKeyframedFaceContentIds (val), ContentProvider (val)
    if a1 and a2:IsA("StringValue") then
        local v1
        local v2 = getHumanoidModels(a1)
        if #v2 == 0 then
            return
        end
        local u104 = {}
        local v3 = {}
        local v4 = nil
        local v5 = nil
        local v6, v7 = a2, a1
        for i, j in v2, v4, v5 do
            for k, n in j:QueryDescendants("Decal, Texture, ImageLabel, ImageButton") do
                if typeof(n) ~= "Instance" then
                    v1 = if type(n) ~= "number" then if type(n) ~= "string" then nil else if n ~= "" then if not n:match("^%d+$") then n else ("rbxassetid://%*"):format(n) else nil else ("rbxassetid://%*"):format(n)
                    if v1 and not v3[v1] then
                        v3[v1] = true
                        table.insert(u104, v1)
                    end
                elseif not v3[n] then
                    v3[n] = true
                    table.insert(u104, n)
                end
            end
        end
        collectKeyframedFaceContentIds(u104, v3, v6, v7, v2)
        if #u104 == 0 then
            return
        end
        local success, result = pcall(function() -- Line: 521 -- upvalues: ContentProvider (upval), u104 (val)
            ContentProvider:PreloadAsync(u104)
        end)
        if not success then
            warn((("[CutSceneController] Failed to preload cutscene face assets: %*"):format(result)))
        end
        return
    end
end

local function getCutScene(a1) -- Line: 530
    -- upvalues: u165 (val), CutScenes (val), getCutSceneContentData (val), HttpService (val)
    local v1
    local v2 = u165[a1]
    if v2 then
        if if v2.Root.Parent == CutScenes then if v2.Scene.Parent ~= nil then if not v2.Asset then true else v2.Asset.Parent ~= nil else false else false then
            return v2
        end
        u165[a1] = nil
    end
    local v3 = CutScenes:FindFirstChild(a1) or CutScenes:WaitForChild(a1, 3)
    if not v3 then
        return
    end
    local Scene = v3:FindFirstChild("Scene")
    if not Scene then
        Scene = v3:WaitForChild("Scene", 3)
    end
    local Asset = v3:FindFirstChild("Asset")
    local Music = v3:FindFirstChild("Music")
    local Attribute = v3:GetAttribute("AspectRatio")
    local v4 = getCutSceneContentData(a1)
    if not Scene then
        warn((("Cutscene \"%*\" does not have cutscene animation!"):format(v3.Name)))
        return
    end
    local success, result = pcall(function() -- Line: 556 -- upvalues: HttpService (upval), Scene (val)
        return HttpService:JSONDecode(Scene.Value)
    end)
    if not success then
        warn((("Cutscene \"%*\" has invalid json:\n%*"):format(v3.Name, result)))
    end
    local v5 = nil
    if v3:FindFirstChild("Lighting") then
        v5 = require(v3.Lighting)
        v5.Custom = v3.Lighting:GetChildren()
    end
    local Subtitles_2 = if type(v4) ~= "table" then nil else if type(v4.Subtitles) == "table" then v4.Subtitles else nil
    if Subtitles_2 == nil and v3:FindFirstChild("Subtitles") then
        local Subtitles_3 = require(v3.Subtitles)
        if type(Subtitles_3) == "table" and next(Subtitles_3) ~= nil then
            Subtitles_2 = Subtitles_3
        end
    end
    local v6 = {}
    if v3:FindFirstChild("Dialog") then
        local Attribute_2, Attribute_3, v7
        for i, j in v3.Dialog:GetChildren() do
            v7 = tonumber(j.Name)
            if v7 then
                Attribute_2 = j:GetAttribute("Voice")
                if typeof(Attribute_2) == "number" then
                    Attribute_2 = "rbxassetid://" .. Attribute_2
                end
                Attribute_3 = j:GetAttribute("Hidden")
                v6[v7] = {
                    Speaker = j:GetAttribute("Speaker"),
                    Emotion = j:GetAttribute("Emotion"),
                    Hidden = if Attribute_3 ~= nil then Attribute_3 == true else nil,
                    Text = j:GetAttribute("Text"),
                    Flip = j:GetAttribute("Flip"),
                    Voice = Attribute_2,
                }
            end
        end
    end
    local u197 = {Name = a1, Root = v3}
    u197.Time = result.Information.Length / (result.Information.FPS or 60)
    u197.FPS = result.Information.FPS or 60
    u197.Scene = Scene
    u197.Asset = Asset
    u197.Music = Music
    if type(v4) == "table" then
        local MusicId = v4.MusicId or v4.MusicID or v4.musicId or v4.musicID
        v1 = if type(MusicId) ~= "number" then if type(MusicId) ~= "string" then nil else if MusicId ~= "" then if not MusicId:match("^%d+$") then MusicId else ("rbxassetid://%*"):format(MusicId) else nil else ("rbxassetid://%*"):format(MusicId)
    else
        v1 = nil
    end
    u197.MusicId = v1
    u197.Lighting = v5
    u197.Dialog = v6
    u197.Subtitles = Subtitles_2
    u197.AspectRatio = Attribute
    v1 = true
    if type(v4) == "table" then
        v1 = v4.Skippable ~= false
    end
    u197.Skippable = v1
    u197.WorldOffset = if type(v4) ~= "table" then nil else if typeof(v4.WorldOffset) == "Vector3" then v4.WorldOffset else nil
    u165[a1] = u197
    v3.Destroying:Once(function() -- Line: 620 -- upvalues: u165 (upval), a1 (val), u197 (val)
        if u165[a1] == u197 then
            u165[a1] = nil
        end
    end)
    return u197
end

local function toggleUserInterfaces() -- Line: 629 -- upvalues: Players (val)
    local u0 = {}
    for i, j in Players.LocalPlayer:WaitForChild("PlayerGui"):GetChildren() do
        if not table.find({
                "Cmdr",
                "FadeInOut",
                "ReactOverridesVote",
                "ReactUniversalQAWatermark",
                "ReactUniversalCutsceneSubtitle",
                "ReactUniversalCutsceneLetterbox",
                "ReactLobbyCutsceneSkipButton",
            }, j.Name)
            and j:IsA("ScreenGui")
            and j.Enabled then
            u0[j] = true
            j.Enabled = false
        end
    end
    return function() -- Line: 653 -- upvalues: u0 (val)
        for i in u0 do
            i.Enabled = true
        end
        table.clear(u0)
    end
end

local function updateCutScenesPlayed(a1) -- Line: 662 -- upvalues: GameState (val) -- types: a1: string
    local v1 = GameState.Replicator:Get("CutScenePlayed") or {}
    v1[a1] = true
    GameState.Replicator:Set("CutScenePlayed", v1)
end

local function suppressInterfaceBlur() -- Line: 672 -- upvalues: ViewStateStore (val)
    local u2 = ViewStateStore.getBlur()
    local u3 = false
    ViewStateStore.setBlur(0)
    return function() -- Line: 677 -- upvalues: u3 (ref), ViewStateStore (upval), u2 (val)
        if u3 then
            return
        end
        u3 = true
        if ViewStateStore.getBlur() == 0 then
            ViewStateStore.setBlur(u2)
        end
    end
end

function transformSceneAsset(a1, a2) -- Line: 689
    -- upvalues: transformSceneAsset (val)
    if a1:IsA("Model") then
        a1:PivotTo(a2 * (a1:GetPivot()))
        return
    end
    if a1:IsA("BasePart") then
        a1.CFrame = a2 * a1.CFrame
        return
    end
    for i, j in a1:GetChildren() do
        transformSceneAsset(j, a2)
    end
end

local u220 = nil

local function clearScreenFade() -- Line: 706 -- upvalues: u220 (ref)
    if u220 then
        u220()
        u220 = nil
    end
end

local function fadeInOut(a1) -- Line: 713
    -- upvalues: Create (val), Players (val), TweenService (val)
    local u1 = true
    local u8 = Create("ScreenGui", {
        Name = "FadeInOut",
        DisplayOrder = 9999,
        IgnoreGuiInset = true,
        Parent = Players.LocalPlayer.PlayerGui,
    })
    local u18 = Create("Frame", {
        Name = "Fade",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.new(),
        Parent = u8,
    })
    TweenService:Create(u18, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {BackgroundTransparency = 0}):Play()
    if not a1 then
        task.wait(0.5)
    end
    return function() -- Line: 745 -- upvalues: u1 (ref), TweenService (upval), u18 (val), u8 (val)
        if not u1 then
            return
        end
        u1 = false
        TweenService:Create(u18, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {BackgroundTransparency = 1}):Play()
        task.delay(0.5, function() -- Line: 759 -- upvalues: u8 (upval)
            u8:Destroy()
        end)
    end
end

local function findCutscenePath(a1, a2) -- Line: 765 -- types: a1: userdata, a2: string
    local v1 = a1
    for i in a2:gmatch("[^/]+") do
        if not v1 then
            return nil
        end
        v1 = v1:FindFirstChild(i)
    end
    return v1
end

local function findCutsceneVfxTarget(a1, a2, a3) -- Line: 778
    -- upvalues: findCutscenePath (val)
    if a2 == "" then
        return a3
    end
    if a2:find("/", 1, true) then
        local v1 = findCutscenePath(a1, a2)
        if v1 then
            return v1
        end
    end
    return a1:FindFirstChild(a2, true)
end

local function startCutsceneSubtitles(a1, a2, a3, a4) -- Line: 797
    -- upvalues: CutsceneConfig (val), SubtitleStore (val), RunService (val)
    local v1, v2
    if not a1.Subtitles then
        return nil
    end
    local u49 = {}
    local v3 = 0
    local u75 = a1.FPS or 60
    local v4 = nil
    local v5 = nil
    for i, j in a1.Subtitles, v4, v5 do
        if j.delay then
            v3 = v3 + j.delay
        end
        v1 = v3
        v2 = v3 + j.lifetime
        table.insert(u49, {
            startTime = v1,
            endTime = v2,
            startFrame = math.floor(v1 * u75 + 0.5),
            endFrameExclusive = math.floor(v2 * u75 + 0.5),
            subTitle = j,
        })
    end
    table.sort(u49, function(a1, a2) -- Line: 832
        return a1.startTime < a2.startTime
    end)
    local u64 = nil
    local u78 = 1
    local u81 = #u49

    local function resolveSpeaker(a1, a2) -- Line: 840 -- upvalues: CutsceneConfig (upval) -- types: a2: userdata?
        local Name
        local DefaultSpeakerColor = CutsceneConfig.DefaultSpeakerColor
        if type(a1) ~= "string" then
            Name = if not a1.Name then tostring(a1) else a1.Name
            if a1.Color then
                DefaultSpeakerColor = a1.Color
            end
            if a2 then
                DefaultSpeakerColor = a2
            end
            return Name, DefaultSpeakerColor
        end
        Name = a1
        local v1 = CutsceneConfig.Speaker[a1]
        DefaultSpeakerColor = if not v1 then CutsceneConfig.DefaultSpeakerColor else if not v1.Color then CutsceneConfig.DefaultSpeakerColor else v1.Color
        if a2 and a2 ~= CutsceneConfig.DefaultSpeakerColor then
            return Name, a2
        end
        return Name, DefaultSpeakerColor
    end

    local function applySubtitle(a1) -- Line: 874 -- upvalues: SubtitleStore (upval), u64 (ref), resolveSpeaker (val)
        if not a1 then
            SubtitleStore.setVisible(false)
            u64 = nil
            return
        end
        local v1, v2 = resolveSpeaker(a1.subTitle.speaker, a1.subTitle.speakerColor)
        SubtitleStore.setSpeaker(v1)
        SubtitleStore.setText(a1.subTitle.text)
        SubtitleStore.setSpeakerColor(v2)
        SubtitleStore.setVisible(true)
        u64 = a1
    end

    if 0 < a2.TimePosition then
        local v6, v7
        local TimePosition = a2.TimePosition
        v2 = 1
        local v8 = u81
        while v2 <= v8 do
            v6 = math.floor((v2 + v8) / 2)
            v7 = u49[v6]
            if TimePosition < v7.startTime then
                v8 = v6 - 1
            elseif not (v7.endTime < TimePosition) then
                u78 = v6
                break
            else
                v2 = v6 + 1
            end
        end
    end
    local u54 = nil
    u54 = (RunService.Heartbeat:Connect(function() -- Line: 909
        -- upvalues: a4 (val), SubtitleStore (upval), u64 (ref), u54 (ref), a3 (val), a2 (val), u75 (val), u78 (ref)
        -- upvalues: u81 (val), u49 (val), applySubtitle (val)
        if a4() then
            SubtitleStore.setVisible(false)
            u64 = nil
            u54:Disconnect()
            return
        end
        local v1 = a3()
        local v2 = math.floor((if not v1 then a2.TimePosition else if not v1.IsLoaded then a2.TimePosition else if not v1.IsPlaying then a2.TimePosition else v1.TimePosition) * u75 + 0.5)
        while u78 > 1 do
            if not (u81 < u78) and not (v2 < u49[u78].startFrame) then
                break
            end
            u78 = u78 - 1
        end
        while u78 <= u81 do
            if not (u49[u78].endFrameExclusive <= v2) then
                break
            end
            if u64 == u49[u78] then
                SubtitleStore.setVisible(false)
                u64 = nil
            end
            u78 = u78 + 1
        end
        if u81 < u78 then
            if u64 then
                SubtitleStore.setVisible(false)
                u64 = nil
            end
            return
        end
        local v3 = u49[u78]
        if v3 and v3.startFrame <= v2 and v2 < v3.endFrameExclusive then
            if v3 == u64 then
                return
            end
            applySubtitle(v3)
            return
        end
        if u64 then
            SubtitleStore.setVisible(false)
            u64 = nil
        end
    end))
    return u54
end

function u166.Setup(a1) -- Line: 957
    -- upvalues: transformSceneAsset (val), Folder (val), applyPlayerAppearances (val), preloadHumanoidFaceAssets (val)
    -- upvalues: LightingController (val), Moonlite (val), findCutscenePath (val), ReplicatedStorage (val)
    -- upvalues: DialogController (val), u220 (ref), fadeInOut (val), u85 (val)
    local v1
    local Scene = a1.Scene
    local u9 = nil
    local u47 = nil
    if a1.Asset then
        u9 = a1.Asset:Clone()
        u9.Name = a1.Name
        if a1.WorldOffset then
            v1 = CFrame.new(a1.WorldOffset)
            transformSceneAsset(u9, v1)
        end
        u9.Parent = Folder
        applyPlayerAppearances(u9)
        preloadHumanoidFaceAssets(u9, Scene)
    end
    if a1.Lighting then
        if workspace.Type.Value == "Game" and LightingController.CurrentProfile == "Default" then
            LightingController.UpdateDefaultProfile()
        end
        u47 = LightingController.Apply("CutScene", a1.Lighting, true)
    end
    v1 = if not a1.WorldOffset then nil else CFrame.new(a1.WorldOffset)
    local v2 = Moonlite.CreatePlayer(Scene, nil, v1)
    local u76 = (v2:GetAnimationEventSignal("VFX")):Connect(function(a1, a2) -- Line: 989
        -- upvalues: u9 (ref), findCutscenePath (upval), Moonlite (upval)
        local v1
        if not u9 then
            return
        end
        local v2 = u9
        if a1 == "" then
            v1 = a2
        elseif not a1:find("/", 1, true) then
            v1 = v2:FindFirstChild(a1, true)
        else
            local v3 = findCutscenePath(v2, a1)
            v1 = if not v3 then v2:FindFirstChild(a1, true) else v3
        end
        if not v1 then
            warn((("[CutSceneController] Could not find cutscene VFX \"%*\""):format(a1)))
            return
        end
        if v1 ~= u9 and not v1:IsDescendantOf(u9) then
            warn((("[CutSceneController] Could not find cutscene VFX \"%*\""):format(a1)))
            return
        end
        Moonlite.EmitVFX(v1)
    end)
    local v3 = workspace.Type.Value ~= "Lobby"
    local u91 = nil
    if v3 then
        u91 = require(ReplicatedStorage.Client.Controllers.Game.NewPlacementController)
        u91:Disable()
    end
    v2.Completed:Connect(function(a1) -- Line: 1014 -- upvalues: u76 (val), u9 (ref), u47 (ref), u91 (ref)
        if a1 == Enum.PlaybackState.Playing then
            return
        end
        u76:Disconnect()
        if u9 then
            u9:Destroy()
        end
        if u47 then
            u47()
        end
        if u91 then
            u91:Enable()
        end
    end)
    if next(a1.Dialog) then
        local u119 = 1
        ;(v2:GetMarkerReachedSignal("Dialog")):Connect(function() -- Line: 1036 -- upvalues: a1 (val), u119 (ref), DialogController (upval)
            local v1 = a1.Dialog[u119]
            if not v1 then
                return
            end
            DialogController.Queue(v1)
            u119 = u119 + 1
        end)
    end
    ;(v2:GetMarkerReachedSignal("ScreenFade")):Connect(function(a1) -- Line: 1047 -- upvalues: u220 (upval), fadeInOut (upval) -- types: a1: boolean
        if not a1 then
            if u220 then
                u220()
                u220 = nil
            end
            return
        end
        if u220 then
            u220()
            u220 = nil
        end
        u220 = fadeInOut(true)
    end)
    ;(v2:GetMarkerReachedSignal("MusicFade")):Connect(function(a1_2) -- Line: 1056 -- upvalues: a1 (val), u85 (upval) -- types: a1_2: boolean
        if not a1_2 then
            if u85:IsPlaying() then
                u85:Stop()
            end
            return
        end
        if a1.Music and a1.Music.Value ~= "" then
            u85:Play(a1.Music.Value)
            return
        end
    end)
    return v2
end

function u166.Play(a1, a2) -- Line: 1071
    -- upvalues: getCutScene (val), Promise (val), u166 (val), SoundService (val), fadeInOut (val)
    -- upvalues: toggleUserInterfaces (val), ViewStateStore (val), u85 (val), u220 (ref), CutsceneStore (val)
    -- upvalues: GameState (val), ReplicatedStorage (val), RunService (val), MusicController (val)
    -- upvalues: startCutsceneSubtitles (val), SubtitleStore (val)
    local u8 = a2 or workspace:GetServerTimeNow()
    local u13 = workspace:GetServerTimeNow() - u8
    local u17 = getCutScene(a1)
    if u17 and not (u17.Time < workspace:GetServerTimeNow() - u8) then
        u166.Stop(a1)
        local Volume = SoundService.Music.Volume
        SoundService.Music.Volume = 0
        local u35 = fadeInOut()
        local u37 = toggleUserInterfaces()
        local u40 = ViewStateStore.getBlur()
        local u41 = false
        ViewStateStore.setBlur(0)

        local function u46() -- Line: 677 -- upvalues: u41 (ref), ViewStateStore (upval), u40 (val)
            if u41 then
                return
            end
            u41 = true
            if ViewStateStore.getBlur() == 0 then
                ViewStateStore.setBlur(u40)
            end
        end

        local u47 = false
        local u51 = u166.Setup(u17)
        u51.Looped = false
        u166.PlaybackPlayers[a1] = u51
        local u58 = Promise.new(function(a1_2, a2, a3) -- Line: 1094
            -- upvalues: u85 (upval), u220 (upval), SoundService (upval), Volume (val), u51 (val), CutsceneStore (upval)
            -- upvalues: u35 (val), u37 (val), u46 (val), a1 (val), GameState (upval), ReplicatedStorage (upval)
            -- upvalues: u47 (ref), RunService (upval), fadeInOut (upval), u8 (ref), u13 (val), u17 (val)
            -- upvalues: MusicController (upval), startCutsceneSubtitles (upval), SubtitleStore (upval)
            local u3 = nil
            local u4 = nil
            local u5 = nil
            local u6 = nil
            a3(function() -- Line: 1099
                -- upvalues: u3 (ref), u4 (ref), u5 (ref), u6 (ref), u85 (upval), u220 (upval), SoundService (upval)
                -- upvalues: Volume (upval), u51 (upval), CutsceneStore (upval), u35 (upval), u37 (upval), u46 (upval)
                if u3 then
                    u3:Disconnect()
                    u3 = nil
                end
                if u4 then
                    task.cancel(u4)
                    if u5 then
                        u5()
                    end
                    if u6 then
                        task.cancel(u6)
                        u6 = nil
                    end
                    u4 = nil
                    u5 = nil
                end
                if u85:IsPlaying() then
                    u85:Stop()
                end
                if u220 then
                    u220()
                    u220 = nil
                end
                SoundService.Music.Volume = Volume
                u51:Stop()
                CutsceneStore.setEnabled(false)
                CutsceneStore.setSkipEnabled(false)
                u35()
                u37()
                u46()
            end)
            local v1 = u51.Completed:Connect(function(a1_3) -- Line: 1137
                -- upvalues: u85 (upval), SoundService (upval), Volume (upval), a1 (upval), GameState (upval)
                -- upvalues: u220 (upval), u37 (upval), u46 (upval), a1_2 (val)
                if a1_3 == Enum.PlaybackState.Completed then
                    if u85:IsPlaying() then
                        u85:Stop()
                    end
                    SoundService.Music.Volume = Volume
                    local v1 = a1
                    local v2 = GameState.Replicator:Get("CutScenePlayed") or {}
                    v2[v1] = true
                    GameState.Replicator:Set("CutScenePlayed", v2)
                    if u220 then
                        u220()
                        u220 = nil
                    end
                    u37()
                    u46()
                    a1_2()
                end
            end)
            if workspace.Type.Value == "Game" then
                require(ReplicatedStorage.Client.Controllers.Game.NewPlacementController):Stop()
            end
            v1 = task.spawn(function() -- Line: 1159
                -- upvalues: u51 (upval), u47 (upval), RunService (upval), CutsceneStore (upval), u5 (ref)
                -- upvalues: fadeInOut (upval), u4 (ref)
                local v1 = u51:GetTimeLength() - 0.15
                while not u47 do
                    if not (u51.TimePosition < v1) then
                        break
                    end
                    RunService.Heartbeat:Wait()
                end
                if u47 then
                    return
                end
                CutsceneStore.setEnabled(false)
                u47 = true
                u5 = fadeInOut(true)
                task.wait(1.1)
                u5()
                u4 = nil
                u5 = nil
            end)
            v1 = (workspace:GetServerTimeNow()) - u8
            if u13 < 0.5 then
                v1 = 0
            end
            u51.TimePosition = v1
            CutsceneStore.setAspectRatio(u17.AspectRatio)
            CutsceneStore.setLetterboxEnabled(u17.AspectRatio ~= nil)
            CutsceneStore.setSkipEnabled(u17.Skippable)
            CutsceneStore.setEnabled(true)
            local Value = workspace.Music.Value
            local u124 = nil
            local u74 = false
            local v2 = u17
            local MusicId = v2.MusicId
            if not MusicId then
                local Music = v2.Music
                if not Music then
                    MusicId = nil
                elseif Music.Value ~= "" then
                    local v3 = MusicController.Tracks[Music.Value]
                    if v3 then
                        local Music_2 = v3.Music
                        MusicId = if type(Music_2) ~= "number" then if type(Music_2) ~= "string" then nil else if Music_2 ~= "" then if not Music_2:match("^%d+$") then Music_2 else ("rbxassetid://%*"):format(Music_2) else nil else ("rbxassetid://%*"):format(Music_2)
                    else
                        warn((("[CutSceneController] Missing music track \"%*\""):format(Music.Value)))
                        MusicId = nil
                    end
                else
                    MusicId = nil
                end
            end
            if MusicId then
                workspace.Music.Value = ""
                u124 = Instance.new("Sound")
                u124.SoundId = MusicId
                task.defer(function() -- Line: 1204 -- upvalues: u124 (ref), SoundService (upval)
                    u124.SoundGroup = SoundService:WaitForChild("Cutscene")
                end)
                u124.Volume = 1
                u124.Parent = workspace
            end
            local u143 = startCutsceneSubtitles(u17, u51, function() -- Line: 1212 -- upvalues: u124 (ref)
                return u124
            end, function() -- Line: 1214 -- upvalues: u74 (ref)
                return u74
            end)
            task.spawn(function() -- Line: 1218 -- upvalues: u51 (upval), u124 (ref)
                u51:Play(u124)
            end)
            u51.Completed:Once(function() -- Line: 1222 -- upvalues: u74 (ref), u143 (val), u124 (ref), Value (val), SubtitleStore (upval)
                u74 = true
                if u143 then
                    u143:Disconnect()
                end
                if u124 then
                    u124:Destroy()
                    workspace.Music.Value = Value
                end
                SubtitleStore.setVisible(false)
            end)
            task.delay(0.2, u35)
        end)
        u58:finally(function() -- Line: 1240
            -- upvalues: u220 (upval), u46 (val), CutsceneStore (upval), u166 (upval), a1 (val), u51 (val), u58 (val)
            -- upvalues: u47 (ref), fadeInOut (upval)
            if u220 then
                u220()
                u220 = nil
            end
            u46()
            CutsceneStore.setSkipEnabled(false)
            if u166.PlaybackPlayers[a1] == u51 then
                u166.PlaybackPlayers[a1] = nil
            end
            if u166.PlayingCutScenes[a1] == u58 then
                u166.PlayingCutScenes[a1] = nil
            end
            if u47 then
                return
            end
            CutsceneStore.setEnabled(false)
            u47 = true
            local v1 = fadeInOut(true)
            task.wait(1.1)
            v1()
        end)
        u166.PlayingCutScenes[a1] = u58
        return u58
    end
    return (Promise.resolve())
end

function u166.PlayLocal(a1, a2) -- Line: 1269
    -- upvalues: Promise (val), CutScenes (val), CutScenes_2 (val), getCutScene (val), u166 (val)
    return Promise.new(function(a1_2, a2_2, a3) -- Line: 1270
        -- upvalues: CutScenes (upval), a1 (val), CutScenes_2 (upval), a2 (val), getCutScene (upval), u166 (upval)
        -- upvalues: Promise (upval)
        local u3 = nil
        a3(function() -- Line: 1273 -- upvalues: u3 (ref)
            if u3 then
                u3:cancel()
            end
        end)
        local v1 = CutScenes:FindFirstChild(a1)
        if not v1 then
            local v2, v3 = CutScenes_2:invokeServer("RequestCutscene", a2)
            if not v2 then
                a2_2(v3)
                return
            end
            v1 = CutScenes:WaitForChild(a1, 3)
        end
        if not v1 then
            a2_2((("Cutscene \"%*\" was not replicated"):format(a1)))
            return
        end
        if not getCutScene(a1) then
            a2_2((("Cutscene \"%*\" did not finish loading"):format(a1)))
            return
        end
        u3 = u166.Play(a1)
        ;(u3:andThen(a1_2)):catch(a2_2)
        u3:finally(function(a1) -- Line: 1305 -- upvalues: Promise (upval), a1_2 (val)
            if a1 == Promise.Status.Cancelled then
                a1_2()
            end
        end)
    end)
end

function u166.PlayStoryLocal(a1, a2) -- Line: 1313
    -- upvalues: Promise (val), CutScenes_2 (val), CutScenes (val), getCutScene (val), u166 (val)
    return Promise.new(function(a1_2, a2_2, a3) -- Line: 1314
        -- upvalues: CutScenes_2 (upval), a1 (val), a2 (val), CutScenes (upval), getCutScene (upval), u166 (upval)
        -- upvalues: Promise (upval)
        local u3 = nil
        a3(function() -- Line: 1317 -- upvalues: u3 (ref)
            if u3 then
                u3:cancel()
            end
        end)
        local v1, v2 = CutScenes_2:invokeServer("RequestStoryCutscene", a1, a2)
        if not v1 then
            a2_2(v2)
            return
        end
        local v3 = CutScenes:FindFirstChild(v2) or CutScenes:WaitForChild(v2, 3)
        if not v3 then
            a2_2((("Cutscene \"%*\" was not replicated"):format(v2)))
            return
        end
        if not getCutScene(v2) then
            a2_2((("Cutscene \"%*\" did not finish loading"):format(v2)))
            return
        end
        u3 = u166.Play(v2)
        ;(u3:andThen(a1_2)):catch(a2_2)
        u3:finally(function(a1) -- Line: 1345 -- upvalues: Promise (upval), a1_2 (val)
            if a1 == Promise.Status.Cancelled then
                a1_2()
            end
        end)
    end)
end

function u166.WaitForCutScene(a1) -- Line: 1353
    -- upvalues: TypedPromise (val), u181 (val), GameState (val)
    return TypedPromise.new(function(a1_2, a2, a3) -- Line: 1354 -- upvalues: u181 (upval), GameState (upval), a1 (val)
        if u181() then
            a1_2()
            return
        end
        local u7 = nil
        a3(function() -- Line: 1362 -- upvalues: u7 (ref)
            if u7 then
                u7:Disconnect()
            end
        end)

        local function checkHasPlayed() -- Line: 1368 -- upvalues: GameState (upval), a1 (upval), u7 (ref), a1_2 (val)
            local v1 = GameState.Replicator:Get("CutScenePlayed") or {}
            if not v1[a1] then
                return
            end
            u7:Disconnect()
            u7 = nil
            a1_2()
        end

        local v1 = (GameState.Replicator:GetStateChangedSignal("CutScenePlayed")):Connect(checkHasPlayed)
        checkHasPlayed()
    end)
end

function u166.Stop(a1) -- Line: 1385 -- upvalues: u166 (val) -- types: a1: string
    if not u166.PlayingCutScenes[a1] then
        return false
    end
    u166.PlayingCutScenes[a1]:cancel()
    u166.PlayingCutScenes[a1] = nil
    return true
end

function u166.GetPlaybackPlayer(a1) -- Line: 1395 -- upvalues: u166 (val) -- types: a1: string
    return u166.PlaybackPlayers[a1]
end

function u166.Pause(a1) -- Line: 1399 -- upvalues: u166 (val) -- types: a1: string
    local v1 = u166.GetPlaybackPlayer(a1)
    return not (v1 == nil) and v1:Pause() or false
end

function u166.Resume(a1) -- Line: 1404 -- upvalues: u166 (val) -- types: a1: string
    local v1 = u166.GetPlaybackPlayer(a1)
    return not (v1 == nil) and v1:Resume() or false
end

function u166.Seek(a1, a2) -- Line: 1409 -- upvalues: u166 (val) -- types: a1: string, a2: number
    local v1 = u166.GetPlaybackPlayer(a1)
    return v1 and v1:Seek(a2) or nil
end

function u166.SkipPlayingCutScenes() -- Line: 1414 -- upvalues: u166 (val)
    local v1 = false
    for i in u166.PlayingCutScenes do
        if u166.Stop(i) then
            v1 = true
        end
    end
    return v1
end

function u166.IsPlaying() -- Line: 1426 -- upvalues: u166 (val)
    if next(u166.PlayingCutScenes) then
        return true
    end
    return false
end

;(GameState.Replicator:GetStateChangedSignal("CutScenePlayed")):Connect(function(a1) -- Line: 1434 -- upvalues: u160 (ref), u166 (val)
    local v1 = u160
    u160 = table.clone(a1 or {})
    for i, j in u160 do
        if not v1[i] then
            u166.CutSceneFinished:Fire(i)
        end
    end
end)
TagReplicator.hook("CutSceneManager", function(a1, a2) -- Line: 1445 -- upvalues: u166 (val)
    a2.Changed:Connect(function(a1, a2) -- Line: 1446 -- upvalues: u166 (upval) -- types: a1: string, a2: number?
        if a2 and a2 > 0 then
            u166.Play(a1, a2)
            return
        end
        u166.Stop(a1)
    end)
    for i, j in a2:GetAllStates() do
        if not j or not (j > 0) then
            u166.Stop(i)
        else
            u166.Play(i, j)
        end
    end
end)
CutScenes_2:onEvent("SkipCutscenes", function() -- Line: 1460 -- upvalues: u166 (val)
    u166.SkipPlayingCutScenes()
end)
return u166