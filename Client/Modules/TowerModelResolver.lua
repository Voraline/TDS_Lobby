-- Script path: ReplicatedStorage.Client.Modules.TowerModelResolver
-- Decompile time: 10.05 ms

local watchFolder
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local u10 = {}
u10.Changed = Signal.new()
local u13 = {}
local u14 = {}
local u15 = {}
local u16 = {}
local u17 = false
local u18 = 0
local u19 = false
local u20 = nil

local function getTowersFolder() -- Line: 19
    local Towers = workspace:FindFirstChild("Towers")
    if Towers and Towers:IsA("Folder") then
        return Towers
    end
    return nil
end

local function normalizeId(a1) -- Line: 24
    if a1 ~= nil then
        return (tostring(a1))
    end
    return nil
end

local function queueChanged() -- Line: 28 -- upvalues: u18 (ref), u19 (ref), u10 (val)
    u18 = u18 + 1
    if u19 then
        return
    end
    u19 = true
    task.defer(function() -- Line: 36 -- upvalues: u19 (upval), u10 (upval), u18 (upval)
        u19 = false
        local v1 = u18
        u10.Changed:Fire(v1)
    end)
end

local function findReplacementModel(a1, a2) -- Line: 42 -- upvalues: u14 (val) -- types: a1: string, a2: userdata
    for i, j in u14 do
        if i ~= a2 and j == a1 and i.Parent ~= nil then
            return i
        end
    end
    return nil
end

local function unregisterModel(a1) -- Line: 52 -- upvalues: u14 (val), u13 (val), u15 (val) -- types: a1: userdata
    local v1
    local v2 = false
    local v3 = u14[a1]
    if v3 then
        u14[a1] = nil
        if u13[v3] == a1 then
            for i, j in u14 do
                if i ~= a1 and j == v3 and i.Parent ~= nil then
                    u13[v3] = i
                    if v1 ~= a1 then
                        v2 = true
                    end
                    v1 = u15[a1]
                    if v1 then
                        v1:Disconnect()
                        u15[a1] = nil
                    end
                    return v2
                end
            end
            u13[v3] = nil
            if v1 ~= a1 then
                v2 = true
            end
        end
    end
    v1 = u15[a1]
    if v1 then
        v1:Disconnect()
        u15[a1] = nil
    end
    return v2
end

local function refreshModel(a1) -- Line: 78
    -- upvalues: u20 (ref), u14 (val), u13 (val), u15 (val)
    local v1, v2, v3
    if u20 then
        v3 = u20
        if a1:IsDescendantOf(v3) then
            v1 = u14[a1]
            local Attribute = a1:GetAttribute("TowerUID")
            v2 = if Attribute == nil then nil else tostring(Attribute)
            if v1 ~= v2 then
                v3 = false
                if v1 and u13[v1] == a1 then
                    for k, n in u14 do
                        if k ~= a1 and n == v1 and k.Parent ~= nil then
                            u13[v1] = k
                            if not v2 then
                                u14[a1] = nil
                                return true
                            end
                            if u13[v2] ~= a1 then
                                v3 = true
                            end
                            u13[v2] = a1
                            u14[a1] = v2
                            return v3
                        end
                    end
                    u13[v1] = nil
                    v3 = true
                end
                if v2 then
                    if u13[v2] ~= a1 then
                        v3 = true
                    end
                    u13[v2] = a1
                    u14[a1] = v2
                    return v3
                end
                u14[a1] = nil
                return v3
            end
            if v2 ~= nil and u13[v2] ~= a1 then
                v3 = false
                if v1 and u13[v1] == a1 then
                    for i, j in u14 do
                        if i ~= a1 and j == v1 and i.Parent ~= nil then
                            u13[v1] = i
                            if not v2 then
                                u14[a1] = nil
                                return true
                            end
                            if u13[v2] ~= a1 then
                                v3 = true
                            end
                            u13[v2] = a1
                            u14[a1] = v2
                            return v3
                        end
                    end
                    u13[v1] = nil
                    v3 = true
                end
                if not v2 then
                    u14[a1] = nil
                    return v3
                end
                if u13[v2] ~= a1 then
                    v3 = true
                end
                u13[v2] = a1
                u14[a1] = v2
                return v3
            end
            return false
        end
    end
    v1 = false
    v2 = u14[a1]
    if v2 then
        u14[a1] = nil
        if u13[v2] == a1 then
            for m, i5 in u14 do
                if m ~= a1 and i5 == v2 and m.Parent ~= nil then
                    u13[v2] = m
                    if v3 ~= a1 then
                        v1 = true
                    end
                    v3 = u15[a1]
                    if v3 then
                        v3:Disconnect()
                        u15[a1] = nil
                    end
                    return v1
                end
            end
            u13[v2] = nil
            if v3 ~= a1 then
                v1 = true
            end
        end
    end
    v3 = u15[a1]
    if v3 then
        v3:Disconnect()
        u15[a1] = nil
    end
    return v1
end

local function registerModel(a1) -- Line: 111
    -- upvalues: u15 (val), refreshModel (val), u18 (ref), u19 (ref), u10 (val)
    if not u15[a1] then
        u15[a1] = ((a1:GetAttributeChangedSignal("TowerUID")):Connect(function() -- Line: 113 -- upvalues: refreshModel (upval), a1 (val), u18 (upval), u19 (upval), u10 (upval)
            if refreshModel(a1) then
                u18 = u18 + 1
                if u19 then
                    return
                end
                u19 = true
                task.defer(function() -- Line: 36 -- upvalues: u19 (upval), u10 (upval), u18 (upval)
                    u19 = false
                    local v1 = u18
                    u10.Changed:Fire(v1)
                end)
            end
        end))
    end
    return (refreshModel(a1))
end

local function registerTree(a1) -- Line: 123
    -- upvalues: u15 (val), refreshModel (val), u18 (ref), u19 (ref), u10 (val)
    local AttributeChangedSignal_2, v1
    local v2 = false
    if a1:IsA("Model") then
        if not u15[a1] then
            u15[a1] = ((a1:GetAttributeChangedSignal("TowerUID")):Connect(function() -- Line: 113 -- upvalues: refreshModel (upval), a1 (val), u18 (upval), u19 (upval), u10 (upval)
                if refreshModel(a1) then
                    u18 = u18 + 1
                    if u19 then
                        return
                    end
                    u19 = true
                    task.defer(function() -- Line: 36 -- upvalues: u19 (upval), u10 (upval), u18 (upval)
                        u19 = false
                        local v1 = u18
                        u10.Changed:Fire(v1)
                    end)
                end
            end))
        end
        v2 = refreshModel(a1) or v2
    end
    for i, j in a1:GetDescendants() do
        if j:IsA("Model") then
            if not u15[j] then
                v1 = u15
                AttributeChangedSignal_2 = j:GetAttributeChangedSignal("TowerUID")
                v1[j] = (AttributeChangedSignal_2:Connect(function() -- Line: 113 -- upvalues: refreshModel (upval), j (val), u18 (upval), u19 (upval), u10 (upval)
                    if refreshModel(j) then
                        u18 = u18 + 1
                        if u19 then
                            return
                        end
                        u19 = true
                        task.defer(function() -- Line: 36 -- upvalues: u19 (upval), u10 (upval), u18 (upval)
                            u19 = false
                            local v1 = u18
                            u10.Changed:Fire(v1)
                        end)
                    end
                end))
            end
            v2 = refreshModel(j) or v2
        end
    end
    return v2
end

local function clearFolderState() -- Line: 139 -- upvalues: u16 (val), u15 (val), u13 (val), u14 (val), u20 (ref)
    for i, j in u16 do
        j:Disconnect()
    end
    table.clear(u16)
    for k, n in u15 do
        n:Disconnect()
    end
    table.clear(u15)
    table.clear(u13)
    table.clear(u14)
    u20 = nil
end

function watchFolder(a1) -- Line: 156
    -- upvalues: u20 (ref), clearFolderState (val), u18 (ref), u19 (ref), u10 (val), u16 (val), u15 (val)
    -- upvalues: refreshModel (val), u14 (val), u13 (val), watchFolder (val), registerTree (val)
    if u20 == a1 then
        return
    end
    clearFolderState()
    u20 = a1
    if not a1 then
        u18 = u18 + 1
        if u19 then
            return
        end
        u19 = true
        task.defer(function() -- Line: 36 -- upvalues: u19 (upval), u10 (upval), u18 (upval)
            u19 = false
            local v1 = u18
            u10.Changed:Fire(v1)
        end)
        return
    end
    table.insert(u16, (a1.DescendantAdded:Connect(function(a1) -- Line: 171 -- upvalues: u15 (upval), refreshModel (upval), u18 (upval), u19 (upval), u10 (upval)
        if a1:IsA("Model") then
            if not u15[a1] then
                u15[a1] = ((a1:GetAttributeChangedSignal("TowerUID")):Connect(function() -- Line: 113 -- upvalues: refreshModel (upval), a1 (val), u18 (upval), u19 (upval), u10 (upval)
                    if refreshModel(a1) then
                        u18 = u18 + 1
                        if u19 then
                            return
                        end
                        u19 = true
                        task.defer(function() -- Line: 36 -- upvalues: u19 (upval), u10 (upval), u18 (upval)
                            u19 = false
                            local v1 = u18
                            u10.Changed:Fire(v1)
                        end)
                    end
                end))
            end
            if refreshModel(a1) then
                u18 = u18 + 1
                if u19 then
                    return
                end
                u19 = true
                task.defer(function() -- Line: 36 -- upvalues: u19 (upval), u10 (upval), u18 (upval)
                    u19 = false
                    local v1 = u18
                    u10.Changed:Fire(v1)
                end)
            end
        end
    end)))
    table.insert(u16, (a1.DescendantRemoving:Connect(function(a1) -- Line: 180 -- upvalues: u14 (upval), u13 (upval), u15 (upval), u18 (upval), u19 (upval), u10 (upval)
        if a1:IsA("Model") then
            local v1
            local v2 = false
            local v3 = u14[a1]
            if v3 then
                u14[a1] = nil
                if u13[v3] == a1 then
                    for i, j in u14 do
                        if i ~= a1 and j == v3 and i.Parent ~= nil then
                            u13[v3] = i
                            if v1 ~= a1 then
                                v2 = true
                            end
                            v1 = u15[a1]
                            if v1 then
                                v1:Disconnect()
                                u15[a1] = nil
                            end
                            if v2 then
                                u18 = u18 + 1
                                if u19 then
                                    return
                                end
                                u19 = true
                                task.defer(function() -- Line: 36 -- upvalues: u19 (upval), u10 (upval), u18 (upval)
                                    u19 = false
                                    local v1 = u18
                                    u10.Changed:Fire(v1)
                                end)
                            end
                            return
                        end
                    end
                    u13[v3] = nil
                    if v1 ~= a1 then
                        v2 = true
                    end
                end
            end
            v1 = u15[a1]
            if v1 then
                v1:Disconnect()
                u15[a1] = nil
            end
            if v2 then
                u18 = u18 + 1
                if u19 then
                    return
                end
                u19 = true
                task.defer(function() -- Line: 36 -- upvalues: u19 (upval), u10 (upval), u18 (upval)
                    u19 = false
                    local v1 = u18
                    u10.Changed:Fire(v1)
                end)
            end
        end
    end)))
    table.insert(u16, ((a1:GetPropertyChangedSignal("Name")):Connect(function() -- Line: 189 -- upvalues: a1 (val), watchFolder (upval)
        if a1.Name ~= "Towers" then
            local v1 = watchFolder
            local Towers = workspace:FindFirstChild("Towers")
            v1(if not Towers then nil else if not Towers:IsA("Folder") then nil else Towers)
        end
    end)))
    table.insert(u16, (a1.AncestryChanged:Connect(function() -- Line: 198 -- upvalues: a1 (val), watchFolder (upval)
        if a1.Parent ~= workspace then
            local v1 = watchFolder
            local Towers = workspace:FindFirstChild("Towers")
            v1(if not Towers then nil else if not Towers:IsA("Folder") then nil else Towers)
        end
    end)))
    registerTree(a1)
    u18 = u18 + 1
    if u19 then
        return
    end
    u19 = true
    task.defer(function() -- Line: 36 -- upvalues: u19 (upval), u10 (upval), u18 (upval)
        u19 = false
        local v1 = u18
        u10.Changed:Fire(v1)
    end)
end

local function start() -- Line: 209
    -- upvalues: u17 (ref), watchFolder (val), u20 (ref), clearFolderState (val), u18 (ref), u19 (ref), u10 (val)
    if u17 then
        return
    end
    u17 = true
    workspace.ChildAdded:Connect(function(a1) -- Line: 216 -- upvalues: watchFolder (upval)
        if a1.Name == "Towers" then
            local v1 = watchFolder
            local Towers = workspace:FindFirstChild("Towers")
            v1(if not Towers then nil else if not Towers:IsA("Folder") then nil else Towers)
        end
    end)
    workspace.ChildRemoved:Connect(function(a1) -- Line: 222 -- upvalues: u20 (upval), clearFolderState (upval), u18 (upval), u19 (upval), u10 (upval)
        if a1 == u20 then
            if u20 == nil then
                return
            end
            clearFolderState()
            u20 = nil
            u18 = u18 + 1
            if u19 then
                return
            end
            u19 = true
            task.defer(function() -- Line: 36 -- upvalues: u19 (upval), u10 (upval), u18 (upval)
                u19 = false
                local v1 = u18
                u10.Changed:Fire(v1)
            end)
        end
    end)
    local v1 = watchFolder
    local Towers = workspace:FindFirstChild("Towers")
    v1(if not Towers then nil else if not Towers:IsA("Folder") then nil else Towers)
end

function u10.getVersion() -- Line: 231 -- upvalues: start (val), u18 (ref)
    start()
    return u18
end

function u10.observe(a1) -- Line: 236 -- upvalues: start (val), u10 (val), u18 (ref) -- types: a1: function
    start()
    local u3 = true
    local u9 = u10.Changed:Connect(function(a1_2) -- Line: 240 -- upvalues: u3 (ref), a1 (val)
        if u3 then
            a1(a1_2)
        end
    end)
    task.defer(function() -- Line: 246 -- upvalues: u3 (ref), a1 (val), u18 (upval)
        if u3 then
            a1(u18)
        end
    end)
    return function() -- Line: 252 -- upvalues: u3 (ref), u9 (val)
        u3 = false
        u9:Disconnect()
    end
end

function u10.getModel(a1) -- Line: 258 -- upvalues: start (val), u13 (val)
    local v1
    start()
    if (if a1 == nil then nil else tostring(a1)) == nil then
        return nil
    end
    return u13[v1]
end

function u10.getTargetPart(a1) -- Line: 269 -- types: a1: userdata?
    if not a1 then
        return nil
    end
    local HumanoidRootPart = a1:FindFirstChild("HumanoidRootPart")
    if HumanoidRootPart and HumanoidRootPart:IsA("BasePart") then
        return HumanoidRootPart
    end
    return a1.PrimaryPart
end

return u10