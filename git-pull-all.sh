#!/bin/bash

find . -type d -name *.git -exec git -C {} -c remote.origin.mirror=true remote update --prune origin \;
