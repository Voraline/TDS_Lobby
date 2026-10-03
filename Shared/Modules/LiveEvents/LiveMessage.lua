-- Script path: ReplicatedStorage.Shared.Modules.LiveEvents.LiveMessage
-- Decompile time: 0.40 ms

local u0 = {MaxLength = 180}

function u0.validate(a1) -- Line: 5 -- upvalues: u0 (val)
    if type(a1) == "string" and string.find(a1, "%S") then
        local v1 = utf8.len(a1)
        if not v1 then
            return "Enter a valid text message."
        end
        if u0.MaxLength < v1 then
            return (("Keep the message within %* characters."):format(u0.MaxLength))
        end
        return nil
    end
    return "Enter a message."
end

return u0