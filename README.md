# service-workbench-on-aws-github-actions
A sample repository to test out github actions for awslabs/service-workbench-on-aws

## Workflow deploy.yml
This workflow provides an example of how version control can indicate when the mainline branch is out of date with the latest released version of the repository. On a release, the change log will reflect this release. On the next change to mainline after that release, a Beta header will be added at the top of the change lot to indicate that mainline is no longer released changes. Additionally, information on what has changed since the last release will be provided in the Beta section.

This workflow step and script work well with [standard-version](https://github.com/conventional-changelog/standard-version) releasing package as the Beta header and additional information in that section will automatically be overwritten on the next release.

## Script get-release-info.sh
This script scrapes the latest version and date of release of that version from the change log and saves it in a yml file to be used in other areas of deployment. If the change log indicates that the branch is in Beta, that as well as the latest released version are scraped from the change log to be used in other areas of deployment.
