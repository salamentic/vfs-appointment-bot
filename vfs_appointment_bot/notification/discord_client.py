# Adapted from https://gist.github.com/Bilka2/5dd2ca2b6e9f3573e0c2defe5d3031b2
import logging
import requests
from typing import Optional
from vfs_appointment_bot.notification.notification_client import NotificationClient


class DiscordClient(NotificationClient):
    """Concrete implementation of NotificationClient for the Discord channel.

    This class provides functionality for sending notifications through the Discord
    communication platform. It inherits from the abstract `NotificationClient` class
    and implements the required `send_notification` method for Discord-specific
    notification sending logic, including SMS messages and calls (if enabled).
    """

    def __init__(self):
        """
        Initializes the Discord client with configuration data.

        This constructor retrieves configuration settings from the "twilio"
        section of the application configuration and validates them using the
        base class validation logic.
        """
        required_config_keys = [
            "url",
            "username",
        ]
        super().__init__("discord", required_config_keys)

    def send_notification(self, message: str) -> None:
        """
        Sends a notification message through Discord webhook.


        Args:
            message (str): The message content to be sent as a Twilio SMS.
        """
        url: str = self.config.get("url")
        username: Optional[str] = self.config.get("username")

        self.__send_message(message, url, username)

    def __get_data(
            self,
            message: str,
            username: Optional[str] = None,
        ) -> dict[str,str]:
        """
        Generates payload to send to webhook

        Args:
            message (str): The message content to be sent.
            username (str): The username under which the message will be sent.
        """
        username = "VFS Bot" if not username else username
        if "Found" in message:
            message = "@everyone " + message
        data = {
            "content" : message,
            "username" : username,
        }
        return data

    def __send_message(
        self,
        message: str,
        url: str,
        username: str,
    ) -> None:
        """
        Sends a discord message to given webhook url, using a default username 

        Args:
            message (str): The message content to be sent.
        """
        res = requests.post(url, json=self.__get_data(message, username))
        try:
            res.raise_for_status()
        except requests.exceptions.HTTPError as err:
            print(err)
        else:
            logging.info("Message sent successfully!")
