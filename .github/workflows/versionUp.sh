#!/bin/bash
if ![[ -z git status --porcelain ]]
  git add ../../Dockerfile
