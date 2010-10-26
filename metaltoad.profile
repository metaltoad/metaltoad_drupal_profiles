<?php

/**
 * Return an array of the modules to be enabled when this profile is installed.
 *
 * @return
 *   An array of modules to enable.
 */
function metaltoad_profile_modules() {
  return array(
    // Core modules
    'help',
    'menu',
    'taxonomy',
    'dblog',
    'path',
    'search',

    // admin tools
    'admin_menu',
    'admin_menu_toolbar',
    'cvs_deploy',

    // editing
    'better_formats',
    'diff',

    // User experience
    'hierarchical_select',
    'hs_menu',
    'advanced_help',
    'ie6update',
    'vertical_tabs',

    // Permissions + security
    'role_delegation',
    'adminrole',
    'override_node_options',

    // Content
    'content',
    'views',
    'views_ui',
    'filefield',
    'transliteration',
    'imagefield',
    'imagecache',
    'imagecache_ui',
    'imageapi',
    'imageapi_gd',
    'date_api',
    'date_popup',
    'date_timezone',
    'date',
    'jquery_ui',

    // Search Engine Optimization
    'pathauto',
    'token',
    'globalredirect',
    'path_redirect',
    'xmlsitemap',
    'xmlsitemap_node',

    // Navigation
    'menu_block',
    'search404',
    'search_config',

    // Devel + Testing
    'devel',
    // 'devel_themer',
    'coder',
    'masquerade',
    'views_bulk_operations',
  );
}

/**
 * Return a description of the profile for the initial installation screen.
 *
 * @return
 *   An array with keys 'name' and 'description' describing this profile,
 *   and optional 'language' to override the language selection for
 *   language-specific profiles.
 */
function metaltoad_profile_details() {
  return array(
    'name' => 'MetalToad',
    'description' => 'Select this profile to enable MetalToad\'s core package.'
  );
}

/**
 * Return a list of tasks that this profile supports.
 *
 * @return
 *   A keyed array of tasks the profile will perform during
 *   the final stage. The keys of the array will be used internally,
 *   while the values will be displayed to the user in the installer
 *   task list.
 */
function metaltoad_profile_task_list() {
}

/**
 * Perform any final installation tasks for this profile.
 */
function metaltoad_profile_tasks(&$task, $url) {

  // Insert default user-defined node types into the database. For a complete
  // list of available node type attributes, refer to the node type API
  // documentation at: http://api.drupal.org/api/HEAD/function/hook_node_info.
  $types = array(
    array(
      'type' => 'page',
      'name' => st('Page'),
      'module' => 'node',
      'description' => st("A <em>page</em> is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website."),
      'custom' => TRUE,
      'modified' => TRUE,
      'locked' => FALSE,
      'help' => '',
      'min_word_count' => '',
    ),
  );

  foreach ($types as $type) {
    $type = (object) _node_type_set_defaults($type);
    node_type_save($type);
  }

  // Default page to not be promoted and have comments disabled.
  variable_set('node_options_page', array('status'));
  variable_set('comment_page', COMMENT_NODE_DISABLED);

  // Don't display date and author information for page nodes by default.
  $theme_settings = variable_get('theme_settings', array());
  $theme_settings['toggle_node_info_page'] = FALSE;
  variable_set('theme_settings', $theme_settings);

  // Only site administrators can create new user accounts.
  variable_set('user_register', 0);

  // Configure dblog module.
  variable_set('dblog_row_limit', 100000);

  // Configure pathauto
  variable_set('pathauto_node_pattern', '[type]/[title-raw]');
  variable_set('pathauto_node_page_pattern', '[title-raw]');
  variable_set('pathauto_update_action', '3');

  // Set admin theme.
  variable_set('admin_theme', 'rubik');

  // Update the admin role with all current available permissions.
  adminrole_update_permissions();
  // After much discussion, the name "Programmer" was chosen for the super-admin role.
  // This is to distingish it from the end-user admin role, and also to make it sound unappealing to unqualified users.
  db_query("UPDATE {role} SET name = 'Programmer' WHERE name = 'administrator'");

  // Create some default roles.
  require_once(drupal_get_path('profile', 'metaltoad') . '/permissions.inc');
  metaltoad_create_roles();

  // Update the menu router information.
  menu_rebuild();

}

/**
 * Implementation of hook_form_alter().
 *
 * Allows the profile to alter the site-configuration form. This is
 * called through custom invocation, so $form_state is not populated.
 */
function metaltoad_form_alter(&$form, $form_state, $form_id) {
  if ($form_id == 'install_configure') {
    // Set default for site name field.
    $form['site_information']['site_name']['#default_value'] = $_SERVER['SERVER_NAME'];

    // Convert the password to a plain text field, and suggest an auto-generated password.
    $words = file(drupal_get_path('profile', 'metaltoad') . '/wordlist.txt');
    $pass = array();
    foreach (range(1, 4) as $i) {
      $pass[] = chop($words[mt_rand(0, count($words) - 1)]);
    }
    $pass = implode($pass, '_');

    $form['admin_account']['account']['pass']['#type'] = 'textfield';
    $form['admin_account']['account']['pass']['#title'] = 'Password';
    $form['admin_account']['account']['pass']['#default_value'] = $pass;
  }
}

