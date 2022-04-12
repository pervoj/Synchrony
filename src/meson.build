sources = [
  'application.vala',
  'window.vala',
]


dependencies = [
  dependency('libadwaita-1', version: '>= 1.0'),
]


config_data = configuration_data()
config_data.set('VERSION', meson.project_version())
config_data.set('APP_ID', app_id)
config_data.set('GETTEXT_PACKAGE', meson.project_name())
config_data.set('LOCALE_DIR', join_paths(get_option('prefix'), get_option('localedir')))
config_data.set('DATA_DIR', join_paths(get_option('prefix'), get_option('datadir'), 'synchrony'))

sources += configure_file(
  input: 'constants.vala.in',
  output: 'constants.vala',
  configuration: config_data
)


sources += gnome.compile_resources('resources',
  '@0@.gresource.xml'.format(meson.project_name()),
  c_name: meson.project_name()
)


executable(meson.project_name(), sources,
  vala_args: '--target-glib=2.50',  dependencies: dependencies,
  install: true,
)
