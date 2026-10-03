-- Script path: ReplicatedStorage.Client.Controllers.Shared.AssetStreamingController
-- Decompile time: 4.57 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local InstanceUtil = require(ReplicatedStorage.Shared.Modules.InstanceUtil)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local Promise = require(ReplicatedStorage.Shared.Modules.Typescript.Promise)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local u39 = NewNetwork.Channel("AssetStreaming", {events = {"requestAsset", "requestAssets", "removeAsset", "removeAssets"}})
local u40 = {}
local u41 = {}

local function getStreamingFolder() -- Line: 18 -- upvalues: Players (val)
    return Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Streaming")
end

local function resolveAsset(a1, a2) -- Line: 23
    -- upvalues: u40 (val), Players (val), InstanceUtil (val)
    if u40[a1] then
        return u40[a1]
    end
    local v1 = InstanceUtil.resolvePath(Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Streaming"), a1, a2)
    if v1 then
        u40[a1] = v1
    end
    return v1
end

local function trackAsset(a1, a2, a3) -- Line: 38
    -- upvalues: u40 (val), u41 (val)
    u40[a1] = a2
    local v1 = u41
    local v2 = u41[a1] or {}
    v1[a1] = v2
    if a3 then
        v1 = u41[a1]
        v1[a3] = true
    end
    a2.Destroying:Connect(function() -- Line: 46 -- upvalues: u40 (upval), a1 (val), u41 (upval)
        u40[a1] = nil
        u41[a1] = nil
    end)
end

local function getAsset(a1, a2) -- Line: 52
    -- upvalues: u40 (val), u41 (val), u39 (val), Players (val), InstanceUtil (val), trackAsset (val)
    local v1 = a2 or "global"
    local v2 = u40[a1]
    if not u41[a1] then
        u41[a1] = {}
    end
    local v3 = u41[a1]
    v3[v1] = true
    if v2 then
        return v2
    end
    u39:fireServer("requestAsset", a1)
    if not u40[a1] then
        local v4 = InstanceUtil.resolvePath(Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Streaming"), a1, true)
        if v4 then
            u40[a1] = v4
        end
        v2 = v4
    else
        v2 = u40[a1]
    end
    if u40[a1] then
        v2:Destroy()
        return u40[a1]
    end
    trackAsset(a1, v2, v1)
    return v2
end

local function getAssets(a1) -- Line: 79
    -- upvalues: u40 (val), Players (val), InstanceUtil (val), u41 (val), Promise (val), u39 (val), TypedPromise (val)
    local Streaming, v1, v2, v3, v4
    local v5 = {}
    local v6 = {}
    local u79 = {}
    local v7 = nil
    local v8 = nil
    for i, j in a1, v7, v8 do
        local path = j.path
        v1 = j.context or "global"
        if not u40[path] then
            Streaming = Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Streaming")
            v4 = InstanceUtil.resolvePath(Streaming, path, false)
            if v4 then
                u40[path] = v4
            end
            v2 = v4
        else
            v2 = u40[path]
        end
        if not u41[path] then
            u41[path] = {}
            v3 = u41[path]
            v3[v1] = true
        end
        if not v2 then
            if not table.find(v6, path) then
                table.insert(v6, path)
            end
            table.insert(v5, (Promise.new(function(a1) -- Line: 106
                -- upvalues: path (val), u40 (upval), Players (upval), InstanceUtil (upval), u41 (upval), u79 (val)
                -- upvalues: i (val)
                local v1, v2
                local v3 = path
                if not u40[v3] then
                    local Streaming = Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Streaming")
                    v2 = InstanceUtil.resolvePath(Streaming, v3, true)
                    if v2 then
                        u40[v3] = v2
                    end
                    v1 = v2
                else
                    v1 = u40[v3]
                end
                local u26 = path
                u40[u26] = v1
                local v4 = u41
                v2 = u41[u26] or {}
                v4[u26] = v2
                v1.Destroying:Connect(function() -- Line: 46 -- upvalues: u40 (upval), u26 (val), u41 (upval)
                    u40[u26] = nil
                    u41[u26] = nil
                end)
                u79[i] = v1
                a1(v1)
            end)))
        else
            u79[i] = v2
        end
    end
    if v6[1] then
        u39:fireServer("requestAssets", v6)
    end
    if next(v5) then
        TypedPromise.all(v5):expect()
    end
    return u79
end

return {
    getAsset = getAsset,
    getAssetAsync = TypedPromise.promisify(getAsset),
    getAssets = getAssets,
    getAssetsAsync = TypedPromise.promisify(getAssets),
    removeAsset = function(a1, a2) -- Line: 130
        -- upvalues: u40 (val), Players (val), InstanceUtil (val), u41 (val), u39 (val)
        local v1
        local v2 = a2 or "global"
        if not u40[a1] then
            local v3 = InstanceUtil.resolvePath(Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Streaming"), a1, false)
            if v3 then
                u40[a1] = v3
            end
            v1 = v3
        else
            v1 = u40[a1]
        end
        if u41[a1] then
            local v4 = u41[a1]
            v4[v2] = nil
            if next(u41[a1]) then
                return
            end
        end
        if v1 then
            v1:Destroy()
            u39:fireServer("removeAsset", a1)
        end
    end,
    removeAssets = function(a1) -- Line: 148
        -- upvalues: u40 (val), Players (val), InstanceUtil (val), u41 (val), u39 (val)
        local path, v1, v2, v3, v4
        local v5 = nil
        local v6 = nil
        for i, j in a1, v5, v6 do
            path = j.path
            v3 = j.context or "global"
            if not u40[path] then
                v2 = InstanceUtil.resolvePath(Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Streaming"), path, false)
                if v2 then
                    u40[path] = v2
                end
                v4 = v2
            else
                v4 = u40[path]
            end
            if u41[path] then
                v1 = u41[path]
                v1[v3] = nil
                if not next(u41[path]) and v4 then
                    v4:Destroy()
                end
            elseif v4 then
                v4:Destroy()
            end
        end
        u39:fireServer("removeAssets", {})
    end,
}