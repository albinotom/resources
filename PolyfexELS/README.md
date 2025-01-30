# Polyfex ELS

### No fuss, straight to the point ELS

### [NEW] Out of the box QBCore support!
To enable this, set `Config.Framework` to `qb` in the `config.lua`

## Adding Vehicles
### ELS Vehicle
All vehicle config is defined within `vehicles`, each JSON file should be named the spawncode of the vehicle.

Below can be found a breakdown of the JSON files.

```json
{
  "sirens": {
    Sirens that can be used on the vehicle, reference documented GTA sounds 
    "toneOne": "VEHICLES_HORNS_SIREN_1",
    "toneTwo": "VEHICLES_HORNS_SIREN_2",
    "toneThree": "VEHICLES_HORNS_POLICE_WARNING",
    "toneFour": "VEHICLES_HORNS_AMBULANCE_WARNING"
  },
  "999mode": false, If false, 999mode wont be used when lights are turned on
  "pattern": {
    Light modes patterns the vehicle will use
    "primary": {
      Stages of the cycle, no minimum or maximum, normally 4 or 5
      "01": {
        "duration": "80", Duration of the stage
        "extras": [ List of extras to toggle during this stage
          "01",
          "02"
        ]
      },
      ...
    },
    "secondary": {
      ...
    },
    "tertiary": {
      ...
    }
  }
}
```

### NonELS Vehicle

Same as above, config is slightly different however

```json
{
  "sirens": {
    "toneOne": "VEHICLES_HORNS_SIREN_1",
    "toneTwo": "VEHICLES_HORNS_SIREN_2",
    "toneThree": "VEHICLES_HORNS_POLICE_WARNING",
    "toneFour": "VEHICLES_HORNS_AMBULANCE_WARNING"
  },
  "999mode": true,
  "nonels": true,
  Patterns are not required on NonELS vehicles, however if you wish to use them, they can be defined as below
  "pattern": {
    "primary": [
      "01",
      "02"
    ],
    "secondary": [
      "02"
    ],
    "tertiary": [
      "03"
    ]
  }
}

```

### Custom Sirens

This is the same for ELS and NonELS vehicles.

This resource can support custom sirens, to do this ensure your server is running [wm-serversirens](https://github.com/Walsheyy/WMServerSirens) and is started prior to this resource. 

### If you are using WM-SIRENS
Set `Config.UsingCustomSirens` to `true` in the `config.lua`
<br>
Then, in your vehicle's .json file, set the `customSirensBank` to `DLC_WMSIRENS_SOUNDSET`
<br>
An Example of this can be found below.

Ensure you edit your vehicle's .json which you'd like to enable the custom sirens on.

Ensure you set the `customSirensBank` within the vehicle's .json file
<br>
p.s Recently some reports have been made about syncing of these, form a script view there's nothing extra I can do without effecting performance for the worse, if you have issues like this I would suggest switching to the base game sirens.

```json
{
  "sirens": {
    "toneOne": "SIREN_ALPHA",
    "toneTwo": "SIREN_BRAVO",
    "toneThree": "SIREN_CHARLIE",
    "toneFour": "SIREN_DELTA"
  },
  "customSirensBank": "DLC_WMSIRENS_SOUNDSET",
  "999mode": true,
  "nonels": true
}

```

<hr>

### If you are using another package
In this example we're going to use [LGMods' London Sirens](https://store.lgmods.co.uk/package/5997240)

Your `Config.UsingCustomSirens` should look like this 

```lua
UsingCustomSirens = {
	"DLC_LGMODS\\sirenpack_one",
	"DLC_LGMODS\\sirenpack_two",
	"DLC_LGMODS\\sirenpack_three"
}
```

Then, in your vehicle's .json file, you should said the `customSirensBank` respectfully to what pack you'd like you use, for example `SIRENPACK_ONE_SOUNDSET`

Here is an example vehicle.json

```json
{
  "sirens": {
    "toneOne": "SIREN_ALPHA",
    "toneTwo": "SIREN_BRAVO",
    "toneThree": "SIREN_CHARLIE",
    "toneFour": "SIREN_ECHO"
  },
  "customSirensBank": "SIRENPACK_ONE_SOUNDSET",
  "999mode": true,
  "nonels": true
}
```

<hr>

Technically, this should also allow multiple siren packs to be used in parallel with each other, for example wm-sirens and LG's like below

```lua
UsingCustomSirens = {
	"DLC_LGMODS\\sirenpack_one",
	"DLC_LGMODS\\sirenpack_two",
	"DLC_LGMODS\\sirenpack_three",
    "DLC_WMSIRENS\\SIRENPACK_ONE"
}
```

Note: I have not tested this in anyway and don't give any guarantees that it will work, if you do try this and it works, please let me know!

<hr>

## Vehicle Checks
_If you are using QB Core, I suggest using the in-built support!_
<br>
The checks for the vehicle and notifications can be found within `local.lua`, the current vehicle check is obviously just a placeholder if you're not using a framework. If you wish to improve this I would suggest using the `CEventPedEnteredMyVehicle` game event to track once a player has entered the vehicle removing the loop of `GetVehiclePedIsIn`. See the below references:

- [FiveM Game Event Reference](https://docs.fivem.net/docs/game-references/game-events/)
- [FiveM gameEventTriggered](https://docs.fivem.net/docs/scripting-reference/events/list/gameEventTriggered/)

# Change Log

### 3.1.3
```
    [FIXED] Patched issue stopping lights when returning to vehicle
```

### 3.1.2
```
    [ADDED] Support for multiple addon sirens.
```

### 3.0.2
```
    [FIXED] Fix for controls disabling when not inside vehicle 
```

### 3.0.1
```
    [FIXED] Hot Fix for QB Release 
```

### 3.0.0
```
    [UPDATED] Updated ELS light loop to allow asynconous light changes
    [ADDED] Keybind mappings to local.lua to allow for customisation
    [ADDED] Out-Of-Box QBCore Support
    [ADDED] Allow lights to stay on when engine has turned off (Config.ShutdownWithEngine)
    [ADDED] Non-ELS Primary, Secondary and Tertiary light support
```

### 2.1.0
```
    [ADDED] Ability to use custom sirens from wm-serversirens
```

### 2.0.0
```
    [FIXED] Ability to use siren when outside vehicle
    [ADDED] NonELS vehicle suppport
    [ADDED] Blip siren feature (Default Key R)
    [ADDED] Siren selection feature (See keykinds to map, unset by default)
    [ADDED] Moved more utility functions into local.lua to allow more customisation.  
```

### 1.2.0
```
    [FIXED] Updated tracking loop
    [FIXED] Added local.lua to fxmanifest.lua
    [FIXED] Corrected issue on 999 mode
```

### 1.1.0
```
    [FIXED] Standard vehicle tracking loop
    [ADDED] 999mode audio system
```

### 1.0.0
```
    Inital release
```
