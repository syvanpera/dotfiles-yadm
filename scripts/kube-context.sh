#!/usr/bin/env bash

echo "☸️ $(kubectl config view -o=jsonpath='{.current-context}')"
