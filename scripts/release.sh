#!/bin/bash -e

update_version() {
  echo "$(node -p "p=require('./${1}');p.version='${2}';JSON.stringify(p,null,2)")" > $1
  echo "Updated ${1} version to ${2}"
}

current_version=$(node -p "require('./composer.json').version")

printf "Next version (current is $current_version)? "
read next_version

if ! [[ $next_version =~ ^[0-9]\.[0-9]+\.[0-9](-.+)? ]]; then
  echo "Version must be a valid semver string, e.g. 1.0.2 or 2.3.0-beta.1"
  exit 1
fi

next_ref="v$next_version"

git add -u

# Update version
update_version 'composer.json' $next_version
update_version 'package.json' $next_version
update_version 'package-lock.json' $next_version

git commit -am "release $next_version"
git tag $next_version

git push --tags