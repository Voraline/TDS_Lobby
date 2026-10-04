-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.equals.spec
-- Decompile time: 0.42 ms

return function() -- Line: 1
    local equals = require(script.Parent.equals)
    it("should return true if the dictionaries are equal", function() -- Line: 4 -- upvalues: equals (val)
        expect(equals({hello = "world", goodbye = "world"}, {hello = "world", goodbye = "world"})).to.equal(true)
    end)
    it("should return false if the dictionaries are not equal", function() -- Line: 11 -- upvalues: equals (val)
        expect(equals({hello = "world", goodbye = "world"}, {hello = "world", goodbye = "world2"})).to.equal(false)
    end)
    it("should return false for nested dictionaries", function() -- Line: 18 -- upvalues: equals (val)
        expect(equals({hello = "world", goodbye = {world = "hello"}}, {hello = "world", goodbye = {world = "hello"}})).to.equal(false)
    end)
end