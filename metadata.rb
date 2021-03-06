name             "cookbook-lamp"
maintainer       "Juan Manuel Lopez"
maintainer_email ""
license          "Apache 2.0"
description      "Setup a LAMP environment"
version          "0.0.1"

depends "apache2",          "=  1.7.0"
depends "apt",              "~> 2.5.0"
depends "mysql",            "=  2.0.2" # Doesn't use v3.0.3 because of http://pastebin.com/kMPn0HZc
depends "php",              "=  1.2.4"
depends "smbfs",            "~> 0.4.0"
depends "vim",              "~> 1.1.2"
