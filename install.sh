#!/usr/bin/bash

# Install uv
apt install uv -y

# Install packages from aptfile
xargs -a aptfile apt install -y