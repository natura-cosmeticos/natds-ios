#!/bin/bash

sed -i'' -e "s|<a href=\"docs/How-to-contribute.md\">|<a href="how-to-contribute.html" target=\"_blank\">|g" ./docs/documentation/index.html

sed -i'' -e "s|<a href=\"docs/Getting-started.md\">|<a href="getting-started.html" target=\"_blank\">|g" ./docs/documentation/index.html

sed -i'' -e "s|<a href=\"How-to-use-icons.md\">|<a href="how-to-use-icons.html" target=\"_blank\">|g" ./docs/documentation/getting-started.html
