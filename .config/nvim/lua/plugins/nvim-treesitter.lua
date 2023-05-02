require('nvim-treesitter.configs').setup({
  -- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
  ensure_installed = {
    'bash',
    'css',
    'dockerfile',
    'elixir',
    'gdscript',
    'gitattributes',
    'gitignore',
    'glsl',
    'go',
    'graphql',
    'hcl',
    'html',
    'javascript',
    'json',
    'json5',
    'lua',
    'make',
    'markdown',
    'prisma',
    'proto',
    'python',
    'rust',
    'scss',
    'sql',
    'svelte',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'yaml',
  },
  highlight = { enable = true },
  indent = { enable = true },
})

vim.filetype.add {
  extension = {
    tf = 'hcl',
    tfvars = 'hcl',
  }
}
