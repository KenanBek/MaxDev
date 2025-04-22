# Redis Client Test Environment

This directory contains a simple environment for manually testing the Redis client tool in maxDEV.

## Getting Started

Use the following command to set up the test environment and populate it with sample data. This will start a Redis server and load some test data.

1. Start the test environment with initial data:

   ```
   make start
   ```

   This sets up the entire test environment:

   - Starts Redis server
   - Loads sample test data

2. Start the simulation:

   ```
   make run
   ```

   This runs a simulation that continuously updates the Redis database with new data, simulating real-time activity.

3. Stop the test environment:

   ```
   make stop
   ```

   This stops the Redis server and cleans up the test environment.

4. Clean up the test environment:

   ```
   make clean
   ```

   This removes all test data and stops the Redis server.

## Sample Data

The test environment includes various Redis data types:

- String: `test:string` = "Hello maxDEV Redis Client"
- List: `test:list` = ["item1", "item2", "item3"]
- Set: `test:set` = {"member1", "member2", "member3"}
- Hash: `test:hash` = {field1: "value1", field2: "value2"}
- Sorted Set: `test:zset` = {one: 1, two: 2, three: 3}

## Continuous Activity Simulation

When using `make run`, a simulation runs that:

- Increments counters regularly
- Adds and updates keys with timestamps
- Publishes messages to channels
- Creates keys that expire after a short time
- Updates various data types (lists, sets, hashes)

This makes it easy to test how the maxDEV Redis client handles real-time data changes, expired keys, and pub/sub functionality.
