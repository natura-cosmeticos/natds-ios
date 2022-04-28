#!/bin/bash

# updates docs internal links
sed -i'' -e "s|<a href=\"docs/How%20to%20contribute.md\">|<a href="how-to-contribute.html" target=\"_blank\">|g" ./docs/documentation/index.html

sed -i'' -e "s|<a href=\"docs/Getting%20started.md\">|<a href="getting-started.html" target=\"_blank\">|g" ./docs/documentation/index.html

sed -i'' -e "s|<a href=\"docs/How%20to%20use%20icons.md\">|<a href="how-to-use-icons.html" target=\"_blank\">|g" ./docs/documentation/index.html

sed -i'' -e "s|<a href=\"How%20to%20use%20icons.md\">|<a href="how-to-use-icons.html" target=\"_blank\">|g" ./docs/documentation/getting-started.html

sed -i'' -e "s|<a href=\"docs/Setup.md\">|<a href="setup.html" target=\"_blank\">|g" ./docs/documentation/how-to-contribute.html

sed -i'' -e "s|<a href=\"docs/Setup.md\">|<a href="setup.html" target=\"_blank\">|g" ./docs/documentation/index.html

# commits updates
git add ./docs
git commit -m "docs: update documentation files"
git push origin HEAD