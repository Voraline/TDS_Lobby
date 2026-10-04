-- Script path: ReplicatedStorage.Packages.Sift.Array.copy.spec
-- Decompile time: 0.76 ms

return function() -- Line: 1
    local copy = require(script.Parent.copy)
    it("should return a copy of the given array", function() -- Line: 4 -- upvalues: copy (val)
        local v1 = {1, 2, 3}
        local v2 = copy(v1)
        expect(v2).to.be.a("table")
        expect(v2).never.to.equal(v1)
        expect(v2[1]).to.equal(1)
        expect(v2[2]).to.equal(2)
        expect(v2[3]).to.equal(3)
    end)
    it("should not copy nested arrays", function() -- Line: 17 -- upvalues: copy (val)
        local v1 = {1, 2, {3, 4}}
        local v2 = copy(v1)
        expect(v2).to.be.a("table")
        expect(v2).never.to.equal(v1)
        expect(v2[1]).to.equal(1)
        expect(v2[2]).to.equal(2)
        expect(v2[3]).to.equal(v1[3])
    end)
end