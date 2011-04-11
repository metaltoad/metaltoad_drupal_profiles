<?php

/**
 * Implements hook_form_FORM_ID_alter().
 *
 * Allows the profile to alter the site configuration form.
 */
function metaltoad_form_install_configure_form_alter(&$form, $form_state) {

  // Set the admin username / mail
  $form['admin_account']['account']['name']['#default_value'] = 'admin';
  $form['admin_account']['account']['mail']['#default_value'] = 'info@metaltoad.com';


  // Convert the password to a plain text field, and suggest an auto-generated password.
  $words = file(drupal_get_path('module', 'metaltoad') . '/wordlist.txt');
  $pass = array();
  foreach (range(1, 4) as $i) {
    $pass[] = chop($words[mt_rand(0, count($words) - 1)]);
  }
  $pass = implode($pass, '_');

  $form['admin_account']['account']['pass']['#type'] = 'textfield';
  $form['admin_account']['account']['pass']['#title'] = 'Password';
  $form['admin_account']['account']['pass']['#default_value'] = $pass;

  // Set the country to U.S.
  $form['server_settings']['site_default_country']['#default_value'] = 'US';
}

