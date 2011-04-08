<?php

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

