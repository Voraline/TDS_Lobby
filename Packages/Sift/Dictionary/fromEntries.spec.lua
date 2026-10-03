-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.fromEntries.spec
-- Decompile time: 0.40 ms

return function() -- Line: 1
    local fromEntries = require(script.Parent.fromEntries)
    it("should create a new dictionary from the given key-value pairs", function() -- Line: 4 -- upvalues: fromEntries (val)
        local v1 = fromEntries({{"hello", "roblox"}, {"goodbye", "world"}})
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal("roblox")
        expect(v1.goodbye).to.equal("world")
    end)
end