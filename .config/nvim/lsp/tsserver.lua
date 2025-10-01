return {
  cmd = { 'typescript-language-server', '--stdio' },
  root_markers = { 'tsconfig.json', 'package.json', 'jsconfig.json' },
  filetypes = { 'ts', 'js', 'typescript', 'javascript', 'json' },
  init_options = {
    hostInfo = 'neovim',
    preferences = {
      importModuleSpecifierPreference = 'relative',
    },
  },
  single_file_support = true,
}
