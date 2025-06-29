# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

This project uses `uv` (a fast Python package manager) and Nix for development. Here are the essential commands:

**Note**: Always run `uv sync` first to ensure dependencies are installed.

### Running the Application
```bash
uv run pai
```

### Testing
```bash
# Run all tests with coverage
runTests  # (Nix command)
# or
uv run pytest --cov=pai --cov-report=term-missing --cov-report=html

# Run a specific test
uv run pytest tests/pai/test_main.py::test_specific_function
```

### Linting and Formatting
```bash
# Run all linting/formatting (Nix command)
runLint

# Or individually:
uv run ruff format src          # Format code
uv run ruff check --fix src     # Lint and auto-fix
pyrefly check                   # Type checking

# Run pre-commit hooks
pre-commit run --all-files
```

### Dependency Management
```bash
uv sync                         # Install all dependencies
uv pip install -e .            # Install package in editable mode
```

### CI/CD
The project includes GitHub Actions workflow that automatically:
- Runs tests and linting on all pull requests
- Runs tests and linting on pushes to main branch
- Uses Nix for consistent CI environment
- Uploads test coverage reports as artifacts

## Architecture Overview

This is an AI-centric Python application with a clean, modular structure:

1. **Main Package**: `src/pai/` - The core application package ("Python AI")
   - Entry point: `src/pai/main.py:main` (accessed via `uv run pai`)
   - The main function logs initialization and returns a boolean status
   
2. **Configuration**: Modern Python project using:
   - `pyproject.toml` for all project metadata and dependencies
   - `uv.lock` for reproducible dependency management
   - Nix flakes for development environment consistency

3. **Key Architectural Patterns**:
   - Pydantic for data validation and settings management
   - Structured logging with structlog
   - Async-first design with httpx for HTTP operations
   - Type safety enforced through Basedpyright and Pyrefly

4. **AI/ML Integration Points**:
   - Anthropic Claude API integration
   - OpenAI API support
   - Hugging Face model hub access
   - Model Context Protocol (MCP) for AI interactions

## Development Environment

This project uses Nix for reproducible development environments. Enter the dev shell with:
```bash
nix develop
```

The environment includes:
- Python 3.13
- All development tools (ruff, pytest, pyrefly, etc.)
- Pre-configured pre-commit hooks
- Environment file support (`.env`, `.test.env`, `.deploy.env`)

## Code Quality Standards

- **Line Length**: 120 characters (Ruff configuration)
- **Type Checking**: Both Basedpyright and Pyrefly must pass
- **Test Coverage**: Maintain test coverage with parallel structure in `tests/`
- **Pre-commit**: All hooks must pass before commits