#!/bin/bash
for path in $(cat .gitignore)
do
   rm -rf .$path
done

