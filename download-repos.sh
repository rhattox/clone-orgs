#!/usr/bin/env bash


ORGS_LIST=(
  "rhattox-praia-carioca"
  "rhattox-ansible"  
)


for i in "${ORG_LIST[@]}"; then
  gh repo list ${i} --limit 50 | while read -r repo _; do
    gh repo clone "$repo" "$repo"
  done
done
