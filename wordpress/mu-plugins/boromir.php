<?php defined( 'ABSPATH' ) or die( 'Cheatin&#8217; uh?' );
/*
Plugin Name: Boromir - Homme
Description: Init Env
Version: 1.0
Author: Stephen D.
Copyright 2020
*/


/** --------------------------------------------------------------------------------------------- */
/** DEFINES ===================================================================================== */
/** --------------------------------------------------------------------------------------------- */
define('VERSION_BOROMIR', '1.0');


/** --------------------------------------------------------------------------------------------- */
/** UTILITY ===================================================================================== */
/** --------------------------------------------------------------------------------------------- */

/**
* Supprimer un répertoire et son contenu
* @param  string    $dir     Chemin absolu du répertoire
*/
function boromir_rrmdir( $dir ) {
    foreach( glob($dir) as $file ){
        if( is_dir($file) ){ 
					boromir_rrmdir("$file/*");
            rmdir($file);
        } else unlink($file);
    }
}


// Add repertoire theme
register_theme_directory( ABSPATH . '/themes');

// Blocked update
add_filter( 'auto_update_plugin', '__return_false' );
add_filter( 'auto_update_theme', '__return_false' );


/** --------------------------------------------------------------------------------------------- */
/** INIT    ===================================================================================== */
/** --------------------------------------------------------------------------------------------- */

// INIT WORDPRESS FOR Epyo
add_action( 'current_screen', 'boromir_force_change' );

if( !function_exists('boromir_force_change' )){

	function boromir_force_change(){

		if ( is_user_logged_in() && current_user_can( 'administrator' ) ) {

			// Check if init exec
			if( get_option( 'boromir_init_wordpress' ) != false ) return;

			// Structure permalien
			update_option('permalink_structure', '/%postname%/');

			// on supprime les posts de wordpress
			wp_delete_post( 1, true ); // We remove the article "Hello World"
			wp_delete_post( 2, true ); // We remove the "Exemple page"
			wp_delete_post( 3, true ); // We remove the "politic confidential page"

			// Let's create the page
			/*
			$args = array(
				'post_title' 		=> '',
				'post_name'			=> $post['slug'],
				'post_content'		=> trim( $post['content'] ),
				'post_status' 		=> $post['status'],
				'post_type' 		=> $post['type'],
				'post_parent'		=> $parent,
				'post_author'		=> 1,
				'post_date' 		=> date('Y-m-d H:i:s'),
				'post_date_gmt' 	=> gmdate('Y-m-d H:i:s'),
				'comment_status' 	=> 'closed',
				'ping_status'		=> 'closed'
			);*/
			//wp_insert_post( $args );

			// Force epyo theme
			// switch_theme( 'my-theme', 'my-theme');

			// Delete wordpress theme
			delete_theme( 'twentytwenty' );
			delete_theme( 'twentynineteen' );
			delete_theme( 'twentyseventeen' );
			delete_theme( 'twentysixteen' );
			delete_theme( 'twentyfifteen' );
			delete_theme( 'twentyfourteen' );
			delete_theme( 'twentythirteen' );
			delete_theme( 'twentytwelve' );
			delete_theme( 'twentyeleven' );
			delete_theme( 'twentyten' );
			delete_theme( 'twentytwentyone');

			// Delete plugins wordpress
			@unlink( WP_PLUGIN_DIR . '/hello.php');
			@epyo_rrmdir( WP_PLUGIN_DIR . '/akismet' );

			// Activation des plugins encore présent dans le repertoire
			activate_plugins( array_keys( get_plugins() ) );

			// On créer un toogle dans la base
			add_option('boromir_init_wordpress', 1, '', 'yes' );

			// On se sacrifie
			// @unlink( __FILE__);
			
		}		

	}
}


