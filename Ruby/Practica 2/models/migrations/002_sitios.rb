Sequel.migration do
  up do
      create_table(:sitios) do
        String :nombre_sitio
        primary_key :sitio_id, auto_increment: true
   end
      end
              end
