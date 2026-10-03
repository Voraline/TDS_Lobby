-- Script path: ReplicatedStorage.Packages.Sift.Set.has.spec
-- Decompile time: 0.24 ms

return function() -- Line: 1
    local has = require(script.Parent.has)
    it("should check if a value is in a set", function() -- Line: 4 -- upvalues: has (val)
        local v1 = {hello = true}
        expect(has(v1, "hello")).to.equal(true)
        expect(has(v1, "world")).to.equal(false)
    end)
end