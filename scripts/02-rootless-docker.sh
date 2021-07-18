# install dependencies for rootless docker (might not need in future)
sudo apt -y install uidmap
curl -o slirp4netns --fail -L https://github.com/rootless-containers/slirp4netns/releases/download/v1.1.11/slirp4netns-$(uname -m)
chmod +x slirp4netns
sudo mv slirp4netns /usr/local/bin/

# install rootless docker
dockerd-rootless-setuptool.sh install
echo "export DOCKER_HOST=unix:///run/user/1000/docker.sock" >> ~/.zshrc

# expose privileged ports
sudo su <<EOF
echo "net.ipv4.ip_unprivileged_port_start=0" >> /etc/sysctl.conf
sysctl --system
EOF
