drush dl --package-handler=cvs drupal
cd drupal
mkdir -p sites/all/modules/contrib

drush dl --package-handler=cvs --destination=sites/all/modules/contrib admin_menu
drush dl --package-handler=cvs --destination=sites/all/modules/contrib cvs_deploy
drush dl --package-handler=cvs --destination=sites/all/modules/contrib better_formats
drush dl --package-handler=cvs --destination=sites/all/modules/contrib diff
drush dl --package-handler=cvs --destination=sites/all/modules/contrib hierarchical_select
drush dl --package-handler=cvs --destination=sites/all/modules/contrib betterselect
drush dl --package-handler=cvs --destination=sites/all/modules/contrib advanced_help
drush dl --package-handler=cvs --destination=sites/all/modules/contrib ie6update
drush dl --package-handler=cvs --destination=sites/all/modules/contrib role_delegation
drush dl --package-handler=cvs --destination=sites/all/modules/contrib adminrole
drush dl --package-handler=cvs --destination=sites/all/modules/contrib cck
drush dl --package-handler=cvs --destination=sites/all/modules/contrib views
drush dl --package-handler=cvs --destination=sites/all/modules/contrib filefield
drush dl --package-handler=cvs --destination=sites/all/modules/contrib transliteration
drush dl --package-handler=cvs --destination=sites/all/modules/contrib imagefield
drush dl --package-handler=cvs --destination=sites/all/modules/contrib imagecache
drush dl --package-handler=cvs --destination=sites/all/modules/contrib imageapi
drush dl --package-handler=cvs --destination=sites/all/modules/contrib date
drush dl --package-handler=cvs --destination=sites/all/modules/contrib pathauto
drush dl --package-handler=cvs --destination=sites/all/modules/contrib token
drush dl --package-handler=cvs --destination=sites/all/modules/contrib globalredirect
drush dl --package-handler=cvs --destination=sites/all/modules/contrib path_redirect
drush dl --package-handler=cvs --destination=sites/all/modules/contrib xmlsitemap
drush dl --package-handler=cvs --destination=sites/all/modules/contrib menu_block
drush dl --package-handler=cvs --destination=sites/all/modules/contrib search404
drush dl --package-handler=cvs --destination=sites/all/modules/contrib search_config
drush dl --package-handler=cvs --destination=sites/all/modules/contrib devel
drush dl --package-handler=cvs --destination=sites/all/modules/contrib coder
drush dl --package-handler=cvs --destination=sites/all/modules/contrib masquerade
drush dl --package-handler=cvs --destination=sites/all/modules/contrib views_bulk_operations

drush dl --package-handler=cvs --destination=sites/all/modules/contrib calendar
drush dl --package-handler=cvs --destination=sites/all/modules/contrib content_type_selector

drush dl --package-handler=cvs zen 
drush dl --package-handler=cvs rootkit
