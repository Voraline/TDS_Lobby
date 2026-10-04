-- Script path: ReplicatedStorage.Packages.Sift.Array.is.spec
-- Decompile time: 0.54 ms

return function() -- Line: 1
    local is = require(script.Parent.is)
    it("should return whether the given object is an array", function() -- Line: 4 -- upvalues: is (val)
        expect(is({})).to.equal(false)
        expect(is({1, 2, 3})).to.equal(true)
        expect(is({hello = "world"})).to.equal(false)
        expect(is({1, 2, hello = "world"})).to.equal(false)
        expect(is({1, 2, 3, nil, 5})).to.equal(true)
    end)
end