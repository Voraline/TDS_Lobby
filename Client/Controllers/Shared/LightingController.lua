-- Script path: ReplicatedStorage.Client.Controllers.Shared.LightingController
-- Decompile time: 5.45 ms

local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Maid = require(ReplicatedStorage.Shared.Modules.GuiLib.Utilities.Maid)
local Promise = require(ReplicatedStorage.Shared.Modules.Promise)
local u27 = {
    Ambient = true,
    Brightness = true,
    ColorShift_Bottom = true,
    ColorShift_Top = true,
    GlobalShadows = true,
    OutdoorAmbient = true,
    TimeOfDay = true,
    GeographicLatitude = true,
    ClockTime = true,
    FogColor = true,
    FogEnd = true,
    FogStart = true,
    ExposureCompensation = true,
    Outlines = true,
    ShadowSoftness = true,
    EnvironmentDiffuseScale = true,
    EnvironmentSpecularScale = true,
}
local Value = workspace.Type.Value
local u32 = Maid.new()
local u33 = {CurrentProfile = "Default", Profiles = {}}

local function awaitMapLoad() -- Line: 42 -- upvalues: Promise (val)
    return Promise.new(function(a1, a2, a3) -- Line: 43
        local Attribute = workspace:GetAttribute("Map")
        local u8 = nil

        local function resolveIfLoaded() -- Line: 47 -- upvalues: u8 (ref), Attribute (val), a1 (val), a2 (val)
            local v1 = workspace:GetAttribute("MapLoaded") == true
            local Attribute_2 = workspace:GetAttribute("Map")
            if not v1 then
                return false
            end
            if u8 then
                u8:Disconnect()
                u8 = nil
            end
            if v1 then
                if Attribute_2 ~= Attribute then
                    a2("Map failed to load")
                else
                    a1()
                end
            end
            return true
        end

        if resolveIfLoaded() then
            return
        end
        u8 = (workspace:GetAttributeChangedSignal("MapLoaded")):Connect(function() -- Line: 75 -- upvalues: resolveIfLoaded (val)
            resolveIfLoaded()
        end)
        a3(function() -- Line: 79 -- upvalues: u8 (ref)
            if u8 then
                u8:Disconnect()
                u8 = nil
            end
        end)
    end)
end

local function serializeCurrentProfile() -- Line: 88 -- upvalues: u27 (val), Lighting (val)
    local v1 = {Custom = {}}
    for i in u27 do
        v1[i] = Lighting[i]
    end
    for j, k in Lighting:GetChildren() do
        table.insert(v1.Custom, (k:Clone()))
    end
    return v1
end

local function serializeProfile(a1) -- Line: 105 -- types: a1: userdata
    local v1 = require(a1)
    v1.Custom = {}
    for i, j in a1:GetChildren() do
        table.insert(v1.Custom, j)
    end
    return v1
end

local u39 = false

function u33.init() -- Line: 117
    -- upvalues: u39 (ref), u33 (val), serializeCurrentProfile (val), Lighting (val), Promise (val), Value (val)
    -- upvalues: Players (val), ReplicatedStorage (val), serializeProfile (val)
    assert(not u39, "Lighting has already been initialized!")
    u39 = true
    u33.Profiles.Default = serializeCurrentProfile()
    Lighting:SetAttribute("Profile", "Default")
    ;(Lighting:GetAttributeChangedSignal("Profile")):Connect(function() -- Line: 126 -- upvalues: Lighting (upval), u33 (upval)
        local Attribute = Lighting:GetAttribute("Profile")
        if Attribute == u33.CurrentProfile then
            return
        end
        u33.ApplyProfile(Attribute)
    end)
    ;(workspace:GetAttributeChangedSignal("Map")):Connect(function() -- Line: 135 -- upvalues: Promise (upval), u33 (upval)
        (Promise.new(function(a1, a2, a3) -- Line: 43
            local Attribute = workspace:GetAttribute("Map")
            local u8 = nil

            local function resolveIfLoaded() -- Line: 47 -- upvalues: u8 (ref), Attribute (val), a1 (val), a2 (val)
                local v1 = workspace:GetAttribute("MapLoaded") == true
                local Attribute_2 = workspace:GetAttribute("Map")
                if not v1 then
                    return false
                end
                if u8 then
                    u8:Disconnect()
                    u8 = nil
                end
                if v1 then
                    if Attribute_2 ~= Attribute then
                        a2("Map failed to load")
                    else
                        a1()
                    end
                end
                return true
            end

            if resolveIfLoaded() then
                return
            end
            u8 = (workspace:GetAttributeChangedSignal("MapLoaded")):Connect(function() -- Line: 75 -- upvalues: resolveIfLoaded (val)
                resolveIfLoaded()
            end)
            a3(function() -- Line: 79 -- upvalues: u8 (ref)
                if u8 then
                    u8:Disconnect()
                    u8 = nil
                end
            end)
        end)):andThen(function() -- Line: 136 -- upvalues: u33 (upval)
            u33.UpdateDefaultProfile()
        end)
    end)
    if Value == "Game" then
        return
    end
    Players.LocalPlayer.CharacterAdded:Connect(function() -- Line: 142 -- upvalues: u33 (upval)
        if u33.Profiles.Default and u33.CurrentProfile ~= "Default" then
            u33.ApplyProfile("Default")
            return
        end
    end)
    if not ReplicatedStorage.Assets:FindFirstChild("Lighting") then
        return
    end
    local v1 = {}
    for i, j in ReplicatedStorage.Assets.Lighting:GetChildren() do
        if not j:IsA("ModuleScript") then
            warn((("WARNING: Profile \"%*\" is invalid, it should be a lighting configuration module"):format(j.Name)))
        elseif not u33.Profiles[j.Name] then
            u33.Profiles[j.Name] = (serializeProfile(j))
        else
            if not v1[j.Name] then
                warn((("WARNING: Profile \"%*\" already exists, others will be ignored."):format(j.Name)))
            end
            v1[j.Name] = true
        end
    end
end

function u33.UpdateDefaultProfile() -- Line: 184 -- upvalues: u33 (val), serializeCurrentProfile (val)
    local Default = u33.Profiles.Default
    if Default and Default.Custom then
        for i, j in Default.Custom do
            j:Destroy()
        end
        table.clear(Default.Custom)
        Default.Custom = nil
    end
    table.clear(Default)
    u33.Profiles.Default = serializeCurrentProfile()
end

function u33.GetCurrentProfile() -- Line: 203 -- upvalues: u33 (val)
    return u33.Profiles[u33.CurrentProfile]
end

function u33.GetProfile(a1) -- Line: 208 -- upvalues: u33 (val) -- types: a1: string
    return u33.Profiles[a1]
end

function u33.Apply(a1, a2, a3) -- Line: 213
    -- upvalues: u32 (val), u27 (val), Lighting (val), u33 (val)
    local ClassName, v1, v2
    u32:Sweep()
    local u7 = {}
    for i, j in a2 do
        if u27[i] then
            u7[i] = Lighting[i]
            Lighting[i] = j
        end
    end
    local v3 = ("%*_LIGHTING"):format((a1:upper()))
    if a3 then
        v2 = ("%*_LIGHTING"):format(((u33.CurrentProfile or "DEFAULT"):upper()))
        for k, n in Lighting:GetChildren() do
            if n:HasTag(v2) then
                n:Destroy()
            end
        end
    end
    u32:Mark(function() -- Line: 242 -- upvalues: u7 (val), Lighting (upval)
        for i, j in u7 do
            Lighting[i] = j
        end
    end)
    v2 = nil
    local v4 = nil
    local v5 = a1
    for m, i5 in a2.Custom, v2, v4 do
        ClassName = i5.ClassName
        if ClassName == "BlurEffect" then
            if a3 then
                for i6, i7 in Lighting:GetChildren() do
                    if not i7:HasTag("DONT_TOUCH") and i7.ClassName == ClassName and not i7:HasTag(v3) then
                        i7:Destroy()
                    end
                end
                v1 = i5:Clone()
                v1:AddTag(v3)
                v1.Parent = Lighting
                u32:Mark(v1)
            end
        elseif ClassName ~= "DepthOfFieldEffect" then
            for i8, i9 in Lighting:GetChildren() do
                if not i9:HasTag("DONT_TOUCH") and i9.ClassName == ClassName and not i9:HasTag(v3) then
                    i9:Destroy()
                end
            end
            v1 = i5:Clone()
            v1:AddTag(v3)
            v1.Parent = Lighting
            u32:Mark(v1)
        elseif a3 then
            for i10, i11 in Lighting:GetChildren() do
                if not i11:HasTag("DONT_TOUCH") and i11.ClassName == ClassName and not i11:HasTag(v3) then
                    i11:Destroy()
                end
            end
            v1 = i5:Clone()
            v1:AddTag(v3)
            v1.Parent = Lighting
            u32:Mark(v1)
        end
    end
    local CurrentProfile = u33.CurrentProfile
    u33.CurrentProfile = v5
    Lighting:SetAttribute("Profile", v5)
    return function() -- Line: 278 -- upvalues: u33 (upval), CurrentProfile (val), a3 (val)
        u33.ApplyProfile(CurrentProfile, a3)
    end
end

function u33.ApplyProfile(a1, a2) -- Line: 284 -- upvalues: u33 (val) -- types: a1: string, a2: boolean?
    local v1 = u33.GetProfile(a1)
    assert(v1, (("Profile with name \"%*\" does not exist"):format(a1)))
    return u33.Apply(a1, v1, a2)
end

u33.SerializeProfile = serializeProfile
u33.init()
return u33