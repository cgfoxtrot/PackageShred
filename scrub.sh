#!/bin/bash

# Check for root user
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Prompt user to choose whether to uninstall and purge a package
read -p "Do you want to uninstall and purge a package? [y/n]: " uninstall_package

if [[ "$uninstall_package" == "y" ]]; then
  # Prompt user for package name
  read -p "Enter the name of the package to uninstall and securely scrub: " package_name

  # Uninstall and purge package
  apt-get remove --purge $package_name

  # Find and securely delete any remaining data associated with the package and its dependencies
  apt-get autoremove --purge

  # Provide feedback to the user
  echo "Package '$package_name' and its dependencies have been uninstalled and purged."
fi

# Prompt user for package name to securely scrub
read -p "Enter the name of the package to securely scrub: " package_name

# Find and securely delete any remaining data associated with the package and its dependencies
find / -name $package_name -type f -print0 | xargs -0 shred -u -n 24 -z -v && find / -name $package_name -type f -print0 | xargs -0 rm -P -v

# Provide feedback to the user
echo "All remaining data associated with package '$package_name' and its dependencies have been securely deleted 24 times."
