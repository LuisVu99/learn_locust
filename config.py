# Locust Configuration File

# Cấu hình mặc định cho các test scenarios
# Có thể override bằng command line arguments

locust_config = {
    # Base configuration
    "host": "http://localhost:8000",
    "users": 10,
    "spawn_rate": 2,
    "run_time": "1m",
    
    # Test scenarios
    "booking_endpoint": "/booking/2",
    
    # Performance thresholds
    "max_response_time_ms": 2000,  # 2 seconds
    "max_failure_rate": 0.05,      # 5%
}
