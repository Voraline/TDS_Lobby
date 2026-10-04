-- Script path: ReplicatedStorage.Packages.Sift.Set.copy.spec
-- Decompile time: 0.30 ms

return function() -- Line: 1
    local copy = require(script.Parent.copy)
    it("should copy a set", function() -- Line: 4 -- upvalues: copy (val)
        local v1 = {hello = true}
        local v2 = copy(v1)
        expect(v2).to.be.a("table")
        expect(v2).never.to.equal(v1)
        expect(v2.hello).to.equal(true)
    end)
end