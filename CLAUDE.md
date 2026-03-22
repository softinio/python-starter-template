# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

This project uses `poetry` for package management and Nix for development. Here are the essential commands:

**Note**: Always run `poetry install` first to ensure dependencies are installed.

### Running the Application
```bash
poetry run pai
```

### Testing
```bash
# Run all tests with coverage
runTests  # (Nix command)
# or
poetry run pytest --cov=pai --cov-report=term-missing --cov-report=html

# Run a specific test
poetry run pytest tests/pai/test_main.py::test_specific_function
```

### Linting and Formatting
```bash
# Run all linting/formatting (Nix command)
runLint

# Or individually:
poetry run black src        # Format code
poetry run isort src        # Sort imports
poetry run flake8 src       # Lint
poetry run pyrefly check    # Type checking

# Run pre-commit hooks
poetry run pre-commit run --all-files
```

### Dependency Management
```bash
poetry install              # Install all dependencies
poetry add <package>        # Add a production dependency
poetry add --group dev <package>  # Add a development dependency
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
   - Entry point: `src/pai/main.py:main` (accessed via `poetry run pai`)
   - The main function logs initialization and returns a boolean status
   
2. **Configuration**: Modern Python project using:
   - `pyproject.toml` for all project metadata and dependencies
   - `poetry.lock` for reproducible dependency management
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
- All development tools (black, isort, flake8, pytest, pyrefly, etc.)
- Pre-configured pre-commit hooks
- Environment file support (`.env`, `.test.env`, `.deploy.env`)

## Code Quality Standards

- **Line Length**: 120 characters (black/flake8 configuration)
- **Type Checking**: Pyrefly must pass
- **Test Coverage**: Maintain test coverage with parallel structure in `tests/`
- **Pre-commit**: All hooks must pass before commits