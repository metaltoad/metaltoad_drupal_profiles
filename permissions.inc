<?php

/**
 * Create default roles and permissions.
 */
function metaltoad_create_roles() {
  // rid 1 is anonymous user
  $perms[1] = array(
    'collapse format fieldset by default',
    'collapsible format selection',
    'show format selection for blocks',
    'show format selection for comments',
    'show format selection for nodes',
    'show format tips',
    'show more format tips link',
    'access comments',
    'post comments',
    'view date repeats',
    'access content',
    'search content',
    'use advanced search',
    'search by node type',
    'search by category',
    'use keyword search',
    'access user profiles',
  );

  // rid 2 is authenticated user
  $perms[2] = array(
    'collapse format fieldset by default',
    'collapsible format selection',
    'show format selection for blocks',
    'show format selection for comments',
    'show format selection for nodes',
    'show format tips',
    'show more format tips link',
    'access comments',
    'post comments',
    'view date repeats',
    'access content',
    'search content',
    'use advanced search',
    'search by node type',
    'search by category',
    'use keyword search',
    'access user profiles',
    'change own username',
  );

  $perms['Editor'] = array(
    'view advanced help index',
    'view advanced help popup',
    'view advanced help topic',
    'access comments',
    'administer comments',
    'post comments',
    'post comments without approval',
    'create page content',
    'delete any page content',
    'delete revisions',
    'edit any page content',
    'revert revisions',
    'view revisions',
    'access administration pages',
  );

  $perms['Publisher'] = array(
    'view advanced help index',
    'view advanced help popup',
    'view advanced help topic',
    'administer blocks',
    'access comments',
    'administer comments',
    'post comments',
    'post comments without approval',
    'administer menu',
    'administer nodes',
    'administer url aliases',
    'create url aliases',
    'administer redirects',
    'access administration pages',
    'administer taxonomy',
  );

  $perms['Administrator'] = array(
    'view advanced help index',
    'view advanced help popup',
    'view advanced help topic',
    'access administration menu',
    'display drupal links',
    'administer blocks',
    'access comments',
    'administer comments',
    'post comments',
    'post comments without approval',
    'administer imagecache',
    'flush imagecache',
    'administer menu',
    'administer nodes',
    'administer url aliases',
    'create url aliases',
    'administer redirects',
    'administer pathauto',
    'assign Administrator role',
    'assign Editor role',
    'assign Publisher role',
    'access administration pages',
    'access site reports',
    'administer site configuration',
    'administer taxonomy',
    'administer users',
    'access all views',
    'administer views',
    'override node settings',
    'override profile settings',
    'administer search',
  );

  $fake_form_state = array(); // $form_state is passed by reference so we need an actual variable
  better_formats_new_role(array(), $fake_form_state); // Make sure better_formats is aware of the adminrole, see http://drupal.org/node/731810

  foreach ($perms as $role => $permissions) {
    if (is_numeric($role)) {
      $rid = $role;
    }
    else {
      db_query("INSERT INTO {role} SET name = '%s'", $role);
      $rid = db_result(db_query("SELECT rid from {role} WHERE name = '%s'", $role));
      $fake_form_state = array(); // $form_state is passed by reference so we need an actual variable
      better_formats_new_role(array(), $fake_form_state); // Make sure better_formats is aware of the new role, see http://drupal.org/node/731810
    }

    db_query("INSERT INTO {permission} SET rid = %d, perm = '%s'", $rid, implode(',', $permissions));
  }

  // Rename the "anonymous" role to a more friendly "Visitor".
  variable_set('anonymous', 'Visitor');
}