-- Script path: ReplicatedStorage.Packages.Sift.Array.splice.spec
-- Decompile time: 0.51 ms

return function() -- Line: 1
    local splice = require(script.Parent.splice)
    it("should insert the given values into the given array", function() -- Line: 4 -- upvalues: splice (val)
        local v1 = splice({1, 2, 3}, 2, 0, 4, 5)
        expect(v1).to.be.a("table")
        expect(#v1).to.equal(3)
        expect(v1[1]).to.equal(1)
        expect(v1[2]).to.equal(4)
        expect(v1[3]).to.equal(5)
    end)
    it("should insert the given values into the given array with a negative index", function() -- Line: 16 -- upvalues: splice (val)
        local v1 = splice({1, 2, 3}, -2, 0, 4, 5)
        expect(v1).to.be.a("table")
        expect(#v1).to.equal(2)
        expect(v1[1]).to.equal(4)
        expect(v1[2]).to.equal(5)
        expect(v1[3]).never.to.be.ok()
    end)
end