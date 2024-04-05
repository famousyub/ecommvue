module.exports = {
    port: process.env.PORT || 8084 ,
   db: {
        database: process.env.DB_NAME || "mydb2",
        user: process.env.DB_USER || "root",
        password: process.env.DB_PASS || "",
        dialect: process.env.DIALECT || "mysql", 
        host: process.env.HOST || "localhost"
        
    }
    
    /* db:  {
        database: process.env.DB_NAME || "mydb",
        user: process.env.DB_USER || "postgres",
        password: process.env.DB_PASS || "postgres",
        dialect: process.env.DIALECT || "postgres", 
        host: process.env.HOST || "localhost"
         http://127.0.0.1:8081
    }*/
    ,
    authentication: {
        jwtSecret : process.env.JWT_SECRET || 'secret'
    }
}
