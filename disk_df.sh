#!/bin/bash
df -h | awk '{print $NF"\t"$0}' | sort -u -k1,1 | cut -f2-