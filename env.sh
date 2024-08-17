#!/bin/bash

# Default Configuration
export VFS_INTERVAL=1800

# Browser Configuration
export VFS_BROWSER="chromium"
export VFS_HEADLESS=false

# Notification Configuration; comma seperated list
export VFS_CHANNELS="discord"

# VFS Credential
export VFS_EMAIL="***REMOVED***"
export VFS_PASSWORD="***REMOVED***"

# Discord Configuration
export DISCORD_URL="https://discord.com/api/webhooks/1273733818439700531/4xYoczIYBbGpdpSIpxgY1ikQ-IRLYLMqqbVSHb4-tyyvWZBUzsTYEibBVM4wck897J3D"
export DISCORD_USERNAME="VFS Bot"

# Telegram Configuration
export TELEGRAM_CHAT_ID="your_telegram_chat_id_here"
export TELEGRAM_PARSE_MODE="your_telegram_parse_mode_here"
export TELEGRAM_BOT_TOKEN="your_telegram_bot_token_here"

# Twilio Configuration
export TWILIO_URL="your_twilio_url_here"
export TWILIO_AUTH_TOKEN="your_twilio_auth_token_here"
export TWILIO_ACCOUNT_SID="your_twilio_account_sid_here"
export TWILIO_SMS_ENABLED=true
export TWILIO_CALL_ENABLED=false
export TWILIO_TO_NUM="your_twilio_to_number_here"
export TWILIO_FROM_NUM="your_twilio_from_number_here"

# Email Notification Configuration
export VFS_NOTIF_EMAIL="your_email_here"
export VFS_NOTIF_PASSWORD="your_email_password_here"
