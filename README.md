
# Installation
this node requires Ruby and following ruby gems: json, whois, whois-parser installed on the server running nodered

```bash
  apt install ruby-full rubygems
  gem install json whois whois-parser
```

# Troubleshooting
in case you are working with nodered in docker container, you may need the root access to install ruby.

docker exec will allow you to login as root
> docker exec -u 0 -it mynodered bash

then you can install ruby with
```bash
  apk update
  apk add ruby-full
```

# Links
 - https://github.com/weppos/whois-parser whois parsing project used
 - https://www.ruby-lang.org/en/documentation/installation/ ruby installation (package manager is simplest)
