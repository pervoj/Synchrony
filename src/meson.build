sources = [
  'interfaces/provider.vala',
  'provider-controller.vala',
  'providers/dropbox.vala',
  'application.vala',
#  'window.vala',
]


dependencies = [
  dependency('libadwaita-1', version: '>= 1.0'),
]


sources += configure_file(
  input: 'constants.vala.in',
  output: 'constants.vala',
  configuration: config_data
)


sources += gnome.compile_resources('resources',
  configure_file(
    input: '@0@.gresource.xml.in'.format(meson.project_name()),
    output: '@0@.gresource.xml'.format(meson.project_name()),
    configuration: config_data
  ),
  c_name: meson.project_name()
)


executable(meson.project_name(), sources,
  vala_args: '--target-glib=2.50',  dependencies: dependencies,
  install: true,
)
