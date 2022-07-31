project('synchrony', ['c', 'vala'],
  version: '0.1.0',
  meson_version: '>= 0.59.0',
  default_options: [ 'warning_level=2' ]
)



app_id_prefix = 'app.drey.Synchrony'
resource_path_prefix = '/app/drey/Synchrony'

app_id_suffix = ''
resource_path_suffix = ''
app_is_development = false

# check the profile for this build
if get_option('profile') == 'development'
  add_project_arguments('-D', 'DEVEL', language: 'vala')
  app_id_suffix = '.Devel'
  resource_path_suffix = '/Devel'
  app_is_development = true
endif

app_id = app_id_prefix + app_id_suffix
resource_path = resource_path_prefix + resource_path_suffix



add_project_arguments('-DGETTEXT_PACKAGE="@0@"'.format(meson.project_name()), language: 'c')

i18n = import('i18n')
gnome = import('gnome')



# config variables

config_data = configuration_data()

# project version
config_data.set('VERSION', meson.project_version())

# application ID
config_data.set('APP_ID', app_id)
config_data.set('APP_ID_PREFIX', app_id_prefix)
config_data.set('APP_ID_SUFFIX', app_id_suffix)

# application resource path
config_data.set('RESOURCE_PATH', resource_path)
config_data.set('RESOURCE_PATH_PREFIX', resource_path_prefix)
config_data.set('RESOURCE_PATH_SUFFIX', resource_path_suffix)

# GNU GetText package name
config_data.set('GETTEXT_PACKAGE', meson.project_name())

# data directory paths
config_data.set('LOCALE_DIR', join_paths(get_option('prefix'), get_option('localedir')))
config_data.set('DATA_DIR', join_paths(get_option('prefix'), get_option('datadir'), meson.project_name()))



subdir('data')
subdir('src')
subdir('po')



gnome.post_install(
  glib_compile_schemas: true,
  gtk_update_icon_cache: true,
  update_desktop_database: true,
)
