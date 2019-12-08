package main;

import java.util.ArrayList;
import java.util.List;

public class Table {
    
    private String name;
    private List<String> columns;

    public Table() {
    }
    
    public Table(String name, String... columns) {
        this.name = name;
        this.columns = new ArrayList<>();
        
        for (String column : columns) {
            this.columns.add(column);
        }
    }

    public String getName() {
        return name;
    }
    
    public String getShortName() {
//        String table = "cb_configuracion_condominio";
        int lastIndexOf = this.name.lastIndexOf("_");
        
        return this.name.substring(lastIndexOf + 1, this.name.length());
    }
    
    public String firstLetter() {
        return this.getShortName().substring(0, 1);
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<String> getColumns() {
        return columns;
    }

    public void setColumns(List<String> columns) {
        this.columns = columns;
    }
    
    public void setColumns(String... columns) {
        if (this.columns == null) {
            this.columns = new ArrayList<>();
        }
        
        for (String column : this.columns) {
            this.columns.add(column);
        }
    }

}