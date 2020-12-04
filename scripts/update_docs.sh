#!/bin/bash

sed -i'' -e "s/<a href=\"docs\/how-to-contribute.md\">/<a href=\"https:\/\/github.com\/natura-cosmeticos\/natds-ios\/blob\/master\/docs\/how-to-contribute.md\" target='_blank'>/g" ./docs/documentation/index.html

sed -i'' -e "s/<a href=\"docs\/getting-started.md\">/<a href=\"https:\/\/github.com\/natura-cosmeticos\/natds-ios\/blob\/master\/docs\/getting-started.md\" target='_blank'>/g" ./docs/documentation/index.html