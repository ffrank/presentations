# Webserver installation and configuration

 1. [Base system](#base-system)
 2. [Packages](#packages)
 3. [Config files](#config-files)
 4. [Backup](#backup)
 5. [Boot options](#boot-options)
 6. [Arcane rituals](#arcane-rituals)

## Base system

Works with the Ubuntu 14.04 base image as of 06/2015. The images from September or later introduce a weird JVM performance
quirk that makes zero sense, and we have never figured out why. Just don't use them.
Earlier images have been known to suffer from erratic failures to restart nginx under unknown circumstances.

Ubuntu 16 and newer will be supported once we ported both the custom nginx plugins. We're still struggling
to come up with a clean build of all the dependencies that are no longer available. Sorry!

## Packages

Don't even get me started.

## Config files

All things in /etc basically. Oh, some are in /usr/local/etc, and their counterparts in /etc are ignored.
There are some configs in /opt, but those should all be symlinked to locations under /etc.

Copy all values from the prod01-web instance. **Do not use files from prod03** that instance currently uses experimental configs.

## Backup

Yes, please.

## Boot options

Just messing with you, no kernel options needed.

## Arcane rituals

OK this will sound funny, but it happened twice: When the JVM won't start up, delete the bash history of the
jdoe user and start two individual new shells. Run at least 3 commands in the first one and terminate it.
Start a third shell, which can now launch Java. The problem should not appear again for a while.
