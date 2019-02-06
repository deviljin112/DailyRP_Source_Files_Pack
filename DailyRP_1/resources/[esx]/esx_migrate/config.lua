Config = {}

-- specifies how many vehicles to migrate at the same time. A high value will cause deadlocks on the database, but will process faster, set to a decent value depending on the hardware
Config.MaxMigrates = 6

-- enable fast mode? ignores wait time to process faster, but can cause overload issues
Config.FastMode = true

-- enable safe mode? writes slower to db which may result in a higher success rate, but will slow down the process a lot! Only enable if you're having issues and can wait 10 minutes.
Config.SafeMode = false

-- looks like this LLLL-NNNN
Config.PlateLetters = 4
Config.PlateNumbers = 4
Config.PlateUseDash = true