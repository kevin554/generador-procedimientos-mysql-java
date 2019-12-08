package main;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.List;

public class Console {

    public static void main(String[] args) {
//        String[] tables = {
//            "cb_configuracion_condominio"
//        };
        List<Table> tables = new ArrayList<>();
        
        Table condominio = new Table("cb_configuracion_condominio", 
            "cb_condominio_id", "cb_condominio_nombre", "cb_condominio_zona",
            "cb_condominio_ciudad", "cb_condominio_contacto", 
            "cb_condominio_cargo", "cb_condominio_telefono",
            "cb_condominio_correo", "cb_condominio_fechainicio",
            "cb_condominio_fechacobranza", "cb_condominio_preciobase",
            "cb_condominio_precioadicional", "cb_condominio_imagen", 
            "cb_condominio_enabled", "cb_condominio_adicionadopor",
            "cb_condominio_fechaadicion", "cb_condominio_modificadopor",
            "cb_condominio_fechamodificacion");
        
        Table vivienda = new Table("cb_configuracion_vivienda", 
            "cb_vivienda_id", "cb_vivienda_codificacion", 
            "cb_vivienda_familia", "cb_vivienda_direccion",
            "cb_vivienda_telefono", "cb_vivienda_cantidad",
            "cb_vivienda_uso", "cb_vivienda_fkcondominio", 
            "cb_vivienda_enabled", "cb_vivienda_adicionadopor",
            "cb_vivienda_fechaadicion", "cb_vivienda_modificadopor", 
            "cb_vivienda_fechamodificacion");
        
        Table familiar = new Table("cb_configuracion_familia",
            "cb_familia_id", "cb_familia_nombre", 
            "cb_familia_apellido", "cb_familia_celular",
            "cb_familia_correo", "cb_familia_ci",
            "cb_familia_genero", "cb_familia_fkvivienda",
            "cb_familia_token", "cb_familia_codigo",
            "cb_familia_activo", "cb_familia_adicional",
            "cb_familia_enabled", "cb_familia_adicionadopor",
            "cb_familia_fechaadicion", "cb_familia_modificadopor",
            "cb_familia_fechamodificacion");
        
        Table parametro = new Table("cb_configuracion_parametro", 
            "cb_parametro_id", "cb_parametro_correo", 
            "cb_parametro_telefono", "cb_parametro_celular",
            "cb_parametro_permanencia", "cb_parametro_ci", 
            "cb_parametro_placa", "cb_parametro_cantidad", 
            "cb_parametro_fkcondominio", "cb_parametro_enabled");
        
        tables.add(condominio);
        tables.add(vivienda);
        tables.add(familiar);
        tables.add(parametro);
        
        String s = "delimiter //\n";
        
        for (int i = 0; i < tables.size(); i++) {
            Table table = tables.get(i);
            
            s += "drop procedure if exists mk_" + table.getShortName() + "// \n";
            s += "create procedure mk_" + table.getShortName() + "(\n";
            
            boolean isFirst = true;
            for (int j = 0; j < table.getColumns().size(); j++) {
                String column = table.getColumns().get(j);
                if (!isFirst)
                    s += ",\n";
                
                s += "\tin " + getShortName(column) + " text";
                
                isFirst = false;
            }
            
            s += "\n)\n";
            s += "begin\n";
            s += "\tif (id = 0) then\n";
            s += "\t\tinsert into " + table.getName() + " (\n";
            
            isFirst = true;
            for (int j = 1; j < table.getColumns().size(); j++) {
                String column = table.getColumns().get(j);
                if (!isFirst)
                    s += ",\n";
                
                s += "\t\t\t" +column + "";
                
                isFirst = false;
            }
            
            s += "\t\t) values (\n";
            
            isFirst = true;
            for (int j = 1; j < table.getColumns().size(); j++) {
                String column = table.getColumns().get(j);
                if (!isFirst)
                    s += ",\n";
                
                s += "\t\t\t" + getShortName(column) + "";
                
                isFirst = false;
            }
            
            s += ");\n";
            s += "else\n";
            s += "update " + table.getName() + " " + table.firstLetter() + "\n";
            s += "set\n";
            
            isFirst = true;
            for (int j = 1; j < table.getColumns().size(); j++) {
                String column = table.getColumns().get(j);
                if (!isFirst)
                    s += ",\n";
                
                s += column + " = " + getShortName(column) + "";
                
                isFirst = false;
            }
            
            s += "\n";
            s += "where " + table.getColumns().get(0) + " = id;\n";
            s += "end if;\n";
            s += "end//\n";
            
            s += "\n";
            
            s += "drop procedure if exists del_" + table.getShortName() + "//\n";
            s += "create procedure del_" + table.getShortName() + "(in id int)\n";
            s += "begin\n";
            s += "delete\n";
            s += "from " + table.getName() + "\n";
            s += "where " + table.getColumns().get(0) + " = id;\n";
            s += "end//\n";
            
            s += "\n";

            s += "drop procedure if exists get_" + table.getShortName() + "//\n";
            s += "create procedure get_" + table.getShortName() + "(in id int)\n";
            s += "begin\n";
            s += "select\n";
            isFirst = true;
            for (int j = 1; j < table.getColumns().size(); j++) {
                String column = table.getColumns().get(j);
                if (!isFirst)
                    s += ",\n";
                
                s += column + "";
                
                isFirst = false;
            }
            s += "\n";
            s += "from " + table.getName() + " " + table.firstLetter() + "\n";
            s += "where " + table.getColumns().get(0) + " = id;\n";
            s += "end//\n";
            
            s += "\n";
            
            s += "drop procedure if exists get_" + table.getShortName() + "s//\n";
            s += "create procedure get_" + table.getShortName() + "s()\n";
            s += "begin\n";
            s += "select\n";
            isFirst = true;
            for (int j = 1; j < table.getColumns().size(); j++) {
                String column = table.getColumns().get(j);
                if (!isFirst)
                    s += ",\n";
                
                s += column + "";
                
                isFirst = false;
            }
            s += "\n";
            s += "from " + table.getName() + " " + table.firstLetter() + ";\n";
            s += "end//\n";
            
            s += "\n";
        }
        
        File archivo = new File("procedimientos almacenados.sql");
        
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(archivo))) {
            bw.write(s);
        } catch (Exception ex) {
            System.out.println(ex);
        }
        
        /*

drop procedure if exists get_condominios//
create procedure get_condominios()
begin
	select
		c.cb_condominio_id,
        c.cb_condominio_nombre,
        c.cb_condominio_zona,
        c.cb_condominio_ciudad,
        c.cb_condominio_contacto,
        c.cb_condominio_cargo,
        c.cb_condominio_telefono,
        c.cb_condominio_correo,
        c.cb_condominio_fechainicio,
        c.cb_condominio_fechacobranza,
        c.cb_condominio_preciobase,
        c.cb_condominio_precioadicional,
        c.cb_condominio_imagen,
        c.cb_condominio_enabled,
        c.cb_condominio_adicionadopor,
        c.cb_condominio_fechaadicion,
        c.cb_condominio_modificadopor,
        c.cb_condominio_fechamodificacion
    from cb_configuracion_condominio c;
end//

        */
    }
    
    public static String getShortName(String name) {
        int lastIndexOf = name.lastIndexOf("_");
        
        return name.substring(lastIndexOf + 1, name.length());
    }

}