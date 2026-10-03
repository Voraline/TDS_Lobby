-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.PromptModal.PromptModal.story
-- Decompile time: 0.90 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Parent = require(script.Parent)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement

local function App() -- Line: 9 -- upvalues: React (val), createElement (val), Parent (val)
    local v1, u4 = React.useState(true)
    return createElement(Parent, {
        icon = "rbxassetid://13691899952",
        subject = "Mercenary Base Refund",
        description = "You are eligible for a refund of your Mercenary Base. Would you like to proceed?",
        visible = v1,
        stats = {{key = "coins", icon = "rbxassetid://9245490334", value = "2,500"}},
        actions = {
            {
                key = "yes",
                text = "Yes",
                color = Color3.fromRGB(10, 220, 80),
                onClick = function() -- Line: 29 -- upvalues: u4 (val)
                    u4(false)
                    task.delay(1, function() -- Line: 31 -- upvalues: u4 (upval)
                        u4(true)
                    end)
                end,
            },
            {
                key = "no",
                text = "No",
                color = Color3.fromRGB(39, 39, 39),
                onClick = function() -- Line: 40 -- upvalues: u4 (val)
                    u4(false)
                    task.delay(1, function() -- Line: 42 -- upvalues: u4 (upval)
                        u4(true)
                    end)
                end,
            },
        },
    })
end

return function(a1) -- Line: 51 -- upvalues: ReactRoblox (val), createElement (val), App (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(App)))
    return function() -- Line: 55 -- upvalues: u4 (val)
        u4:unmount()
    end
end