#!/bin/bash

# Set the URL of your NGINX server
NGINX_URL="http://localhost"

# Number of requests to make
NUM_REQUESTS=100


# Function to make requests to NGINX
make_requests() {
    for ((i=0; i<$NUM_REQUESTS; i++)); do
        curl -s -o /dev/null $NGINX_URL
          # Delay a random amount of time between requests
        DELAY=$(awk -v min=0 -v max=0.5 'BEGIN{srand(); print min+rand()*(max-min)}')
        sleep $DELAY
    done
}

# Make requests
make_requests