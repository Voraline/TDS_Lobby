-- Script path: ReplicatedStorage.Client.Interfaces.NPCViews.Components.TVStatic.story
-- Decompile time: 1.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ChromaticAberration = require(script.Parent.ChromaticAberration)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local TVStatic = require(script.Parent.TVStatic)

local function render() -- Line: 10
    -- upvalues: ReactFlow (val), React (val), Maid (val), TVStatic (val), ChromaticAberration (val)
    local v1, u7 = ReactFlow.useTween({start = 0, target = 0, info = TweenInfo.new(1)})
    React.useEffect(function() -- Line: 17 -- upvalues: Maid (upval), u7 (val)
        local u2 = Maid.new()
        u2:Mark((task.spawn(function() -- Line: 20 -- upvalues: u7 (upval)
            task.wait(1)
            u7({
                start = 0,
                target = 1,
                info = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            })
            task.wait(5)
            u7({
                target = 0,
                info = TweenInfo.new(4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            })
        end)))
        return function() -- Line: 36 -- upvalues: u2 (val)
            u2:Sweep()
        end
    end, {})
    return React.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}, {
        TVStatic = React.createElement(TVStatic, {enabled = true, windUpTime = 2}),
        chromatic = React.createElement(ChromaticAberration, {
            enabled = true,
            windUpTime = 5,
            amplitude = 6,
            frequency = 2,
            mult = 0.02,
            objects = {workspace.e},
            percent = v1,
        }),
    })
end

return function(a1) -- Line: 62 -- upvalues: ReactRoblox (val), React (val), render (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((React.createElement(render, {})))
    return function() -- Line: 66 -- upvalues: u4 (val)
        u4:unmount()
    end
end