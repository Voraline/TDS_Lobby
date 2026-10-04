-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.set.spec
-- Decompile time: 0.38 ms

return function() -- Line: 1
    local set = require(script.Parent.set)
    it("should return a new dictionary with the given key/value set", function() -- Line: 4 -- upvalues: set (val)
        local v1 = set({hello = "roblox", goodbye = "world"}, "cat", "meow")
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal("roblox")
        expect(v1.goodbye).to.equal("world")
        expect(v1.cat).to.equal("meow")
    end)
    it("should not modify the original dictionary", function() -- Line: 16 -- upvalues: set (val)
        local v1 = {hello = "roblox", goodbye = "world"}
        set(v1, "cat", "woof")
        expect(v1).to.be.a("table")
        expect(v1.cat).to.equal(nil)
    end)
end