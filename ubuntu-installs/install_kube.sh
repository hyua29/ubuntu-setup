
install_kube()
{
    # Install kubernetes
    sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
    echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
    sudo apt-get update -y
    sudo apt-get install -y kubeadm kubelet kubectl
    sudo apt-mark hold kubelet kubeadm kubectl docker.io

    # Set docker driver to systemd
    sudo echo "{ \"exec-opts\": [\"native.cgroupdriver=systemd\"] }" | sudo tee -a /etc/docker/daemon.json

    # Set swap to off
    sudo swapoff -a
}
