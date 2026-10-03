-- Script path: ReplicatedStorage.Shared.Modules.Lightning.PartCache.PartCache
-- Decompile time: 3.40 ms

local Table = require(script.Parent:WaitForChild("Table"))
local u8 = {}
u8.__index = u8
u8.__type = "PartCache"
local u14 = CFrame.new(0, 1000000000, 0)

local function assertwarn(a1, a2) -- Line: 53 -- types: a1: boolean, a2: string
    if a1 == false then
        warn(a2)
    end
end

local function MakeFromTemplate(a1, a2) -- Line: 60 -- upvalues: u14 (val) -- types: a1: userdata, a2: userdata
    local v1 = a1:Clone()
    v1.CFrame = u14
    v1.Anchored = true
    v1.Parent = a2
    return v1
end

function u8.new(a1, a2, a3) -- Line: 70
    -- upvalues: u8 (val), Table (val), u14 (val)
    local CurrentCacheParent, Open, insert, v1
    local v2 = a3 or workspace
    assert(a2 > 0, "PrecreatedParts can not be negative!")
    if not (a2 ~= 0) then
        warn("PrecreatedParts is 0! This may have adverse effects when initially using the cache.")
    end
    if a1.Archivable == false then
        warn("The template's Archivable property has been set to false, which prevents it from being cloned. It will temporarily be set to true.")
    end
    local Archivable = a1.Archivable
    a1.Archivable = true
    local v3 = a1:Clone()
    a1.Archivable = Archivable
    local v4 = v3
    local v5 = {
        ExpansionSize = 10,
        MaxParts = 5000,
        Open = {},
        InUse = {},
        CurrentCacheParent = v2,
        Template = v4,
    }
    setmetatable(v5, u8)
    for i = 1, a2 or 5 do
        insert = Table.insert
        Open = v5.Open
        CurrentCacheParent = v5.CurrentCacheParent
        v1 = v4:Clone()
        v1.CFrame = u14
        v1.Anchored = true
        v1.Parent = CurrentCacheParent
        insert(Open, v1)
    end
    v5.Template.Parent = nil
    return v5
end

function u8.GetPart(a1) -- Line: 123 -- upvalues: u8 (val), Table (val)
    local v1 = ("Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"):format(
        "GetPart",
        "PartCache.new"
    )
    assert((getmetatable(a1)) == u8, v1)
    if #a1.Open == 0 then
        if not (a1.MaxParts <= #a1.Open + #a1.InUse) then
            warn("No parts available in the cache! Creating [" .. a1.ExpansionSize .. "] new part instance(s) - this amount can be edited by changing the ExpansionSize property of the PartCache instance... (This cache now contains a grand total of " .. (tostring(#a1.Open + #a1.InUse + a1.ExpansionSize)) .. " parts.)")
            a1:Expand(a1.ExpansionSize)
        else
            warn("Cache at max size! Reusing oldest in-use part...")
            a1:ReturnPart(a1.InUse[1])
        end
    end
    local v2 = a1.Open[#a1.Open]
    Table.remove(a1.Open, #a1.Open)
    Table.insert(a1.InUse, v2)
    return v2
end

function u8:ReturnPart(a2) -- Line: 154
    -- upvalues: u8 (val), Table (val), u14 (val)
    local v1 = ("Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"):format(
        "ReturnPart",
        "PartCache.new"
    )
    assert((getmetatable(self)) == u8, v1)
    local v2 = Table.find(self.InUse, a2)
    if not v2 then
        error("Attempted to return part \"" .. a2.Name .. "\" (" .. (a2:GetFullName()) .. ") to the cache, but it's not in-use! Did you call this on the wrong part?")
        return
    end
    self.InUse[v2] = self.InUse[#self.InUse]
    Table.remove(self.InUse, #self.InUse)
    Table.insert(self.Open, a2)
    a2.CFrame = u14
    a2.Anchored = true
end

function u8.SetCacheParent(a1, a2) -- Line: 179 -- upvalues: u8 (val) -- types: a1: table, a2: userdata
    local v1 = ("Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"):format(
        "SetCacheParent",
        "PartCache.new"
    )
    assert((getmetatable(a1)) == u8, v1)
    assert(
        a2:IsDescendantOf(workspace) or a2 == workspace,
        "Cache parent is not a descendant of Workspace! Parts should be kept where they will remain in the visible world."
    )
    a1.CurrentCacheParent = a2
    local v2 = #a1.Open
    for i = 1, v2 do
        a1.Open[i].Parent = a2
    end
    v2 = #a1.InUse
    for j = 1, v2 do
        a1.InUse[j].Parent = a2
    end
end

function u8:Expand(a2) -- Line: 199 -- upvalues: u8 (val), Table (val), u14 (val) -- types: self: table, a2: number?
    local CurrentCacheParent, Open, Template, insert
    local v1 = ("Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"):format(
        "Expand",
        "PartCache.new"
    )
    assert((getmetatable(self)) == u8, v1)
    local ExpansionSize = if a2 ~= nil then a2 else self.ExpansionSize
    local MaxParts = self.MaxParts
    local v2 = #self.Open
    for i = 1, (math.min(ExpansionSize, MaxParts - (v2 + #self.InUse))) do
        insert = Table.insert
        Open = self.Open
        Template = self.Template
        CurrentCacheParent = self.CurrentCacheParent
        v2 = Template:Clone()
        v2.CFrame = u14
        v2.Anchored = true
        v2.Parent = CurrentCacheParent
        insert(Open, v2)
    end
end

function u8.Dispose(a1) -- Line: 215 -- upvalues: u8 (val)
    local v1 = ("Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"):format(
        "Dispose",
        "PartCache.new"
    )
    assert((getmetatable(a1)) == u8, v1)
    local v2 = #a1.Open
    for i = 1, v2 do
        a1.Open[i]:Destroy()
    end
    v2 = #a1.InUse
    for j = 1, v2 do
        a1.InUse[j]:Destroy()
    end
    a1.Template:Destroy()
    a1.Open = {}
    a1.InUse = {}
    a1.CurrentCacheParent = nil
    a1.GetPart = nil
    a1.ReturnPart = nil
    a1.SetCacheParent = nil
    a1.Expand = nil
    a1.Dispose = nil
end

return u8