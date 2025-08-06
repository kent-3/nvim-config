# Agent Guidelines for AstroNvim Configuration

## Build/Lint/Test Commands
- **Format Lua**: `stylua .` (uses .stylua.toml config)
- **Lint Lua**: `selene .` (uses selene.toml config)
- **No test framework** - this is a Neovim configuration, not a testable codebase

## Code Style Guidelines
- **Language**: Lua for Neovim configuration
- **Indentation**: 2 spaces (defined in .stylua.toml)
- **Line width**: 120 characters max
- **Quote style**: Auto-prefer double quotes
- **Function calls**: No parentheses when possible (`call_parentheses = "None"`)

## File Structure
- `lua/plugins/` - Individual plugin configurations as LazySpec tables
- `lua/community.lua` - Community plugin imports
- `lua/lazy_setup.lua` - Lazy.nvim setup
- `lua/polish.lua` - Final configuration tweaks

## Naming Conventions
- Plugin files: lowercase with hyphens (e.g., `neo-tree.lua`)
- Return LazySpec tables with proper `@type` annotations
- Use descriptive variable names following Lua conventions

## Error Handling
- Use conditional returns for optional configurations
- Comment disabled features with explanatory comments
- Follow AstroNvim's configuration patterns and documentation