#!/bin/bash

#Download files;

wget  https://github.com/natura-cosmeticos/natds-commons/blob/main/packages/natds-icons/ios/NatDSIcons/NatDSIcons/Icon.swift
wget  https://github.com/natura-cosmeticos/natds-commons/blob/main/packages/natds-icons/ios/NatDSIcons/Resources/natds-icons-ios.ttf

#Copy files;

mv Icon.swift ../Sources/Public/Components/Icons/Icon.swift
mv natds-icons-ios.ttf ../Sources/Resources/Fonts/natds-icons-ios.ttf
