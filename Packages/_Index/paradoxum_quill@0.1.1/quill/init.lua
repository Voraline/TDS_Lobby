-- Script path: ReplicatedStorage.Packages._Index.paradoxum_quill@0.1.1.quill
-- Decompile time: 4.07 ms

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local Debris = game:GetService("Debris")
local Types = require(script.Types)
local Config = require(script.Config)
local Commands = require(script.Commands)
local Dependencies = require(script.Dependencies)
local Graph = require(script.Graph)
local AssetUtils = require(script.AssetUtils)
local TemplateString = require(script.TemplateString)
local LookBones = require(script.Runtime.LookBones)
local u53 = nil
local u54 = nil
local u55 = {}
local u56 = false
local u57 = false
local u58 = nil
local u59 = nil
local u60 = nil
local u61 = nil
local v1 = {}

local function getAtoms() -- Line: 48 -- upvalues: u60 (ref)
    if not u60 then
        u60 = require(script.Atoms)
    end
    return u60
end

local function getNPCModule() -- Line: 56 -- upvalues: u61 (ref)
    if not u61 then
        u61 = require(script.Runtime.NPC)
    end
    return u61
end

local function getTrove() -- Line: 64 -- upvalues: Dependencies (val)
    return Dependencies.get("Trove")
end

local v2 = {
    __index = function(a1, a2) -- Line: 71 -- upvalues: u60 (ref)
        if not u60 then
            u60 = require(script.Atoms)
        end
        return u60[a2]
    end,
    __newindex = function(a1, a2, a3) -- Line: 74 -- upvalues: u60 (ref)
        if not u60 then
            u60 = require(script.Atoms)
        end
        u60[a2] = a3
    end,
}
v1.atoms = setmetatable({}, v2)
v1.Config = Config
v1.Graph = Graph
v1.AssetUtils = AssetUtils
v1.Commands = Commands
v1.LookBones = LookBones
v1.TemplateString = TemplateString
v1.Dependencies = Dependencies
v1.Types = Types

function v1._getConfig() -- Line: 89 -- upvalues: u58 (ref)
    return u58
end

local function init(a1) -- Line: 93
    -- upvalues: Dependencies (val), u58 (ref), RunService (val), u56 (ref), u54 (ref), SoundService (val), Debris (val)
    local dialogBlip
    if a1 then
        Dependencies.init(a1.dependencies)
    end
    u58 = a1
    if not RunService:IsClient() then
        u56 = true
        return
    end
    if u54 == nil then
        u54 = require(script.UI.DialogTextRevealUtil)
    end
    local v1 = u54
    local sounds = a1 and a1.sounds
    if not sounds then
        if not sounds or typeof(sounds.dialogBlip) ~= "string" then
            v1.setPlayBlip(nil)
        else
            dialogBlip = sounds.dialogBlip
            v1.setPlayBlip(function(a1, a2) -- Line: 115
                -- upvalues: dialogBlip (val), SoundService (upval), Debris (upval)
                if a1:match("^%s+$") then
                    return
                end
                local Sound = Instance.new("Sound")
                Sound.SoundId = dialogBlip
                Sound.Volume = 0.35
                Sound.PlaybackSpeed = 1 + (math.random() - 0.5) * 0.1
                Sound.Parent = SoundService
                Sound:Play()
                Debris:AddItem(Sound, 1.5)
            end)
        end
    elseif sounds.playBlip then
        v1.setPlayBlip(sounds.playBlip)
    elseif not sounds or typeof(sounds.dialogBlip) ~= "string" then
        v1.setPlayBlip(nil)
    else
        dialogBlip = sounds.dialogBlip
        v1.setPlayBlip(function(a1, a2) -- Line: 115
            -- upvalues: dialogBlip (val), SoundService (upval), Debris (upval)
            if a1:match("^%s+$") then
                return
            end
            local Sound = Instance.new("Sound")
            Sound.SoundId = dialogBlip
            Sound.Volume = 0.35
            Sound.PlaybackSpeed = 1 + (math.random() - 0.5) * 0.1
            Sound.Parent = SoundService
            Sound:Play()
            Debris:AddItem(Sound, 1.5)
        end)
    end
    u56 = true
end

v1.init = init
v1.configure = init

function v1.registerNPC(a1) -- Line: 138 -- upvalues: u55 (val), LookBones (val), u61 (ref)
    if u55[a1.id] then
        warn((("[Quill] NPC \"%*\" already registered, skipping"):format(a1.id)))
        return
    end
    if a1.lookBones then
        LookBones.register(a1.id, a1.lookBones)
    end
    local id_2 = a1.id
    if not u61 then
        u61 = require(script.Runtime.NPC)
    end
    u55[id_2] = (u61.new(a1))
end

function v1.registerCommand(a1, a2) -- Line: 151 -- upvalues: Commands (val) -- types: a1: string, a2: function
    Commands.register(a1, a2)
end

function v1.start() -- Line: 155
    -- upvalues: RunService (val), u57 (ref), u56 (ref), u59 (ref), Dependencies (val), Players (val), u53 (ref)
    if not RunService:IsClient() then
        warn("[Quill] Quill.start() should only be called on the client")
        return
    end
    if u57 then
        warn("[Quill] Already started")
        return
    end
    if not u56 then
        warn("[Quill] Quill.init() was not called before start(). Using defaults.")
    end
    u57 = true
    u59 = Dependencies.get("Trove").new()
    local LocalPlayer = Players.LocalPlayer
    if not LocalPlayer then
        warn("[Quill] No LocalPlayer found, cannot mount UI")
        return
    end
    local PlayerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
    if not PlayerGui then
        warn("[Quill] No PlayerGui found, cannot mount UI")
        return
    end
    local React = Dependencies.get("React")
    local ReactRoblox = Dependencies.get("ReactRoblox")
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "QuillDialog"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.DisplayOrder = 300
    ScreenGui.Parent = PlayerGui
    local u52 = ReactRoblox.createRoot(ScreenGui)
    if u53 == nil then
        u53 = require(script.UI.DialogApp)
    end
    u52:render((React.createElement(React.StrictMode, nil, {DialogApp = React.createElement(u53)})))
    u59:Add(function() -- Line: 208 -- upvalues: u52 (val), ScreenGui (val)
        u52:unmount()
        ScreenGui:Destroy()
    end)
end

function v1.getNPC(a1) -- Line: 214 -- upvalues: u55 (val) -- types: a1: string
    return u55[a1]
end

function v1.destroy() -- Line: 218
    -- upvalues: u57 (ref), u59 (ref), u55 (val), u60 (ref), u54 (ref), u58 (ref), u56 (ref)
    u57 = false
    if u59 then
        u59:Destroy()
        u59 = nil
    end
    local v1 = u55
    for i, j in v1 do
        j:destroy()
    end
    table.clear(u55)
    if u60 then
        if not u60 then
            u60 = require(script.Atoms)
        end
        v1 = u60
        v1.currentNpcId(nil)
        v1.inDialogMode(false)
    end
    if u54 then
        u54.setPlayBlip(nil)
    end
    u58 = nil
    u56 = false
end

return v1