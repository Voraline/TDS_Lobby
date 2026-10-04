-- Script path: ReplicatedStorage.Packages.Sift.Array.toSet.spec
-- Decompile time: 0.61 ms

return function() -- Line: 1
    local toSet = require(script.Parent.toSet)
    it("should return a set", function() -- Line: 4 -- upvalues: toSet (val)
        local v1 = toSet({1, 2, 3})
        expect(v1).to.be.a("table")
        expect(v1[1]).to.equal(true)
        expect(v1[2]).to.equal(true)
        expect(v1[3]).to.equal(true)
    end)
    it("should return a set of strings", function() -- Line: 15 -- upvalues: toSet (val)
        local v1 = toSet({"a", "b", "b", "c"})
        expect(v1).to.be.a("table")
        expect(v1.a).to.equal(true)
        expect(v1.b).to.equal(true)
        expect(v1.c).to.equal(true)
    end)
    it("should not modify the original array", function() -- Line: 26 -- upvalues: toSet (val)
        local v1 = {1, 2, 3}
        toSet(v1)
        expect(v1).to.be.a("table")
        expect(#v1).to.equal(3)
        expect(v1[1]).to.equal(1)
        expect(v1[2]).to.equal(2)
        expect(v1[3]).to.equal(3)
    end)
end