#!/bin/bash

ps -eao pid,ppid,stat,comm | awk '{print $1,$2,$4}'