#!/bin/bash
sed -i "s/ARG OBSIDIAN_VERSION=.*/ARG OBSIDIAN_VERSION=${1//v/}/" ../../Dockerfile
