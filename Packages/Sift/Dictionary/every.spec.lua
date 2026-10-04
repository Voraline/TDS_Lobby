-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.every.spec
-- Decompile time: 0.52 ms

return function() -- Line: 1
    local every = require(script.Parent.every)
    it("should return true if all elements match the predicate", function() -- Line: 4 -- upvalues: every (val)
        expect(every({hello = "world", goodbye = "world"}, function(a1) -- Line: 7
            return a1 == "world"
        end)).to.equal(true)
    end)
    it("should return false if any elements do not match the predicate", function() -- Line: 12 -- upvalues: every (val)
        expect(every({hello = "world", goodbye = "world"}, function(a1) -- Line: 15
            return a1 == "hello"
        end)).to.equal(false)
    end)
end