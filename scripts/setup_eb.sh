eb init

rails credentials:edit

# 1. Skip setting up the RDS so we can confirm EB is working
# 2. https://stackoverflow.com/a/40912354/2214973
eb setenv \
  RAILS_MASTER_KEY=$(cat "$(dirname $0)/../config/master.key") \
  RAILS_SKIP_ASSET_COMPILATION=true \
  RAILS_SKIP_MIGRATIONS=true \
  PIDFILE=/var/run/puma/my_app.sock

