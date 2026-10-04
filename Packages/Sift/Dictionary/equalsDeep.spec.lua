-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.equalsDeep.spec
-- Decompile time: 0.57 ms

return function() -- Line: 1
    local equalsDeep = require(script.Parent.equalsDeep)
    it("should return true if the dictionaries are equal", function() -- Line: 4 -- upvalues: equalsDeep (val)
        expect(equalsDeep({hello = "world", goodbye = "world"}, {hello = "world", goodbye = "world"})).to.equal(true)
    end)
    it("should return false if the dictionaries are not equal", function() -- Line: 11 -- upvalues: equalsDeep (val)
        expect(equalsDeep({hello = "world", goodbye = "world"}, {hello = "world", goodbye = "world2"})).to.equal(false)
    end)
    it("should return true for nested dictionaries", function() -- Line: 18 -- upvalues: equalsDeep (val)
        local v1 = {hello = "world", goodbye = {world = "hello"}}
        expect(equalsDeep(v1, {hello = "world", goodbye = {world = "hello"}})).to.equal(true)
        expect(equalsDeep(v1, {hello = "world", goodbye = {world = "world"}})).to.equal(false)
    end)
end