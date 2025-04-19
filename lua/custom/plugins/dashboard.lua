return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'
    local header_art = require 'custom.ascii.doors_of_durin'

    -- Set header
    dashboard.section.header.val = header_art

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button('e', '  New File', '<CMD>ene<BAR>startinsert<CR>'),

      dashboard.button('<leader>pv', '  Project View', '<CMD>Oil --float --preview<CR>'),
      dashboard.button('<leader>sg', '  Search by Grep', '<cmd>Telescope live_grep<CR>'),
      dashboard.button('<leader>sf', '󰱼  Search Files', '<cmd>Telescope find_files<CR>'),

      dashboard.button('l', '󰒲  Lazy', '<CMD>Lazy<CR>'),
      dashboard.button('m', '  Mason', '<CMD>Mason<CR>'),
      dashboard.button('q', '  Quit', '<CMD>qa<CR>'),

      -- dashboard.button('<leader> ee', '  · Toggle file explorer', '<cmd>NvimTreeToggle<CR>'),
      -- dashboard.button('SPC ff', '󰱼  · Find File', '<cmd>Telescope find_files<CR>'),
      -- dashboard.button('SPC fs', '  · Find Word', '<cmd>Telescope live_grep<CR>'),
      -- dashboard.button('SPC wr', '󰁯  · Restore Session For Current Directory', '<cmd>SessionRestore<CR>'),

      -- dashboard.button('f', ' ' .. ' Find file', '<cmd> lua LazyVim.pick()() <cr>'),
      -- dashboard.button('n', ' ' .. ' New file', [[<cmd> ene <BAR> startinsert <cr>]]),
      -- dashboard.button('r', ' ' .. ' Recent files', [[<cmd> lua LazyVim.pick("oldfiles")() <cr>]]),
      -- dashboard.button('g', ' ' .. ' Find text', [[<cmd> lua LazyVim.pick("live_grep")() <cr>]]),
      -- dashboard.button('c', ' ' .. ' Config', '<cmd> lua LazyVim.pick.config_files()() <cr>'),
      -- dashboard.button('s', ' ' .. ' Restore Session', [[<cmd> lua require("persistence").load() <cr>]]),
      -- dashboard.button('x', ' ' .. ' Lazy Extras', '<cmd> LazyExtras <cr>'),
      -- dashboard.button('l', '󰒲 ' .. ' Lazy', '<cmd> Lazy <cr>'),
      -- dashboard.button('q', ' ' .. ' Quit', '<cmd> qa <cr>'),
    }

    dashboard.leader = '<leader>'

    dashboard.section.footer.val = function()
      local quotes = {
        -- General
        '“One ring to rule them all, one ring to find them, one ring to bring them all and in the darkness bind them.” — Gandalf',
        '“This task was appointed to you. And if you do not find a way, no one will.” — Galadriel',
        '“A wizard is never late, Frodo Baggins. Nor is he early. He arrives precisely when he means to.” — Gandalf',

        -- Motivational
        '“Not all those who wander are lost.” — Bilbo Baggins',
        '“All’s well that ends better.” — Hamfast Gamgee',
        '“Even the smallest person can change the course of the future.” — Galadriel',
        '“If more of us valued food and cheer and song above hoarded gold, it would be a merrier world.” — Thorin Oakenshield',
        '“May it be a light to you in dark places, when all other lights go out.” — Galadriel',
        '“But in the end it’s only a passing thing, this shadow; even darkness must pass.” — Sam Gamgee',
        '“All we have to decide is what to do with the time that is given us.” — Gandalf',
        '“I can’t carry it for you, but I can carry you.” — Sam Gamgee',
        '“For even the very wise cannot see all ends.” — Gandalf',

        -- Memes
        '“Fly, you fools!” — Gandalf',
        '“You shall not pass!” — Gandalf',
        '“They have a cave troll.” — Boromir',
        '“Fool of a Took! Throw yourself in the next time, and rid us of your stupidity.” — Gandalf',
        '“Where was Gondor when the Westfold fell?” — Theoden',
        '“They’re taking the Hobbits to Isengard!” — Legolas',
        '“Looks like meat’s back on the menu, boys!” — Ugluk',
        "“I cannot jump the distance, you’ll have to toss me... Don't tell the Elf.” — Gimli",
        '“The Beacons of Minas Tirith! The Beacons are lit! Gondor calls for aid.” — Aragorn',
        '“One does not simply walk into Mordor.” — Boromir',
        '“And my axe!” — Gimli',
        '“All right then, keep your secrets.” — Frodo',
        '“So you have chosen... death.” — Saruman',
        '“I have no memory of this place.” — Gandalf',
      }

      -- Somehow needed for math.random to not be the same value every time
      math.randomseed(os.time())
      return quotes[math.random(#quotes)]
    end

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd [[autocmd FileType alpha setlocal nofoldenable]]
  end,
}
