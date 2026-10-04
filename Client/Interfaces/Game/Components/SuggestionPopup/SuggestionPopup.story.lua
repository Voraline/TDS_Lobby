-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.SuggestionPopup.SuggestionPopup.story
-- Decompile time: 8.50 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local CommunicationConfig = require(ReplicatedStorage.Shared.Data.CommunicationConfig)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Parent = require(script.Parent)
local createElement = React.createElement
local Type = CommunicationConfig.Type
local useEffect = React.useEffect
local useState = React.useState
local v1 = {
    Flipped = false,
    Lifetime = 10,
    SourceName = "Player2",
    StaggerTime = 0.2,
    NameColor = Color3.fromRGB(1, 162, 255),
}
local u39 = {
    [Type.PlaceTower] = "Place Scout",
    [Type.SellTower] = "Sell Minigunner",
    [Type.UpgradeTower] = "Upgrade Accelerator",
    [Type.UseAbility] = "Use Call to Arms",
    [Type.UseConsumable] = "Use Air Strike",
}
return {
    react = React,
    reactRoblox = ReactRoblox,
    controls = v1,
    story = function(a1) -- Line: 34
        -- upvalues: useState (val), useEffect (val), CommunicationConfig (val), RunService (val), createElement (val)
        -- upvalues: Parent (val), u39 (val), React (val)
        local v1, v2
        local v3, u7 = useState(workspace:GetServerTimeNow())
        local v4, u11 = useState({})
        local u16 = math.max(a1.controls.Lifetime, 0)
        local u21 = math.max(a1.controls.StaggerTime, 0)
        local v5 = {}
        local v6 = useEffect
        local v7 = {a1.controls.Lifetime, a1.controls.StaggerTime}
        v6(function() -- Line: 41 -- upvalues: u11 (val), CommunicationConfig (upval), u21 (val), u16 (val)
            local delay, v1
            local u0 = true
            local u1 = {}
            u11({})
            for i, j in CommunicationConfig.TypeOrder do
                v1 = (i - 1) * u21
                delay = task.delay
                u1[i] = (delay(v1, function() -- Line: 49 -- upvalues: u0 (ref), u11 (upval), j (val), u16 (upval), u1 (val)
                    if not u0 then
                        return
                    end
                    local ServerTimeNow = workspace:GetServerTimeNow()
                    u11(function(a1) -- Line: 56 -- upvalues: j (upval), ServerTimeNow (val)
                        local v1 = table.clone(a1)
                        local v2 = j
                        v1[v2] = {exiting = false, createdAt = ServerTimeNow}
                        return v1
                    end)
                    if u16 <= 0 then
                        return
                    end
                    table.insert(u1, (task.delay(u16, function() -- Line: 71 -- upvalues: u0 (upval), u11 (upval), j (upval)
                        if not u0 then
                            return
                        end
                        u11(function(a1) -- Line: 76 -- upvalues: j (upval)
                            if a1[j] == nil then
                                return a1
                            end
                            local v1 = table.clone(a1)
                            v1[j] = (table.clone(v1[j]))
                            local v2 = v1[j]
                            v2.exiting = true
                            return v1
                        end)
                    end)))
                end))
            end
            return function() -- Line: 92 -- upvalues: u0 (ref), u1 (val)
                u0 = false
                for i, j in u1 do
                    pcall(task.cancel, j)
                end
            end
        end, v7)
        useEffect(function() -- Line: 101 -- upvalues: RunService (upval), u7 (val)
            local u5 = RunService.Heartbeat:Connect(function() -- Line: 102 -- upvalues: u7 (upval)
                u7(workspace:GetServerTimeNow())
            end)
            return function() -- Line: 106 -- upvalues: u5 (val)
                u5:Disconnect()
            end
        end, {})
        local v8 = nil
        v7 = nil
        local v9 = a1
        for i, j in CommunicationConfig.TypeOrder, v8, v7 do
            v1 = v4[j]
            if v1 ~= nil then
                v2 = {
                    createdAt = v1.createdAt,
                    currentTime = v3,
                    detail = u39[j],
                    exiting = v1.exiting,
                    icon = CommunicationConfig.TypeIcons[j],
                    layoutOrder = i,
                    lifetime = v9.controls.Lifetime,
                    nameColor = v9.controls.NameColor,
                    showView = CommunicationConfig.MarkerTypes[j] == true,
                    slideDirection = if not v9.controls.Flipped then 1 else -1,
                    sourceName = v9.controls.SourceName,
                    zIndex = i,
                    onDismiss = function() -- Line: 130 -- upvalues: j (val)
                        print((("Dismissed %*"):format(j)))
                    end,
                    onExited = function() -- Line: 133 -- upvalues: u11 (val), j (val)
                        u11(function(a1) -- Line: 134 -- upvalues: j (upval)
                            if a1[j] == nil then
                                return a1
                            end
                            local v1 = table.clone(a1)
                            v1[j] = nil
                            return v1
                        end)
                    end,
                    onView = function() -- Line: 144 -- upvalues: j (val)
                        print((("Viewed %*"):format(j)))
                    end,
                }
                v5[j] = (createElement(Parent, v2))
            end
        end
        return createElement("Frame", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(390, 740),
        }, {
            list = createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                Padding = UDim.new(0, 24),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            popups = createElement(React.Fragment, {}, v5),
        })
    end,
}