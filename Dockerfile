FROM python:3.10-slim
WORKDIR /app
COPY pyproject.toml .

RUN apt-get update && apt-get install -y \
    xvfb \
    && rm -rf /var/lib/apt/lists/*

ENV POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_IN_PROJECT=1 \
    POETRY_VIRTUALENVS_CREATE=1 \
    POETRY_CACHE_DIR=/tmp/poetry_cache

RUN pip install poetry  
RUN poetry install --without dev && rm -rf $POETRY_CACHE_DIR
RUN poetry run playwright install
RUN poetry run playwright install-deps
COPY . .
#ARG CONFIG_FILE=/app/config/config.ini
#COPY ${CONFIG_FILE} /app/config/config.ini
ENV VFS_BOT_CONFIG_PATH=/app/config/config.ini
RUN chmod +x /app/.venv/lib/python3.10/site-packages/undetected_playwright/driver/playwright.sh
RUN chmod +x /app/.venv/lib/python3.10/site-packages/undetected_playwright/driver/node

CMD ["sh", "-c", "xvfb-run -a --server-args='-screen 0 2048x2048x24' poetry run vfs-appointment-bot -sc AE -dc JP -ap visa_center=Dubai,visa_category=Single,visa_sub_category=General > /dev/stdout 2>/dev/stderr"]
