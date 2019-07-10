#!/bin/bash
mdfind -name $1 | grep -v '~' | grep -v '.pyc'