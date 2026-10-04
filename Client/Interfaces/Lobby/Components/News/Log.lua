-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.News.Log
-- Decompile time: 23.55 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local UsernameFromId = require(ReplicatedStorage.Shared.Modules.UsernameFromId)
local createElement = React.createElement
local useState = React.useState
local useEffect = React.useEffect
local u24 = {}
u24["[h1]"] = {
    TextColor3 = Color3.fromRGB(255, 255, 255),
    FontFace = Font.fromEnum(Enum.Font.SourceSansBold),
}
u24.Default = {
    Manipulate = function(a1) -- Line: 50
        return (("• %*"):format(a1))
    end,
}

local function extractUserIds(a1, a2) -- Line: 58 -- types: a1: string?, a2: table
    local v1
    if not a1 then
        return
    end
    for i in string.gmatch(a1, "{%$userId:(%d+)}") do
        v1 = tonumber(i)
        if v1 then
            a2[v1] = true
        end
    end
end

local function replaceUserIds(a1, a2) -- Line: 70 -- types: a1: string, a2: table
    return string.gsub(a1, "{%$userId:(%d+)}", function(a1) -- Line: 71 -- upvalues: a2 (val)
        local v1 = tonumber(a1)
        local v2 = a2[v1] or ("User#%*"):format(v1)
        return (("<font color=\"rgb(100,200,255)\">@%*</font>"):format(v2))
    end)
end

local function injectProps(a1, a2) -- Line: 78
    for k, v in pairs(a2) do
        if k ~= "Manipulate" then
            a1[k] = v
        end
    end
    return a1
end

local function copyProps(a1) -- Line: 89
    local v1 = {}
    for k, v in pairs(a1) do
        v1[k] = v
    end
    return v1
end

local function FunctionPoint(a1) -- Line: 97 -- types: a1: table
    return a1.Render(a1.LayoutOrder, a1.LogProps)
end

return function(a1) -- Line: 101
    -- upvalues: useState (val), useEffect (val), UsernameFromId (val), replaceUserIds (val), createElement (val)
    -- upvalues: TextLabel (val), u24 (val), FunctionPoint (val), React (val)
    local v1, v2, v3, v4, v5, v6
    local v7 = {}
    local SubjectName = a1.SubjectName
    if SubjectName then
        for i in string.gmatch(SubjectName, "{%$userId:(%d+)}") do
            v6 = tonumber(i)
            if v6 then
                v7[v6] = true
            end
        end
    end
    local HeaderName = a1.HeaderName
    if HeaderName then
        for j in string.gmatch(HeaderName, "{%$userId:(%d+)}") do
            v6 = tonumber(j)
            if v6 then
                v7[v6] = true
            end
        end
    end
    local HeaderSubject = a1.HeaderSubject
    if HeaderSubject then
        for k in string.gmatch(HeaderSubject, "{%$userId:(%d+)}") do
            v6 = tonumber(k)
            if v6 then
                v7[v6] = true
            end
        end
    end
    local v8 = nil
    local v9 = nil
    for n, m in a1.Points, v8, v9 do
        if typeof(m) == "string" and m then
            for i5 in string.gmatch(m, "{%$userId:(%d+)}") do
                v1 = tonumber(i5)
                if v1 then
                    v7[v1] = true
                end
            end
        end
    end
    local u57 = {}
    for i6 in v7 do
        table.insert(u57, i6)
    end
    table.sort(u57)
    v8 = table.concat(u57, ",")
    local u78, u79 = useState({})
    v6 = {v8}
    useEffect(function() -- Line: 123 -- upvalues: u57 (val), u79 (val), UsernameFromId (upval)
        if #u57 == 0 then
            u79({})
            return
        end
        local u5 = false
        local u8 = task.spawn(function() -- Line: 130 -- upvalues: u57 (upval), u5 (ref), UsernameFromId (upval), u79 (upval)
            local v1, v2
            local v3 = {}
            local v4 = nil
            local v5 = nil
            for i, j in u57, v4, v5 do
                if u5 then
                    return
                end
                v1 = UsernameFromId(j)
                v2 = if not v1 then ("User#%*"):format(j) else if v1 == "" then ("User#%*"):format(j) else v1
                v3[j] = v2
            end
            if not u5 then
                u79(v3)
            end
        end)
        return function() -- Line: 145 -- upvalues: u5 (ref), u8 (val)
            u5 = true
            if u8 then
                task.cancel(u8)
            end
        end
    end, v6)

    local function resolveText(a1) -- Line: 153
        -- upvalues: u57 (val), replaceUserIds (upval), u78 (val)
        if #u57 == 0 then
            return a1
        end
        return replaceUserIds(a1, u78)
    end

    local v10 = false
    if type(a1.HeaderName) == "string" then
        v10 = a1.HeaderName ~= ""
    end
    v6 = false
    if type(a1.HeaderSubject) == "string" then
        v6 = a1.HeaderSubject ~= ""
    end
    local u105 = v10 or v6
    local u106 = {}
    local u116 = if not u105 then Color3.fromRGB(255, 255, 127) else Color3.new(1, 1, 1)
    local u119 = if not u105 then "\n" else "\n\n"
    local u120 = nil
    local u121 = 0

    local function createPointTextLabel(a1, a2) -- Line: 174
        -- upvalues: createElement (upval), TextLabel (upval)
        return createElement(TextLabel, a1, {
            uiPadding = if not a2 then nil else createElement("UIPadding", {PaddingLeft = UDim.new(0, 15)}),
        })
    end

    local function flushTextBatch() -- Line: 184
        -- upvalues: u120 (ref), u121 (ref), u119 (val), u106 (val), createPointTextLabel (val), u105 (val)
        if not u120 then
            return
        end
        u121 = u121 + 1
        local v1 = u120
        local v2 = {}
        for k, v in pairs(v1.Props) do
            v2[k] = v
        end
        v2.Text = table.concat(v1.TextRows, u119)
        if #v1.TextRows > 1 then
            v2.LineHeight = 1.2
        end
        local v3 = u106
        local v4 = ("text-%*-%*"):format(v1.LayoutOrder, u121)
        v3[v4] = (createPointTextLabel(v2, not u105))
        u120 = nil
    end

    local function canAppendToTextBatch(a1, a2) -- Line: 204
        -- upvalues: u120 (ref), u119 (val)
        if not u120 or u120.StyleKey ~= a1 or #u120.TextRows >= 40 then
            return false
        end
        return u120.TextLength + #u119 + #a2 <= 8000
    end

    local function appendTextPoint(a1, a2, a3, a4) -- Line: 219
        -- upvalues: u120 (ref), u119 (val), flushTextBatch (val)
        local v1 = if not u120 or u120.StyleKey ~= a3 then false else if not (#u120.TextRows >= 40) then u120.TextLength + #u119 + #a4 <= 8000 else false
        if not v1 then
            flushTextBatch()
            v1 = {TextLength = 0, LayoutOrder = a1}
            local v2 = {}
            for k, v in pairs(a2) do
                v2[k] = v
            end
            v1.Props = v2
            v1.StyleKey = a3
            v1.TextRows = {}
            u120 = v1
        end
        v1 = u120
        table.insert(v1.TextRows, a4)
        if v1.TextLength == 0 then
            v1.TextLength = #a4
            return
        end
        v1.TextLength = v1.TextLength + (#u119 + #a4)
    end

    local function getPointTextData(a1_2, a2) -- Line: 241
        -- upvalues: u116 (val), a1 (val), u105 (val), u24 (upval), resolveText (val)
        local v1
        local v2 = {
            RichText = true,
            TextSize = 16,
            TextScaled = false,
            TextWrapped = true,
            FontWeight = "SemiBold",
            Size = UDim2.new(0.919, 0, 0, 0),
            TextColor3 = u116,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top,
            LayoutOrder = a1_2,
            AutomaticSize = Enum.AutomaticSize.Y,
            TextTransparency = a1.Transparency,
        }
        local Default_2 = false
        local v3 = if not u105 then "body-points" else "header-points"
        for k, v in pairs(u24) do
            if k ~= "Default" and string.sub(a2, 1, #k) == k then
                for k2, i in pairs(v) do
                    if k2 ~= "Manipulate" then
                        v2[k2] = i
                    end
                end
                v1 = string.sub(a2, #k + 1)
                Default_2 = v
                v3 = ("header-%*"):format(k)
                break
            end
        end
        if not Default_2 and not u105 then
            for k3, j in pairs(u24.Default) do
                if k3 ~= "Manipulate" then
                    v2[k3] = j
                end
            end
            Default_2 = u24.Default
            v3 = "bulleted-body"
        end
        local v4 = string.gsub(v1, "^%s*(.-)%s*$", "%1")
        if Default_2 and Default_2.Manipulate then
            v4 = Default_2.Manipulate(v4)
        end
        return v2, v3, resolveText(v4)
    end

    for i2, v in ipairs(a1.Points) do
        if typeof(v) == "string" then
            v2, v3, v4 = getPointTextData(i2, v)
            appendTextPoint(i2, v2, v3, v4)
        elseif typeof(v) ~= "function" then
            error("Invalid point type: " .. typeof(v))
        else
            flushTextBatch()
            v5 = tostring(v)
            v2 = ("function-%*-%*"):format(i2, v5)
            u106[v2] = (createElement(FunctionPoint, {LayoutOrder = i2, LogProps = a1, Render = v}))
        end
    end
    flushTextBatch()
    local v11 = createElement
    local v12 = {BackgroundTransparency = 1}
    local Size = a1.Size or UDim2.fromScale(1, 0)
    v12.Size = Size
    v12.Position = a1.Position
    v12.AnchorPoint = a1.AnchorPoint
    v12.AutomaticSize = Enum.AutomaticSize.Y
    v12.LayoutOrder = a1.LayoutOrder
    local v13 = {
        uiList = createElement("UIListLayout", {
            Padding = UDim.new(0, 13),
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Top,
        }),
    }
    local v14 = createElement
    v3 = {PaddingBottom = UDim.new(0, 8), PaddingTop = UDim.new(0, 8)}
    v13.uiPadding = v14("UIPadding", v3)
    local SubjectName_2 = a1.SubjectName
    if SubjectName_2 then
        v14 = createElement
        v3 = {
            RichText = true,
            TextSize = 20,
            TextScaled = false,
            TextWrapped = true,
            LayoutOrder = -1,
            FontWeight = "Black",
            AutomaticSize = Enum.AutomaticSize.Y,
            Size = UDim2.new(0.919, 0, 0, 0),
        }
        local SubjectName_3 = a1.SubjectName
        v3.Text = if #u57 ~= 0 then string.gsub(SubjectName_3, "{%$userId:(%d+)}", function(a1) -- Line: 71 -- upvalues: u78 (val)
            local v1 = tonumber(a1)
            local v2 = u78[v1] or ("User#%*"):format(v1)
            return (("<font color=\"rgb(100,200,255)\">@%*</font>"):format(v2))
        end) else SubjectName_3
        v3.TextColor3 = Color3.fromRGB(255, 255, 255)
        v3.TextXAlignment = Enum.TextXAlignment.Left
        v3.TextYAlignment = Enum.TextYAlignment.Top
        v3.TextTransparency = a1.Transparency
        SubjectName_2 = v14(TextLabel, v3)
    end
    v13.subject = SubjectName_2
    v14 = u105
    if v14 then
        local v15
        v14 = createElement
        v3 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
        }
        v4 = {}
        v5 = createElement
        local v16 = {
            Padding = UDim.new(0, 8),
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Top,
        }
        v4.uiList = v5("UIListLayout", v16)
        v5 = v10
        if v5 then
            v5 = createElement
            v16 = {
                RichText = true,
                TextSize = 28,
                TextScaled = false,
                TextWrapped = true,
                LayoutOrder = -1,
                FontWeight = "ExtraBold",
                AutomaticSize = Enum.AutomaticSize.Y,
                Size = UDim2.fromScale(1, 0),
            }
            local HeaderName_3 = a1.HeaderName
            v16.Text = if #u57 ~= 0 then string.gsub(HeaderName_3, "{%$userId:(%d+)}", function(a1) -- Line: 71 -- upvalues: u78 (val)
                local v1 = tonumber(a1)
                local v2 = u78[v1] or ("User#%*"):format(v1)
                return (("<font color=\"rgb(100,200,255)\">@%*</font>"):format(v2))
            end) else HeaderName_3
            v16.TextColor3 = Color3.fromRGB(255, 255, 255)
            v16.TextXAlignment = Enum.TextXAlignment.Left
            v16.TextYAlignment = Enum.TextYAlignment.Top
            v16.TextTransparency = a1.Transparency
            v15 = {textSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 49})}
            v5 = v5(TextLabel, v16, v15)
        end
        v4.header = v5
        v5 = v6
        if v5 then
            v5 = createElement
            v16 = {
                RichText = true,
                TextSize = 16,
                TextScaled = false,
                TextWrapped = true,
                LayoutOrder = 0,
                FontWeight = "Bold",
                AutomaticSize = Enum.AutomaticSize.Y,
                Size = UDim2.fromScale(1, 0),
            }
            local HeaderSubject_3 = a1.HeaderSubject
            v16.Text = if #u57 ~= 0 then string.gsub(HeaderSubject_3, "{%$userId:(%d+)}", function(a1) -- Line: 71 -- upvalues: u78 (val)
                local v1 = tonumber(a1)
                local v2 = u78[v1] or ("User#%*"):format(v1)
                return (("<font color=\"rgb(100,200,255)\">@%*</font>"):format(v2))
            end) else HeaderSubject_3
            v16.TextColor3 = Color3.fromRGB(207, 207, 207)
            v16.TextXAlignment = Enum.TextXAlignment.Left
            v16.TextYAlignment = Enum.TextYAlignment.Top
            v16.TextTransparency = a1.Transparency
            v16.AnchorPoint = Vector2.zero
            v15 = {textSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 23})}
            v5 = v5(TextLabel, v16, v15)
        end
        v4.headerSubject = v5
        v14 = v14("Frame", v3, v4)
    end
    v13.headerFrame = v14
    v13.points = React.createElement(React.Fragment, {}, u106)
    v11 = v11("Frame", v12, v13)
    return v11
end