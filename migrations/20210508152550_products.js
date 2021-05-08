/**
 * Table for order
 */

 exports.up = function(knex) {
    return knex.schema.createTable('products', t => {
        t.increments('id').primary().unsigned()
        t.string('sku', 255).notNullable()
        t.string('name', 255).notNullable()
        t.float('price').notNullable()
        t.timestamp('date_modified').defaultTo(knex.fn.now())
        t.text('description', 'longtext')
    })
};

exports.down = function(knex) {
    return knex.schema.dropTable('products')
};

