api = 2
core = 6.x

; gzip common text formats.  http://drupal.org/node/101227
projects[drupal][patch][] = http://drupal.org/files/issues/mod_deflate.patch

projects[admin_menu] = '3.0-alpha4'
projects[] = better_formats
projects[] = diff

projects[] = hierarchical_select
projects[] = advanced_help
projects[] = ie6update
projects[] = vertical_tabs

projects[] = role_delegation
projects[] = adminrole
projects[] = override_node_options

projects[] = cck
projects[] = views
projects[] = filefield
projects[] = transliteration
projects[] = imagefield
projects[] = imagecache
projects[] = imageapi
projects[] = date

projects[] = pathauto
projects[] = token
projects[] = globalredirect
projects[] = path_redirect
projects[] = xmlsitemap

projects[] = menu_block
projects[] = search404
projects[] = search_config

projects[] = devel
projects[] = devel_themer
projects[] = coder
projects[] = masquerade
projects[] = views_bulk_operations

projects[] = tao
projects[] = rubik
projects[] = zen

; jQuery UI
; - Most recent plugin for Drupal 6.x, on 17-Sep-2010: jquery.ui-1.6.zip
projects[jquery_ui][subdir]          = ""
libraries[jquery_ui][download][type] = "get"
libraries[jquery_ui][download][url]  = "http://jquery-ui.googlecode.com/files/jquery.ui-1.6.zip"
libraries[jquery_ui][directory_name] = "jquery.ui"
libraries[jquery_ui][destination]    = "modules/jquery_ui"
