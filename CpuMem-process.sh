#!/bin/bash
ps -eo pid,ppid,%mem,%cpu,cmd | head -n4 >> ps.log
