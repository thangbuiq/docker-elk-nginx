#!/bin/bash

# Set the URL of your NGINX server
NGINX_URL="http://localhost"
ROUTE_LIST=('/' '/error' '/error/server')

# Number of requests to make
NUM_REQUESTS=456


# Function to make requests to NGINX
make_requests() {
    for ((i=0; i<$NUM_REQUESTS; i++)); do
        # Select a random route
        ROUTE="$(printf "%s\n" ${ROUTE_LIST[@]} | shuf | head -1)"
        PATH=${NGINX_URL}${ROUTE}
        echo "Making request to $PATH"
        curl -s -o /dev/null $PATH
          # Delay a random amount of time between requests
        # DELAY=$(awk -v min=0 -v max=0.2 'BEGIN{srand(); print min+rand()*(max-min)}')
        # sleep $DELAY
    done
}

# Make requests
make_requests