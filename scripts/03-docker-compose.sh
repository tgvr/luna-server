# install docker compose
curl -L https://raw.githubusercontent.com/docker/compose-cli/main/scripts/install/install_linux.sh | sh
wget -O docker-compose https://github.com/docker/compose-cli/releases/download/v2.0.0-beta.6/docker-compose-linux-arm64
mkdir -p ~/.docker/cli-plugins
mv docker-compose ~/.docker/cli-plugins/
chmod a+x ~/.docker/cli-plugins/docker-compose
