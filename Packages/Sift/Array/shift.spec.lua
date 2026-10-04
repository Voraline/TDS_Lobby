-- Script path: ReplicatedStorage.Packages.Sift.Array.shift.spec
-- Decompile time: 0.52 ms

return function() -- Line: 1
    local shift = require(script.Parent.shift)
    it("should remove the first item from the array", function() -- Line: 4 -- upvalues: shift (val)
        local v1 = shift({1, 2, 3})
        expect(v1[1]).to.equal(2)
        expect(v1[2]).to.equal(3)
        expect(v1[3]).never.to.be.ok()
    end)
    it("should not modify the original array", function() -- Line: 14 -- upvalues: shift (val)
        local v1 = {1, 2, 3}
        shift(v1)
        expect(v1[1]).to.equal(1)
    end)
    it("should shift given a number of items to remove", function() -- Line: 22 -- upvalues: shift (val)
        local v1 = shift({1, 2, 3, 4, 5}, 2)
        expect(v1[1]).to.equal(3)
        expect(v1[2]).to.equal(4)
        expect(v1[3]).to.equal(5)
        expect(v1[4]).never.to.be.ok()
    end)
end