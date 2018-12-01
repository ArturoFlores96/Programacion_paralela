Sequel.migration do
  up do
    create_table(:contraseñas) do
      String :contraseña
      foreign_key :nombre_sitio
      foreign_key :nombre_usuario
      primary_key :contraseña_id, auto_increment: true
  end
end
end
