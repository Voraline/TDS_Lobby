-- Script path: ReplicatedStorage.Packages._Index.sleitnick_trove@1.8.0.trove.init.test
-- Decompile time: 4.14 ms

local ServerScriptService = game:GetService("ServerScriptService")
require(ServerScriptService.TestRunner.Test)
return function(a1) -- Line: 5
    local Parent = require(script.Parent)
    a1:Describe("Trove", function() -- Line: 8 -- upvalues: a1 (val), Parent (val)
        local u0 = nil
        a1:BeforeEach(function() -- Line: 11 -- upvalues: u0 (ref), Parent (upval)
            u0 = Parent.new()
        end)
        a1:AfterEach(function() -- Line: 15 -- upvalues: u0 (ref)
            if u0 then
                u0:Destroy()
                u0 = nil
            end
        end)
        a1:Test("should add and clean up roblox instance", function() -- Line: 22 -- upvalues: u0 (ref), a1 (upval)
            local Part = Instance.new("Part")
            Part.Parent = workspace
            u0:Add(Part)
            u0:Destroy()
            a1:Expect(Part.Parent):ToBeNil()
        end)
        a1:Test("should add and clean up roblox connection", function() -- Line: 30 -- upvalues: u0 (ref), a1 (upval)
            local v1 = workspace.Changed:Connect(function() end)
            u0:Add(v1)
            u0:Destroy()
            ;(a1:Expect(v1.Connected)):ToBe(false)
        end)
        a1:Test("should add and clean up a table with a destroy method", function() -- Line: 37 -- upvalues: u0 (ref), a1 (upval)
            local v1 = {
                Destroyed = false,
                Destroy = function(self) -- Line: 39
                    self.Destroyed = true
                end,
            }
            u0:Add(v1)
            u0:Destroy()
            ;(a1:Expect(v1.Destroyed)):ToBe(true)
        end)
        a1:Test("should add and clean up a table with a disconnect method", function() -- Line: 47 -- upvalues: u0 (ref), a1 (upval)
            local v1 = {
                Connected = true,
                Disconnect = function(self) -- Line: 49
                    self.Connected = false
                end,
            }
            u0:Add(v1)
            u0:Destroy()
            ;(a1:Expect(v1.Connected)):ToBe(false)
        end)
        a1:Test("should add and clean up a function", function() -- Line: 57 -- upvalues: u0 (ref), a1 (upval)
            local u0_2 = false
            u0:Add(function() -- Line: 59 -- upvalues: u0_2 (ref)
                u0_2 = true
            end)
            u0:Destroy()
            local v1 = u0_2
            ;(a1:Expect(v1)):ToBe(true)
        end)
        a1:Test("should allow a custom cleanup method", function() -- Line: 66 -- upvalues: u0 (ref), a1 (upval)
            local v1 = {
                Cleaned = false,
                Cleanup = function(a1) -- Line: 68
                    a1.Cleaned = true
                end,
            }
            u0:Add(v1, "Cleanup")
            u0:Destroy()
            ;(a1:Expect(v1.Cleaned)):ToBe(true)
        end)
        a1:Test("should return the object passed to add", function() -- Line: 76 -- upvalues: u0 (ref), a1 (upval)
            local Part = Instance.new("Part")
            local v1 = u0:Add(Part)
            ;(a1:Expect(Part)):ToBe(v1)
            u0:Destroy()
        end)
        a1:Test("should fail to add object without proper cleanup method", function() -- Line: 83 -- upvalues: a1 (upval), u0 (ref)
            local u0_2 = {}
            a1:Expect(function() -- Line: 85 -- upvalues: u0 (upval), u0_2 (val)
                u0:Add(u0_2)
            end):ToThrow()
        end)
        a1:Test("should construct an object and add it", function() -- Line: 90 -- upvalues: u0 (ref), a1 (upval)
            local u0_2 = {}
            u0_2.__index = u0_2

            function u0_2.new(a1) -- Line: 93 -- upvalues: u0_2 (val)
                local v1 = setmetatable({}, u0_2)
                v1._msg = a1
                v1._destroyed = false
                return v1
            end

            function u0_2:Destroy() -- Line: 99
                self._destroyed = true
            end

            local v1 = u0:Construct(u0_2, "abc")
            ;(a1:Expect((typeof(v1)))):ToBe("table")
            ;(a1:Expect((getmetatable(v1)))):ToBe(u0_2)
            ;(a1:Expect(v1._msg)):ToBe("abc")
            ;(a1:Expect(v1._destroyed)):ToBe(false)
            u0:Destroy()
            ;(a1:Expect(v1._destroyed)):ToBe(true)
        end)
        a1:Test("should connect to a signal", function() -- Line: 112 -- upvalues: u0 (ref), a1 (upval)
            local v1 = u0:Connect(workspace.Changed, function() end)
            ;(a1:Expect((typeof(v1)))):ToBe("RBXScriptConnection")
            ;(a1:Expect(v1.Connected)):ToBe(true)
            u0:Destroy()
            ;(a1:Expect(v1.Connected)):ToBe(false)
        end)
        a1:Test("should remove an object", function() -- Line: 120 -- upvalues: u0 (ref), a1 (upval)
            local v1 = u0:Connect(workspace.Changed, function() end)
            ;(a1:Expect((u0:Remove(v1)))):ToBe(true)
            ;(a1:Expect(v1.Connected)):ToBe(false)
        end)
        a1:Test("should not remove an object not in the trove", function() -- Line: 126 -- upvalues: a1 (upval), u0 (ref)
            local v1 = workspace.Changed:Connect(function() end)
            ;(a1:Expect((u0:Remove(v1)))):ToBe(false)
            ;(a1:Expect(v1.Connected)):ToBe(true)
            v1:Disconnect()
        end)
        a1:Test("should attach to instance", function() -- Line: 133 -- upvalues: u0 (ref), a1 (upval)
            local Part = Instance.new("Part")
            Part.Parent = workspace
            local v1 = u0:AttachToInstance(Part)
            ;(a1:Expect(v1.Connected)):ToBe(true)
            Part:Destroy()
            ;(a1:Expect(v1.Connected)):ToBe(false)
        end)
        a1:Test("should fail to attach to instance not in hierarchy", function() -- Line: 142 -- upvalues: a1 (upval), u0 (ref)
            local Part = Instance.new("Part")
            a1:Expect(function() -- Line: 144 -- upvalues: u0 (upval), Part (val)
                u0:AttachToInstance(Part)
            end):ToThrow()
        end)
        a1:Test("should extend itself", function() -- Line: 149 -- upvalues: u0 (ref), a1 (upval)
            local v1 = u0:Extend()
            local u4 = false
            v1:Add(function() -- Line: 152 -- upvalues: u4 (ref)
                u4 = true
            end)
            ;(a1:Expect((typeof(v1)))):ToBe("table")
            local v2 = a1:Expect((getmetatable(v1)))
            local v3 = u0
            v2:ToBe((getmetatable(v3)))
            u0:Clean()
            local v4 = u4
            ;(a1:Expect(v4)):ToBe(true)
        end)
        a1:Test("should clone an instance", function() -- Line: 161 -- upvalues: u0 (ref), a1 (upval)
            local v1 = u0:Construct(Instance.new, "Part")
            v1.Name = "TroveCloneTest"
            local v2 = u0:Clone(v1)
            ;(a1:Expect((typeof(v2)))):ToBe("Instance")
            a1:Expect(v2):Not():ToBe(v1)
            ;(a1:Expect(v2.Name)):ToBe("TroveCloneTest")
            ;(a1:Expect(v1.Name)):ToBe(v2.Name)
        end)
        a1:Test("should clean up a thread", function() -- Line: 172 -- upvalues: u0 (ref), a1 (upval)
            local v1 = coroutine.create(function() end)
            u0:Add(v1)
            ;(a1:Expect((coroutine.status(v1)))):ToBe("suspended")
            u0:Clean()
            ;(a1:Expect((coroutine.status(v1)))):ToBe("dead")
        end)
        a1:Test("should not allow objects added during cleanup", function() -- Line: 180 -- upvalues: u0 (ref), a1 (upval)
            local u0_2 = false
            u0:Add(function() -- Line: 182 -- upvalues: u0 (upval), u0_2 (ref)
                u0:Add(function() end)
                u0_2 = true
            end)
            u0:Clean()
            local v1 = u0_2
            ;(a1:Expect(v1)):ToBe(false)
        end)
        a1:Test("should not allow objects to be removed during cleanup", function() -- Line: 191 -- upvalues: u0 (ref), a1 (upval)
            local function u0_2() end

            local u1 = false
            u0:Add(u0_2)
            u0:Add(function() -- Line: 195 -- upvalues: u0 (upval), u0_2 (val), u1 (ref)
                u0:Remove(u0_2)
                u1 = true
            end)
            local v1 = u1
            ;(a1:Expect(v1)):ToBe(false)
        end)
    end)
end