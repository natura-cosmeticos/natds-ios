#!/bin/zsh

# TODO: receber path do projeto ios
# TODO: deletar o arquivo de tmp (deleta sozinho depois de 3 dias)

domain='https://github.com/natura-cosmeticos/natds-commons/archive/refs/tags/@naturacosmeticos/natds-themes@'
extension='.tar.gz'

echo "Downloading from $domain${1}$extension"
mkdir /tmp/natds
curl $domain${1}$extension -J -L -o /tmp/natds/Themes.tar.gz

echo "Saving at /tmp"
tar -xzvf /tmp/natds/Themes.tar.gz -C /tmp/natds

cd /tmp/natds/*/packages/natds-themes/build/ios/theme
echo ${1} > themes-version.txt

cp -r /tmp/natds/*/packages/natds-themes/build/ios/theme ~/Desktop

echo -e "\e[1;33m'Themes' folder is now in your Desktop, move it to your project \e[0m"