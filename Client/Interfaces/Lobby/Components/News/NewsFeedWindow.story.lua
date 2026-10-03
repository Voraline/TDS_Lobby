-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.News.NewsFeedWindow.story
-- Decompile time: 1.56 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NewsFeedWindow = require(script.Parent.NewsFeedWindow)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
local u21 = {}
for i, j in ReplicatedStorage.Shared.Data.Newsfeeds:GetChildren() do
    if j:IsA("ModuleScript") then
        table.insert(u21, j)
    end
end
table.sort(u21, function(a1, a2) -- Line: 21
    local v1
    local v2, v3, v4 = string.match(a1.Name, "v(%d+)%.(%d+)%.(%d+)")
    local v5, v6, v7 = string.match(a2.Name, "v(%d+)%.(%d+)%.(%d+)")
    if v2 ~= v5 then
        return v5 < v2
    end
    if v3 ~= v6 then
        v1 = tonumber(v3)
        return tonumber(v6) < v1
    end
    v1 = tonumber(v4)
    return tonumber(v7) < v1
end)
return function(a1) -- Line: 36
    -- upvalues: u21 (val), createElement (val), React (val), NewsFeedWindow (val), ReactRoblox (val)
    local v1
    local u1 = {}
    for i, v in ipairs(u21) do
        v1 = require(v)
        table.insert(u1, {
            Version = v.Name,
            Title = v1.UpdateName,
            ImageId = v1.ImageId,
            Sections = v1.Sections,
        })
    end
    local v2 = createElement(function() -- Line: 49 -- upvalues: React (upval), u1 (val), createElement (upval), NewsFeedWindow (upval)
        local v1, u4 = React.useState(true)
        local v2, u11 = React.useState(u1[1].Version)
        return createElement(NewsFeedWindow, {
            useLatest = true,
            visible = v1,
            closed = function() -- Line: 57 -- upvalues: u4 (val), u11 (val), u1 (upval)
                u4(false)
                task.wait(2)
                u4(true)
                u11(u1[1].Version)
            end,
            onSectionClicked = function(a1) -- Line: 63 -- upvalues: u11 (val)
                u11(a1)
            end,
            newsFeed = u1,
            selectedVersion = v2,
        })
    end)
    local u22 = ReactRoblox.createRoot(a1)
    u22:render(v2)
    return function() -- Line: 75 -- upvalues: u22 (val)
        u22:unmount()
    end
end