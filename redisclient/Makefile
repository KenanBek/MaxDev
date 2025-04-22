.PHONY: start run stop clean setup load-test-data help

# Default Redis port
PORT ?= 6379

help:
	@echo "Redis Client Testing Environment"
	@echo "--------------------------------"
	@echo "make start    - Start Redis server and load sample data"
	@echo "make run      - Start continuous data simulation"
	@echo "make stop     - Stop Redis server and simulation"
	@echo "make clean    - Remove all test data and stop the server"
	@echo "make PORT=xxxx start - Start with custom port (default: 6379)"

setup:
	@mkdir -p data

start: setup
	@echo "Starting Redis container on port $(PORT)..."
	@docker-compose up -d
	@echo "Loading test data into Redis..."
	@docker exec -i redis redis-cli SET test:string "Hello maxDEV Redis Client"
	@docker exec -i redis redis-cli LPUSH test:list "item1" "item2" "item3"
	@docker exec -i redis redis-cli SADD test:set "member1" "member2" "member3" 
	@docker exec -i redis redis-cli HSET test:hash field1 "value1" field2 "value2"
	@docker exec -i redis redis-cli ZADD test:zset 1 "one" 2 "two" 3 "three"
	@docker exec -i redis redis-cli EXPIRE test:string 3600
	@echo ""
	@echo "✅ Redis is running and test data is loaded!"
	@echo "• Redis server is running on localhost:$(PORT)"
	@echo "• Sample test data has been loaded"
	@echo ""
	@echo "Connect maxDEV Redis Client to:"
	@echo "  Host: localhost"
	@echo "  Port: $(PORT)"
	@echo ""
	@echo "Run 'make run' to start continuous simulation"

run:
	@echo "Starting continuous Redis activity simulation..."
	@docker cp ./simulate-activity.sh redis:/simulate-activity.sh
	@docker exec -d redis sh -c "chmod +x /simulate-activity.sh && /simulate-activity.sh"
	@echo "✅ Simulation is running in the background."
	@echo ""
	@echo "You can now observe real-time changes in maxDEV Redis client:"
	@echo "• Key 'simulation:counter' increments continuously"
	@echo "• New events appear in 'simulation:events' list"
	@echo "• Messages are published to 'activity-channel'"
	@echo "• Keys appear and expire automatically"
	@echo ""
	@echo "Run 'make stop' when you're done testing"

stop:
	@echo "Stopping Redis activity simulation..."
	@docker exec -i redis pkill -f "simulate-activity.sh" || true
	@echo "Stopping Redis container..."
	@docker-compose down
	@echo "✅ Test environment stopped"

clean: stop
	@echo "Removing Redis data..."
	@rm -rf data
	@echo "✅ Test environment cleaned up"
