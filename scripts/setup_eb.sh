eb init

rails credentials:edit

eb setenv \
  RAILS_MASTER_KEY=$(cat "$(dirname $0)/../config/master.key") \
  RAILS_SKIP_ASSET_COMPILATION=true

