-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.keys.spec
-- Decompile time: 0.29 ms

return function() -- Line: 1
    local keys = require(script.Parent.keys)
    it("should return an array of the keys in the dictionary", function() -- Line: 4 -- upvalues: keys (val)
        local v1 = keys({hello = "roblox", goodbye = "world"})
        expect(v1).to.be.a("table")
        expect(#v1).to.equal(2)
        expect(v1[1]).to.equal("hello")
        expect(v1[2]).to.equal("goodbye")
    end)
end