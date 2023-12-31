PYTEST=poetry run pytest

install_dev:
	poetry install

install:
	poetry install --no-dev

lint:
	poetry run black -S --check --diff .
	poetry run isort --check-only --diff .
	poetry run flake8 .
	poetry run mypy . --ignore-missing-imports

test: lint
	$(PYTEST)

test_cov:
	# Run tests and prepare coverage report
	$(PYTEST) --cov=./ --cov-report=xml

test_with_warnings:
	# Run tests and show warnings
	$(PYTEST) -W all

poetry_dev:
	# Add default poetry dev dependencies
	poetry add -D black pre-commit isort mypy flake8 pytest pytest-dependency coverage pytest-cov mkdocs-material ipython
