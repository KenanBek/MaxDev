#!/bin/sh

# Continuous Redis activity simulation script
# Used to simulate ongoing activity in Redis for testing

echo "Starting Redis activity simulation"

cleanup() {
  echo "Terminating simulation..."
  exit 0
}

# Set up trap to handle termination
trap cleanup TERM INT

# Initialize some keys
redis-cli SET simulation:counter 0
redis-cli DEL simulation:events
redis-cli DEL simulation:expiring_keys
redis-cli HSET simulation:status started_at "$(date +%s)" status "running"

# Continuous loop to generate activity
counter=0
while true; do
  # Get current timestamp
  timestamp=$(date +"%Y-%m-%d %H:%M:%S")
  
  # Increment counter
  counter=$((counter+1))
  redis-cli INCR simulation:counter
  
  # Add to a list with timestamp
  redis-cli LPUSH simulation:events "Event #${counter} at ${timestamp}"
  # Keep list at reasonable size
  redis-cli LTRIM simulation:events 0 99
  
  # Add a key that will expire
  expiry_key="simulation:temp:${counter}"
  redis-cli SET $expiry_key "This key will expire in 10 seconds" EX 10
  redis-cli SADD simulation:expiring_keys $expiry_key
  
  # Update hash values
  redis-cli HSET simulation:hash last_update "${timestamp}" counter "${counter}"
  
  # Publish message to channel
  redis-cli PUBLISH activity-channel "Activity update #${counter} at ${timestamp}"
  
  # Random activity
  case $((counter % 5)) in
    0) redis-cli SADD simulation:set "member-${counter}" ;;
    1) redis-cli ZADD simulation:sorted:scores ${counter} "score-${counter}" ;;
    2) redis-cli SET simulation:latest "Latest value: ${timestamp}" ;;
    3) redis-cli HSET simulation:config setting_${counter} value_${counter} ;;
    4) redis-cli LPUSH simulation:queue "job-${counter}" ;;
  esac
  
  # Sleep for 2 seconds
  sleep 2
done
