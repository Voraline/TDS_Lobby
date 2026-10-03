-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberWorkInProgress
-- Decompile time: 0.27 ms

local ReactFiberLane = require(script.Parent:WaitForChild("ReactFiberLane"))
local NoLanes = ReactFiberLane.NoLanes
local mergeLanes = ReactFiberLane.mergeLanes
return {
    workInProgressRootSkippedLanes = function(a1) -- Line: 24 -- upvalues: NoLanes (ref)
        if a1 == nil then
            return NoLanes
        end
        return a1
    end,
    markSkippedUpdateLanes = function(a1) -- Line: 34 -- upvalues: NoLanes (ref), mergeLanes (val)
        NoLanes = mergeLanes(a1, NoLanes)
    end,
}