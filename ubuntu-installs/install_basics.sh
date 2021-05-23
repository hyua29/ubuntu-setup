install_basics()
{
    sudo apt-get update -y && sudo apt-get upgrade -y 
    sudo apt-get install -y apt-transport-https ca-certificates curl wget htop mpv

    echo "alias portusage=\"sudo lsof -i -P -n | grep LISTEN\"" | sudo tee -a ~/.bashrc
}
