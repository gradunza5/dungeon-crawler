-- some helpful stuff here:
-- https://stackoverflow.com/questions/70017236/table-of-objects-in-lua
--

Action = {label = "default", action = function()
    io.write("default callback")
end};

function Action:create(label, callback)
    local action = {}
    setmetatable(action, self);
    self.__index = self;

    action.label = label;
    action.callback = callback;

    return action;
end
