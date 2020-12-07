#!/bin/bash

rm -rf ./public
hugo
scp -r ./public/ alyx:/opt/sites/kevinheruer
ssh -t alyx 'service nginx restart'