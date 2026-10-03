-- Script path: ReplicatedStorage.Client.Controllers.Shared.DebugController.Tools.CutsceneDebugger
-- Decompile time: 50.03 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CutSceneController = require(ReplicatedStorage.Client.Controllers.Shared.CutSceneController)
local Moonlite = require(ReplicatedStorage.Client.Modules.Moonlite)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local Specials = require(ReplicatedStorage.Client.Modules.Moonlite.Specials)
require(script.Parent.Types)
local u37 = nil
local CutScenes = NewNetwork.Channel("CutScenes")
local u41 = {Name = "Cutscene Debugger"}
local u47 = Color3.fromRGB(255, 195, 73)
local u52 = Color3.fromRGB(255, 92, 92)
local u57 = Color3.fromRGB(118, 211, 255)
local u62 = Color3.fromRGB(255, 255, 255)
local u67 = Color3.fromRGB(82, 219, 255)
local u72 = Color3.fromRGB(255, 255, 255)
local u77 = Color3.fromRGB(129, 255, 119)
local u82 = Color3.fromRGB(255, 140, 74)
local u87 = Color3.fromRGB(178, 127, 255)
local u91 = setmetatable({}, {__mode = "k"})
local u95 = setmetatable({}, {__mode = "k"})
local u99 = setmetatable({}, {__mode = "k"})

local function getCutScenesFolder() -- Line: 81 -- upvalues: ReplicatedStorage (val)
    local Assets = ReplicatedStorage:FindFirstChild("Assets")
    return Assets and Assets:FindFirstChild("CutScenes") or nil
end

local function getContentCutscenesFolder() -- Line: 86 -- upvalues: ReplicatedStorage (val)
    local Content = ReplicatedStorage:FindFirstChild("Content")
    return Content and Content:FindFirstChild("Cutscenes") or nil
end

local function getCutscenePart(a1) -- Line: 91 -- types: a1: table
    local v1 = a1.RawId or ""
    local PackageName = a1.PackageName
    local v2 = v1:match("[Cc]utscene(%d+)$") or PackageName:match("CUTSCENE(%d+)$") or PackageName:match("_C(%d+)$") or PackageName:match("C(%d+)$")
    if not v1:match("[Cc]utscene[Bb]oss$") and not PackageName:match("CUTSCENEBOSS$") then
        if v2 then
            return (("Part %*"):format(v2))
        end
        return nil
    end
    return "Boss"
end

local function getCutsceneLabels(a1) -- Line: 110 -- upvalues: getCutscenePart (val) -- types: a1: table
    local v1
    local v2 = {}
    local v3 = nil
    local v4 = nil
    for i, j in a1, v3, v4 do
        v1 = getCutscenePart(j)
        table.insert(v2, if not v1 then j.DisplayName else ("%*: %*"):format(v1, j.DisplayName))
    end
    return v2
end

local function getCutsceneStateLabel(a1) -- Line: 123 -- types: a1: table
    if a1.Replicated then
        return "Replicated"
    end
    return "Requestable"
end

local function getCutsceneEntries() -- Line: 127 -- upvalues: ReplicatedStorage (val)
    local v1 = {}
    local v2 = {}
    local Assets = ReplicatedStorage:FindFirstChild("Assets")
    local v3 = Assets and Assets:FindFirstChild("CutScenes") or nil
    if v3 then
        local v4
        for i, j in v3:GetChildren() do
            if j:FindFirstChild("Scene") then
                v4 = {Replicated = true, DisplayName = j.Name, PackageName = j.Name}
                v2[j.Name] = v4
                table.insert(v1, v4)
            end
        end
    end
    local Content = ReplicatedStorage:FindFirstChild("Content")
    local v5 = Content and Content:FindFirstChild("Cutscenes") or nil
    if v5 then
        local Name_2, result, success, v6, v7, v8
        for k, n in v5:GetChildren() do
            if n:IsA("ModuleScript") then
                success, result = pcall(require, n)
                Name_2 = if not success or type(result) ~= "table" then n.Name else if type(result.Name) ~= "string" then n.Name else result.Name
                v6 = v2[Name_2]
                if not v6 then
                    v7 = {DisplayName = n.Name, PackageName = Name_2, RawId = n.Name}
                    v8 = false
                    if v3 ~= nil then
                        v8 = v3:FindFirstChild(Name_2) ~= nil
                    end
                    v7.Replicated = v8
                    table.insert(v1, v7)
                else
                    v6.DisplayName = n.Name
                    v6.RawId = n.Name
                end
            end
        end
    end
    table.sort(v1, function(a1, a2) -- Line: 177
        return (a1.DisplayName:lower()) < a2.DisplayName:lower()
    end)
    return v1
end

local function setCutsceneEntries(a1) -- Line: 184 -- upvalues: getCutsceneLabels (val), u41 (val) -- types: a1: table
    local v1 = getCutsceneLabels(a1)
    u41._cutsceneEntries:set(a1)
    u41._cutsceneLabels:set(v1)
    local v2 = u41._selectedLabel:get()
    if v2 == nil or not table.find(v1, v2) then
        u41._selectedLabel:set(v1[1] or "")
    end
end

local function getSelectedEntry() -- Line: 195 -- upvalues: u41 (val)
    local v1 = u41._cutsceneEntries:get()
    local v2 = table.find(u41._cutsceneLabels:get(), u41._selectedLabel:get())
    return v2 and v1[v2] or nil
end

local function getEntryFromLabel(a1) -- Line: 203 -- upvalues: u41 (val) -- types: a1: string
    local v1 = u41._cutsceneEntries:get()
    local v2 = table.find(u41._cutsceneLabels:get(), a1)
    return v2 and v1[v2] or nil
end

local function getSequenceLabels(a1) -- Line: 211 -- types: a1: table
    local v1 = {}
    for i, j in a1 do
        table.insert(v1, j.DisplayName)
    end
    return v1
end

local function getSequenceItemLabels(a1) -- Line: 221 -- types: a1: table
    local Label, Trigger
    local v1 = {}
    for i, j in a1.Items do
        Label = j.Label
        Trigger = j.Trigger
        table.insert(v1, (("%*. %* [%*]"):format(i, Label, Trigger)))
    end
    return v1
end

local function getSelectedSequence() -- Line: 231 -- upvalues: u41 (val)
    local v1 = u41._modeSequences:get()
    local v2 = table.find(u41._modeSequenceLabels:get(), u41._selectedModeSequence:get())
    return v2 and v1[v2] or nil
end

local function getSelectedSequenceItem(a1) -- Line: 239
    -- upvalues: getSequenceItemLabels (val), u41 (val)
    local v1 = table.find(getSequenceItemLabels(a1), u41._selectedSequenceItem:get())
    return v1 and a1.Items[v1] or nil, v1
end

local function sequenceItemToEntry(a1) -- Line: 246 -- upvalues: ReplicatedStorage (val) -- types: a1: table
    local Assets = ReplicatedStorage:FindFirstChild("Assets")
    local v1 = Assets and Assets:FindFirstChild("CutScenes") or nil
    local v2 = {DisplayName = a1.Label, PackageName = a1.PackageName, RawId = a1.RawId}
    local v3 = false
    if v1 ~= nil then
        v3 = v1:FindFirstChild(a1.PackageName) ~= nil
    end
    v2.Replicated = v3
    return v2
end

local function setModeSequences(a1) -- Line: 257 -- upvalues: u41 (val), getSequenceItemLabels (val) -- types: a1: table
    local v1 = {}
    for i, j in a1 do
        table.insert(v1, j.DisplayName)
    end
    u41._modeSequences:set(a1)
    u41._modeSequenceLabels:set(v1)
    local v2 = u41._selectedModeSequence:get()
    if v2 == "" or not table.find(v1, v2) then
        u41._selectedModeSequence:set(v1[1] or "")
    end
    local v3 = u41._modeSequences:get()
    local v4 = table.find(u41._modeSequenceLabels:get(), u41._selectedModeSequence:get())
    local v5 = v4 and v3[v4] or nil
    v3 = v5 and getSequenceItemLabels(v5) or {}
    local v6 = u41._selectedSequenceItem:get()
    if v6 == "" or not table.find(v3, v6) then
        u41._selectedSequenceItem:set(v3[1] or "")
    end
end

local function entryMatchesSearch(a1, a2, a3) -- Line: 275 -- types: a1: table, a2: string, a3: string
    local v1 = a3:lower():match("^%s*(.-)%s*$")
    if v1 == "" then
        return true
    end
    local v2 = true
    if a2:lower():find(v1, 1, true) == nil then
        v2 = true
        if a1.DisplayName:lower():find(v1, 1, true) == nil then
            v2 = true
            if a1.PackageName:lower():find(v1, 1, true) == nil then
                v2 = false
                if a1.RawId ~= nil then
                    v2 = a1.RawId:lower():find(v1, 1, true) ~= nil
                end
            end
        end
    end
    return v2
end

local function getFilteredLabels(a1, a2, a3) -- Line: 287
    -- upvalues: entryMatchesSearch (val)
    local v1
    local v2 = {}
    for i, j in a2 do
        v1 = a1[i]
        if v1 and entryMatchesSearch(v1, j, a3) then
            table.insert(v2, j)
        end
    end
    return v2
end

local function formatPath(a1) -- Line: 304 -- types: a1: table?
    if type(a1) ~= "table" then
        return "<missing path>"
    end
    return table.concat(a1, ".")
end

local function findRelativeDescendant(a1, a2) -- Line: 312 -- types: a1: userdata, a2: table
    local v1 = a1
    local v2 = nil
    local v3 = nil
    for i, j in a2, v2, v3 do
        v1 = v1 and v1:FindFirstChild(j)
        if not v1 then
            return nil
        end
    end
    return v1
end

local function resolveTarget(a1, a2) -- Line: 325 -- types: a1: userdata
    local Asset = a1:FindFirstChild("Asset")
    local CutScenes = workspace:FindFirstChild("CutScenes")
    if not Asset and CutScenes then
        Asset = CutScenes:FindFirstChild(a1.Name)
    end
    local Path = a2.Path
    local InstanceNames = not (type(Path) ~= "table") and Path.InstanceNames or nil
    if type(InstanceNames) ~= "table" then
        return nil
    end
    if InstanceNames[1] == "game" and InstanceNames[2] == "Workspace" and InstanceNames[3] == "CurrentCamera" then
        return workspace.CurrentCamera
    end
    if Asset
        and InstanceNames[1] == "game"
        and InstanceNames[2] == "Workspace"
        and InstanceNames[3] == "CutScenes" then
        local v1 = {}
        local v2 = #InstanceNames
        for i = 5, v2 do
            table.insert(v1, InstanceNames[i])
        end
        if #v1 == 0 then
            return Asset
        end
        local v3 = Asset
        local v4 = nil
        local v5 = nil
        for j, k in v1, v4, v5 do
            v3 = v3 and v3:FindFirstChild(k)
            if not v3 then
                return nil
            end
        end
        return v3
    end
    return nil
end

local function readPackedValues(a1) -- Line: 364 -- types: a1: userdata
    local success, result = pcall(require, a1)
    if success and type(result) == "table" then
        local Values = result.Values or {}
        return Values, result.Count or 0
    end
    return {}, 0
end

local function readLegacyValues(a1) -- Line: 373 -- types: a1: userdata
    local v1
    local v2 = {}
    local v3 = 0
    local Values = a1:FindFirstChild("Values")
    if not Values then
        return v2, v3
    end
    for i, j in Values:GetChildren() do
        v1 = tonumber(j.Name)
        if v1 and j:IsA("ValueBase") then
            v2[v1] = j.Value
            v3 = math.max(v3, v1)
        end
    end
    return v2, v3
end

local function formatValue(a1) -- Line: 395
    local v1 = typeof(a1)
    if v1 ~= "boolean" and v1 ~= "number" and v1 ~= "string" then
        return v1
    end
    return (tostring(a1))
end

local function scanPropertyValues(a1) -- Line: 405
    -- upvalues: readPackedValues (val), readLegacyValues (val)
    local v1, v2, v3, v4, v5
    local v6 = {}
    local v7 = 0
    local v8 = 0
    local v9 = 0
    local v10 = 0
    local v11 = {}
    for i, j in a1:GetChildren() do
        if tonumber(j.Name) then
            v7 = v7 + 1
            if not j:IsA("ModuleScript") then
                v1, v2 = readLegacyValues(j)
            else
                v1, v2 = readPackedValues(j)
            end
            for k = 0, v2 do
                v3 = v1[k]
                if v3 ~= nil then
                    v4 = typeof(v3)
                    v6[v4] = true
                    if #v11 < 5 then
                        v5 = typeof(v3)
                        table.insert(
                            v11,
                            if v5 == "boolean" then tostring(v3) else if v5 == "number" then tostring(v3) else if v5 ~= "string" then v5 else tostring(v3)
                        )
                    end
                    if v4 ~= "number" then
                        if v4 ~= "boolean" then
                            v10 = v10 + 1
                        elseif v3 == true then
                            v9 = v9 + 1
                        end
                    elseif v3 > 0 then
                        v8 = v8 + 1
                    end
                end
            end
        end
    end
    local v12 = {}
    for n in v6 do
        table.insert(v12, n)
    end
    table.sort(v12)
    return {
        Keyframes = v7,
        PositiveNumbers = v8,
        TrueBooleans = v9,
        UnsupportedEmitValues = v10,
        ValueSummary = table.concat(v11, ", "),
        ValueTypes = v12,
    }
end

local function addIssue(a1, a2) -- Line: 470 -- types: a1: table, a2: table
    table.insert(a1.Issues, a2)
end

local function canReadProperty(a1, a2) -- Line: 474 -- upvalues: Specials (val) -- types: a1: userdata, a2: string
    for i, j in Specials.Index do
        if a1:IsA(i) and j[a2] then
            return true
        end
    end
    return (pcall(function() -- Line: 481 -- upvalues: a1 (val), a2 (val)
        return a1[a2]
    end))
end

local function analyzeCutscene(a1) -- Line: 488
    -- upvalues: HttpService (val), resolveTarget (val), scanPropertyValues (val), canReadProperty (val)
    local v1 = {Items = 0, Properties = 0, Keyframes = 0, Name = a1.Name}
    v1.Issues = {}
    v1.CFrameTracks = {}
    v1.ParticleTracks = {}
    local Scene = a1:FindFirstChild("Scene")
    if Scene and Scene:IsA("StringValue") then
        local success, result = pcall(function() -- Line: 508 -- upvalues: HttpService (upval), Scene (val)
            return HttpService:JSONDecode(Scene.Value)
        end)
        if success and type(result) == "table" and type(result.Items) == "table" then
            local InstanceNames, InstanceTypes, Path, ValueTypes, v2, v3, v4, v5, v6, v7, v8, v9
            v1.Items = #result.Items
            local v10 = nil
            local v11 = nil
            for i, j in result.Items, v10, v11 do
                v2 = Scene:FindFirstChild((tostring(i)))
                Path = j.Path
                InstanceNames = not (type(Path) ~= "table") and Path.InstanceNames or nil
                v3 = if type(InstanceNames) == "table" then table.concat(InstanceNames, ".") else "<missing path>"
                v4 = resolveTarget(a1, j)
                if v2 then
                    if not v4 then
                        table.insert(v1.Issues, {
                            Kind = "MissingTarget",
                            Message = "Scene path could not be resolved against this package Asset.",
                            Path = v3,
                        })
                    end
                    for k, n in v2:GetChildren() do
                        if n:IsA("Folder") and n.Name ~= "Rig" and n.Name ~= "MarkerTrack" then
                            v1.Properties = v1.Properties + 1
                            v5 = scanPropertyValues(n)
                            ValueTypes = v5.ValueTypes
                            v1.Keyframes = v1.Keyframes + v5.Keyframes
                            v6 = table.concat(ValueTypes, ", ")
                            if table.find(ValueTypes, "CFrame") then
                                table.insert(v1.CFrameTracks, {
                                    Kind = "CFrameTrack",
                                    Message = ("CFrame track: %*.%*"):format(v3, n.Name),
                                    Path = v3,
                                    Property = n.Name,
                                    ValueType = v6,
                                })
                            end
                            InstanceTypes = not (type(Path) ~= "table") and Path.InstanceTypes or nil
                            v7 = not (type(InstanceTypes) ~= "table") and InstanceTypes[#InstanceTypes] or nil
                            v8 = true
                            if n.Name ~= "Emit" then
                                v8 = true
                                if n.Name ~= "Clear" then
                                    v8 = true
                                    if v7 ~= "ParticleEmitter" then
                                        v8 = v4 and v4:IsA("ParticleEmitter")
                                    end
                                end
                            end
                            if v8 then
                                v9 = if v5.ValueSummary == "" then "" else (" values: %*"):format(v5.ValueSummary)
                                table.insert(v1.ParticleTracks, {
                                    Kind = "ParticleTrack",
                                    Message = ("%*.%* (%*)%*"):format(v3, n.Name, v6, v9),
                                    Path = v3,
                                    Property = n.Name,
                                    ValueType = v6,
                                })
                            end
                            if n.Name == "Emit" then
                                if 0 < v5.UnsupportedEmitValues then
                                    table.insert(v1.Issues, {
                                        Kind = "UnsupportedEmitValue",
                                        Message = "Emit tracks should export positive numbers or true boolean pulses.",
                                        Path = v3,
                                        Property = n.Name,
                                        ValueType = v6,
                                    })
                                elseif v5.PositiveNumbers == 0 and v5.TrueBooleans == 0 then
                                    table.insert(v1.Issues, {
                                        Kind = "EmitNeverFires",
                                        Message = "Emit track was found, but no positive number or true boolean values were detected.",
                                        Path = v3,
                                        Property = n.Name,
                                        ValueType = v6,
                                    })
                                end
                            end
                            if v4 and not canReadProperty(v4, n.Name) then
                                table.insert(v1.Issues, {
                                    Kind = "UnsupportedProperty",
                                    Message = ("Target %* does not expose property/special '%*'."):format(v4.ClassName, n.Name),
                                    Path = v3,
                                    Property = n.Name,
                                    ValueType = v6,
                                })
                            end
                            if v4
                                and n.Name == "CFrame"
                                and not v4:IsA("BasePart")
                                and not v4:IsA("Camera")
                                and not v4:IsA("Model") then
                                table.insert(v1.Issues, {
                                    Kind = "LikelyUnsupportedCFrame",
                                    Message = ("CFrame is only directly assignable on BasePart/Camera-like targets or Moonlite-bound Models, got %*."):format(v4.ClassName),
                                    Path = v3,
                                    Property = n.Name,
                                    ValueType = v6,
                                })
                            end
                        end
                    end
                else
                    table.insert(v1.Issues, {
                        Kind = "MissingItemFolder",
                        Message = ("Scene has item %*, but Scene.%* is missing."):format(i, i),
                        Path = v3,
                    })
                end
            end
            return v1
        end
        table.insert(v1.Issues, {Kind = "InvalidSceneJson", Message = ("Scene JSON could not be decoded: %*"):format(result)})
        return v1
    end
    table.insert(v1.Issues, {Kind = "MissingScene", Message = "Package has no StringValue named Scene."})
    return v1
end

local function renderIssue(a1) -- Line: 642 -- upvalues: u37 (ref) -- types: a1: table
    u37.Text({(("[$%*] %*"):format(a1.Kind, a1.Message))})
    if a1.Path then
        u37.Text({(("  path: %*"):format(a1.Path))})
    end
    if a1.Property then
        u37.Text({(("  property: %* (%*)"):format(a1.Property, a1.ValueType or "unknown"))})
    end
end

local function setAnalysis(a1) -- Line: 652 -- upvalues: u41 (val) -- types: a1: table?
    u41._analysis:set(a1)
end

local function analyzeEntry(a1) -- Line: 656
    -- upvalues: ReplicatedStorage (val), analyzeCutscene (val), u41 (val)
    local Assets = ReplicatedStorage:FindFirstChild("Assets")
    local v1 = Assets and Assets:FindFirstChild("CutScenes") or nil
    local v2 = v1 and v1:FindFirstChild(a1.PackageName)
    if v2 then
        u41._analysis:set((analyzeCutscene(v2)))
        return
    end
    u41._playStatus:set((("%* must be replicated before it can be analyzed."):format(a1.DisplayName)))
end

local function requestDebugCutscene(a1) -- Line: 669
    -- upvalues: ReplicatedStorage (val), CutScenes (val)
    if not a1.RawId then
        return true
    end
    local Assets = ReplicatedStorage:FindFirstChild("Assets")
    local v1 = Assets and Assets:FindFirstChild("CutScenes") or nil
    if v1 and v1:FindFirstChild(a1.PackageName) then
        return true
    end
    local v2, v3 = CutScenes:invokeServer("DebugRequestCutscene", a1.RawId)
    if not v2 then
        return false, v3
    end
    local Assets_2 = ReplicatedStorage:FindFirstChild("Assets")
    v1 = Assets_2 and Assets_2:FindFirstChild("CutScenes") or nil
    if not v1 or not v1:WaitForChild(a1.PackageName, 3) then
        return false, (("Cutscene \"%*\" was not replicated."):format(a1.PackageName))
    end
    return true
end

local function playCutscene(a1) -- Line: 693
    -- upvalues: u41 (val), CutSceneController (val), requestDebugCutscene (val)
    local u4 = (u41._playToken or 0) + 1
    u41._playToken = u4
    CutSceneController.SkipPlayingCutScenes()
    u41._playStatus:set((("Playing %*..."):format(a1.DisplayName)))
    u41._scrubTime:set(0)
    task.spawn(function() -- Line: 700
        -- upvalues: requestDebugCutscene (upval), a1 (val), u41 (upval), u4 (val), CutSceneController (upval)
        local v1, v2 = requestDebugCutscene(a1)
        if v1 then
            u41._activePlaybackName = a1.PackageName
            u41._activePlaybackLabel = a1.DisplayName
            ;((CutSceneController.Play(a1.PackageName)):andThen(function() -- Line: 718 -- upvalues: u41 (upval), u4 (upval), a1 (upval)
                if u41._playToken ~= u4 then
                    return
                end
                u41._playStatus:set((("Finished %*."):format(a1.DisplayName)))
            end)):catch(function(a1_2) -- Line: 725 -- upvalues: u41 (upval), u4 (upval), a1 (upval)
                if u41._playToken ~= u4 then
                    return
                end
                u41._playStatus:set((("Failed %*: %*"):format(a1.DisplayName, a1_2)))
                warn(a1_2)
            end)
            return
        end
        if u41._playToken ~= u4 then
            return
        end
        local v3 = ("Failed %*: %*"):format(a1.DisplayName, v2)
        u41._playStatus:set(v3)
        warn(v3)
    end)
end

local function stopCutscene(a1) -- Line: 736 -- upvalues: u41 (val), CutSceneController (val) -- types: a1: table
    u41._playToken = (u41._playToken or 0) + 1
    if CutSceneController.Stop(a1.PackageName) then
        u41._playStatus:set((("Stopped %*."):format(a1.DisplayName)))
        return
    end
    u41._playStatus:set((("%* is not currently playing."):format(a1.DisplayName)))
end

local function stopAllCutscenes() -- Line: 746 -- upvalues: u41 (val), CutSceneController (val)
    u41._playToken = (u41._playToken or 0) + 1
    if CutSceneController.SkipPlayingCutScenes() then
        u41._playStatus:set("Stopped all playing cutscenes.")
        return
    end
    u41._playStatus:set("No cutscenes are currently playing.")
end

local function loadModeSequences(a1) -- Line: 756
    -- upvalues: u41 (val), CutScenes (val), setModeSequences (val)
    u41._sequenceStatus:set("Loading mode cutscene sequences...")
    task.spawn(function() -- Line: 759 -- upvalues: CutScenes (upval), a1 (val), u41 (upval), setModeSequences (upval)
        local success, result, v1 = pcall(function() -- Line: 760 -- upvalues: CutScenes (upval), a1 (upval)
            return CutScenes:invokeServer("DebugGetCutsceneSequences", a1)
        end)
        if not success then
            u41._sequenceStatus:set((("Failed to load mode sequences: %*"):format(result)))
            return
        end
        if not result then
            u41._sequenceStatus:set((("Failed to load mode sequences: %*"):format(v1)))
            return
        end
        if type(v1) ~= "table" then
            u41._sequenceStatus:set("Failed to load mode sequences: invalid response")
            return
        end
        setModeSequences(v1)
        u41._sequenceStatus:set((("Loaded %* mode sequence(s)."):format(#v1)))
    end)
end

local function playSequenceFrom(a1, a2, a3) -- Line: 784
    -- upvalues: u41 (val), CutSceneController (val), sequenceItemToEntry (val), requestDebugCutscene (val)
    local u6 = (u41._playToken or 0) + 1
    u41._playToken = u6
    CutSceneController.SkipPlayingCutScenes()
    u41._scrubTime:set(0)
    task.spawn(function() -- Line: 790
        -- upvalues: a3 (val), a1 (val), a2 (val), u41 (upval), u6 (val), sequenceItemToEntry (upval)
        -- upvalues: requestDebugCutscene (upval), CutSceneController (upval)
        local Label_2, _sequenceStatus, v1, v2, v3, v4, v5, v6, v7
        local v8 = math.min(a3 or #a1.Items, #a1.Items)
        for i = a2, v8 do
            if u41._playToken ~= u6 then
                return
            end
            v2 = a1.Items[i]
            v3 = sequenceItemToEntry(v2)
            _sequenceStatus = u41._sequenceStatus
            v1 = #a1.Items
            Label_2 = v2.Label
            _sequenceStatus:set((("Playing %*/%*: %*..."):format(i, v1, Label_2)))
            v4, v5 = requestDebugCutscene(v3)
            if not v4 then
                if u41._playToken == u6 then
                    u41._sequenceStatus:set((("Failed %*: %*"):format(v2.Label, v5 or "unknown error")))
                end
                return
            end
            if u41._playToken ~= u6 then
                return
            end
            u41._activePlaybackName = v3.PackageName
            u41._activePlaybackLabel = v2.Label
            v6, v7 = CutSceneController.Play(v3.PackageName):await()
            if u41._playToken ~= u6 then
                return
            end
            if not v6 then
                u41._sequenceStatus:set((("Failed %*: %*"):format(v2.Label, v7)))
                return
            end
        end
        if a2 == v8 then
            u41._sequenceStatus:set((("Finished %*."):format(a1.Items[a2].Label)))
            return
        end
        u41._sequenceStatus:set((("Finished %*."):format(a1.DisplayName)))
    end)
end

local function stopSequence() -- Line: 838 -- upvalues: u41 (val), CutSceneController (val)
    u41._playToken = (u41._playToken or 0) + 1
    CutSceneController.SkipPlayingCutScenes()
    u41._sequenceStatus:set("Stopped mode sequence playback.")
end

local function getModelBounds(a1) -- Line: 844 -- types: a1: userdata
    local success, result, v1 = pcall(function() -- Line: 845 -- upvalues: a1 (val)
        return a1:GetBoundingBox()
    end)
    if success then
        return result, v1
    end
    return nil, nil
end

local function getGizmoFrame(a1) -- Line: 856 -- upvalues: getModelBounds (val) -- types: a1: userdata
    local Parent = a1
    while Parent do
        if Parent:IsA("Attachment") then
            return Parent.WorldCFrame, nil
        end
        if Parent:IsA("BasePart") then
            return Parent.CFrame, Parent.Size
        end
        if Parent:IsA("Model") then
            return getModelBounds(Parent)
        end
        if Parent:IsA("Camera") then
            return Parent.CFrame, (Vector3.new(1, 1, 1))
        end
        Parent = Parent.Parent
    end
    return nil, nil
end

local function getDiagnosticColor(a1) -- Line: 876 -- upvalues: u47 (val), u52 (val), u57 (val)
    if a1.Kind == "Action" then
        return u47
    end
    if a1.Kind ~= nil then
        return u52
    end
    return u57
end

local function isTrackPlaying(a1) -- Line: 886
    local success, result = pcall(function() -- Line: 887 -- upvalues: a1 (val)
        return a1:IsPlaying()
    end)
    return success and result == true
end

local function getTrackPackageRoot(a1) -- Line: 894
    local _save = a1._save
    if typeof(_save) ~= "Instance" then
        return nil
    end
    return _save.Parent
end

local function getTrackLiveRoot(a1) -- Line: 903
    local _save = a1._save
    local Parent = if typeof(_save) == "Instance" then _save.Parent else nil
    local CutScenes = workspace:FindFirstChild("CutScenes")
    if Parent and CutScenes then
        return CutScenes:FindFirstChild(Parent.Name)
    end
    return nil
end

local function getTrackStateLabel(a1) -- Line: 913
    local v1 = {}
    local success, result = pcall(function() -- Line: 887 -- upvalues: a1 (val)
        return a1:IsPlaying()
    end)
    if success and result == true then
        table.insert(v1, "playing")
    end
    local _save = a1._save
    local Parent = if typeof(_save) == "Instance" then _save.Parent else nil
    local CutScenes = workspace:FindFirstChild("CutScenes")
    if if not Parent then nil else if CutScenes then CutScenes:FindFirstChild(Parent.Name) else nil then
        table.insert(v1, "live")
    end
    if #v1 == 0 then
        return "stale"
    end
    return table.concat(v1, ", ")
end

local function getTrackDebugName(a1) -- Line: 931
    local _save = a1._save
    if typeof(_save) ~= "Instance" then
        return "<unknown>"
    end
    return _save:GetFullName()
end

local function getDebugTracks() -- Line: 940 -- upvalues: Moonlite (val)
    local v1 = Moonlite.GetTracks()
    table.sort(v1, function(a1, a2) -- Line: 943
        local success, result = pcall(function() -- Line: 887 -- upvalues: a1 (val)
            return a1:IsPlaying()
        end)
        local v1 = success and result == true
        local success_2, result_2 = pcall(function() -- Line: 887 -- upvalues: a2 (val)
            return a2:IsPlaying()
        end)
        if v1 ~= (success_2 and result_2 == true) then
            return v1
        end
        local _save = a1._save
        local Parent = if typeof(_save) == "Instance" then _save.Parent else nil
        local CutScenes = workspace:FindFirstChild("CutScenes")
        local v2 = (if not Parent then nil else if CutScenes then CutScenes:FindFirstChild(Parent.Name) else nil) ~= nil
        local _save_2 = a2._save
        local Parent_2 = if typeof(_save_2) == "Instance" then _save_2.Parent else nil
        local CutScenes_2 = workspace:FindFirstChild("CutScenes")
        if v2 ~= ((if not Parent_2 then nil else if CutScenes_2 then CutScenes_2:FindFirstChild(Parent_2.Name) else nil) ~= nil) then
            return v2
        end
        local TimePosition_2 = if type(a1.TimePosition) ~= "number" then 0 else a1.TimePosition
        local TimePosition_4 = if type(a2.TimePosition) ~= "number" then 0 else a2.TimePosition
        if TimePosition_2 ~= TimePosition_4 then
            return TimePosition_4 < TimePosition_2
        end
        local _save_3 = a1._save
        local v3 = if typeof(_save_3) == "Instance" then _save_3:GetFullName() else "<unknown>"
        local _save_4 = a2._save
        return v3 < (if typeof(_save_4) == "Instance" then _save_4:GetFullName() else "<unknown>")
    end)
    return v1
end

local function isRenderableInstance(a1) -- Line: 968 -- types: a1: userdata
    local v1 = true
    if a1 ~= workspace.CurrentCamera then
        v1 = a1:IsDescendantOf(workspace)
    end
    return v1
end

local function getBoundsFromParts(a1) -- Line: 972 -- types: a1: table
    local Position, v1
    if #a1 == 0 then
        return nil, nil
    end
    local v2 = Vector3.new((1 / 0), (1 / 0), (1 / 0))
    local v3 = Vector3.new((-1 / 0), (-1 / 0), (-1 / 0))
    local v4 = nil
    local v5 = nil
    for i, j in a1, v4, v5 do
        v1 = j.Size / 2
        for k = -1, 1, 2 do
            for n = -1, 1, 2 do
                for m = -1, 1, 2 do
                    Position = (j.CFrame * CFrame.new(v1.X * k, v1.Y * n, v1.Z * m)).Position
                    v2 = Vector3.new(math.min(v2.X, Position.X), math.min(v2.Y, Position.Y), (math.min(v2.Z, Position.Z)))
                    v3 = Vector3.new(math.max(v3.X, Position.X), math.max(v3.Y, Position.Y), (math.max(v3.Z, Position.Z)))
                end
            end
        end
    end
    return (CFrame.new((v2 + v3) / 2)), v3 - v2
end

local function getInstanceBounds(a1) -- Line: 1010
    -- upvalues: getModelBounds (val), getBoundsFromParts (val)
    if a1:IsA("BasePart") then
        return a1.CFrame, a1.Size
    end
    if a1:IsA("Model") then
        return getModelBounds(a1)
    end
    local v1 = {}
    for i, j in a1:GetDescendants() do
        if j:IsA("BasePart") then
            table.insert(v1, j)
        end
    end
    return getBoundsFromParts(v1)
end

local function getCutsceneBounds(a1) -- Line: 1027
    -- upvalues: u95 (val), getInstanceBounds (val)
    local v1 = u95[a1]
    if v1 then
        return v1.CFrame, v1.Size
    end
    local v2, v3 = getInstanceBounds(a1)
    u95[a1] = {CFrame = v2, Size = v3}
    return v2, v3
end

local function drawCutsceneBounds(a1, a2) -- Line: 1042 -- upvalues: u95 (val), getInstanceBounds (val), u77 (val)
    local CFrame, Size, v1
    local _save = a2._save
    local Parent = if typeof(_save) == "Instance" then _save.Parent else nil
    local CutScenes = workspace:FindFirstChild("CutScenes")
    if not (if not Parent then nil else if CutScenes then CutScenes:FindFirstChild(Parent.Name) else nil) then
        return
    end
    local v2 = u95[v1]
    if not v2 then
        local v3, v4 = getInstanceBounds(v1)
        u95[v1] = {CFrame = v3, Size = v4}
        CFrame = v3
        Size = v4
    else
        CFrame = v2.CFrame
        Size = v2.Size
    end
    if CFrame and Size then
        a1.SetStyle(u77, 0.88, false)
        a1.VolumeBox:Draw(CFrame, Size)
        a1.SetStyle(u77, 0.2, true)
        a1.Box:Draw(CFrame, Size, false)
        return
    end
end

local function drawParticleMarker(a1, a2, a3) -- Line: 1060 -- upvalues: u82 (val) -- types: a2: userdata, a3: userdata
    a1.SetStyle(u82, 0.05, true)
    a1.Sphere:Draw(a3, 0.18, 8, 360)
end

local function drawSoundMarker(a1, a2, a3) -- Line: 1065 -- upvalues: u87 (val) -- types: a2: userdata, a3: userdata
    a1.SetStyle(u87, 0.05, true)
    a1.Sphere:Draw(a3, 0.22, 8, 360)
end

local function getEffectTargets(a1) -- Line: 1070 -- upvalues: u99 (val) -- types: a1: userdata
    local v1 = u99[a1]
    if v1 then
        return v1
    end
    local v2 = {}
    for i, j in a1:GetDescendants() do
        if #v2 >= 24 then
            break
        end
        if j:IsA("ParticleEmitter") or j:IsA("Sound") or j:IsA("Beam") or j:IsA("Trail") then
            table.insert(v2, j)
        end
    end
    u99[a1] = v2
    return v2
end

local function drawEffectOverlays(a1, a2) -- Line: 1096
    -- upvalues: getEffectTargets (val), getGizmoFrame (val), u82 (val), u87 (val)
    local Attachment0, Attachment0_2, Attachment1, Attachment1_2, v1, v2
    local _save = a2._save
    local Parent = if typeof(_save) == "Instance" then _save.Parent else nil
    local CutScenes = workspace:FindFirstChild("CutScenes")
    if not (if not Parent then nil else if CutScenes then CutScenes:FindFirstChild(Parent.Name) else nil) then
        return
    end
    local v3 = 0
    local v4 = a1
    for i, j in getEffectTargets(v1) do
        if v3 >= 24 then
            break
        end
        if j:IsDescendantOf(v1) then
            if j:IsA("ParticleEmitter") then
                v2 = getGizmoFrame(j)
                if v2 then
                    v4.SetStyle(u82, 0.05, true)
                    v4.Sphere:Draw(v2, 0.18, 8, 360)
                    v3 = v3 + 1
                end
            elseif j:IsA("Sound") then
                v2 = getGizmoFrame(j)
                if v2 then
                    if j.SoundId ~= "" or j.IsPlaying then
                        v4.SetStyle(u87, 0.05, true)
                        v4.Sphere:Draw(v2, 0.22, 8, 360)
                        v3 = v3 + 1
                    end
                end
            elseif j:IsA("Beam") then
                Attachment0 = j.Attachment0
                Attachment1 = j.Attachment1
                if Attachment0 and Attachment1 then
                    v4.SetStyle(u82, 0.15, true)
                    v4.Ray:Draw(Attachment0.WorldPosition, Attachment1.WorldPosition)
                    v3 = v3 + 1
                end
            elseif j:IsA("Trail") then
                Attachment0_2 = j.Attachment0
                Attachment1_2 = j.Attachment1
                if Attachment0_2 and Attachment1_2 then
                    v4.SetStyle(u82, 0.3, true)
                    v4.Ray:Draw(Attachment0_2.WorldPosition, Attachment1_2.WorldPosition)
                    v3 = v3 + 1
                end
            end
        end
    end
end

local function readCFrameSamples(a1) -- Line: 1144
    -- upvalues: readPackedValues (val), readLegacyValues (val)
    local v1, v2, v3, v4
    local v5 = {}
    for i, j in a1:GetChildren() do
        v4 = tonumber(j.Name)
        if v4 then
            if not j:IsA("ModuleScript") then
                v1, v2 = readLegacyValues(j)
            else
                v1, v2 = readPackedValues(j)
            end
            for k = 0, v2 do
                v3 = v1[k]
                if typeof(v3) == "CFrame" then
                    table.insert(v5, {Frame = v4 + k, Value = v3})
                end
            end
        end
    end
    table.sort(v5, function(a1, a2) -- Line: 1171
        return a1.Frame < a2.Frame
    end)
    return v5
end

local function isCameraItem(a1) -- Line: 1178
    local v1
    local Path = not (type(a1) ~= "table") and a1.Path or nil
    if type(Path) ~= "table" then
        return false
    end
    local ItemType = Path.ItemType
    local InstanceTypes = Path.InstanceTypes
    if ItemType == "Camera" then
        return true
    end
    if type(InstanceTypes) == "table" and InstanceTypes[#InstanceTypes] == "Camera" then
        return true
    end
    local InstanceNames = Path.InstanceNames
    if type(InstanceNames) ~= "table" then
        return false
    end
    for i, j in InstanceNames do
        v1 = j:lower()
        if v1 ~= "currentcamera" and v1:find("camera", 1, true) == nil then
            continue
        end
        return true
    end
    return false
end

local function getCameraPathSamples(a1) -- Line: 1208
    -- upvalues: u91 (val), isCameraItem (val), readCFrameSamples (val)
    local v1 = u91[a1]
    if v1 and v1.Save == a1._save then
        return v1.Samples
    end
    local v2 = {}
    local _save = a1._save
    local _data = a1._data
    if typeof(_save) == "Instance" and type(_data) == "table" and type(_data.Items) == "table" then
        local CFrame, v3
        local v4 = nil
        local v5 = nil
        for i, j in _data.Items, v4, v5 do
            if isCameraItem(j) then
                v3 = _save:FindFirstChild((tostring(i)))
                CFrame = v3 and v3:FindFirstChild("CFrame")
                if CFrame and CFrame:IsA("Folder") then
                    for k, n in readCFrameSamples(CFrame) do
                        table.insert(v2, n)
                    end
                end
            end
        end
        table.sort(v2, function(a1, a2) -- Line: 1239
            return a1.Frame < a2.Frame
        end)
        u91[a1] = {Save = _save, Samples = v2}
        return v2
    end
    u91[a1] = {Save = _save, Samples = v2}
    return v2
end

local function getCurrentCameraSample(a1, a2) -- Line: 1251 -- types: a2: table
    if #a2 == 0 then
        return nil
    end
    local FrameRate_2 = if type(a1.FrameRate) ~= "number" then 60 else a1.FrameRate
    local v1 = math.floor((if type(a1.TimePosition) ~= "number" then 0 else a1.TimePosition) * FrameRate_2)
    local Value = a2[1].Value
    for i, j in a2 do
        if v1 < j.Frame then
            break
        end
        Value = j.Value
    end
    return Value
end

local function drawCameraPath(a1, a2) -- Line: 1275
    -- upvalues: getCameraPathSamples (val), u67 (val), getCurrentCameraSample (val), u72 (val)
    local Value
    local v1 = getCameraPathSamples(a2)
    if #v1 == 0 then
        return
    end
    local v2 = math.max(math.ceil((#v1 - 1) / 160), 1)
    local v3 = nil
    local v4 = 0
    a1.SetStyle(u67, 0.1, true)
    local v5 = #v1
    for i = 1, v5, v2 do
        Value = v1[i].Value
        if v3 then
            a1.Ray:Draw(v3.Position, Value.Position)
            v4 = v4 + 1
            if v4 >= 160 then
                break
            end
        end
    end
    v5 = math.max(math.ceil(#v1 / 12), 1)
    a1.SetStyle(u67, 0, true)
    local v6 = #v1
    for j = 1, v6, v5 do
        a1.Sphere:Draw(v1[j].Value, 0.24, 8, 360)
    end
    v6 = getCurrentCameraSample(a2, v1)
    if v6 then
        local Position_3 = v6.Position
        a1.SetStyle(u72, 0, true)
        a1.Sphere:Draw(v6, 0.42, 10, 360)
        a1.Ray:Draw(Position_3, Position_3 + v6.LookVector * 3)
        a1.Ray:Draw(Position_3, Position_3 + v6.RightVector * 1.25)
        a1.Ray:Draw(Position_3, Position_3 + v6.UpVector * 1.25)
    end
end

local function drawDiagnosticTarget(a1, a2, a3) -- Line: 1316
    -- upvalues: getGizmoFrame (val), u82 (val), u87 (val), u47 (val), u52 (val), u57 (val), u62 (val)
    if typeof(a2.Instance) == "Instance" then
        local Instance_2 = a2.Instance
        local v1 = true
        if Instance_2 ~= workspace.CurrentCamera then
            v1 = Instance_2:IsDescendantOf(workspace)
        end
        if v1 then
            local v2
            v1, v2 = getGizmoFrame(a2.Instance)
            if not v1 then
                return false
            end
            local Frame_2 = if typeof(a2.Frame) ~= "number" then 0 else a2.Frame
            local v3 = v1 + Vector3.new(0, a3 % 8 * 0.08, 0)
            local v4 = math.clamp(Frame_2 % 12, 0, 12) * 0.015 + 0.35
            if a2.Instance:IsA("ParticleEmitter") then
                local Instance_3 = a2.Instance
                a1.SetStyle(u82, 0.05, true)
                a1.Sphere:Draw(v3, 0.18, 8, 360)
            elseif a2.Instance:IsA("Sound") then
                local Instance_4 = a2.Instance
                a1.SetStyle(u87, 0.05, true)
                a1.Sphere:Draw(v3, 0.22, 8, 360)
            end
            a1.SetStyle(if a2.Kind ~= "Action" then if a2.Kind == nil then u57 else u52 else u47, 0, true)
            if not v2 then
                a1.Sphere:Draw(v3, v4, 12, 360)
            else
                a1.Box:Draw(v3, Vector3.new(math.max(v2.X, 0.25), math.max(v2.Y, 0.25), (math.max(v2.Z, 0.25))), false)
            end
            a1.SetStyle(u62, 0.25, true)
            local Position = v3.Position
            a1.Ray:Draw(Position, Position + (Vector3.new(0, math.clamp(Frame_2 % 20, 0, 20) * 0.04 + 1.5, 0)))
            return true
        end
    end
    return false
end

function u41.createGizmos(a1) -- Line: 1356
    -- upvalues: Moonlite (val), drawCutsceneBounds (val), drawEffectOverlays (val), drawCameraPath (val)
    -- upvalues: drawDiagnosticTarget (val)
    local Diagnostics, v1
    local v2 = 0
    local v3 = Moonlite.GetTracks()
    table.sort(v3, function(a1, a2) -- Line: 943
        local success, result = pcall(function() -- Line: 887 -- upvalues: a1 (val)
            return a1:IsPlaying()
        end)
        local v1 = success and result == true
        local success_2, result_2 = pcall(function() -- Line: 887 -- upvalues: a2 (val)
            return a2:IsPlaying()
        end)
        if v1 ~= (success_2 and result_2 == true) then
            return v1
        end
        local _save = a1._save
        local Parent = if typeof(_save) == "Instance" then _save.Parent else nil
        local CutScenes = workspace:FindFirstChild("CutScenes")
        local v2 = (if not Parent then nil else if CutScenes then CutScenes:FindFirstChild(Parent.Name) else nil) ~= nil
        local _save_2 = a2._save
        local Parent_2 = if typeof(_save_2) == "Instance" then _save_2.Parent else nil
        local CutScenes_2 = workspace:FindFirstChild("CutScenes")
        if v2 ~= ((if not Parent_2 then nil else if CutScenes_2 then CutScenes_2:FindFirstChild(Parent_2.Name) else nil) ~= nil) then
            return v2
        end
        local TimePosition_2 = if type(a1.TimePosition) ~= "number" then 0 else a1.TimePosition
        local TimePosition_4 = if type(a2.TimePosition) ~= "number" then 0 else a2.TimePosition
        if TimePosition_2 ~= TimePosition_4 then
            return TimePosition_4 < TimePosition_2
        end
        local _save_3 = a1._save
        local v3 = if typeof(_save_3) == "Instance" then _save_3:GetFullName() else "<unknown>"
        local _save_4 = a2._save
        return v3 < (if typeof(_save_4) == "Instance" then _save_4:GetFullName() else "<unknown>")
    end)
    local v4 = nil
    local v5 = nil
    local v6 = a1
    for i, j in v3, v4, v5 do
        drawCutsceneBounds(v6, j)
        drawEffectOverlays(v6, j)
        drawCameraPath(v6, j)
        Diagnostics = j:GetDiagnostics()
        v1 = 0
        for k = #Diagnostics, 1, -1 do
            if v1 >= 24 or v2 >= 80 then
                break
            end
            if drawDiagnosticTarget(v6, Diagnostics[k], v2 + 1) then
                v2 = v2 + 1
                v1 = v1 + 1
            end
        end
    end
end

local function formatTime(a1) -- Line: 1380 -- types: a1: number
    local v1 = math.floor(a1 / 60)
    return string.format("%d:%05.2f", v1, a1 - v1 * 60)
end

local function renderPlaybackControls() -- Line: 1385 -- upvalues: u41 (val), CutSceneController (val), u37 (ref)
    local _activePlaybackName = u41._activePlaybackName
    if not _activePlaybackName then
        return
    end
    local v1 = CutSceneController.GetPlaybackPlayer(_activePlaybackName)
    if not v1 then
        return
    end
    local TimeLength = v1:GetTimeLength()
    local v2 = math.clamp(v1.TimePosition, 0, TimeLength)
    local v3 = v1:IsPaused()
    local v4 = math.min(math.floor(v2 * v1.FrameRate), v1.Frames)
    u41._playbackProgress:set(if not (TimeLength > 0) then 0 else v2 / TimeLength)
    u37.Separator()
    u37.Text({(("Active: %*"):format(u41._activePlaybackLabel or _activePlaybackName))})
    u37.Text({
        (("Playback: %* | Frame %*/%* @ %* FPS"):format(if not v3 then "Playing" else "Paused", v4, v1.Frames, v1.FrameRate)),
    })
    local ProgressBar = u37.ProgressBar
    local v5 = {}
    local v6 = math.floor(v2 / 60)
    local v7 = string.format("%d:%05.2f", v6, v2 - v6 * 60)
    local v8 = math.floor(TimeLength / 60)
    local v9 = string.format("%d:%05.2f", v8, TimeLength - v8 * 60)
    v5[1] = "Progress"
    v5[2] = (("%* / %*"):format(v7, v9))
    ProgressBar(v5, {progress = u41._playbackProgress})
    u37.SameLine()
    if not v3 then
        if u37.Button({"Pause"}).clicked() and CutSceneController.Pause(_activePlaybackName) then
            u41._scrubTime:set(v1.TimePosition)
            u41._playStatus:set((("Paused %*."):format(u41._activePlaybackLabel or _activePlaybackName)))
        end
    elseif u37.Button({"Resume"}).clicked() and CutSceneController.Resume(_activePlaybackName) then
        u41._playStatus:set((("Resumed %*."):format(u41._activePlaybackLabel or _activePlaybackName)))
    end
    u37.End()
    local v10 = 1 / math.max(v1.FrameRate, 1)
    local v11 = {"Timeline", v10, 0, TimeLength, "%.2f s"}
    if u37.SliderNum(v11, {number = u41._scrubTime}).numberChanged() then
        v11 = CutSceneController.Seek(_activePlaybackName, u41._scrubTime:get())
        if v11 then
            u41._scrubTime:set(v11)
        end
    elseif not v3 then
        u41._scrubTime:set(v2)
    end
    u37.SameLine()
    if u37.Button({"-1 Frame"}).clicked() then
        v11 = CutSceneController.Seek(_activePlaybackName, v1.TimePosition - v10)
        if v11 then
            u41._scrubTime:set(v11)
        end
    end
    if u37.Button({"+1 Frame"}).clicked() then
        v11 = CutSceneController.Seek(_activePlaybackName, v1.TimePosition + v10)
        if v11 then
            u41._scrubTime:set(v11)
        end
    end
    u37.End()
    u37.Text({"Seeking previews continuous properties and intentionally skips marker/action replay."})
end

local function renderModeSequences() -- Line: 1472
    -- upvalues: u37 (ref), u41 (val), getSequenceItemLabels (val), playSequenceFrom (val), CutSceneController (val)
    -- upvalues: CutScenes (val), setModeSequences (val)
    local v1
    u37.Separator()
    u37.Text({"Mode Sequences"})
    local v2 = u41._modeSequences:get()
    local v3 = u41._modeSequenceLabels:get()
    if not (#v2 > 0) then
        u37.Text({"No mode cutscene sequences loaded."})
    else
        u37.ComboArray({(("Sequence (%*)"):format(#v2))}, {index = u41._selectedModeSequence}, v3)
        local v4 = u41._modeSequences:get()
        local v5 = table.find(u41._modeSequenceLabels:get(), u41._selectedModeSequence:get())
        v1 = v5 and v4[v5] or nil
        if v1 then
            v4 = getSequenceItemLabels(v1)
            if not table.find(v4, (u41._selectedSequenceItem:get())) then
                u41._selectedSequenceItem:set(v4[1] or "")
            end
            if not (#v4 > 0) then
                u37.Text({"This mode has no playable cutscene items."})
            else
                u37.ComboArray({(("Start item (%*)"):format(#v4))}, {index = u41._selectedSequenceItem}, v4)
                local v6 = table.find(getSequenceItemLabels(v1), u41._selectedSequenceItem:get())
                v5 = v6 and v1.Items[v6] or nil
                local v7 = v6
                if v5 and v7 then
                    u37.Text({(("Raw Id: %* | Trigger: %*"):format(v5.RawId, v5.Trigger))})
                    u37.SameLine()
                    if u37.Button({"Play Item"}).clicked() then
                        playSequenceFrom(v1, v7, v7)
                    end
                    if u37.Button({"Play From Here"}).clicked() then
                        playSequenceFrom(v1, v7)
                    end
                    if u37.Button({"Stop Sequence"}).clicked() then
                        u41._playToken = (u41._playToken or 0) + 1
                        CutSceneController.SkipPlayingCutScenes()
                        u41._sequenceStatus:set("Stopped mode sequence playback.")
                    end
                    u37.End()
                end
            end
        end
    end
    if u37.Button({"Refresh Sequences"}).clicked() then
        u41._sequenceStatus:set("Loading mode cutscene sequences...")
        local spawn = task.spawn
        local u196 = true
        spawn(function() -- Line: 759 -- upvalues: CutScenes (upval), u196 (val), u41 (upval), setModeSequences (upval)
            local success, result, v1 = pcall(function() -- Line: 760 -- upvalues: CutScenes (upval), u196 (upval)
                return CutScenes:invokeServer("DebugGetCutsceneSequences", u196)
            end)
            if not success then
                u41._sequenceStatus:set((("Failed to load mode sequences: %*"):format(result)))
                return
            end
            if not result then
                u41._sequenceStatus:set((("Failed to load mode sequences: %*"):format(v1)))
                return
            end
            if type(v1) ~= "table" then
                u41._sequenceStatus:set("Failed to load mode sequences: invalid response")
                return
            end
            setModeSequences(v1)
            u41._sequenceStatus:set((("Loaded %* mode sequence(s)."):format(#v1)))
        end)
    end
    v1 = u41._sequenceStatus:get()
    if v1 ~= "" then
        u37.Text({v1})
    end
end

function u41.canRun() -- Line: 1539
    return true
end

function u41.createWindows() -- Line: 1543
    -- upvalues: u37 (ref), u41 (val), getFilteredLabels (val), playCutscene (val), ReplicatedStorage (val)
    -- upvalues: analyzeCutscene (val), stopCutscene (val), CutSceneController (val), setCutsceneEntries (val)
    -- upvalues: getCutsceneEntries (val), renderPlaybackControls (val), renderModeSequences (val), renderIssue (val)
    -- upvalues: Moonlite (val), getTrackStateLabel (val)
    local v1, v2, v3
    local Window = u37.Window
    local v4 = {}
    v4[u37.Args.Window.Title] = u41.Name
    v4[u37.Args.Window.NoClose] = true
    Window(v4, {
        size = u37.State(Vector2.new(420, 360)),
        position = u37.State(Vector2.new(520, 240)),
    })
    local v5 = u41._cutsceneEntries:get()
    v4 = u41._cutsceneLabels:get()
    local v6 = u41._cutsceneEntries:get()
    local v7 = table.find(u41._cutsceneLabels:get(), u41._selectedLabel:get())
    local v8 = v7 and v6[v7] or nil
    local v9 = getFilteredLabels(v5, v4, (u41._search:get()))
    if #v5 ~= 0 then
        local InputText = u37.InputText
        v2 = {text = u41._search}
        InputText({"Search"}, v2)
        if #v9 ~= 0 then
            v7 = u41._selectedLabel:get()
            if not table.find(v9, v7) then
                v7 = v9[1]
                u41._selectedLabel:set(v7)
                v2 = u41._cutsceneEntries:get()
                v3 = table.find(u41._cutsceneLabels:get(), v7)
                v8 = v3 and v2[v3] or nil
                u41._analysis:set(nil)
            end
            u37.ComboArray({(("Package (%*/%*)"):format(#v9, #v4))}, {index = u41._selectedLabel}, v9)
        else
            u37.Text({"No cutscenes match the current search."})
        end
    else
        u37.Text({"No cutscene packages found in ReplicatedStorage.Assets.CutScenes or Content.Cutscenes."})
    end
    if v8 then
        u37.Text({(("Selected: %*"):format((u41._selectedLabel:get())))})
        u37.Text({(("Package: %*"):format(v8.PackageName))})
        u37.Text({
            (("Raw Id: %* | State: %*"):format(v8.RawId or "-", if not v8.Replicated then "Requestable" else "Replicated")),
        })
        u37.SameLine()
        if u37.Button({"Play"}).clicked() then
            playCutscene(v8)
        end
        v1 = {"Analyze"}
        if u37.Button(v1).clicked() then
            local Assets = ReplicatedStorage:FindFirstChild("Assets")
            v1 = Assets and Assets:FindFirstChild("CutScenes") or nil
            v2 = v1 and v1:FindFirstChild(v8.PackageName)
            if not v2 then
                u41._playStatus:set((("%* must be replicated before it can be analyzed."):format(v8.DisplayName)))
            else
                u41._analysis:set((analyzeCutscene(v2)))
            end
        end
        if u37.Button({"Stop"}).clicked() then
            stopCutscene(v8)
        end
        if u37.Button({"Stop All"}).clicked() then
            u41._playToken = (u41._playToken or 0) + 1
            if not CutSceneController.SkipPlayingCutScenes() then
                u41._playStatus:set("No cutscenes are currently playing.")
            else
                u41._playStatus:set("Stopped all playing cutscenes.")
            end
        end
        if u37.Button({"Refresh"}).clicked() then
            setCutsceneEntries((getCutsceneEntries()))
            u41._analysis:set(nil)
        end
        u37.End()
    end
    v7 = u41._playStatus:get()
    if v7 and v7 ~= "" then
        u37.Text({v7})
    end
    renderPlaybackControls()
    renderModeSequences()
    v1 = u41._analysis:get()
    if v1 then
        u37.Separator()
        u37.Text({
            (("%*: %* items, %* properties, %* keyframes"):format(v1.Name, v1.Items, v1.Properties, v1.Keyframes)),
        })
        u37.Text({
            (("%* CFrame track(s), %* particle track(s), %* issue(s)"):format(#v1.CFrameTracks, #v1.ParticleTracks, #v1.Issues)),
        })
        v2 = u37.State(true)
        u37.CollapsingHeader({"CFrame Tracks"}, {isUncollapsed = v2})
        if v2:get() then
            for i, j in v1.CFrameTracks do
                renderIssue(j)
            end
            if #v1.CFrameTracks == 0 then
                u37.Text({"No CFrame tracks detected."})
            end
        end
        u37.End()
        local v10 = u37.State(true)
        u37.CollapsingHeader({"Particle Tracks"}, {isUncollapsed = v10})
        if v10:get() then
            for k, n in v1.ParticleTracks do
                renderIssue(n)
            end
            if #v1.ParticleTracks == 0 then
                u37.Text({"No particle tracks detected."})
            end
        end
        u37.End()
        v3 = u37.State(true)
        u37.CollapsingHeader({"Issues"}, {isUncollapsed = v3})
        if v3:get() then
            for m, i5 in v1.Issues do
                renderIssue(i5)
            end
            if #v1.Issues == 0 then
                u37.Text({"No structural issues detected."})
            end
        end
        u37.End()
    end
    u37.Separator()
    u37.Text({"Live Moonlite Diagnostics"})
    u37.Text({
        "Enable Gizmos > Cutscene Debugger for bounds, camera path, VFX/sound volumes, and recent diagnostics.",
    })
    v2 = Moonlite.GetTracks()
    table.sort(v2, function(a1, a2) -- Line: 943
        local success, result = pcall(function() -- Line: 887 -- upvalues: a1 (val)
            return a1:IsPlaying()
        end)
        local v1 = success and result == true
        local success_2, result_2 = pcall(function() -- Line: 887 -- upvalues: a2 (val)
            return a2:IsPlaying()
        end)
        if v1 ~= (success_2 and result_2 == true) then
            return v1
        end
        local _save = a1._save
        local Parent = if typeof(_save) == "Instance" then _save.Parent else nil
        local CutScenes = workspace:FindFirstChild("CutScenes")
        local v2 = (if not Parent then nil else if CutScenes then CutScenes:FindFirstChild(Parent.Name) else nil) ~= nil
        local _save_2 = a2._save
        local Parent_2 = if typeof(_save_2) == "Instance" then _save_2.Parent else nil
        local CutScenes_2 = workspace:FindFirstChild("CutScenes")
        if v2 ~= ((if not Parent_2 then nil else if CutScenes_2 then CutScenes_2:FindFirstChild(Parent_2.Name) else nil) ~= nil) then
            return v2
        end
        local TimePosition_2 = if type(a1.TimePosition) ~= "number" then 0 else a1.TimePosition
        local TimePosition_4 = if type(a2.TimePosition) ~= "number" then 0 else a2.TimePosition
        if TimePosition_2 ~= TimePosition_4 then
            return TimePosition_4 < TimePosition_2
        end
        local _save_3 = a1._save
        local v3 = if typeof(_save_3) == "Instance" then _save_3:GetFullName() else "<unknown>"
        local _save_4 = a2._save
        return v3 < (if typeof(_save_4) == "Instance" then _save_4:GetFullName() else "<unknown>")
    end)
    if #v2 ~= 0 then
        local CollapsingHeader_4, Diagnostics, FullName, _save, v11, v12, v13, v14, v15, v16, v17
        v3 = nil
        local v18 = nil
        for i6, i7 in v2, v3, v18 do
            Diagnostics = i7:GetDiagnostics()
            v11 = 0
            v12 = 0
            for i8, i9 in Diagnostics do
                if i9.Kind ~= "Action" then
                    v12 = v12 + 1
                else
                    v11 = v11 + 1
                end
            end
            v13 = u37.State(i6 == 1)
            CollapsingHeader_4 = u37.CollapsingHeader
            v14 = {}
            _save = i7._save
            v16 = if typeof(_save) == "Instance" then _save:GetFullName() else "<unknown>"
            v17 = getTrackStateLabel(i7)
            v14[1] = (("Track %*: %* [%*] (%* failure(s), %* action(s))"):format(i6, v16, v17, v12, v11))
            v15 = {isUncollapsed = v13}
            CollapsingHeader_4(v14, v15)
            if v13:get() then
                if u37.Button({"Clear Diagnostics"}).clicked() then
                    i7:ClearDiagnostics()
                end
                v14 = nil
                v15 = nil
                for i10, i11 in Diagnostics, v14, v15 do
                    FullName = i11.Instance and i11.Instance:GetFullName() or "<nil>"
                    u37.Text({
                        (("[%*] frame=%* %*.%* [%*]: %*"):format(
                            i11.Kind or "Error",
                            i11.Frame or "-",
                            FullName,
                            i11.Property or "?",
                            i11.ValueType or "unknown",
                            i11.Message
                        )),
                    })
                end
                if #Diagnostics == 0 then
                    u37.Text({"No runtime property failures or particle actions recorded."})
                end
            end
            u37.End()
        end
    else
        u37.Text({"No Moonlite players created yet."})
    end
    u37.End()
end

function u41.init() -- Line: 1726
    -- upvalues: u37 (ref), u41 (val), setCutsceneEntries (val), getCutsceneEntries (val), CutScenes (val)
    -- upvalues: setModeSequences (val)
    u37 = u41.Iris
    u41._cutsceneEntries = u37.State({})
    u41._cutsceneLabels = u37.State({})
    u41._selectedLabel = u37.State("")
    u41._search = u37.State("")
    u41._analysis = u37.State(nil)
    u41._playStatus = u37.State("")
    u41._scrubTime = u37.State(0)
    u41._playbackProgress = u37.State(0)
    u41._modeSequences = u37.State({})
    u41._modeSequenceLabels = u37.State({})
    u41._selectedModeSequence = u37.State("")
    u41._selectedSequenceItem = u37.State("")
    u41._sequenceStatus = u37.State("")
    u41._activePlaybackName = nil
    u41._activePlaybackLabel = nil
    u41._playToken = 0
    task.defer(function() -- Line: 1746
        -- upvalues: setCutsceneEntries (upval), getCutsceneEntries (upval), u41 (upval), CutScenes (upval)
        -- upvalues: setModeSequences (upval)
        setCutsceneEntries((getCutsceneEntries()))
        u41._sequenceStatus:set("Loading mode cutscene sequences...")
        local spawn = task.spawn
        local u11 = false
        spawn(function() -- Line: 759 -- upvalues: CutScenes (upval), u11 (val), u41 (upval), setModeSequences (upval)
            local success, result, v1 = pcall(function() -- Line: 760 -- upvalues: CutScenes (upval), u11 (upval)
                return CutScenes:invokeServer("DebugGetCutsceneSequences", u11)
            end)
            if not success then
                u41._sequenceStatus:set((("Failed to load mode sequences: %*"):format(result)))
                return
            end
            if not result then
                u41._sequenceStatus:set((("Failed to load mode sequences: %*"):format(v1)))
                return
            end
            if type(v1) ~= "table" then
                u41._sequenceStatus:set("Failed to load mode sequences: invalid response")
                return
            end
            setModeSequences(v1)
            u41._sequenceStatus:set((("Loaded %* mode sequence(s)."):format(#v1)))
        end)
    end)
end

return u41