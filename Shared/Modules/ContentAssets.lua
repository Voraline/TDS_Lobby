-- Script path: ReplicatedStorage.Shared.Modules.ContentAssets
-- Decompile time: 2.06 ms

local AssetService = game:GetService("AssetService")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local UILabs = require(ReplicatedStorage.Shared.Modules.UILabs)
local u42 = RunService:IsRunning()
local u45 = RunService:IsServer()
local u46 = {Troops = true, Enemies = true, LegacyEnemies = true, Units = true}
local u54 = HttpService:GenerateGUID(false)
local u55 = false
local u56 = {}

local function getPluginStorage() -- Line: 27 -- upvalues: CoreGui (val)
    local TDS_PLUGIN_PACKAGES = CoreGui:FindFirstChild("TDS_PLUGIN_PACKAGES")
    if not TDS_PLUGIN_PACKAGES then
        TDS_PLUGIN_PACKAGES = Instance.new("Folder")
        TDS_PLUGIN_PACKAGES.Name = "TDS_PLUGIN_PACKAGES"
        TDS_PLUGIN_PACKAGES.Parent = CoreGui
    end
    return TDS_PLUGIN_PACKAGES
end

local function fetchPluginPackage(a1) -- Line: 39
    -- upvalues: UILabs (val), CoreGui (val), u54 (val), u55 (ref), u56 (val), ServerStorage (val), TypedPromise (val)
    -- upvalues: AssetService (val)
    local v1 = UILabs.getStoryJanitor()
    local TDS_PLUGIN_PACKAGES = CoreGui:FindFirstChild("TDS_PLUGIN_PACKAGES")
    if not TDS_PLUGIN_PACKAGES then
        TDS_PLUGIN_PACKAGES = Instance.new("Folder")
        TDS_PLUGIN_PACKAGES.Name = "TDS_PLUGIN_PACKAGES"
        TDS_PLUGIN_PACKAGES.Parent = CoreGui
    end
    TDS_PLUGIN_PACKAGES:SetAttribute("RunnerID", u54)
    if not u55 then
        u55 = true
        v1:Add(function() -- Line: 47 -- upvalues: TDS_PLUGIN_PACKAGES (val), u54 (upval)
            task.delay(600, function() -- Line: 48 -- upvalues: TDS_PLUGIN_PACKAGES (upval), u54 (upval)
                if (TDS_PLUGIN_PACKAGES:GetAttribute("RunnerID")) == u54 then
                    TDS_PLUGIN_PACKAGES:Destroy()
                end
            end)
        end)
    end
    if TDS_PLUGIN_PACKAGES:FindFirstChild(a1) then
        return (TDS_PLUGIN_PACKAGES:FindFirstChild(a1))
    end
    if u56[a1] then
        return u56[a1]:expect()
    end
    local u52 = require(ServerStorage.Server.Data.AssetPackages)[a1]
    assert(u52, (("Asset Package '%*' not found"):format(a1)))
    local u64 = TypedPromise.new(function(a1_2, a2, a3) -- Line: 69
        -- upvalues: a1 (val), u52 (val), AssetService (upval), TDS_PLUGIN_PACKAGES (val), u56 (upval)
        local u3 = false
        a3(function() -- Line: 71 -- upvalues: u3 (ref)
            u3 = true
        end)
        print((("[DEV PLUGIN ASSET] Downloading asset package '%*' (%*)"):format(a1, u52.id)))
        local v1 = AssetService:LoadAssetAsync(u52.id):GetChildren()[1]
        if u3 then
            print((("[DEV PLUGIN ASSET] Download of asset package '%*' was cancelled"):format(a1)))
            v1:Destroy()
            return
        end
        v1.Name = a1
        v1.Parent = TDS_PLUGIN_PACKAGES
        u56[a1] = nil
        print((("[DEV PLUGIN ASSET] Finished downloading asset package '%*'"):format(a1)))
        a1_2(v1)
    end)
    v1:Add(function() -- Line: 92 -- upvalues: u64 (val)
        u64:cancel()
    end)
    u56[a1] = u64
    return u64:expect()
end

local function fetchFromFolderOrPlugin(a1, a2) -- Line: 101
    -- upvalues: u42 (val), fetchPluginPackage (val)
    if not u42 then
        return fetchPluginPackage(a2)
    end
    if a1:WaitForChild(a2) then
        return (a1:WaitForChild(a2))
    end
    return nil
end

return function(a1) -- Line: 113
    -- upvalues: u45 (val), u46 (val), ServerStorage (val), u42 (val), fetchPluginPackage (val), ReplicatedStorage (val)
    if u45 and u46[a1] then
        local Assets = ServerStorage.Assets
        return assert(
            if u42 then if not Assets:WaitForChild(a1) then nil else Assets:WaitForChild(a1) else fetchPluginPackage(a1),
            (("Asset folder '%*' not found"):format(a1))
        )
    end
    local Assets_2 = ReplicatedStorage.Assets
    return assert(
        if u42 then if not Assets_2:WaitForChild(a1) then nil else Assets_2:WaitForChild(a1) else fetchPluginPackage(a1),
        (("Asset folder '%*' not found"):format(a1))
    )
end