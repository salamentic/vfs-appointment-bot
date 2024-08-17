FROM python:3.10-slim
WORKDIR /app
COPY pyproject.toml .
RUN pip install poetry  
RUN poetry install
RUN playwright install
COPY . .
#ARG CONFIG_FILE=config/config.ini
COPY ${CONFIG_FILE} /app/config/config.ini
ENV VFS_BOT_CONFIG_PATH=/app/config/config.ini
CMD ["vfs-appointment-bot", "-sc", "AE", "-dc", "JP", "-ap", "visa_center=Dubai,visa_category=Single,visa_sub_category=General"]
