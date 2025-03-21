#!/bin/bash

# Pega a última tag
LAST_TAG=$(git describe --tags --abbrev=0)

# Verifica se existe algum commit com 'major:' no início desde a última tag
if git log "${LAST_TAG}..HEAD" --format='%s' | grep -q -E '^major:'; then
    # Se "major:" for encontrado no início, aumenta a versão major
    npx standard-version --release-as major

# Verifica se existe algum commit com 'breaking:' no início desde a última tag
elif git log "${LAST_TAG}..HEAD" --format='%s' | grep -q -E '^breaking:'; then
    # Se "breaking:" for encontrado no início, aumenta a versão minor
    npx standard-version --release-as minor

else
    # Para todos os outros casos, segue o procedimento padrão que normalmente aumenta o patch
    npx standard-version
fi

# Pega a versão atual do arquivo version.txt
VERSION=$(cat ./version.txt)

# Atualiza a versão no agvtool e nos projetos
xcrun agvtool new-marketing-version $VERSION
cd SampleApp
xcrun agvtool new-marketing-version $VERSION
cd ..

# Adiciona os arquivos plist alterados
git add NatDSSnapShotTests/Info.plist
git add SampleApp/Sources/Supporting\ Files/Info.plist
git add Supporting\ Files/Info.plist
git add Tests/Supporting\ Files/Info.plist

# Faz um commit com as alterações
git commit -m "chore: updates version on Info.plist files"

# Empurra os commits e as tags
git push --follow-tags origin HEAD

# Faz o upload da nova versão para o Cocoapods
VERSION_NUMBER=$VERSION pod trunk push NatDS.podspec --allow-warnings --verbose
