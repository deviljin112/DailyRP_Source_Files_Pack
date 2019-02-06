# es_wsync
Simple weather and time sync script for FiveM servers.

### Requirements
- ES
- ESX

### Features
- Dynamic changing weather every 10 minutes (can be (temporarily or permanently) disabled. The weather will only change according to realistic patterns. Some types like snow, xmas, halloween and neutral have been disabled. This means that if the weather is currenlty one of those types, it won't be changed. It will also never change to those types.
- Blackout. Enable/disable this in the config or using /blackout ingame.
- Weather and Time synced across all players.

### Commands
- `/weather <type>` Change the weather type (will fade to the new weather type within 15 seconds).
- `/time <h> <m>` Set the time.

### Triggers (new)
Don't forget to specify the source
- `es_wsync:morning`
- `es_wsync:noon`
- `es_wsync:evening`
- `es_wsync:night`
- `es_wsync:blackout`
- `es_wsync:freeze_time`
- `es_wsync:freeze_weather`