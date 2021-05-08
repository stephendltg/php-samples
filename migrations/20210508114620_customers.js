/**
 * Table for customers
 */

 exports.up = function(knex) {
    return knex.schema.createTable('customers', t => {
        t.increments('id').primary().unsigned()
        t.string('email', 100).unique().index().notNullable()
        t.string('firstname', 255)
        t.string('lastname', 255)
    })
};

exports.down = function(knex) {
    return knex.schema.dropTable('customers')
};
