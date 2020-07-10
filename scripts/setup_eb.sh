eb init

rails credentials:edit

# Skip setting up the RDS so we can confirm EB is working
# After RDS setup we should turn off RAILS_SKIP_MIGRATION
eb setenv \
  RAILS_MASTER_KEY=$(cat "$(dirname $0)/../config/master.key") \
  RAILS_SKIP_ASSET_COMPILATION=true \
  RAILS_SKIP_MIGRATIONS=true

