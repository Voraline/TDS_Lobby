-- Script path: ReplicatedStorage.Packages.Fusion.Instances.Children
-- Decompile time: 1.69 ms

local Parent = script.Parent.Parent
require(Parent.PubTypes)
local logWarn = require(Parent.Logging.logWarn)
local Observer = require(Parent.State.Observer)
local xtypeof = require(Parent.Utility.xtypeof)
return {
    type = "SpecialKey",
    kind = "Children",
    stage = "descendants",
    apply = function(a1, a2, a3, a4) -- Line: 24
        -- upvalues: xtypeof (val), Observer (val), logWarn (val)
        local u4 = {}
        local u5 = {}
        local u6 = {}
        local u7 = {}
        local u8 = false
        local u9 = nil

        local function updateChildren() -- Line: 38
            -- upvalues: u8 (ref), u5 (ref), u4 (ref), u7 (ref), u6 (ref), xtypeof (upval), a3 (val), Observer (upval)
            -- upvalues: u9 (ref), logWarn (upval), a2 (ref)
            local processChild
            u8 = false
            local v1 = u5
            u5 = u4
            u4 = v1
            v1 = u7
            u7 = u6
            u6 = v1
            table.clear(u4)
            table.clear(u6)

            function processChild(a1, a2) -- Line: 46
                -- upvalues: xtypeof (upval), u4 (upval), u5 (upval), a3 (upval), processChild (val), u7 (upval)
                -- upvalues: Observer (upval), u9 (upval), u6 (upval), logWarn (upval)
                local v1, v2
                local v3 = xtypeof(a1)
                if v3 == "Instance" then
                    u4[a1] = true
                    if u5[a1] == nil then
                        a1.Parent = a3.instance
                        return
                    end
                    u5[a1] = nil
                    return
                end
                if v3 == "State" then
                    local v4 = a1:get(false)
                    if v4 ~= nil then
                        processChild(v4, a2)
                    end
                    local v5 = u7[a1]
                    if v5 ~= nil then
                        u7[a1] = nil
                    else
                        v5 = (Observer(a1)):onChange(u9)
                    end
                    u6[a1] = v5
                    return
                end
                if v3 ~= "table" then
                    logWarn("unrecognisedChildType", v3)
                    return
                end
                local v6 = a2
                for k, v in pairs(a1) do
                    v1 = typeof(k)
                    v2 = nil
                    if v1 == "string" then
                        v2 = k
                    elseif v1 == "number" and v6 ~= nil then
                        v2 = v6 .. "_" .. k
                    end
                    processChild(v, v2)
                end
            end

            if a2 ~= nil then
                processChild(a2)
            end
            for k in pairs(u5) do
                k.Parent = nil
            end
            for k2, v in pairs(u7) do
                v()
            end
        end

        function u9() -- Line: 127 -- upvalues: u8 (ref), updateChildren (val)
            if not u8 then
                u8 = true
                task.defer(updateChildren)
            end
        end

        table.insert(a4, function() -- Line: 134 -- upvalues: a2 (ref), updateChildren (val)
            a2 = nil
            updateChildren()
        end)
        updateChildren()
    end,
}