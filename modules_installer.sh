#!/bin/bash -l

shopt -s expand_aliases  # Enables alias expansion.

drush pm-download --package-handler=cvs drupal
cd drupal
mkdir -p sites/all/modules/contrib

drush pm-download --package-handler=cvs --destination=sites/all/modules/contrib admin_menu
drush pm-download --package-handler=cvs --destination=sites/all/modules/contrib cvs_deploy
drush pm-download --package-handler=cvs --destination=sites/all/modules/contrib better_formats
drush pm-download --package-handler=cvs --destination=sites/all/modules/contrib diff
drush pm-download --package-handler=cvs --destination=sites/all/modules/contrib hierarchical_select
drush pm-download --package-handler=cvs --destination=sites/all/modules/contrib advanced_help
drush pm-download --package-handler=cvs --destination=sites/all/modules/contrib ie6update
drush pm-download --package-handler=cvs --destination=sites/all/modules/contrib role_delegation
drush pm-download --package-handler=cvs --destination=sites/all/modules/contrib adminrole
drush pm-download --package-handler=cvs --destination=sites/all/modules/contrib override_node_options
drush pm-download --package-handler=cvs --destination=sites/all/modules/contrib cck
drush pm-download --package-handler=cvs --destination=sites/all/modules/contrib views
drush pm-download --package-handler=cvs --destination=sites/all/modules/contrib filefield
drush pm-download --package-handler=cvs --destination=sites/all/modules/contrib transliteration
drush pm-download --package-handler=cvs --destination=sites/all/modules/contrib imagefield
drush pm-download --package-handler=cvs --destination=sites/all/modules/contrib imagecache
drush pm-download --package-handler=cvs --destination=sites/all/modules/contrib imageapi
drush pm-download --package-handler=cvs --destination=sites/all/modules/contrib date
drush pm-download --package-handler=cvs --destination=sites/all/modules/contrib pathauto
drush pm-download --package-handler=cvs --destination=sites/all/modules/contrib token
drush pm-download --package-handler=cvs --destination=sites/all/modules/contrib globalredirect
drush pm-download --package-handler=cvs --destination=sites/all/modules/contrib path_redirect
drush pm-download --package-handler=cvs --destination=sites/all/modules/contrib xmlsitemap
drush pm-download --package-handler=cvs --destination=sites/all/modules/contrib menu_block
drush pm-download --package-handler=cvs --destination=sites/all/modules/contrib search404
drush pm-download --package-handler=cvs --destination=sites/all/modules/contrib search_config
drush pm-download --package-handler=cvs --destination=sites/all/modules/contrib devel
drush pm-download --package-handler=cvs --destination=sites/all/modules/contrib coder
drush pm-download --package-handler=cvs --destination=sites/all/modules/contrib masquerade
drush pm-download --package-handler=cvs --destination=sites/all/modules/contrib views_bulk_operations

drush pm-download --package-handler=cvs zen
drush pm-download --package-handler=cvs rootcandy
