-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.StoryBook.Components.ChapterList
-- Decompile time: 2.57 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ChapterCollection = require(script.Parent.Parent.ChapterCollection)
local ChapterEntry = require(script.Parent.ChapterEntry)
local createElement = React.createElement
return function(a1) -- Line: 21
    -- upvalues: createElement (val), ChapterCollection (val), ChapterEntry (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12
    local progress = a1.progress

    local function isMissionCompleted(a1, a2) -- Line: 24 -- upvalues: progress (val) -- types: a1: number, a2: number
        local v1 = progress and progress.Chapters[a1]
        local v2 = false
        if v1 ~= nil then
            v2 = v1.Missions[a2] ~= nil
        end
        return v2
    end

    local v13 = {
        UIListLayout = createElement("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0.008, 0)}),
    }
    v13.UIPadding = createElement("UIPadding", {
        PaddingTop = UDim.new(0.003, 0),
        PaddingBottom = UDim.new(0.003, 0),
        PaddingLeft = UDim.new(0.033, 0),
        PaddingRight = UDim.new(0.033, 0),
    })
    local v14 = ChapterCollection.getSortedNumericKeys(a1.chapters)
    local v15 = nil
    local v16 = nil
    for i, j in v14, v15, v16 do
        v1 = a1.chapters[j]
        v2 = #v1.Missions
        v3 = 0
        for k = 1, v2 do
            v8 = progress and progress.Chapters[j]
            v7 = false
            if v8 ~= nil then
                v7 = v8.Missions[k] ~= nil
            end
            if v7 then
                v3 = v3 + 1
            end
        end
        v4 = true
        if a1.storyMaxChapter ~= nil then
            v4 = j <= a1.storyMaxChapter
        end
        v5 = a1.chapters[j - 1]
        v6 = j <= 1
        if j > 1 and v5 then
            v6 = #v5.Missions > 0
            v7 = #v5.Missions
            for n = 1, v7 do
                v11 = j - 1
                v12 = progress and progress.Chapters[v11]
                v10 = false
                if v12 ~= nil then
                    v10 = v12.Missions[n] ~= nil
                end
                if not v10 then
                    v6 = false
                    break
                end
            end
        end
        v8 = v1.Missions[1]
        v9 = ("Chapter_%*"):format(j)
        v13[v9] = (createElement(ChapterEntry, {
            title = v1.Title,
            map = v8 and v8.Map,
            completed = v3,
            total = v2,
            selected = j == a1.selectedChapter,
            locked = not v6 or not v4,
            layoutOrder = j,
            onActivate = function() -- Line: 82 -- upvalues: a1 (val), j (val)
                a1.onSelect(j)
            end,
        }))
    end
    return createElement("ScrollingFrame", {
        Active = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 8,
        Size = UDim2.fromScale(0.215, 0.885),
        CanvasSize = UDim2.fromScale(0, 4),
    }, v13)
end