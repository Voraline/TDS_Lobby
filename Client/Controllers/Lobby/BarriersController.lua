-- Script path: ReplicatedStorage.Client.Controllers.Lobby.BarriersController
-- Decompile time: 3.97 ms

local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local spr = require(ReplicatedStorage.Shared.Modules.spr)

local function getElevatorLabel(a1) -- Line: 6 -- types: a1: userdata
    local Display = a1:FindFirstChild("Display")
    local Timer = Display and Display:FindFirstChild("Timer")
    local TextLabel = Timer and Timer:FindFirstChild("TextLabel")
    if TextLabel and TextLabel:IsA("TextLabel") then
        return TextLabel
    end
    return nil
end

local function getElevatorStatusText(a1) -- Line: 14 -- types: a1: userdata
    local Attribute = a1:GetAttribute("Timer")
    if typeof(Attribute) == "number" and Attribute >= 0 then
        return (tostring(Attribute))
    end
    return (("%*/%*"):format(a1:GetAttribute("Players") or 0, (a1:GetAttribute("Capacity")) or 0))
end

task.spawn(function() -- Line: 23 -- upvalues: Players (val), getElevatorStatusText (val), CollectionService (val), spr (val)
    local Level = Players.LocalPlayer:WaitForChild("Level")
    local Barriers = (workspace:WaitForChild("Lobby")):WaitForChild("Barriers")
    local HardcoreDoors = (workspace:WaitForChild("Lobby")):WaitForChild("HardcoreDoors")
    local DoorLeft = HardcoreDoors:WaitForChild("DoorLeft")
    local DoorRight = HardcoreDoors:WaitForChild("DoorRight")
    local u32 = {}
    u32.left = {open = DoorLeft:GetPivot(), close = (DoorLeft:GetPivot()) * CFrame.new(0, 0, 12)}
    u32.right = {
        open = DoorRight:GetPivot(),
        close = (DoorRight:GetPivot()) * CFrame.new(0, 0, 12),
    }
    local u59 = {}

    local function updateElevatorDisplay(a1) -- Line: 43
        -- upvalues: Level (val), getElevatorStatusText (upval)
        local v1
        local v2 = a1:GetAttribute("Level") or 0
        local Display = a1:FindFirstChild("Display")
        local Timer = Display and Display:FindFirstChild("Timer")
        local TextLabel = Timer and Timer:FindFirstChild("TextLabel")
        if not (if not TextLabel then nil else if not TextLabel:IsA("TextLabel") then nil else TextLabel) then
            return
        end
        local v3 = if not (Level.Value < v2) then getElevatorStatusText(a1) else ("Unlocks at Level %*"):format(v2)
        if v1.Text ~= v3 then
            v1.Text = v3
        end
    end

    local function watchElevator(a1) -- Line: 59
        -- upvalues: u59 (val), updateElevatorDisplay (val), Level (val), getElevatorStatusText (upval)
        local v1, v2
        if u59[a1] then
            return
        end
        local Display = a1:FindFirstChild("Display")
        local Timer = Display and Display:FindFirstChild("Timer")
        local TextLabel = Timer and Timer:FindFirstChild("TextLabel")
        if not (if not TextLabel then nil else if not TextLabel:IsA("TextLabel") then nil else TextLabel) then
            return
        end
        u59[a1] = ((v1:GetPropertyChangedSignal("Text")):Connect(function() -- Line: 71 -- upvalues: updateElevatorDisplay (upval), a1 (val)
            task.defer(updateElevatorDisplay, a1)
        end))
        local v3 = a1:GetAttribute("Level") or 0
        local Display_2 = a1:FindFirstChild("Display")
        local Timer_2 = Display_2 and Display_2:FindFirstChild("Timer")
        local TextLabel_2 = Timer_2 and Timer_2:FindFirstChild("TextLabel")
        if not (if not TextLabel_2 then nil else if not TextLabel_2:IsA("TextLabel") then nil else TextLabel_2) then
            return
        end
        local v4 = if not (Level.Value < v3) then getElevatorStatusText(a1) else ("Unlocks at Level %*"):format(v3)
        if v2.Text ~= v4 then
            v2.Text = v4
        end
    end

    local function updateElevatorDisplays() -- Line: 85
        -- upvalues: CollectionService (upval), watchElevator (val), Level (val), getElevatorStatusText (upval)
        local Display, TextLabel, Timer, v1, v2, v3
        for i, j in CollectionService:GetTagged("Elevator") do
            watchElevator(j)
            v1 = j:GetAttribute("Level") or 0
            Display = j:FindFirstChild("Display")
            Timer = Display and Display:FindFirstChild("Timer")
            TextLabel = Timer and Timer:FindFirstChild("TextLabel")
            v2 = if not TextLabel then nil else if not TextLabel:IsA("TextLabel") then nil else TextLabel
            if v2 then
                v3 = if not (Level.Value < v1) then getElevatorStatusText(j) else ("Unlocks at Level %*"):format(v1)
                if v2.Text ~= v3 then
                    v2.Text = v3
                end
            end
        end
    end

    local function updateBarriers() -- Line: 92
        -- upvalues: Barriers (val), Level (val), spr (upval), DoorLeft (val), u32 (val), DoorRight (val)
        local TextLabel, v1, v2, v3
        for k, v in pairs(Barriers:GetChildren()) do
            v1 = v:GetAttribute("Level") or 0
            v2 = Level.Value < v1
            if v:GetAttribute("type") == "Hardcore" then
                v3 = not v2
                spr.target(DoorLeft, 1, 0.2, {Pivot = u32.left[if not v3 then "close" else "open"]})
                spr.target(DoorRight, 0.5, 0.2, {Pivot = u32.right[if not v3 then "close" else "open"]})
            end
            if v2 then
                TextLabel = v:FindFirstChild("TextLabel", true)
                if TextLabel then
                    TextLabel.Text = ("LEVEL %*+"):format(v1)
                end
            elseif v:IsA("BasePart") then
                v:Destroy()
            end
        end
    end

    updateBarriers()
    updateElevatorDisplays()
    ;(CollectionService:GetInstanceAddedSignal("LevelBarrier")):Connect(updateBarriers)
    ;(CollectionService:GetInstanceAddedSignal("Elevator")):Connect(watchElevator)
    ;(CollectionService:GetInstanceRemovedSignal("Elevator")):Connect(function(a1) -- Line: 77 -- upvalues: u59 (val) -- types: a1: userdata
        local v1 = u59[a1]
        if v1 then
            v1:Disconnect()
            u59[a1] = nil
        end
    end)
    Level.Changed:Connect(function() -- Line: 124 -- upvalues: updateBarriers (val), updateElevatorDisplays (val)
        updateBarriers()
        updateElevatorDisplays()
    end)
end)
return true