# Some info on `self`

From this answer [here](https://devforum.roblox.com/t/what-is-the-self-keyword-in-lua/3051477/6)

self is a keyword generally used in OOP to refer to the current object you are editing. In Luau, it is also used to refer to a table the specified function is in, like @SeasonedRiceFarmer said.

sorry to the person above me about calling methods in different ways I actually typed this out before you replied and didn’t want to get rid of it

There’s two ways of calling a method:

    Dot Notation
    Colon Notation

```lua
local tbl: {({any}) -> ()} = {}

function tbl:funcOne()
    print(self)
end

tbl.funcOne() --> this would output nil as self has not been defined

--these two have the same effect
tbl.funcOne(tbl)
tbl:FuncOne()
```

This is crucial in OOP so each object actually knows what object to reference (it needs to reference itself).

```lua
local Class = {}
Class.__index = Class


function Class:OutputClass()
    print(self.PlayerName)
end

function Class.new(playerName: string)
    local self = setmetatable({}, Class)
    self.PlayerName = playerName

    return self
end

return Class
```

Now, if we required this module, and ran this code:

```lua
local Class = require(path_to_module)

local obj1 = Class.new("bob")
local obj2 = Class.new("emily")

obj1:OutputClass() --> outputs "bob"
obj2:OutputClass() --> outputs "emily"
```

You also mentioned metatables.
I think the best way to think about a metatable is “a table about a table”. It holds information about the table and how it should behave.

This metatable can also include metamethods. These change how certain actions are performed on the table.

For example, the __index metamethod is invoked when an index in a table is not found (it is nil). You can redirect Luau to another table, where the desired method should hopefully be.

```lua
local tbl: {any} = {
    ["keyOne"] = "valueOne",
    ["keyTwo"] = "valueTwo"
}

setmetatable(tbl, {
    ["__index"] = function(self, index)
        warn("Index was not found in table")
        
        return 3 --this will cause any nil indexes to return 3
    end
})

--so, if we did this:
local value = tbl.keyThree

--tbl.keyThree is nil, so Luau is redirected to that function and 3 is returned
print(value) --> outputs 3
```


**This is incredibly helpful for inheritance in OOP.**

```lua
--create a class
local Class = {}

--set up this metamethod for future inheritance
Class.__index = Class

--methods for the class
function Class.method1()
    print("Luau was redirected to this subprogram.")
end

--class constructor
function Class.new()
    local self = setmetatable({}, Class) --note self has inherited __index and it is set to the class

    --assign items specific to this object
    self.Item1 = 3
    self.Item2 = 4

    --try and call the method
    self:method1()

    --this method was nil, so __index was invoked
    --the method was found in Class, so it was run there with the provided parameters. which in this case, was the object itself
end

return Class
```

Please let me know if you need me to explain this further, I don’t know how well I explained it here especially because I had to compress a lot of information.
