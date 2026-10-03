-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.removeKey.spec
-- Decompile time: 0.47 ms

return function() -- Line: 1
    local removeKey = require(script.Parent.removeKey)
    it("should return a new dictionary with the given key removed", function() -- Line: 4 -- upvalues: removeKey (val)
        local v1 = removeKey({hello = "roblox", goodbye = "world"}, "goodbye")
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal("roblox")
        expect(v1.goodbye).to.equal(nil)
    end)
    it("should not modify the original dictionary", function() -- Line: 15 -- upvalues: removeKey (val)
        local v1 = {hello = "roblox", goodbye = "world"}
        removeKey(v1, "goodbye")
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal("roblox")
        expect(v1.goodbye).to.equal("world")
    end)
end