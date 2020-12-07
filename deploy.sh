#!/bin/bash

rm -rf ./public
hugo
scp -r ./public/* alyx:/opt/sites/kevinheruer
ssh -t alyx 'chown -R nginx:nginx /opt/sites && service nginx restart'