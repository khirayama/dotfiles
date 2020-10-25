## Ubuntu

- [Connect to Wi-Fi From Terminal on Ubuntu 18.04/19.10 with WPA Supplicant - LinuxBabe](https://www.linuxbabe.com/ubuntu/connect-to-wi-fi-from-terminal-on-ubuntu-18-04-19-04-with-wpa-supplicant)
- [systemd環境のArch LinuxでDHCP(dhclient)を使ったネットワーク設定 - Qiita](https://qiita.com/aki3061/items/ca7647a4c3e4aee75d38)
- [Ubuntu,Debianの自動サスペンドの解除 - Qiita](https://qiita.com/ikesama200/items/f595293de82ddc9fa3f1)

```
# For iPad with GCP
# ssh-keygen -t rsa -b 4096 -m PEM -f gcloud_rsa.pem
# cat gcloud_rsa.pem.pub

# Set up ssh for github. https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
# ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
# cat ~/.ssh/id_rsa.pub

$ git clone git@github.com:khirayama/dotfiles.git

$ sh ./setup.ubuntu.sh

# Change password
$ sudo passwd

# Change default shell to `/usr/bin/zsh`
$ sudo vim /etc/passwd

$ sudo shutdown -r now

# Open ngrok to finish setting up
# https://dashboard.ngrok.com/
$ unzip NGROK_FILE
$ sudo mv ./ngrok /usr/bin
$ source ~/.zshrc
$ ngrok authtoken AUTH_TOKEN
$ rm NGROK_FILE
```
