/**
 * Table for order
 */

 exports.up = function(knex) {
    return knex.schema.createTable('orders', t => {
        t.increments('id').primary().unsigned()
        t.bigInteger('customer').unsigned().defaultTo(0)
        t.string('status', 20).defaultTo('publish')
        t.float('price')
        t.timestamp('orderDate').defaultTo(knex.fn.now())
        t.json('cart').nullable()
    })
};

exports.down = function(knex) {
    return knex.schema.dropTable('orders')
};

