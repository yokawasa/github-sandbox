# GitHub Actions Runner
# https://github.com/actions/runner/

GITHUB_USER=yokawasa
GITHUB_REPOSITORY=actions-runner-test
GITHUB_TOKEN=AAAUDHFOKWKQE5WMXBVVFTK6GPEUC

# Download the latest runner package
mkdir actions-runner && cd actions-runner// Download the latest runner package
curl -O -L https://github.com/actions/runner/releases/download/v2.164.0/actions-runner-osx-x64-2.164.0.tar.gz
# Extract the runner
tar xzf ./actions-runner-osx-x64-2.164.0.tar.gz

# Create the runner and start the configuration experience
# ./config.sh --url https://github.com/{user}/{repo} --token {token}
./config.sh --url https://github.com/${GITHUB_USER}/${GITHUB_REPOSITORY} --token ${GITHUB_TOKEN}

echo "You are about to run the self-hosted runner"
echo "Please check the action settings to see the runner status"
echo "- https://github.com/${GITHUB_USER}/${GITHUB_REPOSITORY}/settings/actions"

# Last step, run it!
#./run.sh
