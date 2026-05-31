#!/bin/bash
# Script to run Locust load tests locally

echo "🔧 Locust Load Testing Script"
echo "=============================="
echo ""

# Check if locust is installed
if ! command -v locust &> /dev/null; then
    echo "❌ Locust not found. Installing dependencies..."
    pip install -r requirements.txt
fi

# Get parameters
HOST="${1:-http://localhost:8000}"
USERS="${2:-10}"
SPAWN_RATE="${3:-2}"
RUN_TIME="${4:-1m}"

echo "📊 Configuration:"
echo "  Host: $HOST"
echo "  Users: $USERS"
echo "  Spawn Rate: $SPAWN_RATE"
echo "  Run Time: $RUN_TIME"
echo ""

# Run locust
echo "🚀 Starting load test..."
locust -f locustfile.py \
  --host=$HOST \
  --users=$USERS \
  --spawn-rate=$SPAWN_RATE \
  --run-time=$RUN_TIME \
  --headless \
  --csv=results \
  --csv-prefix=""

echo ""
echo "✅ Test completed!"
echo "📁 Results saved to results_*.csv"
