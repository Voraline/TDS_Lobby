-- Script path: ReplicatedStorage.Shared.Modules.Rank
-- Decompile time: 0.81 ms

local u0 = {
    {"Bronze I", 5305805804},
    {"Bronze II", 5305809436},
    {"Bronze III", 5305811472},
    {"Bronze IV", 5305813433},
    {"Bronze V", 5305814607},
    {"Bronze VI", 5305816945},
    {"Bronze VII", 5305819370},
    {"Bronze VIII", 5305821136},
    {"Bronze IX", 5305823712},
    {"Silver I", 5305826591},
    {"Silver II", 5305828450},
    {"Silver III", 5305829439},
    {"Silver IV", 5305830610},
    {"Silver V", 5305831439},
    {"Silver VI", 5305832554},
    {"Silver VII", 5305833389},
    {"Silver VIII", 5305834251},
    {"Silver IX", 5305835602},
    {"Gold I", 5305837660},
    {"Gold II", 5305838690},
    {"Gold III", 5305839381},
    {"Gold IV", 5305840240},
    {"Gold V", 5305841097},
    {"Gold VI", 5305842052},
    {"Gold VII", 5305842826},
    {"Gold VIII", 5305843994},
    {"Gold IX", 5305845021},
}
return function(a1) -- Line: 33 -- upvalues: u0 (val)
    return u0[math.clamp(math.floor(a1 / 5), 1, #u0)]
end