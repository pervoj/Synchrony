project('synchrony', ['c', 'vala'],
          version: '0.1.0',
    meson_version: '>= 0.59.0',
  default_options: [ 'warning_level=2',
                   ],
)
app_id = 'cz.pervoj.Synchrony'


add_project_arguments ('-DGETTEXT_PACKAGE=synchrony', language: 'c')


gnome = import('gnome')
i18n = import('i18n')


subdir('data')
subdir('src')
subdir('po')


gnome.post_install(
  glib_compile_schemas: true,
  gtk_update_icon_cache: true,
  update_desktop_database: true,
)
