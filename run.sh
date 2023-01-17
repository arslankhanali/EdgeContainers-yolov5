#!/bin/bash

# Start the first process
python3 backend.py --port 5000 &

  
# Start the second process
python3 frontend.py --port 6000 &
  
# Wait for any process to exit
wait -n
  
# Exit with status of process that exited first
exit $?