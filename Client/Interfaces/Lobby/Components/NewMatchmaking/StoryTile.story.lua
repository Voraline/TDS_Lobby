-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.StoryTile.story
-- Decompile time: 3.93 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local MatchmakingStyle = require(script.Parent.MatchmakingStyle)
local StoryTile = require(script.Parent.StoryTile)
local useFontScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useFontScale)

local function getCurrentTime() -- Line: 20 -- upvalues: RunService (val)
    if RunService:IsRunning() then
        return (workspace:GetServerTimeNow())
    end
    return (tick())
end

return {
    react = React,
    reactRoblox = ReactRoblox,
    controls = {
        Compact = true,
        Locked = true,
        RevealCycle = 0,
        Selected = false,
        TimedLock = true,
        UnlocksInSeconds = 432000,
    },
    story = function(a1) -- Line: 24
        -- upvalues: React (val), useFontScale (val), MatchmakingStyle (val), RunService (val), StoryTile (val)
        local v1, u5 = React.useState(0)
        local Compact = a1.controls.Compact
        local v2 = useFontScale(MatchmakingStyle.getFontSize("subheader1", Compact))
        local useMemo = React.useMemo
        local v3 = {
            a1.controls.Locked,
            a1.controls.TimedLock,
            a1.controls.UnlocksInSeconds,
        }
        local v4 = useMemo(function() -- Line: 28 -- upvalues: a1 (val), RunService (upval)
            if a1.controls.Locked and a1.controls.TimedLock and not (a1.controls.UnlocksInSeconds <= 0) then
                local ServerTimeNow = if not RunService:IsRunning() then tick() else workspace:GetServerTimeNow()
                return ServerTimeNow + a1.controls.UnlocksInSeconds
            end
            return nil
        end, v3)
        local v5 = if not Compact then UDim2.fromOffset(360, 92) else UDim2.fromOffset(204, 68)
        return React.createElement("Frame", {
            BackgroundColor3 = MatchmakingStyle.colors.surface,
            Size = UDim2.fromScale(1, 1),
        }, {
            Layout = React.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                Padding = UDim.new(0, MatchmakingStyle.spacing.large),
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }),
            Tile = React.createElement(StoryTile, {
                image = 129664072496886,
                layoutOrder = 1,
                lockReason = "Complete Fallen Harbor",
                progressText = "3 / 6 missions complete",
                subtitle = "Continue your story",
                title = "Dustlands",
                compact = Compact,
                locked = a1.controls.Locked,
                onActivated = function() -- Line: 62 -- upvalues: u5 (val)
                    u5(function(a1) -- Line: 63
                        return a1 + 1
                    end)
                end,
                revealCycle = a1.controls.RevealCycle,
                selected = a1.controls.Selected,
                size = v5,
                unlocksAt = v4,
            }),
            ActivationCount = React.createElement("TextLabel", {
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                FontFace = Font.fromName("Montserrat", Enum.FontWeight.SemiBold),
                Size = UDim2.fromOffset(v5.X.Offset, 28),
                Text = ("Activations: %*"):format(v1),
                TextColor3 = Color3.fromRGB(220, 223, 230),
                TextSize = v2,
            }),
        })
    end,
}