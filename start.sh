if [ ! -f /data/db/production.sqlite3 ]; then
  mkdir -p /data/db
  bundle exec rake db:create db:migrate
fi

if [ ! -f /data/secret ]; then
  bundle exec rake secret > /data/secret
fi

if [ ! -d /data/attachment_files ]; then
  mkdir -p /data/attachment_files
fi

export SECRET_KEY_BASE=`cat /data/secret`
bundle exec puma
