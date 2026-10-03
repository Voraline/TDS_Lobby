-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.ConsolePatchingDev.roblox
-- Decompile time: 0.87 ms

local console = require(script.Parent:WaitForChild("console"))
local u8 = 0
local u9 = nil
local u10 = nil
local u11 = nil
local u12 = nil
local u13 = nil
local u14 = nil
local u15 = nil

local function u16() end

return {
    disabledLog = u16,
    disableLogs = function() -- Line: 40
        -- upvalues: u8 (ref), u9 (ref), console (val), u10 (ref), u11 (ref), u12 (ref), u13 (ref), u14 (ref), u15 (ref)
        -- upvalues: u16 (val)
        if _G.__DEV__ then
            if u8 == 0 then
                u9 = console.log
                u10 = console.info
                u11 = console.warn
                u12 = console.error
                u13 = console.group
                u14 = console.groupCollapsed
                u15 = console.groupEnd
                console.info = u16
                console.log = u16
                console.warn = u16
                console.error = u16
                console.group = u16
                console.groupCollapsed = u16
                console.groupEnd = u16
            end
            u8 = u8 + 1
        end
    end,
    reenableLogs = function() -- Line: 64
        -- upvalues: u8 (ref), console (val), u9 (ref), u10 (ref), u11 (ref), u12 (ref), u13 (ref), u14 (ref), u15 (ref)
        if _G.__DEV__ then
            u8 = u8 - 1
            if u8 == 0 then
                console.log = u9
                console.info = u10
                console.warn = u11
                console.error = u12
                console.group = u13
                console.groupCollapsed = u14
                console.groupEnd = u15
            end
            if u8 < 0 then
                console.error("disabledDepth fell below zero. This is a bug in React. Please file an issue.")
            end
        end
    end,
}