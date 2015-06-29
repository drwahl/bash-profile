#!/bin/bash
mosh "$@"
[ $? -ne 0 ] && ssh "$@"
