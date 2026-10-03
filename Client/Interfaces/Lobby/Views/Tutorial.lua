-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.Tutorial
-- Decompile time: 2.07 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local useFFlag = require(ReplicatedStorage.Client.Interfaces.Hooks.useFFlag)
local useViewEnabled = require(ReplicatedStorage.Client.Interfaces.Hooks.useViewEnabled)
local CutSceneController = require(ReplicatedStorage.Client.Controllers.Shared.CutSceneController)
local Tutorial = require(ReplicatedStorage.Shared.Modules.Network).Channel("Tutorial")
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local React = require(ReplicatedStorage.Shared.UI.React)

local function showTutorialError(a1) -- Line: 20 -- upvalues: Notification (val)
    warn((("Failed to start the tutorial: %*"):format(a1)))
    Notification.Create({
        Text = "Error occurred while trying to start tutorial. Please try again later.",
        Color = Color3.fromRGB(255, 0, 0),
    })
end

local function startTutorialFlow(a1) -- Line: 28
    -- upvalues: Tutorial (val), showTutorialError (val), CutSceneController (val)
    local u1 = false
    local u2 = nil

    local function continueAfterIntro() -- Line: 32
        -- upvalues: u1 (ref), Tutorial (upval), showTutorialError (upval), a1 (val)
        if u1 then
            return
        end
        local success, result = pcall(function() -- Line: 37 -- upvalues: Tutorial (upval)
            return Tutorial:InvokeServer("CompleteIntro")
        end)
        if not success then
            showTutorialError(result)
            return
        end
        if not result then
            a1("Hotbar")
            return
        end
        local success_2, result_2 = pcall(function() -- Line: 46 -- upvalues: Tutorial (upval)
            return Tutorial:InvokeServer("Start")
        end)
        if success_2 and result_2 then
            a1("Hotbar")
            return
        end
        showTutorialError(if not success_2 then result_2 else "Tutorial start request was rejected")
    end

    task.spawn(function() -- Line: 59
        -- upvalues: Tutorial (upval), u1 (ref), showTutorialError (upval), continueAfterIntro (val), u2 (ref)
        -- upvalues: CutSceneController (upval)
        local success, result = pcall(function() -- Line: 60 -- upvalues: Tutorial (upval)
            return Tutorial:InvokeServer("ShouldPlayIntro")
        end)
        if u1 then
            return
        end
        if not success then
            showTutorialError(result)
            return
        end
        if not result then
            continueAfterIntro()
            return
        end
        u2 = CutSceneController.PlayStoryLocal(0, 1)
        ;(u2:andThen(continueAfterIntro)):catch(function(a1) -- Line: 79 -- upvalues: u1 (upval), showTutorialError (upval)
            if not u1 then
                showTutorialError(a1)
            end
        end)
    end)
    return function() -- Line: 86 -- upvalues: u1 (ref), u2 (ref)
        u1 = true
        if u2 then
            u2:cancel()
        end
    end
end

local function updateTutorialFlow(a1, a2, a3) -- Line: 94
    -- upvalues: startTutorialFlow (val)
    if not a1 then
        return
    end
    if not a2 then
        return (startTutorialFlow(a3))
    end
    task.defer(a3, "Hotbar")
end

return function() -- Line: 107 -- upvalues: useViewEnabled (val), useFFlag (val), React (val), updateTutorialFlow (val)
    local Tutorial, Tutorial_2 = useViewEnabled("Tutorial")
    local u8 = useFFlag("tutorial.disabled", false, {enabled = Tutorial})
    local v1 = {Tutorial, u8}
    React.useEffect(function() -- Line: 111 -- upvalues: updateTutorialFlow (upval), Tutorial (val), u8 (val), Tutorial_2 (val)
        return updateTutorialFlow(Tutorial, u8, Tutorial_2)
    end, v1)
    return nil
end