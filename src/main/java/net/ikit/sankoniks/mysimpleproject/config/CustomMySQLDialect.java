package net.ikit.sankoniks.mysimpleproject.config;

import org.hibernate.dialect.MySQLInnoDBDialect;

public class CustomMySQLDialect extends MySQLInnoDBDialect {

    public String getTableTypeString() {
        return " ENGINE=InnoDB DEFAULT CHARSET=utf8";
    }


}
