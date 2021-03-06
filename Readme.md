Junethack is a server for holding tournaments for the roguelike game NetHack
and its forks.

This server collects data from several external public servers and show
achievements and trophies for the participating players.

## Requirements

### Needed pre-installed software

 - ruby 1.9.3
 - curl
 - sqlite3

### Installation

Clone the repository:

    git clone https://github.com/junethack/Junethack.git junethack


Install the Ruby interpreter. Example using RVM:

    \curl -#L https://get.rvm.io | bash -s stable
    source ~/.rvm/scripts/rvm
    rvm install `cat junethack/.ruby-version`

Install all required rubygems:

    cd junethack
    bundle install

Start the server 

    rake

### Archival of a finished tournament

Use httrack to make a static copy of the website:

```
# httrack http://127.0.0.1:4567 -O /tmp/junethack_mirror '-127.0.0.1:4567/archive/*' -%v --max-rate=1000000

# mv /tmp/junethack_mirror/127.0.0.1_4567 public/archive/2013
```

Edit the archive links to the previous Junethack tournaments in public/archive/2013/index.html.
Also add a link to the the new Junethack archive in views/splash.haml.

Add and commit the the repository.


TODO: more documentation, distinction prod/dev env, maintenance mode, manually fetching games, dummy users
