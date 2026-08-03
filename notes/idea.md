
Great choice. A text-based RPG is large enough to feel like a real application, but small enough to complete in a weekend or two. The structure below is designed to teach Lua fundamentals while introducing software engineering practices such as modularity, state management, and testing.

# Project Overview

**Game:** Dungeon Explorer

**Goal:** Navigate a dungeon, defeat monsters, collect loot, and reach the final boss.

### Core Learning Objectives

* Lua syntax and idioms
* Tables as data structures
* Modules (`require`)
* File I/O
* Random number generation
* State management
* Basic OOP patterns
* Unit testing

***

# Directory Structure

```text
dungeon-explorer/
│
├── main.lua
│
├── game/
│   ├── game.lua
│   ├── player.lua
│   ├── enemy.lua
│   ├── battle.lua
│   ├── inventory.lua
│   ├── items.lua
│   ├── world.lua
│   └── save.lua
│
├── data/
│   ├── enemies.lua
│   ├── items.lua
│   └── rooms.lua
│
├── tests/
│   ├── test_battle.lua
│   └── test_inventory.lua
│
└── README.md
```

***

# Milestone 1: Game Loop

Create the simplest playable version.

### main.lua

```lua
local Game = require("game.game")

Game:start()
```

### game/game.lua

```lua
local Game = {}

function Game:start()
    print("Welcome to Dungeon Explorer!")

    while true do
        print("\n1. Explore")
        print("2. Status")
        print("3. Quit")

        local choice = io.read()

        if choice == "1" then
            print("You enter a room...")
        elseif choice == "2" then
            print("Status screen")
        elseif choice == "3" then
            break
        end
    end
end

return Game
```

**Concepts learned:**

* Modules
* Loops
* Functions
* Input/output

***

# Milestone 2: Player System

Create a player object.

### player.lua

```lua
local Player = {}

function Player:new()
    local player = {
        name = "Hero",
        hp = 100,
        attack = 10,
        gold = 0
    }

    setmetatable(player, self)
    self.__index = self

    return player
end

return Player
```

Player tracks:

* Health
* Attack power
* Level
* Experience
* Gold

**Concepts learned:**

* Tables
* Metatables
* Object-like design

***

# Milestone 3: Enemies

### data/enemies.lua

```lua
return {
    {
        name = "Goblin",
        hp = 20,
        attack = 4
    },
    {
        name = "Skeleton",
        hp = 30,
        attack = 6
    },
    {
        name = "Orc",
        hp = 50,
        attack = 10
    }
}
```

### enemy.lua

Randomly select enemies from the data file.

```lua
math.random(#enemies)
```

**Concepts learned**

* Data-driven design
* Lists
* Randomization

***

# Milestone 4: Combat Engine

Create a battle module.

### battle.lua

Responsibilities:

```text
Player attacks
Enemy attacks
Victory check
Defeat check
Award XP
```

Example flow:

```text
A wild Goblin appears!

1. Attack
2. Run

You hit Goblin for 10 damage.
Goblin hits you for 4 damage.

Goblin defeated!
+15 XP
+5 Gold
```

Combat formula:

```lua
damage = attack + math.random(1,5)
```

Later you can add:

* Critical hits
* Armor
* Special abilities

***

# Milestone 5: Inventory

### inventory.lua

Data structure:

```lua
inventory = {
    "Potion",
    "Iron Sword"
}
```

Functions:

```lua
addItem()
removeItem()
useItem()
listItems()
```

Items:

### data/items.lua

```lua
return {
    potion = {
        name = "Potion",
        heal = 25
    },

    sword = {
        name = "Iron Sword",
        attack = 5
    }
}
```

***

# Milestone 6: World Exploration

### world.lua

Represent rooms as tables.

```lua
rooms = {
    "Goblin Cave",
    "Ancient Tomb",
    "Treasure Room",
    "Boss Chamber"
}
```

Exploring a room may trigger:

* Enemy encounter
* Treasure chest
* Merchant
* Nothing

Example:

```lua
event = math.random(1,4)
```

***

# Milestone 7: Save and Load

One of the most useful Lua skills.

### save.lua

Save:

```lua
local file = io.open("save.txt", "w")
file:write(player.hp)
file:close()
```

Load:

```lua
local file = io.open("save.txt", "r")
local hp = tonumber(file:read())
file:close()
```

Store:

```text
HP
Level
Experience
Gold
Inventory
```

***

# Milestone 8: Progression System

Add:

### Experience

```text
Goblin = 15 XP
Skeleton = 25 XP
Orc = 50 XP
```

### Level Up

```text
Level 1: 0 XP
Level 2: 100 XP
Level 3: 250 XP
```

Reward:

```text
+10 HP
+2 Attack
```

***

# Milestone 9: Final Boss

Create:

```lua
Dragon
```

Stats:

```lua
HP: 300
Attack: 25
```

Special abilities:

```text
Fire Breath
Tail Swipe
Roar
```

Victory ends the game.

***

# Milestone 10: Refactoring Challenge

After the game works:

### Add Configuration Files

Move all game balance values into:

```text
data/
```

This teaches separation of:

```text
Game Logic
vs
Game Data
```

which is a major professional software design principle.

***

# Stretch Goals

Once you're comfortable with Lua:

### Easy

* Shops
* Equipment slots
* More monsters
* Achievements

### Medium

* Quests
* Dialogue trees
* Procedural dungeon generation

### Advanced

* Turn the game into a graphical RPG using LÖVE (Love2D)
* Add JSON save files
* Networking for co-op play
* AI-controlled companions

***

# Engineering-Oriented Enhancement

Since you lead engineering teams and have experience with CI/CD concepts, I would add one extra feature:

### Event Log System

Create:

```text
logs/game.log
```

Record all actions:

```text
2026-07-30  Attack Goblin for 12
2026-07-30  Goblin defeated
2026-07-30  Gold gained: 5
```

This introduces:

* Logging
* Diagnostics
* Debugging
* Audit trails

Those skills translate directly into real production software.

The complete project typically lands around **1,000 to 2,000 lines of Lua**, which is enough to become genuinely comfortable with the language without becoming overwhelming.
