#moves figures into this folder

#!/bin/bash

FIGURE_NAME=$1
PROJECT_PATH=~/uni/crs/ayii/phy

[ -z "$FIGURE_NAME" ] && echo "Unspecified figure name (type FIGURE_NAME=...)" || mv ~/Downloads/$FIGURE_NAME $PROJECT_PATH/src/matter/mainmatter/figures