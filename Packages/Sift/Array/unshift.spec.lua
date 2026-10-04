-- Script path: ReplicatedStorage.Packages.Sift.Array.unshift.spec
-- Decompile time: 1.19 ms

return function() -- Line: 1
    local unshift = require(script.Parent.unshift)
    it("should return a new array with the given value at the beginning", function() -- Line: 4 -- upvalues: unshift (val)
        local v1 = unshift({1, 2, 3}, 4)
        expect(v1).to.be.a("table")
        expect(#v1).to.equal(4)
        expect(v1[1]).to.equal(4)
        expect(v1[2]).to.equal(1)
        expect(v1[3]).to.equal(2)
        expect(v1[4]).to.equal(3)
    end)
    it("should prepend multiple values to the array", function() -- Line: 18 -- upvalues: unshift (val)
        local v1 = unshift({1, 2, 3}, 4, 5, 6)
        expect(v1).to.be.a("table")
        expect(#v1).to.equal(6)
        expect(v1[1]).to.equal(4)
        expect(v1[2]).to.equal(5)
        expect(v1[3]).to.equal(6)
        expect(v1[4]).to.equal(1)
        expect(v1[5]).to.equal(2)
        expect(v1[6]).to.equal(3)
    end)
    it("should not modify the original array", function() -- Line: 34 -- upvalues: unshift (val)
        local v1 = {1, 2, 3}
        unshift(v1, 4)
        expect(v1[1]).to.equal(1)
    end)
end