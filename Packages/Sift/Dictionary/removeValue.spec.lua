-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.removeValue.spec
-- Decompile time: 0.41 ms

return function() -- Line: 1
    local removeValue = require(script.Parent.removeValue)
    it("should return a new dictionary with the given value removed", function() -- Line: 4 -- upvalues: removeValue (val)
        local v1 = removeValue({hello = "roblox", goodbye = "world"}, "world")
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal("roblox")
        expect(v1.goodbye).to.equal(nil)
    end)
    it("should not modify the original dictionary", function() -- Line: 15 -- upvalues: removeValue (val)
        local v1 = {hello = "roblox", goodbye = "world"}
        removeValue(v1, "world")
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal("roblox")
        expect(v1.goodbye).to.equal("world")
    end)
end