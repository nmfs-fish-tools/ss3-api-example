_default:
  just --list

# download ss executable for linux
setup:
  wget https://github.com/nmfs-stock-synthesis/stock-synthesis/releases/download/v3.30.20/ss_linux -O ss
  chmod +x ss
  npx degit nmfs-stock-synthesis/user-examples/model_files/empirical_wtatage_and_age_selex --force

# restore environment
bootstrap:
  R -e "renv::restore()"
  
# write manifest
manifest:
  R -e 'rsconnect::writeManifest(appFiles = c("ss", "plumber.R))'

# deploy to named connect server
deploy connect:
  rsconnect deploy manifest manifest.json -n {{connect}}
