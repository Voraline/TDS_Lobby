-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.values.spec
-- Decompile time: 0.34 ms

return function() -- Line: 1
    local values = require(script.Parent.values)
    it("should return a list of the values in the dictionary", function() -- Line: 4 -- upvalues: values (val)
        local v1 = values({hello = "roblox", goodbye = "world"})
        expect(v1).to.be.a("table")
        expect(#v1).to.equal(2)
        expect(v1[1]).to.equal("roblox")
        expect(v1[2]).to.equal("world")
    end)
end