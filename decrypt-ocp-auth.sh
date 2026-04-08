#!/bin/bash

DESTINATION='~/.kube/config'

echo
echo "Ensure destination exists: ${DESTINATION}"
mkdir -p ~/.kube/config

echo
echo "Decrypt ocp auth files"
for file in ocp/*/auth/*.kube*; do
    decrypted_file_destination="${DESTINATION}/$(basename ${file})"
    echo "  * ${file} -> ${decrypted_file_destination}"
    ansible-vault decrypt ${file} --output ${decrypted_file_destination}
done
