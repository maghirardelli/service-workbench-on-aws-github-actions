#!/bin/bash
set -e

# Get the first header (not Changelog) in CHANGELOG.md
versionLine="$(cat CHANGELOG.md | grep -m 1 "[0-9]\.[0-9]\.[0-9]\|Beta")"

# Check if it contains the word Beta
if (echo "$versionLine" | grep -q "Beta")
then
    # Do nothing
    echo "Nothing to change in changelog--still Beta"
else
    git checkout develop
    # Check to see if the file contains the word Beta in a header
    if (cat CHANGELOG.md | grep -q '^## Beta')
    then
        # Delete it
        echo "Delete Beta"
        sed -i -e "/Beta/,+1 d" CHANGELOG.md
        commitMessage="Delete Beta"
    else
        # Add it
        echo "Need to add to changelog"
        # sed -i -e '0,s/.*[0-9]\.[0-9]\.[0-9].*/## Beta\n\n&/' CHANGELOG.md
        # perl -i -l -e 'print "## Beta\n" if $. == 5' CHANGELOG.md
        # awk 'NR==5{print "## Beta\n"}1' CHANGELOG.md > CHANGELOG.md
        ed CHANGELOG.md < add-beta.ed
        commitMessage="Add Beta"
    fi
    # Commit new changelog
    git add CHANGELOG.md
    git commit -m "$commitMessage"
    git push origin develop
fi