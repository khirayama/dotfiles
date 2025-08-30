local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "tomasiser/vim-code-dark" },
  { "airblade/vim-gitgutter" },
  { "tomtom/tcomment_vim" },
  { "junegunn/fzf", build = "fzf#install" },
  { "junegunn/fzf.vim" },
  { "prabirshrestha/asyncomplete.vim" },
  { "prabirshrestha/vim-lsp" },
  { "mattn/vim-lsp-settings" },
  { "prabirshrestha/asyncomplete-lsp.vim" },
  { "prettier/vim-prettier", build = "npm install --frozen-lockfile --production" },
  { "github/copilot.vim" },
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    lazy = false,
    keys = {
      { "<C-a>", nil, desc = "AI/Claude Code" },
      { "<C-a>c", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<C-a>f", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<C-a>r", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<C-a>C", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<C-a>b", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      { "<C-a>s", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      {
        "<C-a>s",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil" },
      },
      -- Diff management
      { "<C-a>a", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<C-a>d", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
})

-- 基本設定
vim.opt.number = true
vim.opt.wrap = false
vim.opt.clipboard:append("unnamed")
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.errorbells = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.laststatus = 2
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 12
vim.opt.splitright = true
vim.opt.updatetime = 600000
vim.opt.completeopt = { "menuone", "noinsert", "noselect", "preview" }

-- キーマッピング
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-n>", ":vertical resize +5<CR>")
vim.keymap.set("n", "<C-m>", ":vertical resize -5<CR>")

-- カラースキーム
vim.cmd.colorscheme("codedark")

-- ファイルタイプ
vim.cmd([[filetype plugin indent on]])

-- fzf 関連設定
vim.g.fzf_preview_window = { "up:50%", "ctrl-/" }
vim.g.fzf_action = { ["ctrl-a"] = "vsplit" }
vim.api.nvim_create_user_command("GGrep", function(opts)
  vim.fn["fzf#vim#grep"]("git grep --line-number " .. vim.fn.shellescape(opts.args), 0)
end, { nargs = "*", bang = true })

function _G.DispatchFilesOrGFiles()
  local opts = { options = { "--preview-window=up:50%" } }
  if vim.fn.isdirectory(".git") == 1 or vim.fn.isdirectory("../.git") == 1 or vim.fn.filereadable(".gitignore") == 1 then
    vim.fn["fzf#vim#gitfiles"]("", vim.fn["fzf#vim#with_preview"](opts), 1)
  else
    vim.fn["fzf#vim#files"](vim.fn.getcwd(), vim.fn["fzf#vim#with_preview"](opts), 1)
  end
end
vim.keymap.set("n", "<C-u>", ":lua DispatchFilesOrGFiles()<CR>")

-- asyncomplete 設定
vim.api.nvim_set_keymap("i", "<Tab>", "pumvisible() ? '<C-n>' : '<Tab>'", { expr = true, noremap = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", "pumvisible() ? '<C-p>' : '<S-Tab>'", { expr = true, noremap = true })
vim.g.asyncomplete_auto_completeopt = 0
vim.g.asyncomplete_popup_delay = 200

-- LSP 関連
vim.g.lsp_diagnostics_float_cursor = 1
vim.g.lsp_diagnostics_float_delay = 200
vim.g.lsp_diagnostics_virtual_text_enabled = 0
vim.g.lsp_document_code_action_signs_enabled = 0
vim.keymap.set("n", "<C-]>", ":LspNextDiagnostic<CR>")
vim.keymap.set("n", "<C-[>", ":LspPreviousDiagnostic<CR>")
vim.cmd([[highlight link LspErrorHighlight Error]])
vim.cmd([[highlight link LspWarningHighlight Error]])
vim.cmd([[highlight link LspInformationHighlight Error]])
vim.cmd([[highlight link LspHintHighlight Error]])
vim.g.lsp_diagnostics_signs_error = { text = "❌" }
vim.g.lsp_diagnostics_signs_warning = { text = "⚠️" }
vim.g.lsp_diagnostics_signs_information = { text = "ℹ️" }
vim.g.lsp_diagnostics_signs_hint = { text = "🔈" }

-- prettier
vim.g["prettier#autoformat"] = 1
vim.g["prettier#autoformat_require_pragma"] = 0
vim.g["prettier#filetype_ignore"] = { "markdown" }

-- statusline（簡易版）
vim.opt.statusline = "%f %=%l/%L [%p%%]"

-- Copilot
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "silent! Copilot enable",
})

-- ClaudeCode
vim.env.PATH = vim.env.PATH .. ':' .. vim.env.HOME .. '/.claude/local'
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    local bufname = vim.api.nvim_buf_get_name(0)
    local filetype = vim.bo.filetype

    if string.match(bufname:lower(), "claude") then
      vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', { buffer = 0 })
      vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', { buffer = 0 })
      vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', { buffer = 0 })
      vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', { buffer = 0 })
    end
  end,
})
