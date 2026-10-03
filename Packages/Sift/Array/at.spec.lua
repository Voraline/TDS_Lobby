-- Script path: ReplicatedStorage.Packages.Sift.Array.at.spec
-- Decompile time: 0.54 ms

return function() -- Line: 1
    local at = require(script.Parent.at)
    it("should return the value at the given index", function() -- Line: 4 -- upvalues: at (val)
        local v1 = {1, 2, 3}
        expect(at(v1, 1)).to.equal(1)
        expect(at(v1, 2)).to.equal(2)
        expect(at(v1, 3)).to.equal(3)
    end)
    it("should return nil if the index is out of bounds", function() -- Line: 12 -- upvalues: at (val)
        expect(at({1, 2, 3}, 4)).to.equal(nil)
    end)
    it("should return from the end if the index is negative (or 0)", function() -- Line: 18 -- upvalues: at (val)
        local v1 = {1, 2, 3}
        expect(at(v1, 0)).to.equal(3)
        expect(at(v1, -1)).to.equal(2)
        expect(at(v1, -2)).to.equal(1)
    end)
end