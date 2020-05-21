#!/bin/sh

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

ruby-install --no-reinstall ruby >/dev/null

gem install bundler
gem install irb
gem install rubocop
gem install solargraph
