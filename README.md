# AutoIndex PHP Script (version 3.x)

by Justin Hagstrom <JustinHagstrom [at] yahoo [dot] com> and Ruben Barkow-Kuder <github [at] r.z11.de>  
AutoIndex is provided under the terms of the GNU General Public License (GPL).

https://github.com/rubo77/AutoIndex
Please post any questions as issue on GitHub.

To install and run the script, simply upload the contents of this directory to a server with PHP support (PHP 5.0 or higher is required).  
Then, point your browser to the `index.php` file in that folder. The first time you do this, it will take you to a configuration page.  
To use all the default values, just click the button at the bottom, or customize it however you want.

# Webserver

## Serve a minimal PHP server on Port 3000

    php -S localhost:3000

## Or use Docker to create a container with apache and PHP:

    docker-compose up -d

# Image thumbnail orientation

If you have images in your files, there is automatically generated a thumbnail. If
they are rotated by EXIF data, PHP cannot correctly interpret this rotation correctly.
To repair this, you can use the tool `jhead` to really rotate the images i.e. with:

    for i in *.{gif,png,jpg}; do jhead -autorot -rgt "$i"; done

# Templates

You can choose between those templates:

- default
- photoswipe_gallery
- simple_image_gallery

This is a list of all the variables that can be used in the template files:

## global_header.tpl / global_footer.tpl

Info about the current directory:

	{info:dir}	the path of the current directory, including the base dir
	{info:subdir}	the path of the current directory, not including the base dir
	{info:version}	the version of AutoIndex
	{info:page_time}	the time (in milliseconds) it took to generate the page

All words from the language file:

	{words:foo}
	... see language file for all options

All settings from the config file:

	{config:foo}
	... see AutoIndex.conf.php for all options

You can include another specific file using the {include} command:

	{include:filename}

Anything between `/*` and `*/` will not be displayed in the HTML output.


## table_header.tpl / table_footer.tpl

All previously mentioned variables, plus:

Info about current directory:

	{info:path_nav}
	{info:total_files}
	{info:total_folders}
	{info:total_size}
	{info:total_downloads}
	{info:search_box}
	{info:login_box}
	{info:archive_link}
	{info:previous_page_link}
	{info:next_page_link}
	{info:current_page_number}
	{info:last_page_number}

If-statements:

	{if:show_dir_size}
	{if:search_enabled}
	{if:use_login_system}
	{if:must_login_to_download}
	{if:days_new}
	{if:thumbnail_height}
	{if:log_file}
	{if:description_file}
	{if:download_count}
	{if:entries_per_page}

To end an if-statement, use `{end if:varibale}`
For example, `{if:days_new} ... {end if:days_new}`

Sort modes:

	{sort:filename}
	{sort:size}
	{sort:m_time}
	{sort:description}
	{sort:downloads}


## each_file.tpl

All previously mentioned variables, plus:

## Properties for individual files:

	{file:filename}		the name of the file or folder
	{file:link}		the link to the file (using the ?dir and ?file parameters in the URL)
	{file:file_ext}		the file extension ("dir" for a directory)
	{file:size}		the size (formatted as a string)
	{file:width}		the width of an image in px (formatted as a string)
	{file:height}		the height of an image in px (formatted as a string)
	{file:bytes}		the size (in bytes)
	{file:date}		the date modified (formatted as a string)
	{file:a_time}		date and time accessed
	{file:m_time}		date and time modified
	{file:num_subfiles}	for a directory, the number of files it contains
		use {file:if:is_real_dir}{file:num_subfiles}{end if}
	{file:thumbnail}	for images, it will display a thumbnail
	{file:md5_link}		a link to get the md5sum of the file
	{file:downloads}	the number of times this file has been downloaded
	{file:description}	the description of the current file
	{file:icon}		the icon image for the filetype
	{file:parent_dir}	the name of the file's parent directory
	{file:tr_class}		this returns "light_row" or "dark_row" for every other file
	{file:if:is_file} ... {end if}		true if it is a file
	{file:if:is_dir} ... {end if}		true if it is a folder or link to parent directory
	{file:if:is_real_dir} ... {end if}	true if it is a folder
	{file:if:is_parent_dir} ... {end if}	true if it is a link to parent directory
	{do_every:x} ... {end do_every} where x is a number.
		The code in between will be displayed every x files.
