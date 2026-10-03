-- Script path: ReplicatedStorage.Client.Modules.Input
-- Decompile time: 0.59 ms

local UserInputService = game:GetService("UserInputService")
local v1 = {}
local v2 = {}
v2.__index = v2

function v2.new() end

function v1.Add(a1) end

function v1.Remove(a1) end

local function _wrapFunction(a1) -- Line: 15
    return function(a1_2, a2) -- Line: 16 -- upvalues: a1 (val)
        return not a2 and a1(a1_2)
    end
end

local InputBegan = UserInputService.InputBegan

local function u12(a1) end

InputBegan:Connect(function(a1, a2) -- Line: 16 -- upvalues: u12 (val)
    return not a2 and u12(a1)
end)
local InputEnded = UserInputService.InputEnded

local function u18(a1) end

InputEnded:Connect(function(a1, a2) -- Line: 16 -- upvalues: u18 (val)
    return not a2 and u18(a1)
end)
return v1