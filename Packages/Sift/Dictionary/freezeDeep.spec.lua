-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.freezeDeep.spec
-- Decompile time: 0.70 ms

return function() -- Line: 1
    local freezeDeep = require(script.Parent.freezeDeep)
    it("should return a read-only copy of the given dictionary", function() -- Line: 4 -- upvalues: freezeDeep (val)
        local v1 = {hello = "roblox", goodbye = "world"}
        local u3 = freezeDeep(v1)
        expect(u3).to.be.a("table")
        expect(u3).never.to.equal(v1)
        expect(u3.hello).to.equal("roblox")
        expect(u3.goodbye).to.equal("world")
        expect(function() -- Line: 15 -- upvalues: u3 (val)
            u3.hello = "world"
        end).to.throw()
    end)
    it("should freeze nested dictionaries", function() -- Line: 20 -- upvalues: freezeDeep (val)
        local v1 = {hello = "roblox", goodbye = {world = "goodbye"}}
        local u4 = freezeDeep(v1)
        expect(u4).to.be.a("table")
        expect(u4).never.to.equal(v1)
        expect(u4.hello).to.equal("roblox")
        expect(u4.goodbye).to.be.a("table")
        expect(u4.goodbye).never.to.equal(v1.goodbye)
        expect(u4.goodbye.world).to.equal("goodbye")
        expect(function() -- Line: 35 -- upvalues: u4 (val)
            u4.hello = "world"
        end).to.throw()
        expect(function() -- Line: 39 -- upvalues: u4 (val)
            u4.goodbye.world = "hello"
        end).to.throw()
    end)
end