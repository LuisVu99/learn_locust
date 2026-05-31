from locust import HttpUser, task, between
import logging

# Setup logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class BookingUser(HttpUser):
    """
    Simulates user behavior for booking system load testing.
    """
    
    wait_time = between(1, 3)

    @task(3)
    def get_booking(self):
        """Get booking information - weighted 3x"""
        with self.client.get(
            "/booking/2",
            catch_response=True
        ) as response:
            if response.status_code == 200:
                response.mark_success()
                logger.info("GET /booking/2 - Success")
            else:
                response.mark_failure(f"Unexpected status: {response.status_code}")
                logger.error(f"GET /booking/2 - Failed with status {response.status_code}")

    @task(1)
    def get_booking_list(self):
        """Get list of bookings - weighted 1x"""
        with self.client.get(
            "/booking",
            catch_response=True
        ) as response:
            if response.status_code == 200:
                response.mark_success()
                logger.info("GET /booking - Success")
            else:
                response.mark_failure(f"Unexpected status: {response.status_code}")
                logger.error(f"GET /booking - Failed with status {response.status_code}")

    def on_start(self):
        """Called when a user is starting"""
        logger.info(f"User {self.client_id} started")

    def on_stop(self):
        """Called when a user is stopping"""
        logger.info(f"User {self.client_id} stopped")