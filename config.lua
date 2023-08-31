Config = {}

Config.Locale = 'en' -- The language things will be outputted in. Refer to documentation for available languages.
Config.IdentifierType = 'license' -- The identifier that will be stored and used to fetch data from in DB. You can use things such as steam, discord, etc. (Refer to documentation to potential issues for not using license).

-- ------------------------------------------------------------------------
-- ------------------------------------------------------------------------

-- For help with adding/modifying new accounts, refer to documentation.

-- ------------------------------------------------------------------------
-- ------------------------------------------------------------------------

Config.Accounts = {
  ['cash'] = {
    StartingAmount = 50000,
    Display = {
      Show = true,
      Position = 1
    }
  },
  ['bank'] = {
    StartingAmount = 50000,
    Display = {
      Show = true,
      Position = 2
    }
  },
  ['dirty_money'] = {
    StartingAmount = 0,
    Dispaly = {
      Show = true,
      Position = 3
    }
  },
}

