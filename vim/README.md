All bundles are installed by cloning git repositories and loaded using pathogen.

I use the stupid vim plugin installer (a small bash script) to install the
plugins. The plugin manifest is maintained as an array in the bash script
itself.

  $VIMHOME/plugins install

To install a new plugin, add it to the vim_bundles manifest, then run the
install command again.  

Learn more:

  $VIMHOME/plugins help
