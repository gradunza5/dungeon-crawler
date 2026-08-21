local Action = {};
Action.__index = Action;

function Action.new(label, callback)
    return {label = label, callback = callback}
end
