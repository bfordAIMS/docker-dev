#!/bin/bash

while IFS=';' read -ra array; do
  ar1+=("${array[0]}")
  ar2+=("${array[1]}")
  ar3+=("${array[2]}")
  ar4+=("${array[3]}")
done < /~/docker-dev/scripts/resources/programs.csv                                                       

printf '%s\n' "${ar1[@]}" "${ar2[@]}" "${ar3[@]}" "${ar4[@]}"