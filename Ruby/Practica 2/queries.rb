require 'bcrypt'
require 'sequel'
require_relative 'services'

Services.load_config!
db = Services.database

def insertar_usuario(nombre_usuario)
  db[:usuarios].insert(nombre_usuario: nombre_usuario)
end

def insertar_sitio(nombre_sitio)
db[:sitios].insert(nombre_sitio: nombre_sitio)
end

def insertar_contraseña(pwd, usuario, sitio)
aux = BCrypt::Password.create(pwd)
db[:contraseñas].insert(contraseña: aux, nombre_usuario: usuario, nombre_sitio: sitio )
end

def query_1(sitio_x)
db[:contraseñas.nombre_usuario].where{nombre_sitio = sitio_x}
#select nombre_usuario from contraseñas where nombre_sitio = sitio_x;
end

def query_2(usuario_x)
db[:contraseñas.nombre_sitio].where{nombre_usuario = usuario_x}
#select nombre_sitio from contraseñas where nombre_usuario = usuario_x
end

def query_3()
db.order[:contraseñas.nombre_usuario & :contraseña.nombre_sitio]
end
