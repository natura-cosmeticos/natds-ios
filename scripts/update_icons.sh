#!/bin/bash

#Download files;

wget  https://github.com/natura-cosmeticos/natds-commons/blob/main/packages/natds-icons/ios/NatDSIcons/NatDSIcons/Icon.swift
wget  https://github.com/natura-cosmeticos/natds-commons/blob/main/packages/natds-icons/ios/NatDSIcons/Resources/natds-icons-ios.ttf

#Copy files;

pwd
mv Icon.swift Sources/Public/Components/Icons/
mv natds-icons-ios.ttf Sources/Resources/Fonts/

ls -lrt Sources/Public/Components/Icons/
ls -lrt Sources/Resources/Fonts/

