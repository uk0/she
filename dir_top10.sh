#!/bin/bash
echo "Top 10 files/directories:"
du -hs * | sort -hr | head -10