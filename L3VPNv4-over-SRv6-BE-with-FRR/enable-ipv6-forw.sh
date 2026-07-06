#!/bin/bash

# List of container names
CONTAINERS=("pe1" "p" "pe2")

for NODE in "${CONTAINERS[@]}"; do
    echo "Configuring IPv6 forwarding on $NODE..."
    
    docker exec -i clab-frrsrv6-$NODE sh -c "
        printf 'configure terminal\nipv6 forwarding\nexit\nwrite memory\nexit\n' | vtysh
    "
    
    echo "Done with $NODE."
done

echo "Configuration complete for all nodes."

