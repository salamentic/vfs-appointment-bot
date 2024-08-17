FROM python:3.10-slim
WORKDIR /app
COPY pyproject.toml .

ENV POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_IN_PROJECT=1 \
    POETRY_VIRTUALENVS_CREATE=1 \
    POETRY_CACHE_DIR=/tmp/poetry_cache

RUN pip install poetry  
RUN poetry install --without dev && rm -rf $POETRY_CACHE_DIR
RUN poetry run playwright install
COPY . .
#ARG CONFIG_FILE=/app/config/config.ini
#COPY ${CONFIG_FILE} /app/config/config.ini
ENV VFS_BOT_CONFIG_PATH=/app/config/config.ini
CMD ["python3", "-m", "vfs-appointment-bot", "-sc", "AE", "-dc", "JP", "-ap", "visa_center=Dubai,visa_category=Single,visa_sub_category=General"]
