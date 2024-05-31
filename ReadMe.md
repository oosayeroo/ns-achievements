Discord - https://discord.gg/3WYz3zaqG5

run `achievements.sql` file

Configure the Config to whatever you want to use. 

This shoudl be customised to your own server

event to open achievements menu

client side event
```lua
'ns-achievements:OpenAchievements'
```

exports and events to add achievements
# AddValue = adds a specific value onto a specific achievement
```lua
-- event example from client side
local code = "ACH001"
local value = 1
TriggerServerEvent('ns-achievements:AddValue',code,value)

-- export example / server side
local code = "ACH001"
local value = 1
local src = source --you must send the source through in the exports
exports['ns-achievements']:AddValue(src,code,value)

```
# AddGroupValue = adds an amount onto every achievement that shares that group
```lua
--event example from client side
local group = "zombiekills"
local value = 1
TriggerServerEvent('ns-achievements:AddGroupValue',group,value)

-- export example / server side
local group = "zombiekills"
local value = 1
local src = source
exports['ns-achievements']:AddGroupValue(src,group,value)

```