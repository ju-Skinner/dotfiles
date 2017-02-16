# Various dotFiles that are used within my system.

## How to use
If you are going to clone this repo and what to use these different dot files, you will need to run the following command as an example.
`sh ./setup_dotfiles.sh`

Please be sure to read through the file, so that you are aware what it is doing. It is currently commented out for your protection.


## Weechat

### Scripts Installed
  buffers.py - https://weechat.org/scripts/source/buffers.pl.html/
  iset.py - https://weechat.org/scripts/source/iset.pl.html/
  
#### CA Certificates
If you have installed `curl` via HomeBrew, you can determine which version you have by running and location by entering `which curl`. Navigate to the path listed, in my case it was `usr/local/Cellar/curl/7.52.1/libexec`. In order to extract the CA Certificate you have to expect the perl file named `mk-ca-bundle.pl` by simple entering `./mk-ca-bundle.pl`. This extacts the crt file. Move that file to `~/.weechat/certs`.

  cd /usr/local/Cellar/curl/[your version i.e 7.52.1]/libexec
  ./mk-ca-bundle.pl
  mv ca-bundle.crt ~/.weechat/certs

  Back in weechat
    /set weechat.network.gnutls_ca_file "~/.weechat/certs/ca-bundle.crt"
