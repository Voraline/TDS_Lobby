-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.News
-- Decompile time: 9.77 ms

local v1
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NewsFeedWindow = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.NewsFeedWindow)
local React = require(ReplicatedStorage.Shared.UI.React)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local useFFlag = require(ReplicatedStorage.Client.Interfaces.Hooks.useFFlag)
local createElement = React.createElement
local useEffect = React.useEffect
local useMemo = React.useMemo
local useState = React.useState

local function parseVersion(a1) -- Line: 36 -- types: a1: string
    local v1, v2, v3 = string.match(a1, "^v(%d+)%.(%d+)%.(%d+)$")
    return (tonumber(v1)), (tonumber(v2)), (tonumber(v3))
end

local function compareVersions(a1, a2) -- Line: 41 -- types: a1: string, a2: string
    local v1, v2, v3 = string.match(a1, "^v(%d+)%.(%d+)%.(%d+)$")
    local v4 = tonumber(v1)
    local v5 = tonumber(v2)
    local v6 = tonumber(v3)
    local v7, v8, v9 = string.match(a2, "^v(%d+)%.(%d+)%.(%d+)$")
    v1 = tonumber(v7)
    v2 = tonumber(v8)
    local v10 = tonumber(v9)
    if v4 and v1 then
        if v4 ~= v1 then
            return v4 - v1
        end
        if v5 ~= v2 then
            return v5 - v2
        end
        return v6 - v10
    end
    if a1 == a2 then
        return 0
    end
    if a2 < a1 then
        return 1
    end
    return -1
end

local function isVersionActive(a1, a2) -- Line: 68 -- types: a1: string, a2: string
    local v1, v2, v3 = string.match(a1, "^v(%d+)%.(%d+)%.(%d+)$")
    local v4 = tonumber(v1)
    local v5 = tonumber(v2)
    local v6 = tonumber(v3)
    local v7, v8, v9 = string.match(a2, "^v(%d+)%.(%d+)%.(%d+)$")
    v1 = tonumber(v7)
    v2 = tonumber(v8)
    local v10 = tonumber(v9)
    return (if not v4 then if a1 ~= a2 then if not (a2 < a1) then -1 else 1 else 0 else if v1 then if v4 == v1 then if v5 == v2 then v6 - v10 else v5 - v2 else v4 - v1 else if a1 ~= a2 then if not (a2 < a1) then -1 else 1 else 0) <= 0
end

local function getSelectedVersion(a1) -- Line: 72
    if a1[1] then
        return a1[1].Version
    end
    return ""
end

local Children = ReplicatedStorage.Shared.Data.Newsfeeds:GetChildren()
table.sort(Children, function(a1, a2) -- Line: 64 -- types: a1: userdata, a2: userdata
    local Name_2 = a1.Name
    local Name = a2.Name
    local v1, v2, v3 = string.match(Name_2, "^v(%d+)%.(%d+)%.(%d+)$")
    local v4 = tonumber(v1)
    local v5 = tonumber(v2)
    local v6 = tonumber(v3)
    local v7, v8, v9 = string.match(Name, "^v(%d+)%.(%d+)%.(%d+)$")
    v1 = tonumber(v7)
    v2 = tonumber(v8)
    local v10 = tonumber(v9)
    return 0 < (if not v4 then if Name_2 ~= Name then if not (Name < Name_2) then -1 else 1 else 0 else if v1 then if v4 == v1 then if v5 == v2 then v6 - v10 else v5 - v2 else v4 - v1 else if Name_2 ~= Name then if not (Name < Name_2) then -1 else 1 else 0)
end)
local u50 = {}
for i, j in Children do
    v1 = require(j)
    table.insert(u50, {
        Version = j.Name,
        Title = v1.UpdateName,
        ImageId = v1.ImageId,
        Sections = v1.Sections,
    })
end

local function isViewEnabled() -- Line: 90 -- upvalues: ViewController (val)
    local v1 = ViewController:getCurrentView()
    local v2 = true
    if v1 ~= "" then
        v2 = v1 == "News"
    end
    return v2
end

return function() -- Line: 95
    -- upvalues: useState (val), ViewController (val), useFFlag (val), useMemo (val), u50 (val), useEffect (val)
    -- upvalues: createElement (val), NewsFeedWindow (val)
    local v1, u3 = useState(function() -- Line: 96 -- upvalues: ViewController (upval)
        local v1 = ViewController:getCurrentView()
        local v2 = true
        if v1 ~= "" then
            v2 = v1 == "News"
        end
        return v2
    end)
    local u8 = useFFlag("release.activeVersion", nil, {enabled = v1})
    local v2 = {u8}
    local u13 = useMemo(function() -- Line: 100 -- upvalues: u8 (val), u50 (upval)
        local v1 = {}
        local v2 = u8
        if type(v2) == "string" then
            local v3, v4, v5 = string.match(u8, "^v(%d+)%.(%d+)%.(%d+)$")
            local v6 = tonumber(v3)
            tonumber(v4)
            tonumber(v5)
            if v6 then
                local Version, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17
                v2 = nil
                v3 = nil
                for i, j in u50, v2, v3 do
                    Version = j.Version
                    v17 = u8
                    v10, v11, v12 = string.match(Version, "^v(%d+)%.(%d+)%.(%d+)$")
                    v7 = tonumber(v10)
                    v8 = tonumber(v11)
                    v9 = tonumber(v12)
                    v13, v14, v15 = string.match(v17, "^v(%d+)%.(%d+)%.(%d+)$")
                    v10 = tonumber(v13)
                    v11 = tonumber(v14)
                    v16 = tonumber(v15)
                    if (if not v7 then if Version ~= v17 then if not (v17 < Version) then -1 else 1 else 0 else if v10 then if v7 == v10 then if v8 == v11 then v9 - v16 else v8 - v11 else v7 - v10 else if Version ~= v17 then if not (v17 < Version) then -1 else 1 else 0) <= 0 then
                        table.insert(v1, j)
                    end
                end
                return v1
            end
        end
        return v1
    end, v2)
    local v3, u17 = useState(function() -- Line: 116 -- upvalues: u13 (val)
        local v1 = u13
        if v1[1] then
            return v1[1].Version
        end
        return ""
    end)
    local v4 = {u13}
    useEffect(function() -- Line: 120 -- upvalues: u17 (val), u13 (val)
        local v1 = u13
        u17(if not v1[1] then "" else v1[1].Version)
    end, v4)
    useEffect(function() -- Line: 124 -- upvalues: ViewController (upval), u3 (val)
        return (ViewController:onViewChange(function(a1) -- Line: 125 -- upvalues: u3 (upval), ViewController (upval)
            local v1 = u3
            local v2 = ViewController:getCurrentView()
            local v3 = true
            if v2 ~= "" then
                v3 = v2 == "News"
            end
            v1(v3)
        end))
    end, {})
    local Version = if not u13[1] then "" else u13[1].Version
    if Version == "" then
        return nil
    end
    return createElement(NewsFeedWindow, {
        useLatest = true,
        visible = v1,
        closed = function() -- Line: 139 -- upvalues: ViewController (upval), u17 (val), Version (val)
            ViewController:setView("Hotbar")
            u17(Version)
        end,
        onSectionClicked = function(a1) -- Line: 143 -- upvalues: u17 (val)
            u17(a1)
        end,
        newsFeed = u13,
        selectedVersion = if v3 == "" then Version else v3,
    })
end