-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.fromArrays.spec
-- Decompile time: 0.40 ms

return function() -- Line: 1
    local fromArrays = require(script.Parent.fromArrays)
    it("should return a dictionary composed of the given keys and values", function() -- Line: 4 -- upvalues: fromArrays (val)
        local v1 = fromArrays({"hello", "goodbye"}, {"roblox", "world"})
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal("roblox")
        expect(v1.goodbye).to.equal("world")
    end)
end