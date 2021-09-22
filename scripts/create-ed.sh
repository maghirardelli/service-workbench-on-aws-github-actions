#!/bin/bash
set -e

echo "5i
## Beta

.
w
q" > add-beta.ed
ed CHANGELOG.md < add-beta.ed
rm add-beta.ed