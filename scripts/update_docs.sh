#!/bin/bash

GITHUB_URL=https://github.com/natura-cosmeticos/natds-ios/blob/master/docs

sed -i'' -e "s|<a href=\"docs/how-to-contribute.md\">|<a href=\"$GITHUB_URL/how-to-contribute.md\" target=\"_blank\">|g" ./docs/documentation/index.html

sed -i'' -e "s|<a href=\"docs/getting-started.md\">|<a href=\"$GITHUB_URL/getting-started.md\" target=\"_blank\">|g" ./docs/documentation/index.html
