## Debian on GCP

For iPad with GCP and Blink

無料で使うならAlways Freeを選ぶ
https://cloud.google.com/free/docs/gcp-free-tier?hl=ja 

```
# in Blink on iPad
ssh-keygen -t rsa -b 4096 -m PEM -f gcloud_rsa.pem
cat gcloud_rsa.pem.pub
```

```
# in Machine on GCP

$ sudo apt update
$ sudo apt git

# Set up ssh for github. https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
# ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
# cat ~/.ssh/id_rsa.pub
# Register id_rsa.pub on github

$ git clone git@github.com:khirayama/dotfiles.git

$ sh ./setup.debian.sh

# Change password
$ sudo passwd

# Change default shell to `/usr/bin/zsh` from `bash`
$ sudo vim /etc/passwd

$ sudo shutdown -r now

# Open ngrok to finish setting up
# https://dashboard.ngrok.com/
$ unzip NGROK_FILE
$ sudo mv ./ngrok /usr/bin
$ source ~/.zshrc
$ ngrok authtoken AUTH_TOKEN
$ rm NGROK_FILE

# Install Docker https://docs.docker.com/engine/install/debian/
```
