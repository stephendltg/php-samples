// Update with your config settings.
process.env.NODE_ENV = 'development'

require('dotenv').config({ path: '.env' })

module.exports = {

  development: {
    client: 'mysql',
    connection: {
      host : process.env.DB_HOST || '127.0.0.1',
      database: process.env.DB_TABLE || 'yoonest',
      user:     process.env.DB_USER || 'yoonest',
      password: process.env.DB_PASS ||  'yoonest'
    },
    pool: {
      min: 2,
      max: 10
    },
    migrations: {
      tableName: 'knex_migrations'
    },
    debug: true,
    log: {
      warn(msg) {
        console.log( 'WARN from SQL:', msg )
      },
      error(msg){
        console.log( 'ERROR from SQL:', msg )
      },
      deprecate(msg){
        console.log( 'DEPRECATE from SQL:', msg )
      },
      debug(msg){
        console.log( 'DEBUG from SQL:', msg )
      }
    },
  }

};
