#!/bin/bash
echo 'export GH_TOKEN=$(cat /run/secrets/gh_token 2>/dev/null)' >> ~/.bashrc
git config --global credential.helper '!f() { echo username=x; echo password=$(cat /run/secrets/gh_token 2>/dev/null); }; f'
git config --global credential.useHttpPath true
