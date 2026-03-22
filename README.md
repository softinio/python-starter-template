[![CI](https://github.com/softinio/python-starter-template/actions/workflows/ci.yml/badge.svg)](https://github.com/softinio/python-starter-template/actions/workflows/ci.yml)

# Python AI Starter Template

A modern GitHub template for starting AI-centric Python projects with batteries included.

## Features

This template provides a complete development environment for AI/ML applications with:

- **AI/ML SDKs**: Pre-configured with Anthropic, OpenAI, Hugging Face, and MCP (Model Context Protocol) SDKs
- **Modern Python tooling**: Uses `poetry` for package management
- **Type safety**: Pyrefly for type checking
- **Code quality**: Black, isort, and Flake8 for formatting and linting
- **HTTP client**: httpx for async HTTP operations
- **Development environment**: Optional Nix flakes for reproducible environments
- **Python 3.13**: Latest Python version support

## Quick Start

### Prerequisites

- Python 3.13+
- [Poetry](https://python-poetry.org/) (Python package manager)
- [Nix](https://nixos.org/download.html) (optional, for development environment)
- [direnv](https://direnv.net/) (optional, for automatic environment activation)

### Setting Up Your Development Environment

#### Option 1: Using Nix (Recommended)

1. Clone this template:
   ```bash
   git clone <your-repo-url>
   cd <your-repo-name>
   ```

2. Set up direnv for automatic environment activation:
   ```bash
   echo "use flake" > .envrc && direnv allow
   ```

3. The Nix environment will automatically provide:
   - Python 3.13
   - All development tools (poetry, black, isort, flake8, pyrefly, etc.)
   - Pre-commit hooks

#### Option 2: Without Nix (You already have Python)

1. Ensure Python 3.13+ is installed
2. Install Poetry:
   ```bash
   pip install poetry
   ```
3. Install dependencies:
   ```bash
   poetry install
   ```

### Development Commands

#### Running the Application
```bash
poetry run pai
```

#### Testing
```bash
# Using Nix command
runTests

# Or directly with poetry
poetry run pytest --cov=pai --cov-report=term-missing --cov-report=html

# Run specific tests
poetry run pytest tests/pai/test_main.py::test_specific_function
```

#### Linting and Formatting
```bash
# Using Nix command
runLint

# Or individually with poetry
poetry run black src        # Format code
poetry run isort src        # Sort imports
poetry run flake8 src       # Lint
poetry run pyrefly check    # Type checking
```

#### Pre-commit Hooks
```bash
pre-commit run --all-files
```

## Configuration

### Environment Variables

The template supports multiple environment files:
- `.env` - Default environment variables
- `.test.env` - Test-specific configuration
- `.deploy.env` - Deployment configuration

### Dependencies

Core dependencies included:
- [`anthropic`](https://docs.anthropic.com/en/api/client-sdks#python) - Claude AI API
- [`openai`](https://platform.openai.com/docs/libraries/python-library) - OpenAI API
- [`huggingface-hub`](https://huggingface.co/docs/huggingface_hub/index) - Access to Hugging Face models
- [`mcp[cli]`](https://modelcontextprotocol.io/docs/python/reference) - Model Context Protocol for AI interactions
- [`httpx`](https://www.python-httpx.org/) - Modern async HTTP client (preferred over requests)
- [`pydantic`](https://docs.pydantic.dev/) & [`pydantic-settings`](https://docs.pydantic.dev/latest/usage/pydantic_settings/) - Data validation and settings
- [`structlog`](https://www.structlog.org/) - Structured logging
- [`tenacity`](https://tenacity.readthedocs.io/) - Retry logic for API calls

## Development Workflow

1. **Make changes** to code in `src/pai/`
2. **Write tests** in `tests/` mirroring the source structure
3. **Run linting** with `runLint` or `poetry run flake8 src`
4. **Run tests** with `runTests` or `poetry run pytest`
5. **Commit** - pre-commit hooks will run automatically

## Adding Dependencies

```bash
# Add a production dependency
poetry add <package-name>

# Add a development dependency
poetry add --group dev <package-name>
```

## Type Checking

This template uses Pyrefly (and Basedpyright) for type checking. Run type checks with:
```bash
pyrefly check
```

## Tips for Development

- Use `httpx` for all HTTP operations (async-first design)
- Store API keys in environment variables or use `.env` files (never commit them)
- Implement proper retry logic with `tenacity` for API calls
- Use `pydantic` models for API request/response validation
- Leverage `structlog` for debugging and logging

## Contributing

**GitHub Issues** are disabled to encourage direct community contribution. When you encounter bugs or documentation issues, please contribute fixes through Pull Requests instead.

**How to contribute:** [Open a PR](https://github.com/softinio/python-starter-template/pulls) with your solution, draft changes, or a test reproducing the issue. We'll collaborate from there to refine and merge improvements.

This approach creates faster fixes while building a stronger, community-driven project where everyone benefits from shared contributions.

## Using AI Help to use or contribute to this project

This project is optimized and setup for you to use [Claude Code](https://www.anthropic.com/claude-code) as your AI programming agent. It is recommended to use Claude Code.


## License

python-starter-template is licensed under the MIT License. See [LICENSE](LICENSE) for details.

## This Template was created by

[Salar Rahmanian](https://www.softinio.com)
