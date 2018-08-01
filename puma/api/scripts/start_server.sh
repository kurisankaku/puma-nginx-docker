#!/bin/bash
/root/.rbenv/shims/bundle install --gemfile /var/www/api/Gemfile --path /var/www/api/vendor/bundle/
systemctl start puma
