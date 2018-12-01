Sequel.migration do
up do
create_table(:usuarios) do
  String :nombre_usuario
    primary_key :usuario_id, auto_increment: true
end
end
end
