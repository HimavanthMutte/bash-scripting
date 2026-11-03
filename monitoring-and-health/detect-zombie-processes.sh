#!/bin/bash

ps -eao pid,ppid,stat,comm | awk '$3=="S" && NR>1{print $1,$2,$4}'